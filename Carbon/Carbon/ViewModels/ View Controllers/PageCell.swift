//
//  Page Cell.swift
//  Carbon
//
//  Created by mac on 8/23/21.
//

import UIKit
import Lottie

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            guard let page = page else { return }
            
            let color = UIColor(white: 0.2, alpha: 1)
            let attributedText = NSMutableAttributedString(string: page.title, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.bold), NSAttributedString.Key.foregroundColor: color])
            
            attributedText.append(NSAttributedString(string: "\n\n\(page.message)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: color]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            let length = attributedText.string.count
            attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: length))
            
            textView.attributedText = attributedText
        }
    }
    
    //MARK:- Creating the Animation View
    var animationView: AnimationView!
    var name: [String] = ["bank", "carbon", "carbonPink"]
    
    private func displayAnimation() {
            animationView = .init(name: "carbon")
            animationView.frame = contentView.bounds
            animationView.contentMode = .scaleAspectFit
            animationView.loopMode = .playOnce
            animationView.animationSpeed = 0.7

            addSubview(animationView)

            animationView.play()
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutCellItems()
    }
        
   private let textView: UITextView = {
        let text = UITextView()
        text.text = ""
        text.isEditable = false
        text.contentInset = UIEdgeInsets(top: -10, left: 0, bottom: 0, right: 0)
        return text
    }()
    
    private func layoutCellItems() {
       
        addSubview(textView)
        displayAnimation()
        
        animationView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        
        textView.anchorWithConstantsToTop(top: animationView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
