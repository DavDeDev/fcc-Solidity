// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// We import the contract here so that we can use it inthe factory

import "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] private simpleStorageArray;

    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    //sf = StorageFactory
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber)
        public
    {
        // You will alaways need two data from the contract
        // Address
        // ABI - Application Binary Interface ==> we automatically get the ABI of the imported contracts
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        simpleStorage.store(_simpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256){
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        return simpleStorage.retrieve();
    }
}
