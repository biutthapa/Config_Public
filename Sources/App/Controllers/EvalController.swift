//
//  EvalController.swift
//  App
//
//  Created by Biut Raj Thapa on 6/4/20.
//

import Vapor
import MollieKit

final class EvalController {
    
    let appController = AppController()
    
    func pay(_ req: Request) throws -> Future<Response> {
        return try req.content.decode(PayData.self).map(to: Response.self) { data in
            let session = try req.session()
            let isCameraSelected = data.isCameraSelected ?? "off"
            let isInstallationSelected = data.isInstallationSelected ?? "off"
            let email = data.email
            let phone = data.phone
            let firstName = data.firstName
            let lastName = data.lastName
            let addressLine1 = data.addressLine1
            let addressLine2 = data.addressLine2
            let postalCode = data.postalCode
            let city = data.city
            let country = data.country
            
            print("cam: \(isCameraSelected)")
            print("installation: \(isInstallationSelected)")
            
            session["email"] = email
            session["phone"] = phone
            session["firstName"] = firstName
            session["lastName"] = lastName
            session["addressLine1"] = addressLine1
            session["addressLine2"] = addressLine2
            session["postalCode"] = postalCode
            session["city"] = city
            session["country"] = country

            if isCameraSelected == "on" {
                session["isCameraSelected"] = "true"
            } else {
                session["isCameraSelected"] = "false"
            }
            
            if isInstallationSelected == "on" {
                session["isInstallationSelected"] = "true"
            } else {
                session["isInstallationSelected"] = "false"
            }

            return req.redirect(to: "/pay")

        }
    }
    
    
    
    
    
    
    func evalPropertyAndProtectionType(_ req: Request) throws -> Future<Response> {
        return try req.content.decode(PropertyAndRiskType.self).map(to: Response.self) { info in
            
            print(info.propertyType)
            print(info.riskType)
            
            // Sessions
            let session = try req.session()
            if info.riskType.contains(RiskType.theft.rawValue) {
                session["didSelectTheft"] = "true"
            } else {
                session["didSelectTheft"] = "false"
            }
            
            if info.riskType.contains(RiskType.fire.rawValue) {
                session["didSelectFire"] = "true"
            } else {
                session["didSelectFire"] = "false"
            }
            
            if info.riskType.contains(RiskType.flood.rawValue) {
                session["didSelectFlood"] = "true"
            } else {
                session["didSelectFlood"] = "false"
            }
            
            // Redirects
            if info.propertyType == PropertyType.office.rawValue {
                return req.redirect(to: "/office")
            } else if info.propertyType == PropertyType.apartment.rawValue {
                return req.redirect(to: "/apartment/noOfRoomFloorEntrance/")
            } else if info.propertyType == PropertyType.house.rawValue {
                return req.redirect(to: "/house/noOfRoomFloorEntrance/")
            } else {

                return req.redirect(to: "/error")
            }
        }
    }
    
    // APARTMENT
    
    func evalApartmentNoOfRoomFloorEntrance(_ req: Request) throws -> Future<Response> {
        return try req.content.decode(ApartmentNoOfRoomFloorEntrance.self).map(to: Response.self) { info in
            print("No of rooms: \(info.numberOfRooms)")
            print("No Of floors: \(info.numberOfFloors)")
            print("No Of entrances: \(info.numberOfEntrances)")
            
            // Sessions
            let session = try req.session()
            session["numberOfRooms"] = String(info.numberOfRooms)
            session["numberOfFloors"] = String(info.numberOfFloors)
            session["numberOfEntrances"] = String(info.numberOfEntrances)
            
            // Redirections
            return req.redirect(to: "/apartment/offer/")
        }
    }
    
