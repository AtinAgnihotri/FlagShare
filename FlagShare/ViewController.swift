//
//  ViewController.swift
//  FlagShare
//
//  Created by Atin Agnihotri on 08/07/21.
//

import UIKit

class ViewController: UITableViewController {

    var flags = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setNavigationTitle()
        addFlags()
        print("Point 1")
    }
    
    func setNavigationTitle() {
        title = "Flag Share"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func addFlags() {
        flags += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria",
        "poland", "russia", "spain", "uk", "us"]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // todo
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlagCell", for: indexPath)
        cell.textLabel?.text = flags[indexPath.row].uppercased()
        return cell
    }


}

