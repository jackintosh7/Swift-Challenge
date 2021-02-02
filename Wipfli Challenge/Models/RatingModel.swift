//
//  RatingModel.swift
//  Wipfli Challenge
//
//  Created by Jack Higgins on 1/27/21.
//

import Foundation

final class RatingModel: NSObject, Decodable {
    
    @objc dynamic var source: String?
    @objc dynamic var value: String?
    
    override init() {
        super.init()
    }
    
    init(from decoder: Decoder) throws {
        super.init()
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        source = try? container.decodeIfPresent(.source)
        value =  try? container.decodeIfPresent(.value)
    }
}

extension RatingModel {
    
    enum CodingKeys: String, CodingKey {
        
        case source = "Source"
        case value = "Value"
    }
}
