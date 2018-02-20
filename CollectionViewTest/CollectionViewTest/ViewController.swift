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
        flowLayout?.estimatedItemSize = CGSize(width: 20, height: 20)
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
        return 6000
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ContentCell.self), for: indexPath) as! ContentCell
        cell.configue(text: "jaja", width: collectionView.bounds.width, height: 60)
        
        return cell
    }
}

class ContentCell: UICollectionViewCell, ContentSizeInjectable {
    weak var contentMinXConstraint: NSLayoutConstraint?
    
    weak var contentMinYConstraint: NSLayoutConstraint?
    
    @IBOutlet weak var contentWidthConstraint: NSLayoutConstraint?
    @IBOutlet weak var contentHeightConstraint: NSLayoutConstraint?
    
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        self.translatesAutoresizingMaskIntoConstraints = false
//        setupContentSizeConstraints()
//        self.contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // resetConstraints()
    }
    
    func configue(text: String, width: CGFloat, height: CGFloat) {
        // configureContentSizeConstraintsWithSize(width: width, height: height)
        setContentWidth(width: width)
        label.text = text
    }
    
//    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
//        return layoutAttributes
//    }
}

protocol ContentSizeInjectable: class {
    weak var contentWidthConstraint: NSLayoutConstraint? { get set }
    weak var contentHeightConstraint: NSLayoutConstraint? { get set }
    
    weak var contentMinXConstraint: NSLayoutConstraint? { get set }
    weak var contentMinYConstraint: NSLayoutConstraint? { get set }
}

extension ContentSizeInjectable where Self: UICollectionViewCell {
    //    enum ContentConstraintType {
    //        case width
    //        case height
    //    }
    
    func configureContentSizeConstraintsWithSize(width: CGFloat, height: CGFloat) {
        setupContentSizeConstraints()
        configureWithSize(width: width, height: height)
    }
    
    func configureWithSize(width: CGFloat, height: CGFloat) {
        // -1 to prevent UICollectionViewFlowLayoutBreakForInvalidSizes
        setContentWidth(width: width - 1)
        // setContentHeight(height: height)
        contentMinXConstraint = contentView.leadingAnchor.constraint(equalTo: (self as UICollectionViewCell).leadingAnchor)
        
        contentMinXConstraint?.isActive = true
    }
    
    func resetConstraints() {
        setupContentSizeConstraints()
    }
    
    func setupContentSizeConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentWidthConstraint = contentView.widthAnchor.constraint(equalToConstant: 0)
        contentHeightConstraint = contentView.heightAnchor.constraint(equalToConstant: 0)
        
        
        
        contentWidthConstraint?.isActive = false
        contentHeightConstraint?.isActive = false
    }
    
    func setContentWidth(width: CGFloat) {
        contentWidthConstraint?.constant = width
        contentWidthConstraint?.isActive = width > 0
    }
    
    func setContentHeight(height: CGFloat) {
        contentHeightConstraint?.constant = height
        contentHeightConstraint?.isActive = height > 0
    }
}
