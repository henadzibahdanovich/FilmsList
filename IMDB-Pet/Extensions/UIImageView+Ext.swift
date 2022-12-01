//
//  UIImageView+Ext.swift
//  IMDB-Pet
//
//  Created by Henadzi on 30/11/2022.
//

import UIKit

extension UIImageView {
    func load(from url: String?) {
        DispatchQueue.global(qos: .userInitiated).async {
            if let url = URL(string: url ?? "") {
                do {
                    let data = try Data(contentsOf: url)
                    DispatchQueue.main.async {
                        self.image = UIImage(data: data)
                    }
                } catch {
                    print("Loading image in cell error: " + error.localizedDescription)
                }
            }
        }
    }
}
