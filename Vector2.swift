//
//  Vector2.swift
//  SwiftGeom
//
//  Created by Marcin Pędzimąż on 22.10.2014.
//  Copyright (c) 2014 Marcin Pedzimaz. All rights reserved.
//

import UIKit

struct Vector2 {
    
    var x : Float32 = 0.0
    var y : Float32 = 0.0
    
    init() {
        
        x = 0.0
        y = 0.0
    }
    
    init(value: Float32) {
    
        x = value
        y = value
    }
    
    init(x:Float32,y:Float32) {
        
        self.x = x
        self.y = y
    }
    
    init(other: Vector2) {
    
        x = other.x
        y = other.y
    }
    
    init(point:CGPoint) {
        x = Float32(point.x)
        y = Float32(point.y)
    }

    init(size:CGSize) {
        x = Float32(size.width)
        y = Float32(size.height)
    }
}

extension Vector2: Printable {
    
    var description: String { return "[\(x),\(y)]" }
}

extension Vector2 : Equatable {
    
    func isFinite() -> Bool {
    
        return x.isFinite && y.isFinite
    }

    func distance(other: Vector2) -> Float32 {
        
        let result = self - other;
        return sqrt( result.dot(result) )
    }
    
    mutating func normalize() {
        
        let m = magnitude()
        
        if m > 0 {
            
            let il:Float32 = 1.0 / m
            
            x *= il
            y *= il
        }
    }
    
    func magnitudeSquared() -> Float32 {
        
        return x*x + y*y
    }

    func magnitude() -> Float32 {
        
        return sqrtf(magnitudeSquared())
    }
    
    func dot( v: Vector2 ) -> Float32 {
        
        return x * v.x + y * v.y
    }
    
    mutating func lerp( a: Vector2, b: Vector2, coef : Float32) {
        
        let result = a + ( b - a) * coef
        
        x = result.x
        y = result.y
    }
    
}

func ==(lhs: Vector2, rhs: Vector2) -> Bool {

    return (lhs.x == rhs.x) && (lhs.y == rhs.y)
}

func < (lhs: Vector2, rhs: Vector2) -> Bool {
    
    return (lhs.x < rhs.x) && (lhs.y < rhs.y)
}

func !=(lhs: Vector2, rhs: Vector2) -> Bool {
    
    return !(lhs == rhs)
}

func <= (lhs: Vector2, rhs: Vector2) -> Bool {
    
    return (lhs < rhs) || (lhs == rhs)
}

func > (lhs: Vector2, rhs: Vector2) -> Bool {
    
    return !(lhs <= rhs);
}

func >= (lhs: Vector2, rhs: Vector2) -> Bool {
    
    return (lhs > rhs) || (lhs == rhs)
}

func * (left: Vector2, right : Float32) -> Vector2 {
    
    return Vector2(x:left.x * right, y:left.y * right)
}

func * (left: Vector2, right : Vector2) -> Vector2 {
    
    return Vector2(x:left.x * right.x, y:left.y * right.y)
}

func / (left: Vector2, right : Float32) -> Vector2 {
    
    return Vector2(x:left.x / right, y:left.y / right)
}

func / (left: Vector2, right : Vector2) -> Vector2 {
    
    return Vector2(x:left.x / right.x, y:left.y / right.y)
}

func + (left: Vector2, right: Vector2) -> Vector2 {
    
    return Vector2(x:left.x + right.x, y:left.y + right.y)
}

func - (left: Vector2, right: Vector2) -> Vector2 {
    
    return Vector2(x:left.x - right.x, y:left.y - right.y)
}

func + (left: Vector2, right: Float32) -> Vector2 {
    
    return Vector2(x:left.x + right, y:left.y + right)
}

func - (left: Vector2, right: Float32) -> Vector2 {
    
    return Vector2(x:left.x - right, y:left.y - right)
}

func += (inout left: Vector2, right: Vector2) {
    
    left = left + right
}

func -= (inout left: Vector2, right: Vector2) {
    
    left = left - right
}

func *= (inout left: Vector2, right: Vector2) {
    
    left = left * right
}

func /= (inout left: Vector2, right: Vector2) {
    
    left = left / right
}

func min(lhs: Vector2, rhs: Vector2) -> Vector2 {
    
    return Vector2(x: min(lhs.x, rhs.x), y: min(lhs.y, rhs.y))
}

func max(lhs: Vector2, rhs: Vector2) -> Vector2 {
    
    return Vector2(x: max(lhs.x, rhs.x), y: max(lhs.y, rhs.y))
}

func clamp(value:Vector2, lowerBound:Vector2, upperBound:Vector2) -> Vector2 {
    return min(max(lowerBound, value), upperBound)
}

extension Vector2 : Comparable {}

/* conversions */
extension CGPoint {
    init(vec2:Vector2) {
        self.x = CGFloat(vec2.x)
        self.y = CGFloat(vec2.y)
    }
}

extension CGSize {
    init(vec2:Vector2) {
        self.width = CGFloat(vec2.x)
        self.height = CGFloat(vec2.y)
    }
}