    func evalApartmentBasicPackageSelected(_ req: Request) throws -> Future<Response> {
        return try req.content.decode(ApartmentBasicPackageSelected.self).map(to: Response.self) { info in
            print("Package Select: Basic")
            print(info.basicColorToggle ?? "off")
            
            var totalFromPreviousPage: Double = 0


            let session = try req.session()
            session["packageSelected"] = String("basic")
            session["colorSelected"] = String(info.basicColorToggle ?? "off")
            session["StarterKitPlusQuantity"] = String(info.StarterKitPlusQuantity ?? 0)
            totalFromPreviousPage += StarterKitPlus(quantity: info.StarterKitPlusQuantity ?? 0).total()

            if (session["didSelectTheft"] == "true") {
                session["CombiProtectQuantity"] = String(info.CombiProtectQuantity ?? 0)
                totalFromPreviousPage += CombiProtect(quantity: info.CombiProtectQuantity ?? 0).total()
                session["StreetSirenQuantity"] = String(info.StreetSirenQuantity ?? 0)
                totalFromPreviousPage += StreetSiren(quantity: info.StreetSirenQuantity ?? 0).total()
                session["KeyPadQuantity"] = String(info.KeyPadQuantity ?? 0)
                totalFromPreviousPage += KeyPad(quantity: info.KeyPadQuantity ?? 0).total()
                session["MotionCamQuantity"] = String(info.MotionCamQuantity ?? 0)
                totalFromPreviousPage += MotionCam(quantity: info.MotionCamQuantity ?? 0).total()
                session["IndoorSirenQuantity"] = String(info.IndoorSirenQuantity ?? 0)
                totalFromPreviousPage += IndoorSiren(quantity: info.IndoorSirenQuantity ?? 0).total()
                session["DoorProtectQuantity"] = String(info.DoorProtectQuantity ?? 0)
                totalFromPreviousPage += DoorProtect(quantity: info.DoorProtectQuantity ?? 0).total()
            }
            if (session["didSelectFire"] == "true") {
                session["SmokeDetectorQuantity"] = String(info.SmokeDetectorQuantity ?? 0)
                totalFromPreviousPage += SmokeDetector(quantity: info.SmokeDetectorQuantity ?? 0).total()
            }
            
            if (session["didSelectFlood"] == "true") {
                session["LeakDetectorQuantity"] = String(info.LeakDetectorQuantity ?? 0)
                totalFromPreviousPage += LeakDetector(quantity: info.LeakDetectorQuantity ?? 0).total()
            }
            
            session["totalFromPreviousPage"] = String(totalFromPreviousPage)
            
            return req.redirect(to: "/apartment/buy/")
        }
           
    }
    
    func evalApartmentRecommendedPackageSelected(_ req: Request) throws -> Future<Response> {
        return try req.content.decode(ApartmentRecommendedPackageSelected.self).map(to: Response.self) { info in
            print("Package Select: Recommended")
            print(info.recommendedColorToggle ?? "off")

            var totalFromPreviousPage: Double = 0

            
            let session = try req.session()
            session["packageSelected"] = String("recommended")
            session["colorSelected"] = String(info.recommendedColorToggle ?? "off")
            
            session["StarterKitPlusQuantity"] = String(info.StarterKitPlusQuantity ?? 0)
            totalFromPreviousPage += StarterKitPlus(quantity: info.StarterKitPlusQuantity ?? 0).total()

            if (session["didSelectTheft"] == "true") {
                session["CombiProtectQuantity"] = String(info.CombiProtectQuantity ?? 0)
                totalFromPreviousPage += CombiProtect(quantity: info.CombiProtectQuantity ?? 0).total()
                session["StreetSirenQuantity"] = String(info.StreetSirenQuantity ?? 0)
                totalFromPreviousPage += StreetSiren(quantity: info.StreetSirenQuantity ?? 0).total()
                session["KeyPadQuantity"] = String(info.KeyPadQuantity ?? 0)
                totalFromPreviousPage += KeyPad(quantity: info.KeyPadQuantity ?? 0).total()
                session["MotionCamQuantity"] = String(info.MotionCamQuantity ?? 0)
                totalFromPreviousPage += MotionCam(quantity: info.MotionCamQuantity ?? 0).total()
                session["IndoorSirenQuantity"] = String(info.IndoorSirenQuantity ?? 0)
                totalFromPreviousPage += IndoorSiren(quantity: info.IndoorSirenQuantity ?? 0).total()
                session["DoorProtectQuantity"] = String(info.DoorProtectQuantity ?? 0)
                totalFromPreviousPage += DoorProtect(quantity: info.DoorProtectQuantity ?? 0).total()
                session["MotionProtectCurtainQuantity"] = String(info.MotionProtectCurtainQuantity ?? 0)
                totalFromPreviousPage += MotionProtectCurtain(quantity: info.MotionProtectCurtainQuantity ?? 0).total()
            }
            if (session["didSelectFire"] == "true") {
                session["SmokeDetectorQuantity"] = String(info.SmokeDetectorQuantity ?? 0)
                totalFromPreviousPage += SmokeDetector(quantity: info.SmokeDetectorQuantity ?? 0).total()
            }
            
            if (session["didSelectFlood"] == "true") {
                session["LeaksProtectQuantity"] = String(info.LeaksProtectQuantity ?? 0)
                totalFromPreviousPage += LeaksProtect(quantity: info.LeaksProtectQuantity ?? 0).total()
            }
            
            session["totalFromPreviousPage"] = String(totalFromPreviousPage)
            

            
            return req.redirect(to: "/apartment/buy/")
        }
           
    }
    
