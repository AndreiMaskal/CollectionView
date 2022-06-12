//
//  Item.swift
//  HW14_CollectionViewAndreiMaskal
//
//  Created by Andrei Maskal on 12/06/2022.
//

import UIKit

struct Item {
    
    let text: String
    let image: UIImage?
    let number: UInt
}

class ItemData {
    static func getItem()-> [[Item]] {
        let sectionOne = [Item(text: "Недавние", image: UIImage(named: "image40"), number: 1234),
                          Item(text: "Избранное", image: UIImage(named: "image41"), number: 23),
                          Item(text: "Documents", image: UIImage(named: "image42"), number: 134),
                          Item(text: "Instagram", image: UIImage(named: "image43"), number: 120),
                          Item(text: "Telegram", image: UIImage(named: "image44"), number: 7),
                          Item(text: "Viber", image: UIImage(named: "image45"), number: 345),
                          Item(text: "Pазнoe", image: UIImage(named: "image46"), number: 1054),
                          Item(text: "Kорзина", image: UIImage(named: "image47"), number: 9)]
        
        let sectionTwo = [Item(text: "Люди", image: UIImage(named: "image40"), number: 1234),
                          Item(text: "Места", image: UIImage(named: "image41"), number: 23),
                          Item(text: "Pазнoe", image: UIImage(named: "image46"), number: 1054),
                          Item(text: "Kорзина", image: UIImage(named: "image47"), number: 9)]
        
        let sectionThree = [Item(text: "Видео",
                                 image: UIImage(systemName: "video")?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                                 number: 284),
                            Item(text: "Селфи",
                                 image: UIImage(systemName: "person.crop.square")?
                                .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                                 number: 52),
                            Item(text: "Фото Live Photos",
                                 image: UIImage(systemName: "livephoto")?
                                .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                                 number: 64),
                            Item(text: "Портреты",
                                 image: UIImage(systemName: "cube")?
                                .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                                 number: 136),
                            Item(text: "Снимки экрана",
                                 image: UIImage(systemName: "camera.viewfinder")?
                                .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                                 number: 1467),
                            Item(text: "Записи экрана",
                                 image: UIImage(systemName: "record.circle")?
                                .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                                 number: 44),
                            Item(text: "RAW",
                                 image: UIImage(systemName: "r.square.on.square")?
                                .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                                 number: 1)
                                ]
        
        let sectionFor = [Item(text: "Импортированные",
                               image: UIImage(systemName: "square.and.arrow.down")?
            .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                               number: 27),
                          Item(text: "Скрытые",
                               image: UIImage(systemName: "eye.slash")?
                            .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                               number: 0),
                          Item(text: "Недавно удаленные",
                               image: UIImage(systemName: "trash")?
                            .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                               number: 14)]
        
        return [sectionOne, sectionTwo, sectionThree, sectionFor]
    }
}
