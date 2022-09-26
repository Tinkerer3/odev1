// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FeeCollector {
    address public owner;
    uint256 public balance;

    constructor () {
        owner = msg.sender;
    }

    receive() payable external {
        balance += msg.value;
    }

    function withdraw(uint amount, address payable destAddress) public{
        require(msg.sender == owner, "Only owner can withdraw");
        require(balance >= amount, "Not enough balance");

        destAddress.transfer(amount);
        balance -= amount;
    }
}