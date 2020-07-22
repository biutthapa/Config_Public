//
//  PageInfo.swift
//  App
//
//  Created by Biut Raj Thapa on 5/19/20.
//

import Vapor

struct PageInfo: Content {
    var currentPage: Int
    var pageTotal: Int
}
