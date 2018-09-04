//
//  FieldCell.swift
//  AlienReporter
//
//  Created by Daniel Colnaghi on 03/09/2018.
//  Copyright © 2018 Daniel Colnaghi. All rights reserved.
//

import UIKit

class FieldCell: UITableViewCell {

    @IBOutlet weak var lblCaption: UILabel!
    @IBOutlet weak var txtInput: UITextField!
    private var datePicker: UIDatePicker!
    
    var model: Field? {
        didSet {
            lblCaption.text = model?.caption
            txtInput.placeholder = model?.type.rawValue
            
            if model?.type == Field.FieldType.number {
                txtInput.keyboardType = .numberPad
            } else if model?.type == Field.FieldType.date {
                datePicker = UIDatePicker()
                datePicker.datePickerMode = .date
                datePicker.addTarget(self, action: #selector(dateChange(sender:)), for: .valueChanged)
                txtInput.inputView = datePicker
            }
        }
    }
    
    @objc private func dateChange(sender: UIDatePicker) {
        let format = DateFormatter()
        format.dateStyle = .short
        txtInput.text = format.string(from: sender.date)
    }
}
