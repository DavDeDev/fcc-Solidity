// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// INHERITANCE and OVERRIDING

import "./SimpleStorage.sol";

// ExtraStorage inherits all the methods of SimpleStorage
contract ExtraStorage is SimpleStorage {
    // We want to change one of the SimpleStorage's method ==> override keyword
    function store(uint256 _favoriteNumber) public override{
        favoriteNumber = _favoriteNumber + 5;
    }
}
