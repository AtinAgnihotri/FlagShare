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
//        let vc = FlagViewController()
//        vc.flagName = flags[indexPath.row]
//        navigationController?.pushViewController(vc, animated: true)
        if let vc = storyboard?.instantiateViewController(withIdentifier: "FlagView") as? FlagViewController {
            vc.flagName = flags[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlagCell", for: indexPath)
        let flag = flags[indexPath.row]
        cell.textLabel?.text = flag.uppercased()
        cell.imageView?.image = UIImage(named: flag)
        cell.imageView?.layer.borderWidth = 2
        cell.imageView?.layer.borderColor = UIColor.lightGray.cgColor
        return cell
    }


}

