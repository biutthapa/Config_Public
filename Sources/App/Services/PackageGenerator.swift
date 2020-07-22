//
//  PackageGenerator.swift
//  App
//
//  Created by Biut Raj Thapa on 6/15/20.
//

import Vapor
import Leaf

final class PackageGenerator {
    func generateApartmentPackage(numberOfRooms: Int, numberOfFloors: Int, numberOfEntrances: Int,riskTypes: [RiskType], packageType: PackageType) -> OfferPackage {
        
        let package = ApartmentOfferPackage(numberOfRooms: numberOfRooms, numberOfFloors: numberOfFloors, numberOfEntrances: numberOfEntrances, packageType: packageType, riskTypes: riskTypes)
        
        
        return package
        
        
    }
    
    func generateHousePackage(numberOfRooms: Int, numberOfFloors: Int, numberOfEntrances: Int, riskTypes: [RiskType], packageType: PackageType, isOutdoorSelected: Bool, parameterInMeterSquares: Int) -> OfferPackage {
        
        let package = HouseOfferPackage(
            numberOfRooms: numberOfRooms,
            numberOfFloors: numberOfFloors,
            numberOfEntrances: numberOfEntrances,
            isOutdoorSelected: isOutdoorSelected,
            parameterInMeterSquares: parameterInMeterSquares,
            packageType: packageType,
            riskTypes: riskTypes)
        return package
    }
}
