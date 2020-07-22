//
//  OfferItem.swift
//  App
//
//  Created by Biut Raj Thapa on 6/16/20.
//

import Foundation

protocol OfferItem {
    var itemId: String { get }
    var title: String { get }
    var description: String { get }
    var whiteImageURL: String { get }
    var blackImageURL: String { get }
    var quantity: Int { get set }
    var quantityInputName: String { get }
    var toggleImageId: String { get }
    var priceId: String { get }
    var price: PriceInEuros { get }
    
    init(quantity: Int)
    
    func total() -> Double
    

}

extension OfferItem {
    func total() -> Double {
        return price.priceInEuros * Double(quantity)
    }
}


struct StarterKitPlus: OfferItem {
    var itemId: String
    var title: String
    var description: String
    var whiteImageURL: String
    var blackImageURL: String
    var quantity: Int
    var quantityInputName: String
    var toggleImageId: String
    var priceId: String
    var price: PriceInEuros

    
   
    
    init(quantity: Int) {
        self.itemId = "StarterKitPlus"
        self.title = "StarterKitPlus"
        self.description = "Intrusion detectors, central panel, key fob"
        self.whiteImageURL = "/images/products/StarterKit_white.png"
        self.blackImageURL = "/images/products/StarterKit_black.png"
        self.quantity = quantity
        self.quantityInputName = "StarterKitPlusQuantity"
        self.toggleImageId = "StarterKitPlusToggleImage"
        self.priceId = "StarterKitPlusPriceId"
        self.price = PriceInEuros(priceInEuros: 585.99)
    }

}

struct CombiProtect: OfferItem {
    var itemId: String
    var title: String
    var description: String
    var whiteImageURL: String
    var blackImageURL: String
    var quantity: Int
    var quantityInputName: String
    var toggleImageId: String
    var priceId: String
    var price: PriceInEuros

    
    init(quantity: Int) {
        self.itemId = "CombiProtect"
        self.title = "CombiProtect"
        self.description = "Motion detector and glass break detector in every room"
        self.whiteImageURL = "/images/products/CombiProtect_white.png"
        self.blackImageURL = "/images/products/CombiProtect_black.png"
        self.quantity = quantity
        self.quantityInputName = "CombiProtectQuantity"
        self.toggleImageId = "CombiProtectToggleImage"
        self.priceId = "CombiProtectPriceId"
        self.price = PriceInEuros(priceInEuros: 113.99)

    }
    
    
    


}

struct StreetSiren: OfferItem {
    var itemId: String
    var title: String
    var description: String
    var whiteImageURL: String
    var blackImageURL: String
    var quantity: Int
    var quantityInputName: String
    var toggleImageId: String
    var priceId: String
    var price: PriceInEuros
    
    
    
    init(quantity: Int) {
        self.itemId = "StreetSiren"
        self.title = "StreetSiren"
        self.description = "Street siren"
        self.whiteImageURL = "/images/products/StreetSiren_white.png"
        self.blackImageURL = "/images/products/StreetSiren_black.png"
        self.quantity = quantity
        self.quantityInputName = "StreetSirenQuantity"
        self.toggleImageId = "StreetSirenToggleImage"
        self.priceId = "StreetSirenPriceId"
        self.price = PriceInEuros(priceInEuros: 162.00)

    }


}

struct KeyPad: OfferItem {
    var itemId: String
    var title: String
    var description: String
    var whiteImageURL: String
    var blackImageURL: String
    var quantity: Int
    var quantityInputName: String
    var toggleImageId: String
    var priceId: String
    var price: PriceInEuros

    
    
    
    init(quantity: Int) {
        self.itemId = "KeyPad"
        self.title = "KeyPad"
        self.description = "Keypad to arm and disarm the system"
        self.whiteImageURL = "/images/products/KeyPad_white.png"
        self.blackImageURL = "/images/products/KeyPad_black.png"
        self.quantity = quantity
        self.quantityInputName = "KeyPadQuantity"
        self.toggleImageId = "KeyPadToggleImage"
        self.priceId = "KeyPadPriceId"
        self.price = PriceInEuros(priceInEuros: 130.00)

    }


}

struct MotionCam: OfferItem {
    var itemId: String
    var title: String
    var description: String
    var whiteImageURL: String
    var blackImageURL: String
    var quantity: Int
    var quantityInputName: String
    var toggleImageId: String
    var priceId: String
    var price: PriceInEuros

    
    
    
    init(quantity: Int) {
        self.itemId = "MotionCam"
        self.title = "MotionCam"
        self.description = "Motion detector for the back entrance"
        self.whiteImageURL = "/images/products/MotionCam_white.png"
        self.blackImageURL = "/images/products/MotionCam_black.png"
        self.quantity = quantity
        self.quantityInputName = "MotionCamQuantity"
        self.toggleImageId = "MotionCamToggleImage"
        self.priceId = "MotionCamPriceId"
        self.price = PriceInEuros(priceInEuros: 82.50)

    }

    
}

struct IndoorSiren: OfferItem {
    var itemId: String
    var title: String
    var description: String
    var whiteImageURL: String
    var blackImageURL: String
    var quantity: Int
    var quantityInputName: String
    var toggleImageId: String
    var priceId: String
    var price: PriceInEuros

    
    
    
    init(quantity: Int) {
        self.itemId = "IndoorSiren"
        self.title = "IndoorSiren"
        self.description = ""
        self.whiteImageURL = "/images/products/IndoorSiren_white.png"
        self.blackImageURL = "/images/products/IndoorSiren_black.png"
        self.quantity = quantity
        self.quantityInputName = "IndoorSirenQuantity"
        self.toggleImageId = "IndoorSirenToggleImage"
        self.priceId = "IndoorSirenPriceId"
        self.price = PriceInEuros(priceInEuros: 82.00)

    }


}

