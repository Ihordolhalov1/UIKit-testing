//
//  ViewController.swift
//  UIKit testing
//
//  Created by Ihor Dolhalov on 03.08.2022.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    
    var uiElements = ["UISegmentedControl",
                      "UILabel",
                      "UISlider",
                      "UITextField",
                      "UIButton",
                      "UIDatePicker"]
    var selectedElement : String?
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet var actionButtons: [UIButton]!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var segmentedControlLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textFieldButton: UIButton!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    @IBOutlet weak var switchLabel: UILabel!
    
    
    @IBOutlet weak var textFieldUIPicker: UITextField!
    
  
    @IBOutlet weak var textView: UITextView!
    
    
    @IBOutlet weak var fontStepper: UIStepper!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.isHidden = true
        label.font = label.font.withSize(35)
        button.isHidden = true
        button.setTitle("Clear", for: UIControl.State.normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .red
        
        segmentedControlLabel.isHidden = true
        segmentedControlLabel.font = segmentedControlLabel.font.withSize(20)
        segmentedControlLabel.textAlignment = .center
        segmentedControlLabel.numberOfLines = 0
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: true)
        
        slider.maximumValue = 100
        slider.minimumValue = 1
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .blue
        
        choiceUiElement()
        createToolbar()
        
        textView.isHidden = true
        textView.alpha = 0
        textView.font = UIFont(name:
            "AppleSDGothicNeo-Regular", size: 17)
        textView.layer.cornerRadius = 10
        
        fontStepper.value = 17
        fontStepper.minimumValue = 10
        fontStepper.maximumValue = 25
        fontStepper.layer.cornerRadius = 5
        fontStepper.tintColor = .white
        fontStepper.backgroundColor = .green
        
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .green
        activityIndicator.startAnimating()
        self.view.isUserInteractionEnabled = false
        
        UIView.animate(withDuration: 0, delay: 5, options: .curveEaseIn, animations: {
            self.textView.alpha = 1
        }) { (finished) in
            self.activityIndicator.stopAnimating()
            self.textView.isHidden = false
            self.view.isUserInteractionEnabled = true
        }
       
        progressView.setProgress(0, animated: true)
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in  if self.progressView.progress != 1 {
            self.progressView.progress += 0.2
        } else {self.activityIndicator.stopAnimating()
            self.textView.isHidden = false
            self.view.isUserInteractionEnabled = true
            self.progressView.isHidden = true
        }
        }
        
        
        
    }
    // Hide keyboard when tap out of textview
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
      //  self.view.endEditing(true)   // hide keyboard everywhere on view
        textView.resignFirstResponder() // hide keyboard exactly in textview
   
        textView.delegate = self
    }
    
    func choiceUiElement() {
        let elementPicker = UIPickerView()
        elementPicker.delegate = self
        
        textFieldUIPicker.inputView = elementPicker
    }
    
    func hideAllElements() {
        label.isHidden = true
        button.isHidden = true
        actionButtons[0].isHidden = true
        actionButtons[1].isHidden = true
        segmentedControl.isHidden = true
        segmentedControlLabel.isHidden = true
        slider.isHidden = true
        textField.isHidden = true
        textFieldButton.isHidden = true
        datePicker.isHidden = true
    }
    
    func createToolbar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem (title: "Done", style: .plain, target: self, action: #selector(dismissKeyboard))
        toolbar.setItems([doneButton], animated: true)
        toolbar.isUserInteractionEnabled = true
        textFieldUIPicker.inputAccessoryView = toolbar
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func pressedButton(_ sender: UIButton) {
        label.isHidden = false
        button.isHidden = false
        if sender.tag == 0 {
            label.text = "Pressed 1 button"
            label.textColor = .red
        } else if sender.tag == 1 {
            label.text = "Pressed 2 button"
            label.textColor = .blue
        } else if sender.tag == 2 {
            label.isHidden = true
            button.isHidden = true
        }
    }
    
    @IBAction func choiceSegment(_ sender: UISegmentedControl) {
        segmentedControlLabel.isHidden = false
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            segmentedControlLabel.text = "1 segment is selected"
            segmentedControlLabel.textColor = .red
        case 1:
            segmentedControlLabel.text = "2 segment is selected"
            segmentedControlLabel.textColor = .blue
        case 2:
            segmentedControlLabel.text = "3 segment is selected"
            segmentedControlLabel.textColor = .green
        default:
            print("Something wrong")
        }
    }
    
    
    @IBAction func sliderAction(_ sender: UISlider) {
        label.isHidden = false
        label.text = String(round(slider.value))
        let alphaSlider = 1 - slider.value / 100
        self.view.backgroundColor = self.view.backgroundColor?.withAlphaComponent(CGFloat(alphaSlider))
    }
    
  
    var numeric = false
    @IBAction func textFieldButtonPressed(_ sender: UIButton) {
        //Check for the empty field
        guard textField.text?.isEmpty == false else {return}
        
//Check for the numeric in the field
        
     if textField.text!.contains("0") {
       numeric = true}
        else {}
    if textField.text!.contains("1") {
        numeric = true}
       else {}
    if textField.text!.contains("2") {
        numeric = true}
          else {}
    if textField.text!.contains("3") {
       numeric = true}
          else {}
    if textField.text!.contains("4") {
        numeric = true}
        else {}
      if textField.text!.contains("5") {
        numeric = true}
        else {}
        if textField.text!.contains("6") {
            numeric = true}
            else {}
        if textField.text!.contains("7") {
            numeric = true}
            else {}
        if textField.text!.contains("8") {
            numeric = true}
        else {}
        if textField.text!.contains("9") {
            numeric = true}
            else {}
        
        if numeric {
            let alert = UIAlertController(title: "Wrong format", message: "Please enter your name", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
        else {
            
        label.isHidden = false
        label.text = textField.text
            textField.text = nil
        }
        
    }
    
    @IBAction func changeDate(_ sender: UIDatePicker) {
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .full
        let dateValue = dateformatter.string(from: sender.date)
        label.isHidden = false
        label.text = dateValue
    }
    
    @IBAction func `switch`(_ sender: UISwitch) {
        if sender.isOn {
        label.isHidden = true
        button.isHidden = true
        actionButtons[0].isHidden = true
        actionButtons[1].isHidden = true
        segmentedControl.isHidden = true
        segmentedControlLabel.isHidden = true
        slider.isHidden = true
        textField.isHidden = true
        textFieldButton.isHidden = true
        datePicker.isHidden = true
        switchLabel.text = "Show all elements"
        }
        else {
            label.isHidden = false
            button.isHidden = false
            actionButtons[0].isHidden = false
            actionButtons[1].isHidden = false
            segmentedControl.isHidden = false
            segmentedControlLabel.isHidden = false
            slider.isHidden = false
            textField.isHidden = false
            textFieldButton.isHidden = false
            datePicker.isHidden = false
            switchLabel.text = "Hide all elements"
        }
        }
    
    @IBAction func sizeFontStepper(_ sender: UIStepper) {
        let font = textView.font?.fontName
        let fontSize = CGFloat(fontStepper.value)
        textView.font = UIFont(name: font!, size: fontSize)
    }
    
}


extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
}

func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return uiElements.count
}

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return uiElements[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedElement = uiElements[row]
        textFieldUIPicker.text = selectedElement
        switch row {
        case 0:
            hideAllElements()
            segmentedControl.isHidden = false
        case 1:
            hideAllElements()
            label.isHidden = false
        case 2:
            hideAllElements()
            slider.isHidden = false
        case 3:
            hideAllElements()
            textField.isHidden = false
        case 4:
            hideAllElements()
            button.isHidden = false
        case 5:
            hideAllElements()
            datePicker.isHidden = false
        default:
            hideAllElements()
        }
    }
    
   
}

