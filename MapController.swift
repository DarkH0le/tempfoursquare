//
//  MapController.swift
//  myFourSquare_IVAN
//
//  Created by Ivan Aldama on 20/02/18.
//  Copyright © 2018 Ivan Aldama. All rights reserved.
//

import UIKit
import GoogleMaps

class MapController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logout()
        
        
        
        //Themes 4,5
        
        var user = User(name: "Juan Cabral", image: "penguin.png")
        var post = Post(text: "Swift ", imageUrl: "post_image.png", user: user)
        
        post.incrementComments()
        post.incrementComments()
        post.incrementLikes()
        post.incrementLikes()
        
        print("comments: \(post.getComments()); likes: \(post.getLikes());")
        print("tuple: \(post.getCounters()); \(post.getDisplayTimeAgo(date:  Date(timeIntervalSinceNow: -60*60*24*7*4)))")
        //        print("userId: \(post.user?.id)")
        
        
        view.backgroundColor = UIColor.blue
        GMSServices.provideAPIKey("AIzaSyC1iQPT04MHlxJcTa-8pvP8SWQRGtqwHjg")
        
        //20.7321983,-103.3736167,16.05
        let camera = GMSCameraPosition.camera(withLatitude: 20.7346398, longitude: -103.3719118, zoom: 15)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        mapView.settings.scrollGestures = true
        mapView.settings.zoomGestures = true
        view = mapView
        
        //Inserting marker in map
        printMarkersInMap(mapView)
        
        
         //Creates a marker in the center of the map.
        
    }
    
    //themes 6,7
    
    //we have x number of near positions
    //we have a radius
    //we have the user position
    //set of 20 positions
    
    //Point
    //longitud
    //latitud
    
    //var p1 = Point(12.2,-12.2)
    //list.append(p1)
    
    //Enum Cardinality
    // North
    // West
    // South
    // East
    //we need to find the closest position given a user position
    
    // if x== 0 then we throw an exception
    
    //func getXNumbers(list<Point>, userPosition: Point, radius:Int) -> list<Tuple(Point,Cardinality)> throws
    //function will throw an exception if there's no point at all
    //guard check and render the closest x euclidean distance in the map
    
    //userposition -> render in the map if and only if there's no exception
    
    func logout() {
        var loginController: LoginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }
    func getCurrentPosition() -> PlaceController.Point<String> {
        
        //FAKE GPS LOCATION
        //TODO: Implement throught phone sensor
        var currentPosition = PlaceController.Point<String>(20.7379825, -103.3719118, "Current Position")
        return currentPosition
    }
    
    func printMarkersInMap(_ mapa:GMSMapView) -> Void {
        
        var newPlaceController = PlaceController()
        let listOfPlaces = newPlaceController.dataBasePlaces()
        let currPositionNow = getCurrentPosition()
        var finalListOfPlaces = newPlaceController.getPoints(listOfPlaces, currPositionNow, (5/10))
        
        
        //Pinting markets
        for (index , marker) in (finalListOfPlaces.enumerated()) {
            var xValue = marker.placeXPoint!
            var yValue = marker.placeYPoint!
            var typeInstance = marker.instanceType!
            var marker = GMSMarker()
            
            marker.position = CLLocationCoordinate2D(latitude: xValue, longitude: yValue)
            marker.title = typeInstance
            marker.snippet = "Mexico"
            marker.map = mapa
            
        }
        print(finalListOfPlaces)
    }
    
    
    
}


