//
//  ViewController.swift
//  QRCODE_TEST
//
//  Created by 김성남 on 13/04/2019.
//  Copyright © 2019 김성남. All rights reserved.
//

import UIKit

class ViewController: extensionViewController {
  
  @IBOutlet weak var touchButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.touchButton.setCornerRadius(radius: 10)
  }
  
  
  @IBAction func joinButtonTouched(_ sender: UIButton) {
    let destination = QRCODEInputViewController.instantiate(storyboard: "Main")
    self.present(destination, animated: true, completion: nil)
  }

}

