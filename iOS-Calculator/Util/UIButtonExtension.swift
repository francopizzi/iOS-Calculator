//
//  UIButtonExtension.swift
//  iOS-Calculator
//
//  Created by franco pizzi on 31/12/2021.
//

import UIKit

extension UIButton{
    //BordeRedondo
    func round() {
        layer.cornerRadius = bounds.height / 3
        clipsToBounds = true
    }
    
    //Brillo
    func shine () {
        UIView.animate (withDuration: 0.2, animations: {
            self.alpha = 0.5
        })
        {
            (completion) in
            UIView.animate (withDuration: 0.1, animations: {
                self.alpha = 1
            })
        }
    }
}
