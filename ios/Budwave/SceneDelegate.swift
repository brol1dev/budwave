//
//  SceneDelegate.swift
//  Budwave
//
//  Created by Eric on 11/3/24.
//

import HotwireNative
import UIKit
import WebKit

let rootURL = URL(string: "http://localhost:3000")!

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    private let remotePathConfigUrl = URL(string: "http://localhost:3000/path-configuration.json")!
    
    private lazy var pathConfiguration = PathConfiguration(sources: [
        .server(remotePathConfigUrl)
    ])
    
    private lazy var navigator = Navigator(pathConfiguration: pathConfiguration)
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
#if DEBUG
        Hotwire.config.debugLoggingEnabled = true
#endif
        
        //        let loginViewController = LoginViewController()
        //        loginViewController.delegate = self
        //
        //        window?.rootViewController = loginViewController
        
        Hotwire.registerBridgeComponents([StraditaComponent.self])
        
        window?.rootViewController = navigator.rootViewController
        navigator.route(rootURL)
    }
}

extension SceneDelegate: LoginViewControllerDelegate {
    func loginViewControllerDidLogin(_ loginViewController: LoginViewController) {
        
        
        window?.rootViewController = navigator.rootViewController
        navigator.route(rootURL)
    }
}

