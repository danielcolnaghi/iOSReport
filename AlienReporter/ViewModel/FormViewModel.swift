//
//  FormViewModel.swift
//  AlienReporter
//
//  Created by Daniel Colnaghi on 03/09/2018.
//  Copyright © 2018 Daniel Colnaghi. All rights reserved.
//

import Foundation

class FormViewModel {
    
    private var form: Form?
    
    func loadData(_ complete: @escaping () -> Void) {
        
        AlienAPI().loadAlienForm({ (form) in
            self.form = form
            complete()
        }) { (error) in
            print(error)
        }
    }
    
    var count: Int {
        return self.form?.fields.count ?? 0
    }
    
    func fieldAtIndex(_ index: Int) -> Field? {
        return self.form?.fields[index]
    }
    
    var formStatus: String {
        
        if let form = form {
            let format = DateFormatter()
            format.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            format.timeZone = TimeZone(secondsFromGMT: 0)
            let date = format.date(from: form.lastChangedDate)
            format.dateStyle = .medium
            
            let status = "Last change by \(form.lastChangedBy)\r\(format.string(from: date!))"
            
            return status
        }
        
        return ""
    }
    
    func reorderItensAtIndex(_ index: Int, ToIndex toIndex: Int) {
        let item = form?.fields[index]
        form?.fields.remove(at: index)
        form?.fields.insert(item!, at: toIndex)
    }
}
