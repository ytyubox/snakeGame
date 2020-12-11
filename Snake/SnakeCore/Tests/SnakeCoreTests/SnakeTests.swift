//
// Created by 游宗諭 in 2020/12/11
//
//
// Using Swift 5.0
//
// Running on macOS 10.15


import XCTest
@testable import SnakeCore

class SnakeTests: XCTestCase {

    func testInitMakeBoardSquare() throws {
        let (sut, _) = makeSUT(tc: 5)
        XCTAssert(sut.board.allSatisfy{$0.count == 5})
    }
    func testGameDrawCleanWillHaveTheColumnNone() throws {
        let (sut, game) = makeSUT()
        let point = Point(x: 10, y: 10)
        game.drawClean(point)
        XCTAssertEqual(sut.board[10][10], .none)
    }
    func testGameDrawAppleWillHaveTheColumnApple() throws {
        let (sut, game) = makeSUT()
        let point = Point(x: 10, y: 10)
        game.drawApple(point)
        XCTAssertEqual(sut.board[10][10], .apple)
    }
    func testGameDrawSnakeWillHaveTheColumnSnake() throws {
        let (sut, game) = makeSUT()
        let point = Point(x: 10, y: 10)
        game.drawSnake(point)
        XCTAssertEqual(sut.board[10][10], .snake)
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
        func drawApple(_ p: Point) {
            board[p.x][p.y] = .apple
        }
        
        func drawSnake(_ p: Point) {
            board[p.x][p.y] = .snake
        }
        
        func drawClean(_: Point) {
            
        }
    }

}
