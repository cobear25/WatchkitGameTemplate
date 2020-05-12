//
//  InterfaceController.swift
//  WatchkitGameTemplate WatchKit Extension
//
//  Created by Cody Mace on 5/12/20.
//  Copyright © 2020 codymace. All rights reserved.
//

import WatchKit
import Foundation
import SpriteKit


class InterfaceController: WKInterfaceController, WKCrownDelegate {
    @IBOutlet weak var skScene: WKInterfaceSKScene!
    var scene: GameScene?

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)

        crownSequencer.delegate = self
        loadScene()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        crownSequencer.focus()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    func loadScene() {
        if let gameScene = GameScene(fileNamed: "GameScene") {
            scene = gameScene
            // Set the scale mode to scale to fit the window
            gameScene.scaleMode = .aspectFill

            self.skScene.presentScene(scene)

            // Use a value that will maintain a consistent frame rate
            self.skScene.preferredFramesPerSecond = 30
        }
    }

    func crownDidRotate(_ crownSequencer: WKCrownSequencer?, rotationalDelta: Double) {
        // inform the game scene that the crown rotated
        scene?.crownDidRotate(delta: rotationalDelta)
    }

    // handle gestures (ideally from a 0 duration long press)
    @IBAction func handleGesture(gestureRecognizer : WKGestureRecognizer) {
        let point = gestureRecognizer.locationInObject()
        let screenRect = WKInterfaceDevice.current().screenBounds

        guard let scene = scene else { return }
        // convert the point to the scene coordinates
        let newX = point.x * (scene.size.width / screenRect.width) - (scene.size.width / 2)
        let newY = -(point.y * (scene.size.height / screenRect.height) - (scene.size.height / 2))

        let pointInScene = CGPoint(x: newX, y: newY)

        // call the appropriate touch methods on the scene
        switch gestureRecognizer.state {
        case .began:
            scene.touchBegan(point: pointInScene)
        case .ended:
            scene.touchEnded(point: pointInScene)
        case .changed:
            scene.touchMoved(point: pointInScene)
        default:
            break
        }
    }
}
