//
//  TieBrakeGameTestCase.swift
//  JeuSetMatchTests
//
//  Created by Quentin Beaudoul on 28/06/2021.
//  Copyright © 2021 OpenClassrooms. All rights reserved.
//

import XCTest
@testable import JeuSetMatch

class TieBreakGameTestCase: XCTestCase {
    var tieBreakGame: TieBreakGame!
    override func setUp() {
        super.setUp()
        tieBreakGame = TieBreakGame()
    }
    func testGivenScoreIsZero_WhenIncrementingScore_ThenScoreIsOne() {
        // When
        tieBreakGame.incrementScore(forPlayer: .one)
        // Then
        XCTAssertEqual(tieBreakGame.scores[.one], 1)
    }
    func testGivenScoreIsSix_WhenIncrementingScore_ThenScoreIsSevenAndGameIsOver() {
        // Given
        tieBreakGame.scores[.one] = 6
        // When
        tieBreakGame.incrementScore(forPlayer: .one)
        // Then
        XCTAssertEqual(tieBreakGame.scores[.one], 7)
        XCTAssertTrue(tieBreakGame.isOver)
    }
    func testGivenScoreIsSixToSix_WhenIncrementingScore_ThenScoreMustBeSevenToSexAndTheGameIsNotOver() {
        // Given
        tieBreakGame.scores[.one] = 6
        tieBreakGame.scores[.two] = 6
        // When
        tieBreakGame.incrementScore(forPlayer: .one)
        // Then
        XCTAssertEqual(tieBreakGame.scores[.one], 7)
        XCTAssertEqual(tieBreakGame.scores[.two], 6)
        XCTAssertFalse(tieBreakGame.isOver)
    }
}
