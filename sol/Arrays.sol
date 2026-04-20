// dynamicsum
pragma solidity 0.8.20;

contract Contract {

    function sum (uint256[] calldata numbers) external returns(uint) {
        uint total = 0;
        for (uint i = 0 ; i < numbers.length; i++) {
                total += numbers[i];
        }
        return total;
    }


}

// filtertomemory
pragma solidity 0.8.20;

contract Contract {
    function filterEven(uint[] calldata numbers) pure external returns (uint256[] memory) {
        uint count = 0;
        for (uint i = 0; i < numbers.length; i++) {
            if (numbers[i] % 2 == 0) {
                count++;
            }
        }

        uint256[] memory evenNumbers = new uint256[](count);

        uint index = 0;
        for (uint i = 0; i < numbers.length; i++) {
            if (numbers[i] % 2 == 0) {
                evenNumbers[index] = numbers[i];
                index++;
            }
        }

        return evenNumbers;
    }
}


// filtertostorage
pragma solidity 0.8.20;

contract Contract {

        uint[] public evenNumbers;

        function filterEven(uint256[] calldata numbers) external  {
            for (uint i = 0; i < numbers.length; i++) {
                if (numbers[i] % 2 == 0) {
                    evenNumbers.push(numbers[i]);
                }
            }
        }
}

// fixedsum
pragma solidity 0.8.20;

contract Contract {

    function sum(uint[5] memory numbers) external pure returns (uint) {
        uint total = 0;
        for (uint i = 0; i < 5; i++) {
            total += numbers[i];
        }
        return total;
    }
}

// stackclub
pragma solidity 0.8.20;

contract StackClub {

    address[] public members;

    function addMember(address newMember) public {
        members.push(newMember);
    }

    function isMember(address member) public returns(bool) {
            for (uint i= 0; i<members.length; i++) {
                if (members[i] == member) {
                    return true;
                }
            }
            return false;
        }

}



