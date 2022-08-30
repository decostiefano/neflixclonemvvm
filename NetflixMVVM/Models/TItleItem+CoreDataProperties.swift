//
//  TItleItem+CoreDataProperties.swift
//  NetflixMVVM
//
//  Created by Jerry Purnama Maulid on 30/08/22.
//
//

import Foundation
import CoreData


extension TItleItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TItleItem> {
        return NSFetchRequest<TItleItem>(entityName: "TItleItem")
    }

    @NSManaged public var id: Int64
    @NSManaged public var media_type: String?
    @NSManaged public var original_name: String?
    @NSManaged public var original_title: String?
    @NSManaged public var overview: String?
    @NSManaged public var poster_path: String?
    @NSManaged public var release_date: String?
    @NSManaged public var vote_average: Double
    @NSManaged public var vote_count: Int64

}

extension TItleItem : Identifiable {

}