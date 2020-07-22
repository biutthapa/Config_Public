//
//  HomeController.swift
//  App
//
//  Created by Biut Raj Thapa on 5/18/20.
//

import Vapor
import Leaf
import MollieKit

final class AppController {
    let mollie = Mollie(apiKey: testKey2)

    
    
    func afterPay(_ req: Request) throws -> Future<View> {
        return try req.view().render("pages/afterPay")
    }
   
    
    func pay(_ req: Request) throws -> Future<Response> {
        let session = try? req.session()
        
        let customer = Customer(email: session!["email"]!,
                                phone: session!["phone"]!,
                                firstName: session!["firstName"]!,
                                lastName: session!["lastName"]!,
                                addressLine1: session!["addressLine1"]!,
                                addressLine2: session?["addressLine2"] ?? "",
                                postalCode: session!["postalCode"]!,
                                city: session!["city"]!,
                                country: session!["country"]!)
        
        let order = Order(
            isInstallationSelected: session?["isInstallationSelected"] ?? "false",
            isCameraSelected: session?["isCameraSelected"] ?? "false",
            StarterKitPlusQuantity: session?["StarterKitPlusQuantity"] ?? "0",
            CombiProtectQuantity: session?["CombiProtectQuantity"] ?? "0",
            StreetSirenQuantity: session?["StreetSirenQuantity"] ?? "0",
            KeyPadQuantity: session?["KeyPadQuantity"] ?? "0",
            MotionCamQuantity: session?["MotionCamQuantity"] ?? "0",
            IndoorSirenQuantity: session?["IndoorSirenQuantity"] ?? "0",
            DoorProtectQuantity: session?["DoorProtectQuantity"] ?? "0",
            MotionProtectCurtainQuantity: session?["MotionProtectCurtainQuantity"] ?? "0",
            SmokeDetectorQuantity: session?["SmokeDetectorQuantity"] ?? "0",
            LeaksProtectQuantity: session?["LeaksProtectQuantity"] ?? "0",
            LeakDetectorQuantity: session?["LeakDetectorQuantity"] ?? "0",
            InfraredMotionDetectorOutsideQuantity: session?["InfraredMotionDetectorOutsideQuantity"] ?? "0")
        
        
        let metadata = PaymentMetadata(customer: customer, order: order).metadata()
        
        func getAmountToPay() -> Double {
            let session = try? req.session()
            var totalToPay: Double = 0
            
            if (session?["isCameraSelected"] ?? "false") == "true" {
                totalToPay += 100
            }
            
            if (session?["isInstallationSelected"] ?? "false") == "true" {
                totalToPay += 100
            }
            
            let StarterKitPlusTotal = StarterKitPlus(quantity: Int( session?["StarterKitPlusQuantity"] ?? "0") ?? 0).total()
            let CombiProtectTotal = CombiProtect(quantity: Int( session?["CombiProtectQuantity"] ?? "0") ?? 0).total()
            let StreetSirenTotal = StreetSiren(quantity: Int( session?["StreetSirenQuantity"] ?? "0") ?? 0).total()
            let KeyPadTotal = KeyPad(quantity: Int( session?["KeyPadQuantity"] ?? "0") ?? 0).total()
            let MotionCamTotal = MotionCam(quantity: Int( session?["MotionCamQuantity"] ?? "0") ?? 0).total()
            let IndoorSirenTotal = IndoorSiren(quantity: Int( session?["IndoorSirenQuantity"] ?? "0") ?? 0).total()
            let DoorProtectTotal = DoorProtect(quantity: Int( session?["DoorProtectQuantity"] ?? "0") ?? 0).total()
            let MotionProtectCurtainTotal = MotionProtectCurtain(quantity: Int( session?["MotionProtectCurtainQuantity"] ?? "0") ?? 0).total()
            let SmokeDetectorTotal = SmokeDetector(quantity: Int( session?["SmokeDetectorQuantity"] ?? "0") ?? 0).total()
            let LeaksProtectQuantityTotal = LeaksProtect(quantity: Int( session?["LeaksProtectQuantity"] ?? "0") ?? 0).total()
            var LeakDetectorTotal = LeakDetector(quantity: Int( session?["LeakDetectorQuantity"] ?? "0") ?? 0).total()
            let InfraredMotionDetectorOutsideTotal = InfraredMotionDetectorOutside(quantity: Int( session?["InfraredMotionDetectorOutsideQuantity"] ?? "0") ?? 0).total()
            
            if LeaksProtectQuantityTotal != 0 {
                LeakDetectorTotal = 0
                session?["LeakDetectorQuantity"] = "0"
            }

            
            
            
            totalToPay += {
                StarterKitPlusTotal +
                CombiProtectTotal +
                StreetSirenTotal +
                KeyPadTotal +
                MotionCamTotal +
                IndoorSirenTotal +
                DoorProtectTotal +
                MotionProtectCurtainTotal +
                SmokeDetectorTotal +
                LeaksProtectQuantityTotal +
                LeakDetectorTotal +
                InfraredMotionDetectorOutsideTotal
            }()
            
            return totalToPay
        }
        
        return try self.mollie.createPayment(req,
                                 currency: .EUR,
                                 amountValue: getAmountToPay(),
                                 description: "Payment from Configurator",
                                 redirectUrl: "https://config.beveilig-direct.nl/afterPay",
                                 metadata: metadata)
        
            
    }
    
