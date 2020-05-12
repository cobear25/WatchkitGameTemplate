//
//  ViewController.swift
//  WatchkitGameTemplate
//
//  Created by Cody Mace on 5/12/20.
//  Copyright © 2020 codymace. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    @IBOutlet weak var skView: SKView!
    var gameScene: GameScene?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadScene()
    }

    func loadScene() {
        if let scene = GameScene(fileNamed: "GameScene") {
            self.gameScene = scene

            // Set the scale mode to scale to fit the window
            scene.scaleMode = .resizeFill

            // Present the scene
            skView.presentScene(scene)
        }
    }

}

