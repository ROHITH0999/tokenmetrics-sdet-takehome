// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./fixtures/VaultFixture.sol";

/*
 Example test showing how VaultFixture
 reduces boilerplate in tests.
*/
contract VaultDepositTest is VaultFixture {

    function testDepositIncreasesProtocolValue() public {
        uint256 depositAmount = 100_000e6;

        _depositAs(user1, depositAmount);

        assertEq(protocol.totalValue(), depositAmount);
    }

    function testYieldSimulation() public {
        uint256 depositAmount = 200_000e6;

        _depositAs(user1, depositAmount);
        _simulateYield(500); // 5%

        assertGt(protocol.totalValue(), depositAmount);
    }
}
