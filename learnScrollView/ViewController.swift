//
//  ViewController.swift
//  learnScrollView
//
//  Created by Ben on 2017/5/12.
//  Copyright © 2017年 Boyce. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    var images = [UIImageView]() // Create an object of UIImageView
    
    let MAX_PAGE = 2
    let MIN_PAGE = 0
    var currentPage = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        var contentWidth: CGFloat = 0.0
        let scrollWidth = scrollView.frame.size.width
        // Loading icon image to "images" object
        for x in 0...2 {
            let image = UIImage(named: "icon\(x).png") // Input the number x image to image
            let imageView = UIImageView(image: image) // make a reference, let you could change the size, position or other staffs.
            images.append(imageView) // Initialize the images object
            
            var newX: CGFloat = 0.0
            newX = scrollWidth / 2 + scrollWidth * CGFloat(x)
            
            contentWidth += newX
            
            scrollView.addSubview(imageView) // Add specific icon image to subview
            imageView.frame = CGRect(x: (newX - 75), y: (view.frame.size.height / 2) - 75, width: 150, height: 150)
            
        }
//        contentWidth = scrollWidth * 3
        
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
        
        scrollView.backgroundColor = UIColor.purple
        scrollView.clipsToBounds = false
        
//        self.images[self.currentPage].transform = CGAffineTransform.init(scaleX: 1.4, y: 1.4)
      
    }

    @IBAction func detectSwipe(_ sender: UISwipeGestureRecognizer) {
        if (currentPage < MAX_PAGE && sender.direction == UISwipeGestureRecognizerDirection.left) {                        moveScrollView(direction: 1)
            
        }
        
        if (currentPage > MIN_PAGE && sender.direction == UISwipeGestureRecognizerDirection.right) {
            moveScrollView(direction: -1)
        }
    }
    
    func moveScrollView(direction: Int){
        currentPage = currentPage + direction
        let point: CGPoint = CGPoint(x: scrollView.frame.size.width * CGFloat(currentPage), y: 0.0)
        scrollView.setContentOffset(point, animated: true)
        
//        // Create a animation to increase the actual icon on screen
//        UIView.animate(withDuration: 0.4){
//            self.images[self.currentPage].transform = CGAffineTransform.init(scaleX: 1.4, y: 1.4)
//            
//            // Revert icon size of the non-active pages
//            for x in 0..<self.images.count {
//                if (x != self.currentPage) {
//                    self.images[x].transform = CGAffineTransform.identity
//                }
//            }
//        }
    }
    
    
}

