//
//  QRCODEImageViewController.swift
//  QRCODE_TEST
//
//  Created by 김성남 on 04/05/2019.
//  Copyright © 2019 김성남. All rights reserved.
//

import UIKit

protocol MainViewProtocol {
  func MainViewMove(check: String)
}

class QRCODEImageViewController: extensionViewController {
  
  @IBOutlet weak var qrcodeImageView: UIImageView!
  @IBOutlet weak var mainButton: UIButton!
  
  var receiveUrl = ""
  var qrcodeImage: CIImage!
  var delegate: MainViewProtocol?
  
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
    self.mainButton.setCornerRadius(radius: 10)
  }
  
  override func initRequest() {
    super.initRequest()
    
    // 초기화
    self.qrcodeImage = nil
    
    // 받은 주소 data로 형 변환
    let data = self.receiveUrl.data(using: String.Encoding.isoLatin1, allowLossyConversion: false)
    
    // Create a QR code filter
    let filter = CIFilter(name: "CIQRCodeGenerator")
    
    // QR 코드 내용을 설정하려면 KVC 모드로 설정해야 한다.
    // QR 코드의 값은 NSData여야 함
    filter?.setValue(data, forKeyPath: "inputMessage")
    
    // QR 코드 레벨 설정(수정 속도)
    // key : inputCorrectionLevel
    // value L: 7% M (default): 15% Q: 25% H: 30%
    filter?.setValue("Q", forKeyPath: "inputCorrectionLevel")
    
    self.qrcodeImage = filter?.outputImage
    self.qrcodeImageView.image = UIImage(ciImage: self.qrcodeImage)
    
    displayQRCodeImage()
    
  }

  // imageView에 넣기
  func displayQRCodeImage() {
    let scaleX = self.qrcodeImageView.frame.size.width / qrcodeImage.extent.size.width
    let scaleY = self.qrcodeImageView.frame.size.height / qrcodeImage.extent.size.height
    
    let transformedImage = qrcodeImage.transformed(by: CGAffineTransform(scaleX: scaleX, y: scaleY))
    
    self.qrcodeImageView.image = UIImage(ciImage: transformedImage)
  }
  
  @IBAction func backButtonTouched(_ sender: UIButton) {
    self.dismiss(animated: true, completion: nil)
  }
  
  @IBAction func mainButtonTouched(_ sender: UIButton) {
    self.dismiss(animated: false) {
      self.delegate?.MainViewMove(check: "OK")
    }
  }
}
