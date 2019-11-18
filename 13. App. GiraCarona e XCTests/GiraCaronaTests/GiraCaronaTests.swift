//
//  GiraCaronaTests.swift
//  GiraCaronaTests
//
//  Created by Thiago Dantas on 18/11/19.
//  Copyright © 2019 Thiago Dantas. All rights reserved.
//

import XCTest
@testable import GiraCarona

class GiraCaronaTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCPFValido() {
        let l = LoginViewController();
        XCTAssert(l.validaCPF(cpf: "111.111.111-11") == true, "CPF é Valido e retornou Invalido.")
    }

    func testCPFInvalido() {
        let l = LoginViewController();
        XCTAssert(l.validaCPF(cpf: "123.123.123-11") == false, "CPF é invalido e retornou valido.")
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
