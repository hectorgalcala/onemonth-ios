//
//  cacheProtocol.swift
//  TodoApp
//
//  Created by johnq on 3/8/16.
//  Copyright © 2016 johnq. All rights reserved.
//

import Foundation

protocol CacheProtocol {

  func loadValueForKey(key: String)-> AnyObject?

  func saveObject(object: AnyObject, key: String)
    // This is where we save and destroy our data.
}
