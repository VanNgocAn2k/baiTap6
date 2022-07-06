//
//  ViewController.swift
//  baiThiBai6
//
//  Created by Văn Ngọc An on 30/06/2022.
//

import UIKit

class ViewController: UIViewController {

    let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    let view1: UIView = {
     let view = UIView()
        view.backgroundColor = .white
        view.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        return view
    }()
//    let view2: UIView = {
//     let view = UIView()
//        view.backgroundColor = .red
//        view.frame = CGRect(x: UIScreen.main.bounds.width - 60, y: 0, width: 60, height: 60)
//
//        return view
//    }()
//    let view3: UIView = {
//     let view = UIView()
//        view.backgroundColor = .red
//        view.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - 60, width: 60, height: 60)
//        return view
//    }()
//    let view4: UIView = {
//     let view = UIView()
//        view.backgroundColor = .red
//        view.frame = CGRect(x: UIScreen.main.bounds.width - 60, y: UIScreen.main.bounds.height - 60, width: 60, height: 60)
//        return view
//    }()

    var timerRotate: Timer!
    var rotateAngle: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        timerRotate = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true, block: { _ in
            self.rotateAngle += 1
            self.blueView.transform = CGAffineTransform(rotationAngle: -.pi * self.rotateAngle/360)
        })
        ballRun()
    }
    func ballRun() {
        UIView.animate(withDuration: 1.0) {
            self.view1.frame.origin = CGPoint(x: UIScreen.main.bounds.width - 60, y: 0)
        } completion: { _ in
            self.ballRun2()
        }
    }
    func ballRun2() {
        UIView.animate(withDuration: 1.0) {
            self.view1.frame.origin = CGPoint(x: 0, y: UIScreen.main.bounds.height - 60)
        } completion: { _ in
            self.ballRun3()
        }
    }
    func ballRun3() {
        UIView.animate(withDuration: 1.0) {
            self.view1.frame.origin = CGPoint(x: UIScreen.main.bounds.width - 60, y: UIScreen.main.bounds.height - 60)
        } completion: { _ in
            self.ballRun4()
        }
    }
    func ballRun4() {
        UIView.animate(withDuration: 1.0) {
            self.view1.frame.origin = CGPoint(x: 0, y: 0)
        } completion: { _ in
            self.ballRun()
        }
    }
    func setUpUI() {
        view.backgroundColor = .white
        blueView.frame = view1.bounds
        blueView.layer.cornerRadius = 30
        blueView.clipsToBounds = true
        blueView.addSubview(greenView)
        greenView.frame = .init(x: 0, y: 0, width: 20, height: 20)
        view.addSubview(view1)
        view1.addSubview(blueView)
//        view.addSubview(view2)
//        view.addSubview(view3)
//        view.addSubview(view4)
    }

}

