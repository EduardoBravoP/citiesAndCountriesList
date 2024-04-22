//
//  ViewController.swift
//  CitiesTraveling
//
//  Created by Eduardo Bravo on 22/04/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var citiesTableView: UITableView!
    
    var cities = ["New York", "Las Vegas", "San Diego", "Cancun", "Barcelona", "Amsterdam", "Rome", "Athens", "Lucerne", "Bariloche"]
    var citiesCountries: Dictionary<String, String> = ["New York": "United States", "Las Vegas": "United States", "San Diego": "United States", "Cancun": "Mexico", "Barcelona": "Spain", "Amsterdam": "Netherlands", "Rome": "Italy", "Athens": "Greece", "Lucerne": "Switzerland", "Bariloche": "Argentina"]
    
    struct Constants {
        static let cellIdentifier = "CityCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        citiesTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)
        
        var cellContentConfiguration = tableViewCell.defaultContentConfiguration()
        let currentCity = cities[indexPath.row]
        cellContentConfiguration.text = currentCity
        cellContentConfiguration.secondaryText = citiesCountries[currentCity]
        tableViewCell.contentConfiguration = cellContentConfiguration
        
        return tableViewCell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tappedCity = cities[indexPath.row]
        print("User tapped on city \(tappedCity) of \(citiesCountries[tappedCity] ?? "no country")")
    }
}
