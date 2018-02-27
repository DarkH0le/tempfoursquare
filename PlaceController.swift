//
//  placeController.swift
//  myFourSquare_IVAN
//
//  Created by Ivan Aldama on 27/02/18.
//  Copyright © 2018 Ivan Aldama. All rights reserved.
//
import Foundation
import UIKit

private let Q1:String = "NORTH"
private let Q2:String = "SOUTH"
private let Q3:String = "EAST"
private let Q4:String = "WEST"
private let NEXTYOU:String = "NEXT TO YOU, THE PLACE IS WHERE YOU´RE!"

class PlaceController {
    
    struct Point<T>{
        
        var placeXPoint:Double?
        var placeYPoint:Double?
        var instanceType:T?
        
        init(_ newXPoint:Double?, _ newYPoint:Double?, _ instanceType:T?) {
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
                var distance = sqrt((pow((myXPosition - xPlace), 2) + pow(myYPosition - yPlace, 2)))
                
                print("""
                    
                    
                    \(myXPosition) y el radio es \(xPlace)
                    \(myYPosition)  y luego \(yPlace)
                    
                    
                    
                    
                    """)
                return distance
            }
        }
    }
    
    func getPoints(_ listOfPoints:[Point<String>],_ currPosition:Point<String>,_  radio:Double) throws -> [Point<String>]? {
        
        //List of return, this whitin the points inside of the radio
        var finalList = [Point<String>]()
        
        //Iterate array of points
        for (index, point) in listOfPoints.enumerated() {
            
            //Get distrance thought subscript
            var soFarAway:Double? = listOfPoints[index][currPosition.placeXPoint, currPosition.placeYPoint]
            
            //Check for a validate distance
            guard let finalDistance = soFarAway else {throw errors.ErrorGettingPoins}
            
            //Inserting the place to the final list if is inside of the radio
            if((finalDistance * 100)  < radio){
                finalList.append(point)
            }
        }
        return finalList
    }
    
    //Cardinality
    func cardinalityOfPoint(xPoint:Double, yPoint:Double, currXPoint:Double, currYPoint:Double) -> String {
        
        if (xPoint >= currXPoint) && (yPoint >= currYPoint)  {
            return Q1
        } else if (xPoint <= currXPoint) && (yPoint <= currYPoint) {
            return Q2
        } else if (xPoint >= currXPoint) && (yPoint <= currYPoint) {
            return Q3
        } else if (xPoint <= currXPoint) && (yPoint <= currYPoint) {
            return Q4
        }
        return NEXTYOU
    }
    
    func dataBasePlaces() -> [Point<String>] {
        
        //Creating new list of poinst
        var listadepuntos = [Point<String>]()
        
        //appending to the list all the places
        //TODO: implement it using fireabase
        listadepuntos.append(Point<String>(20.7344872, -103.3803549, "Calle 2"))
        listadepuntos.append(Point<String>(20.731995, -103.38216, "Auditorio Telemx"))
        listadepuntos.append(Point<String>(20.7371131, -103.3790208, "CUCEA"))
        listadepuntos.append(Point<String>(20.7346398, -103.3719118, "TVivero Tabachines"))
        listadepuntos.append(Point<String>(20.7383233, -103.3740413, "The Belenes"))
        listadepuntos.append(Point<String>(20.7363768, -103.373698, "Pepsi"))
      
        return listadepuntos
    }
    
    enum errors:Error {
        case ErrorGettingPoins
    }
}

