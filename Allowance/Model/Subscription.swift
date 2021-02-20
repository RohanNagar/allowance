//
//  Subscription.swift
//  Allowance
//
//  Created by Rohan Nagar on 2/19/21.
//

import Foundation
import SwiftUI

struct Subscription: Hashable, Identifiable {
  var id: Int
  var name: String
  var description: String
  var price: String

  var imageUrl: String

  var firstBill: Date
  var cycle: CycleLength

  var timeToNextBill: String {
    let currentDate = Date()
    var calculatedDate = firstBill
    NSLog("Current Date: " + currentDate.debugDescription)
    NSLog("First bill: " + calculatedDate.debugDescription)

    switch cycle {
    case .daily:
      while calculatedDate < currentDate {
        calculatedDate = Calendar.current.date(byAdding: DateComponents(day: 1), to: calculatedDate)!
      }
    case .monthly:
      while calculatedDate < currentDate {
        calculatedDate = Calendar.current.date(byAdding: DateComponents(month: 1), to: calculatedDate)!
      }
    case .yearly:
      while calculatedDate < currentDate {
        calculatedDate = Calendar.current.date(byAdding: DateComponents(year: 1), to: calculatedDate)!
      }
    }

    NSLog("Calc date: " + calculatedDate.debugDescription)
    NSLog("Offset: " + calculatedDate.offset(from: currentDate))
    return calculatedDate.offset(from: currentDate).uppercased()
  }

  var hexColor: String
  var color: Color {
    Color(hexString: hexColor)
  }

  enum CycleLength {
    case daily, monthly, yearly
  }
}
