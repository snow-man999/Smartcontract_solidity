// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract OnlyAuthorized {
    address public owner;
    uint256 public n;

    error OnlyOwner();
    error ZeroAddress();

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        if (msg.sender != owner) revert OnlyOwner();
        _;
    }

    function changeOwner(address newOwner) external onlyOwner {
        if (newOwner == address(0)) revert ZeroAddress();
        owner = newOwner;
    }

    function setN(uint256 newN) external {
        n = newN;
    }
}
