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
    
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var backButton: UIButton!

    let valueUserLat = UserDefaults.standard.float(forKey: defaultKeys.userLat)
    let valueUserLong = UserDefaults.standard.float(forKey: defaultKeys.userLong)
    let userCity = UserDefaults.standard.string(forKey: defaultKeys.userCity)

    override func viewDidLoad() {
        super.viewDidLoad()
        print(valueUserLat)
        print(userCity!)
        mapView.addSubview(backButton)
        mapView.settings.myLocationButton = true

        let camera = GMSCameraPosition.camera(withLatitude: CLLocationDegrees(valueUserLat), longitude:  CLLocationDegrees(valueUserLong), zoom: 6.0)
        mapView.camera = camera
        showMarker(position: camera.target)


    }

    func showMarker(position: CLLocationCoordinate2D){
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: CLLocationDegrees(valueUserLat), longitude: CLLocationDegrees(valueUserLong))
        marker.title = userCity
        marker.map = mapView
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }


    

  

}