    // HOUSE
    func evalHouseNoOfRoomFloorEntrance(_ req: Request) throws -> Future<Response> {
        return try req.content.decode(HouseNoOfRoomFloorEntrance.self).map(to: Response.self) { info in
            print("No of rooms: \(info.numberOfRooms)")
            print("No Of floors: \(info.numberOfFloors)")
            print("No Of entrances: \(info.numberOfEntrances)")
            if info.isOutdoorSelected == "on" {
                print("isOutdoorSelected: \(String(describing: info.isOutdoorSelected))")
            }
            
            // Sessions
            let session = try req.session()
            session["numberOfRooms"] = String(info.numberOfRooms)
            session["numberOfFloors"] = String(info.numberOfFloors)
            session["numberOfEntrances"] = String(info.numberOfEntrances)
            if info.isOutdoorSelected == "on" {
                session["isOutdoorSelected"] = "true"
            } else {
                session["isOutdoorSelected"] = "false"
            }
            
            
            // Redirections
            if info.isOutdoorSelected == "on" {
                return req.redirect(to: "/house/parameterSize/")
            } else {
                return req.redirect(to: "/house/offer/")
            }
        }
    }
    
    func evalHouseParameterSize(_ req: Request) throws -> Future<Response> {
        return try req.content.decode(HouseParameterSizeData.self).map(to: Response.self) { info in
            print("length: \(info.length)")
            print("width: \(info.width)")
            let parameterInMeterSquares = info.length * info.width
            let session = try req.session()
            session["parameterInMeterSquares"] = String(parameterInMeterSquares)
            return req.redirect(to: "/house/offer/")

        }
    }
    
    func evalHouseOnParameter(_ req: Request) throws -> Future<Response> {
        return try req.content.decode(HouseOnParameterData.self).map(to: Response.self) { info in
            print("loc on para: \(info.locationOnParameter)")
            let session = try req.session()
            session["locationOnParameter"] = String(info.locationOnParameter)
            return req.redirect(to: "/house/SidesToProtect/")
        }
    }
    
    func evalHouseBasicPackageSelected(_ req: Request) throws -> Future<Response> {
        return try req.content.decode(HouseBasicPackageSelected.self).map(to: Response.self) { info in
            print("Package Select: Basic")
            print(info.basicColorToggle ?? "off")
            
            var totalFromPreviousPage: Double = 0
            
            let session = try req.session()
            session["packageSelected"] = String("basic")
            session["colorSelected"] = String(info.basicColorToggle ?? "off")
            session["StarterKitPlusQuantity"] = String(info.StarterKitPlusQuantity ?? 0)
            totalFromPreviousPage += StarterKitPlus.init(quantity: info.StarterKitPlusQuantity ?? 0).total()
            if (session["didSelectTheft"] == "true") {
                session["CombiProtectQuantity"] = String(info.CombiProtectQuantity ?? 0)
                totalFromPreviousPage += CombiProtect(quantity: info.CombiProtectQuantity ?? 0).total()
                session["StreetSirenQuantity"] = String(info.StreetSirenQuantity ?? 0)
                totalFromPreviousPage += StreetSiren(quantity: info.StreetSirenQuantity ?? 0).total()
                session["KeyPadQuantity"] = String(info.KeyPadQuantity ?? 0)
                totalFromPreviousPage += KeyPad(quantity: info.KeyPadQuantity ?? 0).total()
                session["MotionCamQuantity"] = String(info.MotionCamQuantity ?? 0)
                totalFromPreviousPage += MotionCam(quantity: info.MotionCamQuantity ?? 0).total()
                session["IndoorSirenQuantity"] = String(info.IndoorSirenQuantity ?? 0)
                totalFromPreviousPage += IndoorSiren(quantity: info.IndoorSirenQuantity ?? 0).total()
                session["DoorProtectQuantity"] = String(info.DoorProtectQuantity ?? 0)
                totalFromPreviousPage += DoorProtect(quantity: info.DoorProtectQuantity ?? 0).total()
                
            }
            
            if (session["isOutdoorSelected"] == "true") {
                session["InfraredMotionDetectorOutsideQuantity"] = String(info.InfraredMotionDetectorOutsideQuantity ?? 0)
                totalFromPreviousPage += InfraredMotionDetectorOutside(quantity: info.InfraredMotionDetectorOutsideQuantity ?? 0).total()
            }
            
            if (session["didSelectFire"] == "true") {
                session["SmokeDetectorQuantity"] = String(info.SmokeDetectorQuantity ?? 0)
                totalFromPreviousPage += SmokeDetector(quantity: info.SmokeDetectorQuantity ?? 0).total()
            }
            
            if (session["didSelectFlood"] == "true") {
                session["LeakDetectorQuantity"] = String(info.LeakDetectorQuantity ?? 0)
                totalFromPreviousPage += LeakDetector(quantity: info.LeakDetectorQuantity ?? 0).total()
            }
            session["totalFromPreviousPage"] = String(totalFromPreviousPage)
            return req.redirect(to: "/house/buy/")
        }
           
    }
    
