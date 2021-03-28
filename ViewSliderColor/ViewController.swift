//
//  ViewController.swift
//  ViewSliderColor
//
//  Created by Виталий Оранский on 26.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: IB - Outlet
    @IBOutlet weak var viewForSlider: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewForSlider.layer.cornerRadius = 15
        setupLabels()
        setupSliders()
        changeViewColor()
    }
    
    //MARK: IB - Action
    @IBAction func redSliderAction() {
        changeViewColor()
        redLabel.text = "Red: \(String(format: "%.2f", redSlider.value))"
    }
    @IBAction func greenSliderAction() {
        changeViewColor()
        greenLabel.text = "Green: \(String(format: "%.2f", greenSlider.value))"
    }
    @IBAction func blueSliderAction() {
        changeViewColor()
        blueLabel.text = "Blue: \(String(format: "%.2f", blueSlider.value))"
    }
    
    private func setupSliders() {
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
    }
    
    private func setupLabels() {
        redLabel.text = "Red: \(String(format: "%.2f", redSlider.value))"
        greenLabel.text = "Green: \(String(format: "%.2f", greenSlider.value))"
        blueLabel.text = "Blue: \(String(format: "%.2f", blueSlider.value))"
    }
    
    private func changeViewColor() {
        viewForSlider.backgroundColor = .init(red: CGFloat(redSlider.value),
                                              green: CGFloat(greenSlider.value),
                                              blue: CGFloat(blueSlider.value),
                                              alpha: 1)
    }
}




