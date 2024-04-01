//
//  ProductViewModel.swift
//  ProductApi-SwiftUI
//
//  Created by Rahul on 25/03/24.
//

import Foundation

@Observable class ProductViewModel {
    
    var product: [Product] = []
    
    private let manager = APIManager()
    
    func fetchProduct() async {
        do {
            product = try await manager.request(url: "https://fakestoreapi.com/products")
            print(product)
        } catch {
            print("Fetch Product Error: ", error)
        }
    }
    
}
