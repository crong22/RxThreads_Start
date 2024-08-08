//
//  MovieViewModel.swift
//  RxThreads_Start
//
//  Created by Woo on 8/8/24.
//

import Foundation
import RxSwift
import RxCocoa


class MovieViewModel {
    
    let disposeBag = DisposeBag()
    
    struct Input {
        let text : ControlProperty<String>
        let searchBarClick : ControlEvent<Void>
    }
    
    struct Output {
        let searchBarClick : ControlEvent<Void>
    }
    
    func transform(input : Input) -> Output {
        
        
        
        return Output(searchBarClick: input.searchBarClick)
    }
}
