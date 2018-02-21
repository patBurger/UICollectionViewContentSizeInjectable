//
//  ViewController.swift
//  CollectionViewTest
//
//  Created by Burger, Patrick on 19.02.18.
//  Copyright © 2018 SPORT1 Online GmbH. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout
        flowLayout?.estimatedItemSize = CGSize(width: 1, height: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ContentCell.self), for: indexPath) as! ContentCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ContentCollectionViewCell.self), for: indexPath) as! ContentCollectionViewCell
        
        let longText = indexPath.row % 2 == 0
        let text = longText ? "jaja, ich hoffe das hier wird irgendwann mal zweizeilig. Ob die Constraints dann noch passen, man weiß es nicht. Ich schreibe trotzdem weiter und weiter in dieser Zeile" : "jaja"
        cell.configue(text: text, width: collectionView.bounds.width, height: 60)
        
        return cell
    }
}
