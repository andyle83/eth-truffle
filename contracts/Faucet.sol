// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract owner {
    address payable owner;

    // contract constructor: set owner
    constructor() {
        owner = payable(msg.sender);
    }

    // access controller modifier
    modifier onlyOwner {
        require (msg.sender == owner);
        _;
    }
}

contract mortal is owner {
    // contract destructor
    function destroy() public onlyOwner {
        selfdestruct(owner);
    }
}

contract Faucet is mortal {
    event Withdrawal(address indexed to, uint amount);
    event Deposit(address indexed from, uint amount);

    // Give out ether to anyone who asks
    function withdraw(uint withdraw_amount) public {
        // Limit withdrawal amount
        require(withdraw_amount <= 0.1 ether);

        require(
            address(this).balance >= withdraw_amount,
            "Insufficient balance in faucet for withdrawal request"
        );

        // Send the amount to the address that requested it
        payable(msg.sender).transfer(withdraw_amount);
        // Log event
        emit Withdrawal(msg.sender, withdraw_amount);
    }

    // Accept any incoming amount
    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }
}