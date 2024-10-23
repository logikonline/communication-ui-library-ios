//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import UIKit

protocol DrawerViewControllerProtocol {
    func resetOrientation()
}

extension DrawerViewControllerProtocol where Self: UIViewController {
    func resetOrientation() {
        if UIDevice.current.userInterfaceIdiom == .phone {
            if let windowScene = view.window?.windowScene {
                let geometryPreferences = UIWindowScene.GeometryPreferences.iOS(interfaceOrientations: .portrait)
                windowScene.requestGeometryUpdate(geometryPreferences) { error in
                    if let error = error {
                        print("Failed to reset orientation: \(error)")
                    }
                }
            }
            UIViewController.attemptRotationToDeviceOrientation()
        }
    }
}
