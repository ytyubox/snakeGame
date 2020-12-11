//
// Created by 游宗諭 in 2020/12/11
//
//
// Using Swift 5.0
//
// Running on macOS 10.15


import XCTest
import SnakeCore
class GameViewModel: Drawer {
    func drawApple(_: Point) {
        
    }
    
    func drawSnake(_: Point) {
        
    }
    
    func drawClean(_: Point) {
        
    }
}

class SnakeTests: XCTestCase {

    func test() throws {
        
    }
    // MARK: - Helper
    private func makeSUT(tc: Int = 20) -> (GameViewModel, Game) {
        let drawer = GameViewModel()
        let game = Game(tc: tc, drawer: drawer)
        return (drawer, game)
    }
}
