//
//  IBarChartDataSet.swift
//  Charts
//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/Charts
//

import Foundation
import CoreGraphics

@objc
public protocol IBarChartDataSet: IBarLineScatterCandleBubbleChartDataSet
{
    // MARK: - Data functions and accessors
    
    // MARK: - Styling functions and accessors
    
    /// `true` if this DataSet is stacked (stacksize > 1) or not.
    var isStacked: Bool { get }
    
    /// The maximum number of bars that can be stacked upon another in this DataSet.
    var stackSize: Int { get }
    
    /// the color used for drawing the bar-shadows. The bar shadows is a surface behind the bar that indicates the maximum value
    var barShadowColor: NSUIColor { get set }
    
    /// the width used for drawing borders around the bars. If borderWidth == 0, no border will be drawn.
    var barBorderWidth : CGFloat { get set }

    /// the color drawing borders around the bars.
    var barBorderColor: NSUIColor { get set }
    
    /// the corner radius around the bars.
    var barCornerRadiusType: BarCornerRadius { get set }
    
    /// the explicit corner radius value to use when `barCornerRadiusType == .explicit`
    var barCornerRadiusValue: CGFloat { get set }

    /// the alpha value (transparency) that is used for drawing the highlight indicator bar. min = 0.0 (fully transparent), max = 1.0 (fully opaque)
    var highlightAlpha: CGFloat { get set }
    
    /// array of labels used to describe the different values of the stacked bars
    var stackLabels: [String] { get set }
}

@objc public enum BarCornerRadius: Int {
    case none = 0
    case halfTheWidth
    case quarterTheWidth
    case explicit
    
    func radius(for width: CGFloat) -> CGFloat? {
        switch self {
        case .none: return 0
        case .halfTheWidth : return width / 2
        case .quarterTheWidth : return width / 4
        case .explicit: return nil
        }
    }
}
