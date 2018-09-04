//
//  ViewController.swift
//  AlienReporter
//
//  Created by Daniel Colnaghi on 02/09/2018.
//  Copyright © 2018 Daniel Colnaghi. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {

    @IBOutlet weak var tblForm: UITableView!
    var formVM = FormViewModel()
    @IBOutlet weak var lblFormChangeInfo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblForm.keyboardDismissMode = .onDrag
        
        formVM.loadData {
            DispatchQueue.main.async {
                self.lblFormChangeInfo.text = self.formVM.formStatus
                self.tblForm.isEditing = true
                self.tblForm.reloadData()
            }
        }
    }
}

extension FormViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FieldCell") as? FieldCell else {
            return UITableViewCell()
        }
        
        cell.model = formVM.fieldAtIndex(indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return formVM.count
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        formVM.reorderItensAtIndex(sourceIndexPath.row, ToIndex: destinationIndexPath.row)
    }

}
