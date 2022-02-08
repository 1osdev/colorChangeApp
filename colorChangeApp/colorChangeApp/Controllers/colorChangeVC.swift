//
//  colorChangeVC.swift
//  colorChangeApp
//
//  Created by Дмитрий Смирнов on 7.02.22.
//

import UIKit

protocol ColorChangeVCdelegate: AnyObject {
    func changeColor(red: Float, green: Float, blue: Float)
}

final class colorChangeVC: UIViewController, UITextFieldDelegate {

    @IBOutlet private weak var colorView: UIView!

    var red: Float = 0.0
    var green: Float = 0.0
    var blue: Float = 0.0

    @IBOutlet private weak var redSliderView: UISlider!
    @IBOutlet private weak var greenSliderView: UISlider!
    @IBOutlet private weak var blueSliderView: UISlider!

    @IBOutlet private weak var redTF: UITextField!
    @IBOutlet private weak var greenTF: UITextField!
    @IBOutlet private weak var blueTF: UITextField!

    @IBOutlet private weak var actionButton: UIButton!

    weak var delegate: ColorChangeVCdelegate?

    override func viewWillLayoutSubviews() {
        colorView.layer.cornerRadius = 10

        redSliderView.tintColor = .red
        redSliderView.setValue(red, animated: true)
        redTF.returnKeyType = .done
        redTF.delegate = self
        redTF.text = String(Int(red))

        greenSliderView.tintColor = .green
        greenSliderView.setValue(green, animated: true)
        greenTF.returnKeyType = .done
        greenTF.delegate = self
        greenTF.text = String(Int(green))

        blueSliderView.tintColor = .blue
        blueSliderView.setValue(blue, animated: true)
        blueTF.returnKeyType = .done
        blueTF.delegate = self
        blueTF.text = String(Int(blue))

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        colorView.backgroundColor = UIColor(
            red: CGFloat(red) / 255,
            green: CGFloat(green) / 255,
            blue: CGFloat(blue) / 255,
            alpha: 1
        )
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    private func changeColor(red: Float, green: Float, blue: Float) {
        colorView.layer.backgroundColor = CGColor(
            red: CGFloat(red) / 255,
            green: CGFloat(green) / 255,
            blue: CGFloat(blue) / 255,
            alpha: 1
        )
    }

    @IBAction func changeRedColor(_ sender: Any) {
        red = redSliderView.value
        changeColor(red: red, green: green, blue: blue)
    }

    @IBAction func changeGreenColor(_ sender: Any) {
        green = greenSliderView.value
        changeColor(red: red, green: green, blue: blue)
    }

    @IBAction func changeBlueColor(_ sender: Any) {
        blue = blueSliderView.value
        changeColor(red: red, green: green, blue: blue)
    }

    @IBAction func doneAction(_ sender: Any) {
        delegate?.changeColor(red: red,
            green: green,
            blue: blue)
        navigationController?.popViewController(animated: true)
    }
}
