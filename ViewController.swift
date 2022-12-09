//
//  ViewController.swift
//  DynamicTableView
//
//  Created by Shadrach Jabonir on 04/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var academyTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        academyTableView.dataSource = self
        academyTableView.delegate = self
        academyTableView.register(
            UINib(nibName: "AcademyTableViewCell", bundle: nil),
            forCellReuseIdentifier: "AcademyCell"
        )
        // Do any additional setup after loading the view.
    }

    @IBAction func goToWebsite(_ sender: Any) {
        let urlTelkomsel = "https://www.telkomsel.com"
        if let url = URL(string: urlTelkomsel), UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url)
        }
    }
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyAcademyData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: "AcademyCell",
            for: indexPath
        ) as? AcademyTableViewCell { // Mencari UITableViewCell berdasarkan Identifier.
            let academy = dummyAcademyData[indexPath.row]
            cell.academyLabel.text = academy.name
            cell.academyImageView.image = academy.image
            return cell
        } else {
            return UITableViewCell() // Mengembalikan UITableViewCell jika tidak ditemukan.
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "moveToDetail", sender: dummyAcademyData[indexPath.row])
    }
    
    override func prepare(
        for segue: UIStoryboardSegue,
        sender: Any?
      ) {
        if segue.identifier == "moveToDetail" {
          if let detaiViewController = segue.destination as? DetailViewController {
            detaiViewController.academy = sender as? AcademyModel
          }
        }
      }
}
