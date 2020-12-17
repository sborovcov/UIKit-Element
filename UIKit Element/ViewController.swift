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
    
    var count = 0{
        didSet{
            updateButton()
        }
    }
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var birdImageView: UIImageView!
    @IBOutlet weak var poemTextView: UITextView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var button: UIButton!
    
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
        
        //UIButton
//        button.setTitle("Count \(count)", for: [])
        // перенесли строку выше в функцию
        updateButton()
    }

    func updateButton() {
        button.setTitle("Count \(count)", for: [])
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
//        print(#line, #function)
        count += 1
        // [] - значит заголовок выведется для всех состояний кнопки. Конкретное можно задать через .
        //sender.setTitle("Count \(count)", for: [])
        // заменим вызов на функцию. sender в функции уже не нужен, так как для кнопки создан outlet
        //updateButton()
        //  убрали вызов, потому что у переменной count создали наблюдателя didSet
    }
    
    @IBAction func segmentSelected(_ sender: UISegmentedControl) {
//        print(#line, #function, sender.selectedSegmentIndex)
        switch sender.selectedSegmentIndex {
        case 0:
            count = 0
        case 1:
            count -= 1
        case 2:
            count += 1
        default:
            fatalError("Unknown index \(sender.selectedSegmentIndex) in \(#line) \(#function)")
        }
    }
   
  
    @IBAction func dataEntered(_ sender: UITextField) {
        print(#line, #function, sender.tag, sender.text ?? "nil")
    }
}

