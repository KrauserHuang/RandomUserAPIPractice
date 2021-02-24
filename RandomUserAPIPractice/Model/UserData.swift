//
//  UserData.swift
//  RandomUserAPIPractice
//
//  Created by Tai Chin Huang on 2021/2/21.
//

import Foundation

struct UserData: Codable {
    let results: [Result]
    
    struct Result: Codable {
        let name: Name
        let location: Location
        let picture: Picture
        
        struct Name: Codable {
            let first: String
            let last: String
        }
        struct Location: Codable {
            let street: Street
            struct Street: Codable {
                let name: String
                let number: Int
            }
        }
        struct Picture: Codable {
            let large: URL?
            let medium: URL?
            let thumbnail: URL?
        }
    }
}
