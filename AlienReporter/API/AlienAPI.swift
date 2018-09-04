//
//  AlienAPI.swift
//  AlienReporter
//
//  Created by Daniel Colnaghi on 03/09/2018.
//  Copyright © 2018 Daniel Colnaghi. All rights reserved.
//

import Foundation

struct AlienAPI {
    
    func loadAlienForm(_ success: @escaping (_ form: Form) -> Void, fail: @escaping (_ error: String) -> Void) {
        
        let urlRequest = URLRequest(url: URL(string: "http://www.mocky.io/v2/59f7760a2f0000ab1d55864e")!)
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if let error = error {
                fail("Error getting response from server. \(error.localizedDescription)")
                return
            }
            
            if let data = data {
                print(String(data: data, encoding: .utf8) ?? "")
                
                do {
                    let form = try JSONDecoder().decode(Form.self, from: data)
                    success(form)
                    
                } catch {
                    print(error)
                }
            } else {
                fail("Error with data response")
            }
            
        }.resume()
    }
}
