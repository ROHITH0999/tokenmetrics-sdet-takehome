// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../../mocks/MockUSDC.sol";
import "../../mocks/MockProtocol.sol";

/*
 Reusable fixture for vault-related tests.
 Reduces boilerplate across tests.
*/
contract VaultFixture is Test {
    MockUSDC internal usdc;
    MockProtocol internal protocol;

    address internal manager;
    address internal user1;
    address internal user2;

    function setUp() public virtual {
        manager = makeAddr("manager");
        user1 = makeAddr("user1");
        user2 = makeAddr("user2");

        usdc = new MockUSDC();
        protocol = new MockProtocol();

        // Seed balances
        usdc.mint(user1, 1_000_000e6);
        usdc.mint(user2, 1_000_000e6);
    }

    function _depositAs(address user, uint256 amount) internal {
        vm.startPrank(user);
        usdc.approve(address(protocol), amount);
        protocol.deposit(amount);
        vm.stopPrank();
    }

    function _simulateYield(uint256 bps) internal {
        protocol.increaseValue(bps);
    }
}
