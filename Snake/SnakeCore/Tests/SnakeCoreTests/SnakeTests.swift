//
// Created by 游宗諭 in 2020/12/11
//
//
// Using Swift 5.0
//
// Running on macOS 10.15


import XCTest
import SnakeCore

class SnakeTests: XCTestCase {

    func testInitMakeBoardSquare() throws {
        let (sut, _) = makeSUT(tc: 5)
        XCTAssert(sut.board.allSatisfy{$0.count == 5})
        
    }
    // MARK: - Helper
    private func makeSUT(tc: Int = 20) -> (GameViewModelSpy, Game) {
        let drawer = GameViewModelSpy(tc: tc)
        let game = Game(tc: tc, drawer: drawer)
        return (drawer, game)
    }
    class GameViewModelSpy: Drawer {
        internal init(tc: Int) {
            let level = Array(repeating: Node.none, count: tc)
            board = Array(repeating: level, count: tc)
        }
        
        enum Node {case none, apple, snake}
        var board: [[Node]]
        func drawApple(_: Point) {
            
        }
        
        func drawSnake(_: Point) {
            
        }
        
        func drawClean(_: Point) {
            
        }
    }

}
