//
//  ProductRowView.swift
//  Clipkart
//
//  Created by pratik.nalawade on 25/10/24.
//

import SwiftUI

struct ProductRowView: View {
    let product: Product
    
    var body: some View {
        HStack(spacing: 8) {
            if let url = URL(string: product.image) {
                productImage(url: url)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                // Title
                Text(product.title)
                    .font(.headline)
                    .lineLimit(2)
                
                // Category and Rating
                HStack {
                    Text(product.category)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Spacer()
                    
                    HStack {
                        Image(systemName: "star.fill")
                        
                        Text(product.rating.rate.toString())
                    }
                    .fontWeight(.medium)
                    .foregroundStyle(.yellow)
                }
                
                // Description
                Text(product.description)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .lineLimit(3)
                
                // Price and Buy Button
                HStack {
                    Text(product.price, format: .currency(code: "USD"))
                        .font(.title3)
                        .foregroundStyle(.indigo)
                    Spacer()
                    buyButton
                }
            }
        }
        .padding()
        
    }
    
    func productImage(url: URL) -> some View {
        AsyncImage(url: url) { image in
            image.resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
    }
    
    var buyButton: some View {
        Button(action: {}, label: {
            Text("Buy")
                .foregroundStyle(.white)
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(.indigo)
                .clipShape(.capsule)
        })
    }
}

#Preview {
    ProductRowView(product: Product(id: 0, title: "", description: "", category: "", image: "", price: 0.0, rating: Rate(rate: 0.0, count: 0)))
}
