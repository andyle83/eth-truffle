// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import "./Faucet.sol";

contract Token is mortal {
    Faucet _faucet;

    constructor(address payable _f) {
        // create another contract and send a value
        _faucet = Faucet(_f);
        _faucet.withdraw(0.1  ether);
    }
}