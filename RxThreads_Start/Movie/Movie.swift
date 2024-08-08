//
//  Movie.swift
//  RxThreads_Start
//
//  Created by Woo on 8/8/24.
//

import Foundation

struct MovieResult : Decodable {
    let boxOfficeResult : [BoxOfficeResult]
}

struct BoxOfficeResult : Decodable {
    let rank : String
    let movieNm : String
    let openDt : String
}

