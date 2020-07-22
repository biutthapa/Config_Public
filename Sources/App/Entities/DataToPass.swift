//
//  DataToPass.swift
//  App
//
//  Created by Biut Raj Thapa on 5/18/20.
//

import Vapor


struct PropertyAndRiskType: Content {
    var propertyType: PropertyType.RawValue
    var riskType: [RiskType.RawValue]
}

// APARTMENT

struct ApartmentNoOfRoomFloorEntrance: Content {
    var numberOfRooms: Int
    var numberOfFloors: Int
    var numberOfEntrances: Int
}

struct ApartmentOfferToShow: Content {
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
}



struct ApartmentDataToSend: Content {
    let basicPackageData: [ApartmentOfferToShow]
    let recommendedPackageData: [ApartmentOfferToShow]
}

struct ApartmentBasicPackageSelected: Content {
    let StarterKitPlusQuantity: Int?
    let CombiProtectQuantity: Int?
    let StreetSirenQuantity: Int?
    let KeyPadQuantity: Int?
    let MotionCamQuantity: Int?
    let IndoorSirenQuantity: Int?
    let DoorProtectQuantity: Int?
    let SmokeDetectorQuantity: Int?
    let LeakDetectorQuantity: Int?
    
    let basicColorToggle: ColorType.RawValue?
}

struct ApartmentRecommendedPackageSelected: Content {
    let StarterKitPlusQuantity: Int?
    let CombiProtectQuantity: Int?
    let StreetSirenQuantity: Int?
    let KeyPadQuantity: Int?
    let MotionCamQuantity: Int?
    let IndoorSirenQuantity: Int?
    let DoorProtectQuantity: Int?
    let SmokeDetectorQuantity: Int?
    let LeaksProtectQuantity: Int?
    let MotionProtectCurtainQuantity: Int?
    
    let recommendedColorToggle: String?

}

struct ApartmentPackageBuyDataToSend: Content {
    let colorSelected: ColorType.RawValue
    let totalFromPreviousPage: String
}

// HOUSE

struct HouseNoOfRoomFloorEntrance: Content {
    var numberOfRooms: Int
    var numberOfFloors: Int
    var numberOfEntrances: Int
    var isOutdoorSelected: String?
}

struct HouseOfferToShow: Content {
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

}



struct HouseDataToSend: Content {
    let basicPackageData: [ApartmentOfferToShow]
    let recommendedPackageData: [ApartmentOfferToShow]
}

struct HouseBasicPackageSelected: Content {
    let StarterKitPlusQuantity: Int?
    let CombiProtectQuantity: Int?
    let StreetSirenQuantity: Int?
    let KeyPadQuantity: Int?
    let MotionCamQuantity: Int?
    let IndoorSirenQuantity: Int?
    let DoorProtectQuantity: Int?
    let SmokeDetectorQuantity: Int?
    let LeakDetectorQuantity: Int?
    let InfraredMotionDetectorOutsideQuantity: Int?
    
    let basicColorToggle: String?


}

struct HouseRecommendedPackageSelected: Content {
    let StarterKitPlusQuantity: Int?
    let CombiProtectQuantity: Int?
    let StreetSirenQuantity: Int?
    let KeyPadQuantity: Int?
    let MotionCamQuantity: Int?
    let IndoorSirenQuantity: Int?
    let DoorProtectQuantity: Int?
    let SmokeDetectorQuantity: Int?
    let LeaksProtectQuantity: Int?
    let MotionProtectCurtainQuantity: Int?
    let InfraredMotionDetectorOutsideQuantity: Int?

    let recommendedColorToggle: String?

}


struct HousePackageBuyDataToSend: Content {
    let colorSelected: ColorType.RawValue
    let totalFromPreviousPage: String
}

struct HouseParameterSizeData: Content {
    let length: Int
    let width: Int
}

struct HouseOnParameterData: Content {
    let locationOnParameter: String
}

struct OfferPageToBuyPageData: Content {
    
}

struct PayData: Content {
    let isInstallationSelected: String?
    let isCameraSelected: String?
    let email: String
    let phone: String
    let firstName: String
    let lastName: String
    let addressLine1: String
    let addressLine2: String
    let postalCode: String
    let city: String
    let country: String
}
