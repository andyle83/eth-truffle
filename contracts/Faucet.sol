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