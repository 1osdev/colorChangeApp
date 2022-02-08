//
//  backGroundVC.swift
//  colorChangeApp
//
//  Created by Дмитрий Смирнов on 7.02.22.
//

import UIKit

final class backGroundVC: UIViewController {

    @IBOutlet private weak var colorViewBack: UIView!

    private var red: Float = 0.0
    private var green: Float = 0.0
    private var blue: Float = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        red = 0
        green = 0
        blue = 0
    }

    override func viewDidLayoutSubviews() {
        colorViewBack.backgroundColor = UIColor(red: CGFloat(red) / 255,
            green: CGFloat(green) / 255,
            blue: CGFloat(blue) / 255,
            alpha: 1)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? colorChangeVC else { return }
        destination.delegate = self
        destination.red = red
        destination.green = green
        destination.blue = blue
    }
}
extension backGroundVC: ColorChangeVCdelegate {
    func changeColor(red: Float, green: Float, blue: Float) {
        colorViewBack.backgroundColor =
            UIColor(
            red: CGFloat(red) / 255,
            green: CGFloat(green) / 255,
            blue: CGFloat(blue) / 255,
            alpha: 1
        )
        self.red = red
        self.green = green
        self.blue = blue
    }
}
