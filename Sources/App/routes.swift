import Vapor
import MollieKit

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    let appController = AppController()
    let evalController = EvalController()

    // Welcome
    router.get("", use: appController.welcomeView)
    
    // Property and Protection Type
    router.get("propertyAndProtectionType", use: appController.askPropertyAndProtectionType)
    router.post("propertyAndProtectionType", use: evalController.evalPropertyAndProtectionType)

    // Selected Property Office
    router.get("office", use: appController.officeView)
    
    // MARK: APARTMENT

    // Selected Property Apartment
    router.get("apartment", "noOfRoomFloorEntrance", use: appController.askApartmentNoOfRoomFloorEntrance)
    router.post("apartment", "noOfRoomFloorEntrance", use: evalController.evalApartmentNoOfRoomFloorEntrance)

    // Added Apartment number of rooms, floors and entrances
    router.get("apartment", "offer", use: appController.showApartmentOffer)
    
    // Selected Basic Package Apartment
    router.post("apartment", "offer", "basic", use: evalController.evalApartmentBasicPackageSelected)
    
    // Selected Recommended Package Apartment
    router.post("apartment", "offer", "recommended", use: evalController.evalApartmentRecommendedPackageSelected)
    
    

    // MARK: HOUSE
    
    // Selected Property House
    router.get("house", "noOfRoomFloorEntrance", use: appController.askApartmentNoOfRoomFloorEntrance)
    router.post("house", "noOfRoomFloorEntrance", use: evalController.evalApartmentNoOfRoomFloorEntrance)

    // Added House number of rooms, floors and entrances
    router.get("house", "offer", use: appController.showHouseOffer)
    
    // Selected Basic Package House
    router.post("house", "offer", "basic", use: evalController.evalHouseBasicPackageSelected)
    
    // Selected Recommended Package House
    router.post("house", "offer", "recommended", use: evalController.evalHouseRecommendedPackageSelected)

    // Selected Property House
    router.get("house", "noOfRoomFloorEntrance", use: appController.askHouseNoOfRoomFloorEntrance)
    router.post("house", "noOfRoomFloorEntrance", use: evalController.evalHouseNoOfRoomFloorEntrance)
    
    // Selected Outdoors
    router.get("house", "parameterSize", use: appController.askHouseParameterSize)
    router.post("house", "parameterSize", use: evalController.evalHouseParameterSize)
    router.get("house", "locationOnParameter", use: appController.askLocationOnParameter)
    router.get("house", "SidesToProtect", use: appController.askSidesToProtect)
    
    // Selected location On Parameter
    router.post("house", "locationOnParameter", use: evalController.evalHouseOnParameter)


    // MARK: General

    // Buy pages
    router.get("apartment", "buy", use: appController.apartmentPackageBuy)
    router.get("house", "buy", use: appController.housePackageBuy)
    
    // Error
    router.get("error") { req in
        return "Error"
    }
    
    router.post("pay", use: evalController.pay)
    router.get("pay", use: appController.pay)

    router.get("afterPay", use: appController.afterPay)
    
}
