//
// Created by 游宗諭 in 2020/12/11
//
//
// Using Swift 5.0
//
// Running on macOS 10.15


import Foundation
struct Point {
    internal init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    var x,y: Int
}

protocol Drawer {
    func drawApple(_: Point)
    func drawSnake(_: Point)
    func drawClean(_: Point)
}
class Game {
    internal init(tc: Int, drawer: Drawer?) {
        self.tc = tc
        self.drawer = drawer
    }
    
    var drawer: Drawer?
    let time = 1000/15
    @Published var commondInput = ""
    var px = 10
    var py = 10
    var gs = 20
    var tc: Int
    var ax = 15
    var ay = 15
    var xv = 0
    var yv = 0
    var trail = [Point]()
    var tail   = 5
    func gameLoop() {
        px+=xv;
        py+=yv;
        if(px<0) {
            px = tc-1;
        }
        if(px>tc-1) {
            px = 0;
        }
        if(py<0) {
            py = tc-1;
        }
        if(py>tc-1) {
            py = 0;
        }
        for point in trail {
            drawer?.drawSnake(point)
            if(point.x==px && point.y==py) {
                tail = 5
            }
        }
        trail.append(Point(x: px, y: py))
        while (trail.count>tail) {
            trail.removeFirst()
        }
        
        if(ax==px && ay==py) {
            tail += 1
            ax=Int.random(in: 0..<tc)
            ay=Int.random(in: 0..<tc)
        }
        let apple = Point(x: ax, y: ay)
        drawer?.drawApple(apple)
    }
    func keyPush(_ c: Character) {
        switch(c) {
            case "4":
                xv = -1;yv=0;
            case "2":
                xv=0;yv = -1;
            case "6":
                xv=1;yv=0;
            case "8":
                xv=0;yv=1;
            default: break
        }
    }
}
