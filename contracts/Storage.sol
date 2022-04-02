//SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;
contract Storage {
    string public name;
    function setName(string memory _name) public {
        name = _name;
    }
}