//
//  placeController.swift
//  myFourSquare_IVAN
//
//  Created by Ivan Aldama on 27/02/18.
//  Copyright © 2018 Ivan Aldama. All rights reserved.
//
import Foundation

struct Point<T>{
    
    var placeXPoint:Double?
    var placeYPoint:Double?
    var instanceType:T?
    
    init(_ newXPoint:Double?, _ newYPoint:Double?, _ instanceType:T) {
        self.placeXPoint = newXPoint
        self.placeYPoint = newYPoint
        self.instanceType = instanceType
    }
    // Subscript 20pts
    subscript(_ currentXPoint:Double?, _ currentYPoint:Double?) -> Double? {
        get {
            //Unwraping current position
            guard let myXPosition = currentXPoint , let myYPosition = currentYPoint else {
                print("We cannot get your current position")
                return nil
            }
            //Unwraping place position
            guard let xPlace = self.placeXPoint, let yPlace = self.placeYPoint else {
                print("We cannot get the of the place")
                return nil
            }
            //Getting distance between place and current position
            let distance = sqrt((pow((myXPosition - xPlace), 2) + pow(myYPosition - yPlace, 2)))
            return distance
        }
    }
}

func getPoints(_ listOfPoints:[Point<String>],_ currPosition:Point<String>,_  radio:Double) -> [Point<String>] {
    
    //List of return, this whitin the points inside of the radio
    var finalList = [Point<String>]()
    
    //Iterate array of points
    for (index, point) in listOfPoints.enumerated() {
        
        //Get distrance thought subscript
        let soFarAway:Double? = listOfPoints[index][currPosition.placeXPoint, currPosition.placeYPoint]
        
        //Check for a validate distance
        guard let finalDistance = soFarAway else { return [Point<String>]() }
        
        //Inserting the place to the final list if is inside of the radio
        if(finalDistance < radio){
            finalList.append(point)
        }
    }
    return finalList
}
