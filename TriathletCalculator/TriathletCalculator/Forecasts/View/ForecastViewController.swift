//
//  ForecastViewController.swift
//  TriathletCalculator
//
//  Created by Александр Уткин on 29.08.2022.
//

import UIKit

class ForecastViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    let forecasts: [Forecast] = [
    Forecast(swimTime: 100, bikeTime: 200, runTime: 100, t1Time: 10, t2Time: 10, totalTime: 1000),
    Forecast(swimTime: 150, bikeTime: 100, runTime: 500, t1Time: 20, t2Time: 30, totalTime: 500),
    Forecast(swimTime: 200, bikeTime: 200, runTime: 200, t1Time: 100, t2Time: 200, totalTime: 100),
    Forecast(swimTime: 115, bikeTime: 115, runTime: 200, t1Time: 10, t2Time: 20, totalTime: 1000)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "forecastCell", for: indexPath) as? ForecastCellTableViewCell {            
            cell.setupUI()
            return cell
        }

        // Configure the cell...

        return tableView.dequeueReusableCell(withIdentifier: "forecastCell", for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
