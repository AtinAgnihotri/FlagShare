//
//  FlagViewController.swift
//  FlagShare
//
//  Created by Atin Agnihotri on 08/07/21.
//

import UIKit

class FlagViewController: UIViewController {
    
    
    @IBOutlet var imageView: UIImageView!
    
    var flagName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadImage()
        addBackgroundToImage()
        addShareButton()
        setTitle()
    }
    
    func addBackgroundToImage() {
        imageView.layer.backgroundColor = UIColor.lightGray.cgColor
    }
    
    func addShareButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    }
    
    @objc func shareTapped() {
        guard let name = flagName else {
            print("Invalid flag name")
            return
        }
        
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("Invalid flag image")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [name, image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
    func loadImage() {
        if let imageToLoad = flagName {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    func setTitle() {
        title = "\(flagName?.uppercased() ?? "Unknown flag")"
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
