//
//  MovieViewController.swift
//  RxThreads_Start
//
//  Created by Woo on 8/8/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class MovieViewController : UIViewController {
    // 글자
    var dateText = ""
    
    let searchBar : UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "조회할 날짜를 입력해 주세요"
        search.searchTextField.font = .systemFont(ofSize: 15, weight: .regular)
        return search
    }()
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
    
    let tableView = UITableView()
    
    // viewmodel
    let viewModel = MovieViewModel()
    
    // dispose
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // UI
        configureUI()
        
        // Rx
        bind()
    }
    
    private func bind() {
        
        let input = MovieViewModel.Input(text: searchBar.rx.text.orEmpty, searchBarClick: searchBar.rx.searchButtonClicked)
        let output = viewModel.transform(input: input)
        
        input.text
            .bind(with: self) { owner, text in
                print("입력글자 : \(text)")
                owner.dateText = text
            }
            .disposed(by: disposeBag)
        
        input.searchBarClick
            .bind(with: self) { owner, _ in
                print(owner.dateText)
            }
            .disposed(by: disposeBag)
        
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        navigationItem.titleView = searchBar
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(5)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(15)
            make.height.equalTo(40)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(5)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(15)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(15)
        }
        
        
    }
    
    static func layout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 40)
        layout.scrollDirection = .horizontal
        return layout
    }
}
