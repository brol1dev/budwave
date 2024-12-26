//
//  StraditaComponent.swift
//  Budwave
//
//  Created by Eric on 12/12/24.
//

import HotwireNative
import UIKit

class StraditaComponent: BridgeComponent {
    override nonisolated class var name: String { "stradita" }
    
    override func onReceive(message: Message) {
        print("[StraditaComponent] onReceive")
        guard let data: StraditaData = message.data() else { return }
        
        print("[StraditaComponent] onReceive | title: \(data.title)")
    }
}