    func evalHouseRecommendedPackageSelected(_ req: Request) throws -> Future<Response> {
        return try req.content.decode(HouseRecommendedPackageSelected.self).map(to: Response.self) { info in
            print("Package Select: Recommended")
            print(info.recommendedColorToggle ?? "off")
            
            let session = try req.session()
            
            var totalFromPreviousPage: Double = 0

            session["packageSelected"] = String("recommended")
            session["colorSelected"] = String(info.recommendedColorToggle ?? "off")
            session["StarterKitPlusQuantity"] = String(info.StarterKitPlusQuantity ?? 0)
            
            totalFromPreviousPage += StarterKitPlus(quantity: info.StarterKitPlusQuantity ?? 0).total()
            
            if (session["didSelectTheft"] == "true") {
                session["CombiProtectQuantity"] = String(info.CombiProtectQuantity ?? 0)
                totalFromPreviousPage += CombiProtect(quantity: info.CombiProtectQuantity ?? 0).total()
                session["StreetSirenQuantity"] = String(info.StreetSirenQuantity ?? 0)
                totalFromPreviousPage += StreetSiren(quantity: info.StreetSirenQuantity ?? 0).total()
                session["KeyPadQuantity"] = String(info.KeyPadQuantity ?? 0)
                totalFromPreviousPage += KeyPad(quantity: info.KeyPadQuantity ?? 0).total()
                session["MotionCamQuantity"] = String(info.MotionCamQuantity ?? 0)
                totalFromPreviousPage += MotionCam(quantity: info.MotionCamQuantity ?? 0).total()
                session["IndoorSirenQuantity"] = String(info.IndoorSirenQuantity ?? 0)
                totalFromPreviousPage += IndoorSiren(quantity: info.IndoorSirenQuantity ?? 0).total()
                session["DoorProtectQuantity"] = String(info.DoorProtectQuantity ?? 0)
                totalFromPreviousPage += DoorProtect(quantity: info.DoorProtectQuantity ?? 0).total()
                session["MotionProtectCurtainQuantity"] = String(info.MotionProtectCurtainQuantity ?? 0)
                totalFromPreviousPage += MotionProtectCurtain(quantity: info.MotionProtectCurtainQuantity ?? 0).total()
            }
            
            if (session["isOutdoorSelected"] == "true") {
                session["InfraredMotionDetectorOutsideQuantity"] = String(info.InfraredMotionDetectorOutsideQuantity ?? 0)
                totalFromPreviousPage += InfraredMotionDetectorOutside(quantity: info.InfraredMotionDetectorOutsideQuantity ?? 0).total()
            }
            
            if (session["didSelectFire"] == "true") {
                session["SmokeDetectorQuantity"] = String(info.SmokeDetectorQuantity ?? 0)
                totalFromPreviousPage += SmokeDetector(quantity: info.SmokeDetectorQuantity ?? 0).total()
            }
            
            if (session["didSelectFlood"] == "true") {
                session["LeaksProtectQuantity"] = String(info.LeaksProtectQuantity ?? 0)
                totalFromPreviousPage += LeaksProtect(quantity: info.LeaksProtectQuantity ?? 0).total()
            }
            
            session["totalFromPreviousPage"] = String(totalFromPreviousPage)

            return req.redirect(to: "/house/buy/")
        }
           
    }
    
    
    

    
}
    