    func welcomeView(_ req: Request) throws -> Future<View> {
        return try req.view().render("pages/welcome")
    }
    
    func askPropertyAndProtectionType(_ req: Request) throws -> Future<View> {
        return try req.view().render("pages/propertyAndProtectionType")
    }
    
    
    func officeView(_ req: Request) throws -> Future<View> {
        return try req.view().render("pages/office")
    }
    
    // MARK: APARTMENT
    
    func askApartmentNoOfRoomFloorEntrance(_ req: Request) throws -> Future<View> {
        return try req.view().render("pages/apartment/noOfRoomFloorEntrance")
    }
    
    func showApartmentOffer(_ req: Request) throws -> Future<View> {
        let session = try? req.session()
        let isTheftSelected: String = session?["didSelectTheft"] ?? "false"
        let isFireSelected: String = session?["didSelectFire"] ?? "false"
        let isFloodSelected: String = session?["didSelectFlood"] ?? "false"
        let numberOfRooms: String = session?["numberOfRooms"] ?? "1"
        let numberOfFloors: String = session?["numberOfFloors"] ?? "1"
        let numberOfEntrances: String = session?["numberOfEntrances"] ?? "1"
        
        
        let basicOffer: OfferPackage = PackageGenerator().generateApartmentPackage(
            numberOfRooms: Int(numberOfRooms)!,
            numberOfFloors: Int(numberOfFloors)!,
            numberOfEntrances: Int(numberOfEntrances)!,
            riskTypes: getRiskTypes(isTheftSelected: isTheftSelected, isFireSelected: isFireSelected, isFloodSelected: isFloodSelected),
            packageType: .basic)
        
        let recommendedOffer: OfferPackage = PackageGenerator().generateApartmentPackage(
            numberOfRooms: Int(numberOfRooms)!,
            numberOfFloors: Int(numberOfFloors)!,
            numberOfEntrances: Int(numberOfEntrances)!,
            riskTypes: getRiskTypes(isTheftSelected: isTheftSelected, isFireSelected: isFireSelected, isFloodSelected: isFloodSelected),
            packageType: .recommended)
        
        
        let basicPackageData = packageToData(offerPackage: basicOffer)
        let recommendedPackageData = packageToData(offerPackage: recommendedOffer)
        
        let data = ApartmentDataToSend(
            basicPackageData: basicPackageData,
            recommendedPackageData: recommendedPackageData
        )

        return try req.view().render("pages/apartment/offer", data)
    }
    
    func apartmentPackageBuy(_ req: Request) throws -> Future<View> {
        let session = try? req.session()
        let colorSession: String = (session?["colorSelected"] ?? "black")
        let totalFromPreviousPage: String = (session?["totalFromPreviousPage"] ?? "0")
        let colorSelected: ColorType
        if colorSession == "on" {
            colorSelected = .Black
        } else {
            colorSelected = .White
        }
        let data = ApartmentPackageBuyDataToSend(colorSelected: colorSelected.rawValue, totalFromPreviousPage: totalFromPreviousPage)
        return try req.view().render("pages/apartment/buy", data)
    }
    
    
    
    // MARK: HOUSE
    
    func askHouseNoOfRoomFloorEntrance(_ req: Request) throws -> Future<View> {
        return try req.view().render("pages/house/noOfRoomFloorEntrance")
    }
    
    func askHouseParameterSize(_ req: Request) throws -> Future<View> {
        return try req.view().render("pages/house/askHouseParameterSize")
    }
    
    func askLocationOnParameter(_ req: Request) throws -> Future<View> {
        return try req.view().render("pages/house/askLocationOnParameter")
    }
    
