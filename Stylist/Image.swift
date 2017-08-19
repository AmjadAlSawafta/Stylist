//
//  Image.swift
//  Stylist
//
//  Created by Yonas Kolb on 19/8/17.
//  Copyright © 2017 Stylist. All rights reserved.
//

import Foundation

#if os(iOS) || os(tvOS) || os(watchOS)
    import UIKit
    public typealias Image = UIImage
#else
    import Cocoa
    public typealias Image = NSImage
#endif

extension Image: Parseable {

    static func parse(value: Any) -> Image? {
        guard let string = value as? String else { return nil }
        return UIImage(named: string)
    }
}
