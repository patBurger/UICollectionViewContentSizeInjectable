//
//  ContentSizeInjectable.swift
//  CollectionViewTest
//
//  Created by Burger, Patrick on 20.02.18.
//  Copyright © 2018 SPORT1 Online GmbH. All rights reserved.
//

import UIKit

protocol ContentSizeInjectable: class {
    // Necessary IBOutlets
    weak var contentWidthConstraint: NSLayoutConstraint! { get }
    weak var contentHeightConstraint: NSLayoutConstraint! { get }
    
    var container: UIView! { get }
}

extension ContentSizeInjectable where Self: UICollectionViewCell {
    //    enum ContentConstraintType {
    //        case width
    //        case height
    //    }
    
    func loadContainerViewFromNib() {
        
    }
    
    func configureContentSizeConstraintsWithSize(width: CGFloat, height: CGFloat) {
        setupContentSizeConstraints()
        configureWithSize(width: width, height: height)
    }
    
    func configureWithSize(width: CGFloat, height: CGFloat) {
        // -1 to prevent UICollectionViewFlowLayoutBreakForInvalidSizes
        setContentWidth(width: width - 1)
        // setContentHeight(height: height)
    }
    
    func resetConstraints() {
        setupContentSizeConstraints()
    }
    
    func setupContentSizeConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        //        contentWidthConstraint = contentView.widthAnchor.constraint(equalToConstant: 0)
        //        contentHeightConstraint = contentView.heightAnchor.constraint(equalToConstant: 0)
        
        
        
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
