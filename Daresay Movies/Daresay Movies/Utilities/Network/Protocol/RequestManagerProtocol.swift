//
//  RequestManagerProtocol.swift
//  Daresay Movies
//
//  Created by Emad Bayramy on 12/14/21.
//

import Foundation

protocol RequestManagerProtocol {
    /// Provided URL Session
    var session: URLSession! { get set }
    
    /// Access Token
    var accessToken: String? { get }
    
    /// Timeout interval is interval for a request to be timedOut
    var timeOutInterval: Double { get }
    
    var baseApi: String { get set }
    
    var responseValidator: ResponseValidatableProtocol { get set }
    
    var reponseLog: URLRequestLoggableProtocol? { get set }
    
    var cacheManager: CacheManagable! { get set }
    /**
    To make 'get' request to url.
    
    - Parameter url: url of interest to retrieve data. It should be String
    - Parameter httpMethod: http method with associated value
    
    - Returns: completionHandler, which is Swift 5 Result Type ,  on Success returns the type which is codable . On failure returns RequestError based on your server RequestError.
    */
    func performRequestWith<T: Codable>(url: String, httpMethod: HTTPMethod, completionHandler: @escaping CodableResponse<T>)
    
}
