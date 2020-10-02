//
//  AlamofireExt.swift
//  marleyspoon-code-challenge-iOS
//
//  Created by Anderson Soares on 01/10/20.
//  Copyright © 2020 Anderson. All rights reserved.
//

import Foundation
import Alamofire

extension Alamofire.AFDataResponse {
    func debugLog() {
        
        var output: [String] = []
        var datastring = ""
        if let body = request?.httpBody {
            datastring = NSString(data: body, encoding: String.Encoding.utf8.rawValue)! as String
        }
        
        if let header = request?.allHTTPHeaderFields {
            print(header)
        }
        
        
        output.append(request != nil ? "[Request]: \(request!)" : "[Request]: nil")
        output.append("[Method]: \(String(describing: request?.httpMethod))")
        output.append("[Body]: \(datastring)")
        
        if let error = self.error{
             output.append("[Result]: \(error.localizedDescription)")
        }
        
        if let data = self.data, let json = String(data: data, encoding: .utf8){
            output.append("[Result]: \(json)")
        }
        
    
        
        print(output.joined(separator: "\n"))
    }
}

/*extension Alamofire.AFDataResponse {
    func responseDecoder<D: Decodable>(_ type: D.Type) -> D? {
        
        var output: [String] = []
        var datastring = ""
        if let body = request?.httpBody {
            datastring = NSString(data: body, encoding: String.Encoding.utf8.rawValue)! as String
        }
        
        if let header = request?.allHTTPHeaderFields {
            print(header)
        }
        
        
        output.append(request != nil ? "[Request]: \(request!)" : "[Request]: nil")
        output.append("[Method]: \(String(describing: request?.httpMethod))")
        output.append("[Body]: \(datastring)")
        
        if let error = self.error {
            output.append("[Result]: \(error.localizedDescription)")
            return Bas
        }
        
        if let data = self.data, let json = String(data: data, encoding: .utf8){
            output.append("[Result]: \(json)")
            print(output.joined(separator: "\n"))
            return try! JSONDecoder().decode(type, from: data)
        }
       
         return nil
        
    }
}*/



