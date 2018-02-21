//
//  ContentCollectionViewCell.swift
//  CollectionViewTest
//
//  Created by Burger, Patrick on 20.02.18.
//  Copyright © 2018 SPORT1 Online GmbH. All rights reserved.
//

import UIKit

class ContentCell: UICollectionViewCell, ContentSizeInjectable {
    @IBOutlet weak var contentWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var contentHeightConstraint: NSLayoutConstraint!
    @IBOutlet var container: UIView!
    
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
        setContentWidth(width: 200 - layoutMargins.left - layoutMargins.right)
        
        label.text = text
    }
}

class ContentCollectionView: UIView {
    @IBOutlet weak var label: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configure(text: String) {
        label.text = text + "bla bla"
    }
}

class ContentCollectionViewCell: UICollectionViewCell, ContentSizeInjectable {
    var contentWidthConstraint: NSLayoutConstraint!
    var contentHeightConstraint: NSLayoutConstraint!
    
    var container: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        guard let view = Bundle.main.loadNibNamed("ContentCollectionView", owner: nil, options: nil)?[0] as? ContentCollectionView
            else {
                assertionFailure()
                return nil
        }
        
        contentView.addSubview(view)
        container = view
        setupConstraintsProvidingVerticalResizability(view: container)
    }
    
    func configue(text: String, width: CGFloat, height: CGFloat) {
        guard let contentCollectionView = container as? ContentCollectionView else { return }
        
        setContentWidth(width: width)
        contentCollectionView.configure(text: text)
        
        container.layoutIfNeeded()
    }
    
    func setupConstraintsProvidingVerticalResizability(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        // setup adjustable width/height constraints
        contentWidthConstraint = view.widthAnchor.constraint(equalToConstant: 0)
        contentWidthConstraint.priority = UILayoutPriority(999)
        contentHeightConstraint = view.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: 0)
        contentHeightConstraint.priority = UILayoutPriority(999)
        
        // setup positioning constraints
        let equalWidthConstraint = view.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: 0)
        let leadingSpaceConstraint = view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0)
        let topSpaceConstraint = view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0)
        
        activate(constraints: [contentWidthConstraint, contentHeightConstraint, equalWidthConstraint, leadingSpaceConstraint, topSpaceConstraint])
    }
    
    private func activate(constraints: [NSLayoutConstraint]) {
        for constraint in constraints {
            constraint.isActive = true
        }
    }
}
