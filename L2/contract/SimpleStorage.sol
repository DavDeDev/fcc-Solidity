// SPDX-License-Identifier: MIT
// the first thing is the version of the language
pragma solidity ^0.8.7; //any version upper 0.8.7
// >= 0.8.7 <9.0.0

// To define a contract (similar to class)
contract SimpleStorage{
    // // TYPES : boolean, uint, int, address, bytes
    // // uint: unassigned integer -> only positive
    // // address: wallet's address
    // bool hasFavoriteNubmer=true;
    // uint256 favoriteNumber = 5; // you can explicit number of bytes for the int (default & max = 256)
    // string favoriteNUmberInText="Five";
    // address myAddress = 0xafa068B0AaE56BeE54ECC208227f56eA426A7B82;
    // // MAX size of bytes 32
    // bytes17 favoriteBytes = "cat"; // String can be automatically compiled to bytes

    uint256 favoriteNumber ; // Default value is 0 & Default visibility is PRIVATE

    // People public person = People ({favoriteNumber:2, name:"David"});

    // Data Structure: MAP
    mapping(string => uint256 ) public nameToFavoriteNumber;


    // We can create new types
    struct People {
        uint256 favoriteNumber;
        string name;
    }

    // ARRAYs
    // uint256[] public favoriteNumbersList;
    People[] public people; // Dynamic array
    // People[3] public people; // Fixed array

    // function to change the value of the nubmer
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
        //retrieve(); // if we call a view function from another func it costs gas
        // uint256 testVar = 5; // this can only be viewed inside the function  (local scope)
    }

    // view, pure => this disallow modification to the blockchain, FREE from gas
    function retrieve() public view returns (uint256){
        return favoriteNumber;
    }

    // EVM can access and store info in 6 places: CALLDATA, MEMORY, STORAGE, stack, code, logs
    // calldata and memory exists only for the scope
    // calldata can't be modified!!
    // storage exists as global variable
    function addPerson(string memory _name, uint256 _favoriteNumber)public{
        People memory newPerson = People({favoriteNumber:_favoriteNumber,name:_name});
        people.push(newPerson);
        nameToFavoriteNumber[_name]=_favoriteNumber;
    } 

}