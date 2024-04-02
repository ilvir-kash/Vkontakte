//
//  Gr.swift
//  Vkontakte
//
//  Created by Ильвир Кашаев on 20.03.2024.
//

import UIKit

struct Gru: Equatable {
    let name: String
    let imageName: String
    let post1: [Post1]
}


struct Post1: Equatable {
    let text: String
    let imageName: String
}
