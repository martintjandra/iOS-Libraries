//
//  UIDrawView.swift
//  iOPS
//
//  Created by Martin Tjandra on 8/25/16.
//  Copyright © 2016 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation
import CoreGraphics

class UIDrawView : UIView {

    var drawData = Dictionary<String, AnyObject>();
    
    func drawCircle(x x: CGFloat, y: CGFloat, r: CGFloat, startAngle: CGFloat, endAngle: CGFloat, strokeColor: UIColor, fillColor: UIColor) {
        drawData["type"] = "circle";
        drawData["x"] = x;
        drawData["y"] = y;
        drawData["r"] = r;
        drawData["startAngle"] = startAngle;
        drawData["endAngle"] = endAngle;
        drawData["strokeColor"] = strokeColor;
        drawData["fillColor"] = fillColor;

    }
    
    func drawDonut(x x: CGFloat, y: CGFloat, outerRadius r: CGFloat, innerRadius r2: CGFloat, startAngle: CGFloat, endAngle: CGFloat, strokeColor: UIColor, fillColor: UIColor, innerFillColor: UIColor = UIColor.whiteColor()) {
        drawData["type"] = "donut";
        drawData["x"] = x;
        drawData["y"] = y;
        drawData["r"] = r;
        drawData["r2"] = r2;
        drawData["startAngle"] = startAngle;
        drawData["endAngle"] = endAngle;
        drawData["strokeColor"] = strokeColor;
        drawData["fillColor"] = fillColor;
        drawData["innerFillColor"] = innerFillColor;
    }
    
    func drawSpeedometerChart (x x: CGFloat, y: CGFloat, outerRadius r: CGFloat, innerRadius r2: CGFloat, progress: [CGFloat],fillColor: [UIColor], innerFillColor: UIColor = UIColor.whiteColor()) {
        drawData["type"] = "speedometer";
        drawData["x"] = x;
        drawData["y"] = y;
        drawData["r"] = r;
        drawData["r2"] = r2;
        drawData["progress"] = progress;
        drawData["strokeColor"] = UIColor.clearColor();
        drawData["fillColor"] = fillColor;
        drawData["innerFillColor"] = innerFillColor;
    }
    
    func drawCircleCore (x x: CGFloat, y: CGFloat, r: CGFloat, startAngle: CGFloat, endAngle: CGFloat, strokeColor: UIColor, fillColor: UIColor) {
        let pi = CGFloat(3.14159);
        let start = CGFloat(startAngle / 180 * pi);
        let end = CGFloat(endAngle / 180 * pi);
        let context = UIGraphicsGetCurrentContext()
        CGContextMoveToPoint(context, x, y);
        CGContextAddArc(context, x, y, r, start, end, 0);
        strokeColor.setStroke();
        fillColor.setFill();
        CGContextDrawPath(context, .FillStroke);
    }
    
    func drawRect (x x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, strokeColor: UIColor, fillColor: UIColor) {
        drawData["type"] = "rect";
        drawData["x"] = x;
        drawData["y"] = y;
        drawData["w"] = w;
        drawData["h"] = h;
        drawData["strokeColor"] = UIColor.clearColor();
        drawData["fillColor"] = fillColor;
    }
    
    func drawHorizBarChart (x x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, progress: [CGFloat], strokeColor: UIColor, fillColor: [UIColor]) {
        drawData["type"] = "horizbar";
        drawData["x"] = x;
        drawData["y"] = y;
        drawData["w"] = w;
        drawData["h"] = h;
        drawData["progress"] = progress;
        drawData["strokeColor"] = UIColor.clearColor();
        drawData["fillColor"] = fillColor;
    }
    
    func drawRectCore (x x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, strokeColor: UIColor, fillColor: UIColor) {
        let context = UIGraphicsGetCurrentContext()
        let rect = CGRectMake(x, y, w, h);
        let path = CGPathCreateWithRect(rect, nil);
        strokeColor.setStroke();
        fillColor.setFill();
        CGContextAddPath(context, path);
        CGContextDrawPath(context, .FillStroke);
    }
    
    override func drawRect(rect: CGRect) {
//        let path = CGPathCreateWithRect(rect, nil)
        
        guard let type = drawData["type"] as? String else { return; }
        
        if (type == "circle" || type == "donut") {
            guard let x = drawData["x"] as? CGFloat else { return; }
            guard let y = drawData["y"] as? CGFloat else { return; }
            guard let r = drawData["r"] as? CGFloat else { return; }
            guard let startAngle = drawData["startAngle"] as? CGFloat else { return; }
            guard let endAngle = drawData["endAngle"] as? CGFloat else { return; }
            guard let strokeColor = drawData["strokeColor"] as? UIColor else { return; }
            guard let fillColor = drawData["fillColor"] as? UIColor else { return; }
            
            drawCircleCore(x: x, y: y, r: r, startAngle: startAngle, endAngle: endAngle, strokeColor: strokeColor, fillColor: fillColor);
            
            if (type == "donut") {
                guard let r2 = drawData["r2"] as? CGFloat else { return; }
                guard let innerFillColor = drawData["innerFillColor"] as? UIColor else { return; }

                drawCircleCore(x: x, y: y, r: r2, startAngle: startAngle, endAngle: endAngle, strokeColor: strokeColor, fillColor: innerFillColor);
            }
        }
        else if (type == "speedometer") {
            guard let x = drawData["x"] as? CGFloat else { return; }
            guard let y = drawData["y"] as? CGFloat else { return; }
            guard let r = drawData["r"] as? CGFloat else { return; }
            guard let r2 = drawData["r2"] as? CGFloat else { return; }
            guard let progress = drawData["progress"] as? [CGFloat] else { return; }
            guard let strokeColor = drawData["strokeColor"] as? UIColor else { return; }
            guard let fillColor = drawData["fillColor"] as? [UIColor] else { return; }
            guard let innerFillColor = drawData["innerFillColor"] as? UIColor else { return; }
            
            for i in 0..<progress.count {
                let idx = progress.count - i - 1;
                let value = progress[idx];
                var color = UIColor.clearColor();
                if (idx < fillColor.count) { color = fillColor[idx]; }
                let startAngle = CGFloat(180);
                let endAngle = CGFloat(180+180*value);
                
                drawCircleCore(x: x, y: y, r: r, startAngle: startAngle, endAngle: endAngle, strokeColor: strokeColor, fillColor: color)
            }
            
            drawCircleCore(x: x, y: y, r: r2, startAngle: 180, endAngle: 360, strokeColor: strokeColor, fillColor: innerFillColor);
            
        }
        else if (type == "horizbar") {
            guard let x = drawData["x"] as? CGFloat else { return; }
            guard let y = drawData["y"] as? CGFloat else { return; }
            guard let w = drawData["w"] as? CGFloat else { return; }
            guard let h = drawData["h"] as? CGFloat else { return; }
            guard let progress = drawData["progress"] as? [CGFloat] else { return; }
            guard let strokeColor = drawData["strokeColor"] as? UIColor else { return; }
            guard let fillColor = drawData["fillColor"] as? [UIColor] else { return; }
            
            for i in 0..<progress.count {
                let idx = progress.count - i - 1;
                let value = progress[i] * w;
                var color = UIColor.clearColor();
                if (idx < fillColor.count) { color = fillColor[idx]; }
                drawRectCore(x: x, y: y, w: value, h: h, strokeColor: strokeColor, fillColor: color);
            }
            
        }
    }
}