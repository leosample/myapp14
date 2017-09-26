//
//  ViewController.swift
//  myapp15
//
//  Created by sample on 2017/9/26.
//  Copyright © 2017年 sample. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    private var q1 = DispatchQueue(label: "tw.sample.q1", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent)
    @IBAction func but01(_ sender: Any) {
        let url = URL(string: "http://www.iii.org.tw")
        do{
            let content = try String(contentsOf: url!)
            print(content)
            
            //label.text = String
        } catch {
            
        }
    }
    
    @IBAction func but02(_ sender: Any) {
        let url = URL(string: "http://pic.pimg.tw/nicelovemr/1363308887-2648067100.jpg")
        do {
            let data = try Data(contentsOf: url!)
            let img = UIImage(data: data)
            imgView.image = img
//            imgView.image = UIImage
            print("OK")
        } catch {
            print("NO")
        }
    }
    @IBAction func but03(_ sender: Any) {
        q1.async {
            self.test3()
        }
    }
    private func test3(){
        let url = URL(string: "http://pic.pimg.tw/nicelovemr/1363308887-2648067100.jpg")
        do {
            let data = try Data(contentsOf: url!)
            let img = UIImage(data: data)
            DispatchQueue.main.async {
                self.imgView.image = img
            }
            print("OK")
        } catch {
            print("NO")
        }
    }
    @IBAction func test4(_ sender: Any) {
        let url = URL(string: "http://www.pchome.com.tw")
//        let config = URLSessionConfiguration.default //存 cache
        let config = URLSessionConfiguration.ephemeral //不存 cache
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url!) {
            (data, response, error) in
            guard error == nil else { return }
            if let cont = String(data: data!, encoding: String.Encoding.utf8){
                print(cont)
            }
        }
        task.resume()
    }
    
    @IBAction func but05(_ sender: Any) {
        
    }
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(NSHomeDirectory())
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