    func askSidesToProtect(_ req: Request) throws -> Future<View> {
        let session = try? req.session()
        print("Location on parameter = \(session?["locationOnParameter"] ?? "nil")")
        let data = HouseOnParameterData(locationOnParameter: session?["locationOnParameter"] ?? "5")
        return try req.view().render("pages/house/askSidesToProtect", data)
    }
     
    func showHouseOffer(_ req: Request) throws -> Future<View> {
        let session = try? req.session()
        let isTheftSelected: String = session?["didSelectTheft"] ?? "false"
        let isFireSelected: String = session?["didSelectFire"] ?? "false"
        let isFloodSelected: String = session?["didSelectFlood"] ?? "false"
        let numberOfRooms: String = session?["numberOfRooms"] ?? "1"
        let numberOfFloors: String = session?["numberOfFloors"] ?? "1"
        let numberOfEntrances: String = session?["numberOfEntrances"] ?? "1"
        let isOutdoorSelected: Bool
        let parameterInMeterSquares: Int
        if session?["isOutdoorSelected"] == "true" {
        isOutdoorSelected = true
        let text: String = session!["parameterInMeterSquares"]!
        parameterInMeterSquares = Int(text) ?? 0
        } else {
        isOutdoorSelected = false
        parameterInMeterSquares = 0
        }

        let basicOffer: OfferPackage = PackageGenerator().generateHousePackage(
         numberOfRooms: Int(numberOfRooms)!,
         numberOfFloors: Int(numberOfFloors)!,
         numberOfEntrances: Int(numberOfEntrances)!,
         riskTypes: getRiskTypes(isTheftSelected: isTheftSelected, isFireSelected: isFireSelected, isFloodSelected: isFloodSelected),
         packageType: .basic,
         isOutdoorSelected: isOutdoorSelected,
         parameterInMeterSquares: parameterInMeterSquares
        )

        let recommendedOffer: OfferPackage = PackageGenerator().generateHousePackage(
         numberOfRooms: Int(numberOfRooms)!,
         numberOfFloors: Int(numberOfFloors)!,
         numberOfEntrances: Int(numberOfEntrances)!,
         riskTypes: getRiskTypes(
            isTheftSelected: isTheftSelected,
            isFireSelected: isFireSelected,
            isFloodSelected: isFloodSelected),
         packageType: .recommended,
         isOutdoorSelected: isOutdoorSelected,
         parameterInMeterSquares: parameterInMeterSquares
        )
         
         
         let basicPackageData = packageToData(offerPackage: basicOffer)
         let recommendedPackageData = packageToData(offerPackage: recommendedOffer)
         
         let data = HouseDataToSend(
             basicPackageData: basicPackageData,
             recommendedPackageData: recommendedPackageData
         )

         return try req.view().render("pages/house/offer", data)
     }
     
     func housePackageBuy(_ req: Request) throws -> Future<View> {
            let session = try? req.session()
            let colorSession: String = (session?["colorSelected"] ?? "black")
            let totalFromPreviousPage: String = (session?["totalFromPreviousPage"] ?? "0")
            let colorSelected: ColorType
            if colorSession == "on" {
                colorSelected = .Black
            } else {
                colorSelected = .White
            }
        
        let data = HousePackageBuyDataToSend(colorSelected: colorSelected.rawValue, totalFromPreviousPage: totalFromPreviousPage)
            return try req.view().render("pages/house/buy", data)
     }
     
    
    
}

func packageToData(offerPackage: OfferPackage) -> [ApartmentOfferToShow] {
    var offersToShow: [ApartmentOfferToShow] = [ApartmentOfferToShow]()
    
    for item in offerPackage.items() {
        offersToShow.append(
            ApartmentOfferToShow(
            itemId: item.itemId,
            title: item.title,
            description: item.description,
            whiteImageURL: item.whiteImageURL,
            blackImageURL: item.blackImageURL,
            quantity: item.quantity,
            quantityInputName: item.quantityInputName,
            toggleImageId: item.toggleImageId,
            priceId: item.priceId,
            price: item.price
        ))
    }
    
    return offersToShow
}

func getRiskTypes(isTheftSelected: String, isFireSelected: String, isFloodSelected: String) -> [RiskType] {
    var risksSelected: [RiskType] = [RiskType]()
    
    if isTheftSelected == "true" {
        risksSelected.append(.theft)
    }
    
    if isFireSelected == "true" {
        risksSelected.append(.fire)
    }
    
    if isFloodSelected == "true" {
        risksSelected.append(.flood)
    }
    
    return risksSelected
}



    
    
   
    




