//
//  ViewController.swift
//  ViewSliderColor
//
//  Created by Виталий Оранский on 26.03.2021.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {
    
    var color: UIColor!
    var delegate: MainViewControllerDelegate!
    
    //MARK: IB - Outlet
    @IBOutlet weak var viewForSlider: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redField: UITextField!
    @IBOutlet weak var greenField: UITextField!
    @IBOutlet weak var blueField: UITextField!
    
    //MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        viewForSlider.layer.cornerRadius = 15
        setupSliders()
        setupLabels()
        setupFields()
        redField.delegate = self
        greenField.delegate = self
        blueField.delegate = self
        viewForSlider.backgroundColor = color
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    //MARK: IB - Action
    @IBAction func redSliderAction() {
        changeViewColor()
        redLabel.text = String(format: "%.2f", redSlider.value)
        redField.text = String(format: "%.2f", redSlider.value)
    }
    @IBAction func greenSliderAction() {
        changeViewColor()
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        greenField.text = String(format: "%.2f", greenSlider.value)
    }
    @IBAction func blueSliderAction() {
        changeViewColor()
        blueLabel.text = String(format: "%.2f", blueSlider.value)
        blueField.text = String(format: "%.2f", blueSlider.value)
    }
    
    @IBAction func doneButtonAction(_ sender: Any) {
        dismiss(animated: true)
        delegate.setColor(color: color)
    }
    
    //MARK: - Public Methods
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        return updatedText.count <= 4
    }

    
    func textFieldDidBeginEditing(_ textField: UITextField){
        let keyPadToolBar = UIToolbar()
        keyPadToolBar.items = [
            UIBarButtonItem(
                barButtonSystemItem: UIBarButtonItem.SystemItem.fixedSpace,
                target: self,
                action: nil),
            UIBarButtonItem(
                title: "Done",
                style: UIBarButtonItem.Style.done,
                target: textField,
                action: #selector(UITextField.resignFirstResponder)
            )
        ]
        keyPadToolBar.sizeToFit()
        textField.inputAccessoryView = keyPadToolBar
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        guard let value = Float(text), value >= 0 && value <= 1 else {
            showAlert(title: "Некорректный ввод",
                      massage: "Введите значение от: 0.0 - 1.0", textField: textField)
            return
        }
        
        switch textField {
        case redField:
            redSlider.value = value
        case greenField:
            greenSlider.value = value
        case blueField:
            blueSlider.value = value
        default:
            return
        }
        changeViewColor()
    }
    
    
    //MARK: - Private Methods
    private func setupSliders() {
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        let sliderColorValue = CIColor(color: color)
        
        redSlider.value = Float(sliderColorValue.red)
        greenSlider.value = Float(sliderColorValue.green)
        blueSlider.value = Float(sliderColorValue.blue)        
    }
    
    private func setupFields() {
        redField.text = String(format: "%.2f", redSlider.value)
        greenField.text = String(format: "%.2f", greenSlider.value)
        blueField.text = String(format: "%.2f", blueSlider.value)
    }
    
    
    private func setupLabels() {
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
    }
    
    private func changeViewColor() {
        viewForSlider.backgroundColor = .init(red: CGFloat(redSlider.value),
                                              green: CGFloat(greenSlider.value),
                                              blue: CGFloat(blueSlider.value),
                                              alpha: 1)
        color = viewForSlider.backgroundColor
    }
    

    
    private func showAlert(title: String, massage: String, textField: UITextField) {
        let alert = UIAlertController(title: title,
                                      message: massage,
                                      preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Done", style: .default)
        alert.addAction(alertAction)
        textField.text = "0"
        present(alert, animated: true)
    }
}




