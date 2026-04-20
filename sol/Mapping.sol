// addmember
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {

    mapping(address => bool) public members ;

    function addMember(address member) external {
        members[member] = true;
    }

}

//ismember
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {

    mapping(address => bool) public members ;

    function addMember(address member) external {
        members[member] = true;
    }

    function isMember(address member) external view returns(bool) {
        return members[member];
    }

}

//mapstruct
pragma solidity ^0.8.20;

contract Contract {
	struct User {
		uint balance;
		bool isActive;
	}

	mapping(address => User) public users;

	function createUser() external{
		require(!users[msg.sender].isActive, "user already exists");
		users[msg.sender] = User(100, true);
	}

   function transfer(address recipient, uint amount) external {
        require(users[msg.sender].isActive, "sender not active");
        require(users[recipient].isActive, "recipient not active");
        require(users[msg.sender].balance >= amount, "insufficient balance");

        users[msg.sender].balance -= amount;
        users[recipient].balance += amount;
    }
}

//nestedmaps
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
	enum ConnectionTypes {
		Unacquainted,
		Friend,
		Family
	}

	// TODO: create a public nested mapping `connections`
	mapping(address => mapping(address => ConnectionTypes)) public connections;

	function connectWith(address other, ConnectionTypes connectionType) external {
        // TODO: make the connection from msg.sender => other => connectionType
		connections[msg.sender][other] = connectionType;
	}
}

//removemember
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {

    mapping(address => bool) public members ;

    function addMember(address member) external {
        members[member] = true;
    }

    function isMember(address member) external view returns(bool) {
        return members[member];
    }

    function removeMember(address member) external {
        members[member] = false;
    }

}

