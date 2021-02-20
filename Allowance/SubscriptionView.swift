//
//  SubscriptionView.swift
//  Allowance
//
//  Created by Rohan Nagar on 2/19/21.
//

import SwiftUI

struct SubscriptionView: View {
    var body: some View {
      ScrollView {
        SubscriptionCellView(subscription: Subscription(
                              id: 1,
                              name: "Spotify",
                              description: "MUSIC STREAMING",
                              price: "$12.99",
                              firstBill: Date(timeIntervalSince1970: 100),
                              cycle: .yearly, hexColor: "#1db954"))
        SubscriptionCellView(subscription: Subscription(
                              id: 2,
                              name: "Hulu",
                              description: "AD-SUPPORTED VERSION",
                              price: "$1.99",
                              firstBill: Date(),
                              cycle: .monthly, hexColor: "#1ce783"))
        SubscriptionCellView(subscription: Subscription(
                              id: 3,
                              name: "Netflix",
                              description: "FROM T-MOBILE",
                              price: "$0.00",
                              firstBill: Date(timeIntervalSince1970: 1435),
                              cycle: .monthly, hexColor: "#e50914"))
      }
    }
}

struct SubscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionView()
    }
}
