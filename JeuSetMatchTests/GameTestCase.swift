//
//  GameTestCase.swift
//  JeuSetMatchTests
//
//  Created by Quentin Beaudoul on 22/06/2021.
//  Copyright © 2021 OpenClassrooms. All rights reserved.
//

import XCTest
@testable import JeuSetMatch

class GameTestCase: XCTestCase {
    var game: Game!
    override func setUp() {
        super.setUp()
        game = Game()
    }
    func setPlayerOneScore(_ score: Int) {
        game.scores[.one] = score
    }
    func testGivenScoreIsNull_WhenIncrementingPlayer1Score_ThenScoreShouldBeFifteen() {
        // When
        game.incrementScore(forPlayer: .one)
        // Then
        XCTAssertEqual(game.scores[.one]!, 15)
        XCTAssertEqual(game.scores[.two]!, 0)
    }
    func testGivenScoreIsFifteen_WhenIncrementingPlayer1Score_ThenScoreShouldBeThirty() {
        // Given
        setPlayerOneScore(15)
        // When
        game.incrementScore(forPlayer: .one)
        // Then
        XCTAssertEqual(game.scores[.one]!, 30)
    }
    func testGivenScoreIsThirty_WhenIncrementingPlayer1Score_ThenScoreShouldBeForty() {
        // Given
        setPlayerOneScore(30)
        // When
        game.incrementScore(forPlayer: .one)
        // Then
        XCTAssertEqual(game.scores[.one]!, 40)
    }
    func testGivenScoreIsForty_WhenScoreIsForty_ThenPlayer1WinSet() {
        // Given
        setPlayerOneScore(40)
        // When
        game.incrementScore(forPlayer: .one)
        // Then
        XCTAssertEqual(game.winner, .one)
        XCTAssertTrue(game.isOver)
    }
    func testGivenScoreIsFortyToForty_WhenIncrementingScore_ThenScoreIsAdvToForty() {
        // Given
        game.scores[.one] = 40
        game.scores[.two] = 40
        // When
        game.incrementScore(forPlayer: .one)
        // Then
        XCTAssertFalse(game.isOver)
        XCTAssertNil(game.winner)
    }
    func testGivenPlayerOneHasAdvOnPlayerTwoWhenIncressingScoreForPlayerOneThenPlayerOneWinTheGame() {
        // Given
        game.scores[.one] = 40
        game.scores[.two] = 40
        // When
        game.incrementScore(forPlayer: .one)
        game.incrementScore(forPlayer: .one)
        // Then
        XCTAssertTrue(game.isOver)
        XCTAssertEqual(game.winner, Player.one)
    }
}
