//
//  OfferPackage.swift
//  App
//
//  Created by Biut Raj Thapa on 6/15/20.
//

import Vapor
import Leaf

protocol OfferPackage {
    func items() -> [OfferItem]
}

struct ApartmentOfferPackage: OfferPackage {
    let numberOfRooms: Int
    let numberOfFloors: Int
    let numberOfEntrances: Int
    let packageType: PackageType
    let riskTypes: [RiskType]
    
    func items() -> [OfferItem] {
        var items = [OfferItem]()
        // StarterKit
        items.append(
            StarterKitPlus(quantity: 1)
        )
        
        // Basic
        if packageType == .basic {
            
            if riskTypes.contains(.theft) {
                // combiprotect
                if numberOfRooms == 1 {
                    items.append(
                        CombiProtect(quantity: 1)
                    )
                } else {
                    items.append(
                        CombiProtect(quantity:
                            (numberOfRooms * 1 - 1)
                        )
                    )
                }
                
                
                
                // Key pad
                items.append(
                    KeyPad(quantity: 1)
                )
                
                // motioncam
                items.append(
                    MotionCam(quantity:
                        (1 * numberOfEntrances)
                    )
                )
                
                // indoor siren
                items.append(
                    IndoorSiren(quantity: 1)
                )
                
                // Doorprotect
                items.append(
                    DoorProtect(quantity:
                        (numberOfRooms * numberOfEntrances)
                    )
                )
            }
            
            // smoke detector
            if riskTypes.contains(.fire) {
                items.append(
                    SmokeDetector(quantity:
                        (1 * numberOfFloors)
                    )
                )
            }
            
            // leakdetector
            if riskTypes.contains(.flood) {
                items.append(
                    LeakDetector(quantity: 1)
                )
            }
            

        }
        
        // Recommended
        if packageType == .recommended {
            if riskTypes.contains(.theft) {
                // combiprotect
                items.append(
                    CombiProtect(quantity:
                        (numberOfRooms * 1)
                    )
                )
                
                // Street siren
                items.append(
                    StreetSiren(quantity: 1)
                )
                
                // Key pad
                items.append(
                    KeyPad(quantity: 1)
                )

                
                // motioncam
                items.append(
                    MotionCam(quantity:
                        (1 * numberOfEntrances)
                    )
                )
                
                // indoor siren
                items.append(
                    IndoorSiren(quantity: 1 * numberOfFloors)
                )
                
                // Doorprotect
                items.append(
                    DoorProtect(quantity:
                        (1 * numberOfEntrances)
                    )
                )
                
                // motionProtectCurtain
                if numberOfRooms == 1 {
                    items.append(
                        MotionProtectCurtain(quantity: 1)
                    )
                } else {
                    items.append(
                        MotionProtectCurtain(quantity:
                            ((1 * numberOfRooms) / 2)
                        )
                    )
                }
            }
            
            // smoke detector
            if riskTypes.contains(.fire) {
                items.append(
                    SmokeDetector(quantity:
                        (2 + (1 * numberOfFloors))
                    )
                )
            }
             
            // Leaksprotect
            if riskTypes.contains(.flood) {
                items.append(
                    LeaksProtect(quantity: 2)
                )
            }
        }
        return items
    }
}

struct HouseOfferPackage: OfferPackage {
    let numberOfRooms: Int
    let numberOfFloors: Int
    let numberOfEntrances: Int
    let isOutdoorSelected: Bool
    let parameterInMeterSquares: Int
    let packageType: PackageType
    let riskTypes: [RiskType]
    
    func items() -> [OfferItem] {
        var items = [OfferItem]()
        // StarterKit
        items.append(
            StarterKitPlus(quantity: 1)
        )
        
        // Basic
        if packageType == .basic {
            
            if riskTypes.contains(.theft) {
                // combiprotect
                if numberOfRooms == 1 {
                    items.append(
                        CombiProtect(quantity: 1)
                    )
                } else {
                    items.append(
                        CombiProtect(quantity:
                            (numberOfRooms * 1 - 1)
                        )
                    )
                }
                
                // Street siren
                items.append(
                    StreetSiren(quantity: 1)
                )
                
                // Key pad
                items.append(
                    KeyPad(quantity: 1)
                )
                
                // motioncam
                items.append(
                    MotionCam(quantity:
                        (1 * numberOfEntrances)
                    )
                )
                
                // indoor siren
                items.append(
                    IndoorSiren(quantity: 1)
                )
                
                // Doorprotect
                items.append(
                    DoorProtect(quantity:
                        (numberOfRooms * numberOfEntrances)
                    )
                )
            }
            
            // Infrared Outside detector
            if isOutdoorSelected {
                items.append(
                        InfraredMotionDetectorOutside(quantity: 1)
                )
            }
            
            // smoke detector
            if riskTypes.contains(.fire) {
                items.append(
                    SmokeDetector(quantity:
                        (1 * numberOfFloors)
                    )
                )
            }
            
            // leakdetector
            if riskTypes.contains(.flood) {
                items.append(
                    LeakDetector(quantity: 1)
                )
            }
            

        }
        
        // Recommended
        if packageType == .recommended {
            if riskTypes.contains(.theft) {
                // combiprotect
                items.append(
                    CombiProtect(quantity:
                        (numberOfRooms * 1)
                    )
                )
                
                // Street siren
                items.append(
                    StreetSiren(quantity: 1)
                )
                
                // Key pad
                items.append(
                    KeyPad(quantity: 1)
                )

                
                // motioncam
                items.append(
                    MotionCam(quantity:
                        (1 * numberOfEntrances)
                    )
                )
                
                // indoor siren
                items.append(
                    IndoorSiren(quantity: 1 * numberOfFloors)
                )
                
                // Doorprotect
                items.append(
                    DoorProtect(quantity:
                        (1 * numberOfEntrances)
                    )
                )
                
                // motionProtectCurtain
                if numberOfRooms == 1 {
                    items.append(
                        MotionProtectCurtain(quantity: 1)
                    )
                } else {
                    items.append(
                        MotionProtectCurtain(quantity:
                            ((1 * numberOfRooms) / 2)
                        )
                    )
                }
            }
            
            // smoke detector
            if riskTypes.contains(.fire) {
                items.append(
                    SmokeDetector(quantity:
                        (2 + (1 * numberOfFloors))
                    )
                )
            }
            
            // Infrared Outside detector
            if isOutdoorSelected {
                if parameterInMeterSquares > 300 {
                    items.append(
                        InfraredMotionDetectorOutside(quantity:3 )
                    )
                } else {
                    items.append(
                        InfraredMotionDetectorOutside(quantity: 2)
                    )
                }
            }
            
             
            // Leaksprotect
            if riskTypes.contains(.flood) {
                items.append(
                    LeaksProtect(quantity: 2)
                )
            }
        }
        return items
    }
}



