// Layout of Contract:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions

// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

error Raffle__NotEnoughAmountEntered();

/**
 * @title Raffle Contract
 * @author Jonathan Evan (Joev)
 * @notice This contract is for creating a sample raffle
 * @dev Implements Chainlink VRFv2.5
 */
contract Raffle {
    uint256 public immutable i_entrance_fee;
    address payable[] private s_players;

    constructor(uint256 entranceFee) {
        i_entrance_fee = entranceFee;
    }

    function enterRaffle() public payable {
        if (msg.value < i_entrance_fee) {
            revert Raffle__NotEnoughAmountEntered();
        }
        s_players.push(payable(msg.sender));
    }

    function pickWinner() public {}

    /* ============= GETTER FUNCTIONS ============= */
    function getEntranceFee() external view returns (uint256) {
        return i_entrance_fee;
    }
}