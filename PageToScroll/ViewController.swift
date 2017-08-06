//
//  ViewController.swift
//  PageToScroll
//
//  Created by David Sternheim on 7/30/17.
//  Copyright © 2017 David Sternheim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var scrollView: UIScrollView!

    var images = [UIImageView]() // declaring an empty array of images
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        var contentWidth: CGFloat = 0.0
        
        for x in 0...2{
            let image = UIImage(named: "icon\(x).png")//creating images from file names
            let imageView = UIImageView(image: image)
            images.append(imageView)//putting these images into the image array
            
            var newX: CGFloat = 0.0 // intializing a variable which will store the index of the psoition
            newX = scrollView.frame.size.width/2 + scrollView.frame.size.width * CGFloat(x)// CGFloat(x) casts x as a CGFloat
            /*
             view.frame.midX is essentially the entire middle of the screen
             
             ------------
             |   midX   |
             
             view.frame.size.width is the width of the screen
             
             ------------------
             |<-   width   ->|
             
             Multiplying the width by the CGFloat(x) inside of the loop will place the images in the correct position, so
             for example the first iteration of the loop x will be 0 therefore the newX variable will be: newX = midX + width * 0 which places the image at midX position. In the next iteration x will be 1 so the newX variable will be as follows: newX = midX + width * 1 which will place the image one and a half screens from the left edge of the phone
             
             
             **Note: scrollView.frame.size.width is just the width of the scrollView rather than the entire screen so by replacing the screen width with the scrollView width the calculations using newX are based on the scrollView rather than the view/screen width
             */
            
            contentWidth+=newX //Adds the current newX value to the existing contentWidth because you want your content size(which is width in this case) to be the same as your size as your content so it knows how far it needs to scroll
            
            scrollView.addSubview(imageView)
            
            imageView.frame = CGRect(x:newX-75, y:(scrollView.frame.height/2) - 75, width:150, height:150)//This is setting the frame for the image. The x value is how far from the left edge of the screen the image is (x:0 just means the image is pinned to the left edge of the screen. The y value is the same as the x value but just for the height. The x and y values can be moved by + or - values. The width and height values are arbitrary numbers which will determine the size of the image. ***Remember you may want to detect the screen size and adjust image/frame size accordingly
            
            
        }
      
        scrollView.clipsToBounds=false // removes the clipping between images and allows the user to see the next item as they are swiping left or right
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height) // sets the scrollView size to the size of the content
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

