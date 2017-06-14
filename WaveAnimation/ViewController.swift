//
//  ViewController.swift
//  WaveAnimation
//
//  Created by Максим Стегниенко on 13.06.17.
//  Copyright © 2017 Максим Стегниенко. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testView: UIImageView!
    
  
    var divider: CGFloat = 500
    var degree: Double = 0
    let animateDuration:TimeInterval = 0.5
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
  
     self.waveAnimation(view: testView)
        
  
    }


    @IBAction func repeatButton(_ sender: Any) {
        self.waveAnimation(view: testView)
    }
   

    /* 
 Мне не нравится, то что я использую DispatchQueue.main.asyncAfter, и по идее есть другой вариант через cabasicanimation, но там свои камни
 
 
 */
    
    func transformWaveAnimation(rotateAngle: Double,scaleX: CGFloat,scaleY: CGFloat,scaleZ: CGFloat) -> CATransform3D {
        
    
        if rotateAngle < 0 && (scaleX > 0 || scaleY > 0 || scaleZ > 0)  {
            
            var transform = CATransform3DIdentity
            
            transform.m34 = -1.0/divider
            
            let angle = CGFloat((rotateAngle * Double.pi) / 180.0)
            
            let transform1 :CATransform3D
            
            let transform2 :CATransform3D
            
            transform1 = CATransform3DRotate(transform, angle, 1, 0, 0)
            
            transform2 = CATransform3DScale(transform, scaleX, scaleY, scaleZ)
            
            return CATransform3DConcat(transform1, transform2)
            
            
        }else if rotateAngle < 0 {
            
            var transform = CATransform3DIdentity
            
            transform.m34 = -1.0/divider
            
            let rotateAngle = CGFloat((rotateAngle * Double.pi) / 180.0)
        
            return CATransform3DRotate(transform, rotateAngle, 1, 0, 0)
            
        }else if scaleX > 0 || scaleY > 0 || scaleZ > 0 {
            
            var transform = CATransform3DIdentity
            
            transform.m34 = -1.0/divider
       
            return CATransform3DScale(transform, scaleX, scaleY, scaleZ)
        }

       return CATransform3DIdentity
    }


    
    /*
     Здесь можно настроить кастомно почти любую деталь анимации например угол поворот или масштаб увелечения 
     
     */
    
    
    func waveAnimation(view: UIView) {
        
        
        UIView.animate(withDuration: animateDuration) {
            
           view.layer.transform = self.transformWaveAnimation(rotateAngle: 0, scaleX: 1.4, scaleY: 1.4, scaleZ: 1.4)
    
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + animateDuration)
        {
            UIView.animate(withDuration: self.animateDuration, delay: 0, options: UIViewAnimationOptions.beginFromCurrentState, animations: {
                
               view.layer.transform  = self.transformWaveAnimation(rotateAngle: -15, scaleX: 1.15, scaleY: 1.15, scaleZ: 1.15)
                
            }, completion: nil)
            
            
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2*animateDuration)
        {
            UIView.animate(withDuration: self.animateDuration, delay: 0, options: UIViewAnimationOptions.beginFromCurrentState, animations: {
                
                view.layer.transform  = self.transformWaveAnimation(rotateAngle: 0, scaleX: 1, scaleY: 1, scaleZ: 1)
                
            }, completion: nil)
            
            
        }
        
    }
    
}



