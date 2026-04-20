//changevote
// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
	enum Choices { Yes, No }

	struct Vote {
		Choices choice;
		address voter;
	}

	// TODO: create a public state variable: an array of votes
	Vote[] public votes;


	function createVote(Choices choice) external {
		// TODO: add a new vote to the array of votes state variable
        require(!hasVoted(msg.sender), "already voted");
		votes.push(Vote(choice, msg.sender));

	}

    function hasVoted(address addr) public view returns (bool) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == addr) {
                return true;
            }
        }
        return false;
    }

    function findChoice(address addr) external view returns (Choices) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == addr) {
                return votes[i].choice;
            }
        }
    }

    function changeVote(Choices choices) external {
        require(hasVoted(msg.sender), "not voted");
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == msg.sender) {
                votes[i] = Vote(choices, msg.sender);
            }
        }
    }
}

