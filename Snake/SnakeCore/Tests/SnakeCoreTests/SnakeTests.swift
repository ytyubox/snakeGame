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
        let tc = 15
        let (sut, _) = makeSUT(tc: tc)
        XCTAssert(sut.board.allSatisfy{$0.count == tc})
    }
    
    func testInitWillThrowIfSizeLessThan15() {
        XCTAssertThrowsError(try GameViewModelSpy(tc: 14))
        XCTAssertNoThrow(try GameViewModelSpy(tc: 15))
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

        let drawer = try! GameViewModelSpy(tc: tc)
        let game = Game(tc: tc, drawer: drawer)
        return (drawer, game)
    }
    class GameViewModelSpy: Drawer {
        enum GameError: Error{
            case tooSmall
        }
        internal init(tc: Int) throws {
            guard tc >= 15 else {throw GameError.tooSmall}
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
