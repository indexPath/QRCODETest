//
//  QRCODEInputViewController.swift
//  QRCODE_TEST
//
//  Created by 김성남 on 04/05/2019.
//  Copyright © 2019 김성남. All rights reserved.
//

import UIKit

class QRCODEInputViewController: extensionViewController {
  @IBOutlet weak var inputTextField: UITextField!
  @IBOutlet weak var doneButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  override func initLayout() {
    super.initLayout()
    self.inputTextField.delegate = self
    self.doneButton.setCornerRadius(radius: 10)
  }
  
  override func initRequest() {
    super.initRequest()
  }
  
  
  func alert(title: String, message: String) {
    //alert
    let alertController = UIAlertController(
      title: title,
      message: message,
      preferredStyle: UIAlertController.Style.alert
    )
    let confirmAction = UIAlertAction(
    title: "OK", style: UIAlertAction.Style.default) { (action) in
    }
    alertController.addAction(confirmAction)
    present(alertController, animated: true, completion: nil)
  }
  
  
  @IBAction func backButtonTouched(_ sender: UIButton) {
    self.dismiss(animated: true, completion: nil)
  }
  
  @IBAction func doneButtonTouched(_ sender: UIButton) {
    if self.inputTextField.text == "" {
      self.alert(title: "", message: "주소를 입력해 주세요.")
      return
    }
    
    let viewMove = QRCODEImageViewController.instantiate(storyboard: "Main")
    viewMove.receiveUrl = self.inputTextField.text!
    viewMove.delegate = self
    
    self.inputTextField.text = ""
    self.present(viewMove, animated: true, completion: nil)
  }
}

extension QRCODEInputViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
}


// Main 으로 이동하는 delegate
extension QRCODEInputViewController: MainViewProtocol {
  func MainViewMove(check: String) {
    if check == "OK" {
      self.dismiss(animated: false, completion: nil)
    }
  }
}
