// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
 Mock yield protocol to simulate profit/loss
*/
contract MockProtocol {
    uint256 public totalValue;

    function deposit(uint256 amount) external {
        totalValue += amount;
    }

    function increaseValue(uint256 bps) external {
        // increase by basis points
        totalValue = totalValue + (totalValue * bps) / 10_000;
    }
}
