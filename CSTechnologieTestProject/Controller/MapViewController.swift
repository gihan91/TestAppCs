//
//  MapViewController.swift
//  CSTechnologieTestProject
//
//  Created by Gihan Chanaka Beligaswaththa on 9/21/18.
//  Copyright © 2018 Gihan Chanaka Beligaswaththa. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {
     let valueUserLat = UserDefaults.standard.float(forKey: defaultKeys.userLat)
     let valueUserLong = UserDefaults.standard.float(forKey: defaultKeys.userLong)
    let userCity = UserDefaults.standard.string(forKey: defaultKeys.userCity)

    override func viewDidLoad() {
        super.viewDidLoad()
        print(valueUserLat)
        print(userCity!)


    }

    override func loadView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: CLLocationDegrees(valueUserLat), longitude: CLLocationDegrees(valueUserLong), zoom: 16.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView

        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: CLLocationDegrees(valueUserLat), longitude: CLLocationDegrees(valueUserLong))
        marker.title = userCity!
//        marker.snippet = "Australia"
        marker.map = mapView
    }
    

  

}
