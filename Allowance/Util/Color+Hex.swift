//
//  Color+Hex.swift
//  Allowance
//
//  Created by Rohan Nagar on 2/19/21.
//

import Foundation
import SwiftUI

extension Color {
  init(hexString: String, opacity: Double = 1.0) {
    var hString = hexString

    if hexString.hasPrefix("#") {
      let start = hexString.index(hexString.startIndex, offsetBy: 1)
      hString = String(hexString[start...])
    }

    let scanner = Scanner(string: hString)
    var hexNumber: UInt64 = 0

    if scanner.scanHexInt64(&hexNumber) {
      self.init(hex: hexNumber, opacity: opacity)
    } else {
      self.init(hex: 0x000000, opacity: opacity)
    }
  }

  init(hex: UInt64, opacity:Double = 1.0) {
    let red = Double((hex & 0xff0000) >> 16) / 255.0
    let green = Double((hex & 0xff00) >> 8) / 255.0
    let blue = Double((hex & 0xff) >> 0) / 255.0
    self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
  }
}
