//
//  GameScene.swift
//  WatchkitGameTemplate
//
//  Created by Cody Mace on 5/12/20.
//  Copyright © 2020 codymace. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {

    override func sceneDidLoad() {
        let helloWorldLabel = SKLabelNode(text: "Hello World!")
        addChild(helloWorldLabel)
        let rotate = SKAction.rotate(byAngle: 1, duration: 1)
        helloWorldLabel.run(SKAction.repeatForever(rotate))
    }

    // MARK: watchOS specific methods

    func crownDidRotate(delta: Double) {
    }

    func touchBegan(point: CGPoint) {
    }

    func touchEnded(point: CGPoint) {
    }

    func touchMoved(point: CGPoint) {
    }

    // MARK: iOS specific methods

    #if os(iOS)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    #endif

    // MARK: universal methods

    override func update(_ currentTime: TimeInterval) {
    }

    func didBegin(_ contact: SKPhysicsContact) {
    }
}
