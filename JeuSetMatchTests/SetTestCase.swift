//
//  SetTestCase.swift
//  JeuSetMatchTests
//
//  Created by Quentin Beaudoul on 22/06/2021.
//  Copyright © 2021 OpenClassrooms. All rights reserved.
//

import XCTest
@testable import JeuSetMatch

class SetTestCase: XCTestCase {
    var set = Set()
    override func setUp() {
        super.setUp()
        set = Set()
    }
    private func createManyGames(count: Int, wonByPlayer player: Player) {
        for _ in 1...count {
            let game = Game()
            game.winner = player
            set.games.append(game)
        }
    }
    func testGivenPlayerWinByThreeToTwoPlayerOne_WhenGettingScoreFromSet_ThenScoreShouldBeThreeToTwo() {
        createManyGames(count: 3, wonByPlayer: .one)
        createManyGames(count: 2, wonByPlayer: .two)
        // Then
        XCTAssertEqual(set.scores[.one], 3)
        XCTAssertEqual(set.scores[.two], 2)
    }
    func testGivenSetIsNotOver_WhenGettingWinner_ThenWinnerShouldBeNil() {
        // Then
        XCTAssertNil(set.winner)
    }
    func testGivenSetIsOver_WhenGettingWinner_ThenWinnerShouldBePlayerOne() {
        createManyGames(count: 6, wonByPlayer: .one)
        // Then
        XCTAssertTrue(set.isOver)
        XCTAssert(set.winner == .one)
    }
    func testGivenScoreIsSixToFive_WhenGettingWinner_ThenWinnerAndSetIsNotOver() {
        // When
        createManyGames(count: 6, wonByPlayer: .one)
        createManyGames(count: 5, wonByPlayer: .two)
        // Then
        XCTAssertNil(set.winner)
        XCTAssertFalse(set.isOver)
    }
    func testGivenScoreIsSevenToSix_WhenGettingWinner_ThenPlayerOneIsWinner() {
        // When
        createManyGames(count: 7, wonByPlayer: .one)
        createManyGames(count: 6, wonByPlayer: .two)
        // Then
        XCTAssertTrue(set.isOver)
        XCTAssertEqual(set.winner, .one)
    }
}
