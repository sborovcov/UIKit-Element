//
//  ViewController.swift
//  UIKit Element
//
//  Created by Stas Borovtsov on 15.12.2020.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = indexPath.row.isMultiple(of: 2) ? .green : .cyan
        cell.textLabel?.text = "Row: \(indexPath.row)"
        return cell
    }
    

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var birdImageView: UIImageView!
    @IBOutlet weak var poemTextView: UITextView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = #function
        label.textColor = .blue
        
//        birdImageView.image = UIImage(named: "birds")
        
        if let text = poemTextView.text{
            poemTextView.text = String(text.reversed())
        }
        
        //UIScrollView
        let imageView = UIImageView(image: UIImage(named: "birds"))
//        let scrollView = UIScrollView(frame: view.bounds) // так выводим на весь экран
        let scrollView = UIScrollView(frame: CGRect(x: view.bounds.midX - 50, y: view.bounds.minY + 180, width: 100, height: 100)) // а так в заданной области
        scrollView.backgroundColor = .blue
        scrollView.contentSize = imageView.bounds.size
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.addSubview(imageView)// тоже самое как мы перетаскивали объект из библиотеки объектов
        view.addSubview(scrollView)     //добавим на главный view наш элемент
   
        //UITableView
        tableView.backgroundColor = .cyan
        tableView.dataSource = self
    }


}

