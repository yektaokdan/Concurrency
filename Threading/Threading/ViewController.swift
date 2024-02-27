//
//  ViewController.swift
//  Threading
//
//  Created by yekta on 27.02.2024.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    let urlString = ["https://memeart.com.au/cdn/shop/products/DSC01158_2048x.jpg?v=1578829565", "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/LARGE_elevation.jpg/1280px-LARGE_elevation.jpg"]
    var data = Data()
    var tracker = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        DispatchQueue.global().async {
            self.data = try! Data(contentsOf: URL(string: self.urlString[self.tracker])!)
            DispatchQueue.main.async{
                self.imageView.image = UIImage(data: self.data)
            }
        }
       
       
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(changeImage))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Threading Test"
        return cell
    }
    @objc func changeImage(){
        if tracker == 0{
            tracker+=1
        }
        else{
            tracker-=1
        }
        DispatchQueue.global().async {
            self.data = try! Data(contentsOf: URL(string: self.urlString[self.tracker])!) // background thread
            DispatchQueue.main.async{
                self.imageView.image = UIImage(data: self.data) // ui thread
            }
        }    }
}

