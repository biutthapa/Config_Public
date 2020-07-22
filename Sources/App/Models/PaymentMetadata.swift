//
//  PaymentMetadata.swift
//  App
//
//  Created by Biut Raj Thapa on 21/07/2020.
//

import Vapor

struct PaymentMetadata: Content {
    let customer: Customer
    let order: Order

    func customerArray() -> [String: String] {
        return [
            "Email": customer.email,
            "PhoneNumber": customer.phone,
            "FirstName": customer.firstName,
            "LastName": customer.lastName,
            "AddressLine1": customer.addressLine1,
            "AddressLine2": customer.addressLine2,
            "PostalCode": customer.postalCode,
            "City": customer.city,
            "Country": customer.country
        ]
    }
    
    func orderArray() -> [String: String] {
        var leakDetectorQuantity: String {
            if order.LeaksProtectQuantity != "0" {
                return "0"
            } else {
                return order.LeakDetectorQuantity
            }
        }
        return [
            "isInstallationSelected": order.isInstallationSelected,
            "isCameraSelected": order.isCameraSelected,
            "StarterKitPlus": order.StarterKitPlusQuantity,
            "CombiProtect": order.CombiProtectQuantity,
            "StreetSiren": order.StreetSirenQuantity,
            "KeyPad": order.KeyPadQuantity,
            "MotionCam": order.MotionCamQuantity,
            "IndoorSiren": order.IndoorSirenQuantity,
            "DoorProtect": order.DoorProtectQuantity,
            "MotionProtectCurtain": order.MotionProtectCurtainQuantity,
            "SmokeDetector": order.SmokeDetectorQuantity,
            "LeaksProtect": order.LeaksProtectQuantity,
            "LeakDetector": leakDetectorQuantity,
            "InfraredMotionDetectorOutside": order.InfraredMotionDetectorOutsideQuantity
        ]
    }
    
    func metadata() -> [String : [String : String]] {
        return [
            "customer": customerArray(),
            "order": orderArray()
        ]
    }
}

struct Customer: Content {
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

struct Order: Content {
    let isInstallationSelected: String
    let isCameraSelected: String
    let StarterKitPlusQuantity: String
    let CombiProtectQuantity: String
    let StreetSirenQuantity: String
    let KeyPadQuantity: String
    let MotionCamQuantity: String
    let IndoorSirenQuantity: String
    let DoorProtectQuantity: String
    let MotionProtectCurtainQuantity: String
    let SmokeDetectorQuantity: String
    let LeaksProtectQuantity: String
    let LeakDetectorQuantity: String
    let InfraredMotionDetectorOutsideQuantity: String
}
