//
//  SubscriptionCellView.swift
//  Allowance
//
//  Created by Rohan Nagar on 2/19/21.
//

import SwiftUI
import Kingfisher

struct SubscriptionCellView: View {
  var subscription: Subscription

  let processor = DownsamplingImageProcessor(size: CGSize(width: 100, height: 100))

  var body: some View {
    ZStack {
      // Background
      RoundedRectangle(cornerRadius: 6, style: .continuous)
        .fill(subscription.color)
        .frame(height: 70)
        .padding(EdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 10))

      // Foreground
      HStack() {
        KFImage(URL(string: subscription.imageUrl)!)
          .setProcessor(processor)
          .scaleFactor(UIScreen.main.scale)
          .cacheOriginalImage()

        VStack(alignment: .leading) {
          HStack {
            Text(subscription.name)
              .foregroundColor(.white)
              .bold()
            Spacer()
            Text(subscription.price)
              .foregroundColor(.white)
              .bold()
          }
          HStack {
            Text(subscription.description)
              .foregroundColor(.white)
              .font(.subheadline)
            Spacer()
            Text(subscription.timeToNextBill)
              .foregroundColor(.white)
              .font(.subheadline)
          }

        }
      }.padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25))
    }
  }
}

struct SubscriptionCellView_Previews: PreviewProvider {
    static var previews: some View {
      SubscriptionCellView(subscription: Subscription(
                            id: 1,
                            name: "Spotify",
                            description: "MUSIC STREAMING",
                            price: "$12.99",
                            imageUrl: "https://www.rohannagar.com/allowance-data/spotify/white.png",
                            firstBill: Date(),
                            cycle: .monthly,
                            hexColor: "#1db954"))
    }
}
