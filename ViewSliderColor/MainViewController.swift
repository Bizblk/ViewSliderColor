//
//  MainViewController.swift
//  ViewSliderColor
//
//  Created by Виталий Оранский on 10.04.2021.
//

import UIKit


protocol MainViewControllerDelegate {
    func setColor(color: UIColor)
}

class MainViewController: UIViewController, MainViewControllerDelegate {
    
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "settingsSegue" else { return }
        guard  let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.color = view.backgroundColor
        settingsVC.delegate = self
    }
    
    //
    func setColor(color: UIColor) {
        self.view.backgroundColor = color
    }
    
}