struct DoorProtect: OfferItem {
    var itemId: String
    var title: String
    var description: String
    var whiteImageURL: String
    var blackImageURL: String
    var quantity: Int
    var quantityInputName: String
    var toggleImageId: String
    var priceId: String
    var price: PriceInEuros

    
    
    
    init(quantity: Int) {
        self.itemId = "DoorProtect"
        self.title = "DoorProtect"
        self.description = ""
        self.whiteImageURL = "/images/products/DoorProtect_white.png"
        self.blackImageURL = "/images/products/DoorProtect_black.png"
        self.quantity = quantity
        self.quantityInputName = "DoorProtectQuantity"
        self.toggleImageId = "DoorProtectToggleImage"
        self.priceId = "DoorProtectPriceId"
        self.price = PriceInEuros(priceInEuros: 72.00)

    }


}

struct SmokeDetector: OfferItem {
    var itemId: String
    var title: String
    var description: String
    var whiteImageURL: String
    var blackImageURL: String
    var quantity: Int
    var quantityInputName: String
    var toggleImageId: String
    var priceId: String
    var price: PriceInEuros

    
    
    
    init(quantity: Int) {
        self.itemId = "SmokeDetector"
        self.title = "SmokeDetector"
        self.description = ""
        self.whiteImageURL = "/images/products/SmokeDetector_white.png"
        self.blackImageURL = "/images/products/SmokeDetector_black.png"
        self.quantity = quantity
        self.quantityInputName = "SmokeDetectorQuantity"
        self.toggleImageId = "SmokeDetectorToggleImage"
        self.priceId = "SmokeDetectorPriceId"
        self.price = PriceInEuros(priceInEuros: 96.00)

    }


}

struct LeakDetector: OfferItem {
    var itemId: String
    var title: String
    var description: String
    var whiteImageURL: String
    var blackImageURL: String
    var quantity: Int
    var quantityInputName: String
    var toggleImageId: String
    var priceId: String
    var price: PriceInEuros

    
    
    
    init(quantity: Int) {
        self.itemId = "LeakDetector"
        self.title = "LeakDetector"
        self.description = ""
        self.whiteImageURL = "/images/products/LeakDetector_white.png"
        self.blackImageURL = "/images/products/LeakDetector_black.png"
        self.quantity = quantity
        self.quantityInputName = "LeakDetectorQuantity"
        self.toggleImageId = "LeakDetectorToggleImage"
        self.priceId = "LeakDetectorPriceId"
        self.price = PriceInEuros(priceInEuros: 65.00)

    }


}

struct InfraredMotionDetectorOutside: OfferItem {
    var itemId: String
    var title: String
    var description: String
    var whiteImageURL: String
    var blackImageURL: String
    var quantity: Int
    var quantityInputName: String
    var toggleImageId: String
    var priceId: String
    var price: PriceInEuros

    
    
    
    init(quantity: Int) {
        self.itemId = "InfraredMotionDetectorOutside"
        self.title = "InfraredMotionDetectorOutside"
        self.description = ""
        self.whiteImageURL = "/images/products/InfraredMotionDetectorOutside_white.png"
        self.blackImageURL = "/images/products/InfraredMotionDetectorOutside_black.png"
        self.quantity = quantity
        self.quantityInputName = "InfraredMotionDetectorOutsideQuantity"
        self.toggleImageId = "InfraredMotionDetectorOutsideToggleImage"
        self.priceId = "InfraredMotionDetectorOutsidePriceId"
        self.price = PriceInEuros(priceInEuros: 286.00)

    }


}

struct MotionProtectCurtain: OfferItem {
    var itemId: String
    var title: String
    var description: String
    var whiteImageURL: String
    var blackImageURL: String
    var quantity: Int
    var quantityInputName: String
    var toggleImageId: String
    var priceId: String
    var price: PriceInEuros

    
    
    
    init(quantity: Int) {
        self.itemId = "MotionProtectCurtain"
        self.title = "MotionProtectCurtain"
        self.description = "MotionProtectCurtain"
        self.whiteImageURL = "/images/products/MotionProtectCurtain_white.png"
        self.blackImageURL = "/images/products/MotionProtectCurtain_black.png"
        self.quantity = quantity
        self.quantityInputName = "MotionProtectCurtainQuantity"
        self.toggleImageId = "MotionProtectCurtainToggleImage"
        self.priceId = "MotionProtectCurtainPriceId"
        self.price = PriceInEuros(priceInEuros: 148.00)

    }
}

struct LeaksProtect: OfferItem {
    var itemId: String
    var title: String
    var description: String
    var whiteImageURL: String
    var blackImageURL: String
    var quantity: Int
    var quantityInputName: String
    var toggleImageId: String
    var priceId: String
    var price: PriceInEuros

    
    
    
    init(quantity: Int) {
        self.itemId = "LeaksProtect"
        self.title = "LeaksProtect"
        self.description = "LeaksProtect"
        self.whiteImageURL = "/images/products/LeaksProtect_white.png"
        self.blackImageURL = "/images/products/LeaksProtect_black.png"
        self.quantity = quantity
        self.quantityInputName = "LeaksProtectQuantity"
        self.toggleImageId = "LeaksProtectToggleImage"
        self.priceId = "LeaksProtectPriceId"
        self.price = PriceInEuros(priceInEuros: 65.00)

    }


}






