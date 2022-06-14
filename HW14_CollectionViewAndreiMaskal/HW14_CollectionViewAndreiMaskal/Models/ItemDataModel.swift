//
//  ItemDataModelDataModel.swift
//  HW14_CollectionViewAndreiMaskal
//
//  Created by Andrei Maskal on 12/06/2022.
//

import UIKit

struct ItemDataModel {
    
    let text: String
    let image: UIImage?
    let number: UInt
    
    static func getItem()-> [[ItemDataModel]] {
        let sectionOne = [ItemDataModel(text: "Недавние", image: UIImage(named: "image40"), number: 1234),
                          ItemDataModel(text: "Избранное", image: UIImage(named: "image41"), number: 23),
                          ItemDataModel(text: "Documents", image: UIImage(named: "image42"), number: 134),
                          ItemDataModel(text: "Instagram", image: UIImage(named: "image43"), number: 120),
                          ItemDataModel(text: "Telegram", image: UIImage(named: "image44"), number: 7),
                          ItemDataModel(text: "Viber", image: UIImage(named: "image45"), number: 345),
                          ItemDataModel(text: "Pазнoe", image: UIImage(named: "image46"), number: 1054),
                          ItemDataModel(text: "Kорзина", image: UIImage(named: "image47"), number: 9)]
        
        let sectionTwo = [ItemDataModel(text: "Люди", image: UIImage(named: "image40"), number: 1234),
                          ItemDataModel(text: "Места", image: UIImage(named: "image41"), number: 23),
                          ItemDataModel(text: "Pазнoe", image: UIImage(named: "image46"), number: 1054),
                          ItemDataModel(text: "Kорзина", image: UIImage(named: "image47"), number: 9)]
        
        let sectionThree = [ItemDataModel(text: "Видео",
                                          image: UIImage(systemName: "video")?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                                          number: 284),
                            ItemDataModel(text: "Селфи",
                                          image: UIImage(systemName: "person.crop.square")?
                                .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                                          number: 52),
                            ItemDataModel(text: "Фото Live Photos",
                                          image: UIImage(systemName: "livephoto")?
                                .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                                          number: 64),
                            ItemDataModel(text: "Портреты",
                                          image: UIImage(systemName: "cube")?
                                .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                                          number: 136),
                            ItemDataModel(text: "Снимки экрана",
                                          image: UIImage(systemName: "camera.viewfinder")?
                                .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                                          number: 1467),
                            ItemDataModel(text: "Записи экрана",
                                          image: UIImage(systemName: "record.circle")?
                                .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                                          number: 44),
                            ItemDataModel(text: "RAW",
                                          image: UIImage(systemName: "r.square.on.square")?
                                .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                                          number: 1)]
        
        let sectionFor = [ItemDataModel(text: "Импортированные",
                                        image: UIImage(systemName: "square.and.arrow.down")?
            .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                                        number: 27),
                          ItemDataModel(text: "Скрытые",
                                        image: UIImage(systemName: "eye.slash")?
                            .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                                        number: 0),
                          ItemDataModel(text: "Недавно удаленные",
                                        image: UIImage(systemName: "trash")?
                            .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                                        number: 14)]
        
        return [sectionOne, sectionTwo, sectionThree, sectionFor]
    }
}
