// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title SimpleStorage
/// @notice First contract of the course - stores and retrieves a number
/// @dev Minimal example to understand state variables and functions
contract SimpleStorage {
    // ==========================================================================
    // STATE VARIABLES
    // ==========================================================================

    /// @notice The number stored in the contract
    /// @dev `public` automatically generates a getter favoriteNumber()
    uint256 public favoriteNumber;

    // ==========================================================================
    // EVENTS
    // ==========================================================================

    /// @notice Emitted when someone stores a new number
    /// @param oldNumber The previous value
    /// @param newNumber The new stored value
    /// @param updatedBy The address that made the change
    event NumberUpdated(uint256 oldNumber, uint256 newNumber, address indexed updatedBy);

    // ==========================================================================
    // FUNCTIONS
    // ==========================================================================

    /// @notice Stores a new number in the contract
    /// @param _number The number to store
    function store(uint256 _number) public {
        uint256 oldNumber = favoriteNumber;
        favoriteNumber = _number;
        emit NumberUpdated(oldNumber, _number, msg.sender);
    }

    /// @notice Reads the stored number (alternative to automatic getter)
    /// @return The currently stored number
    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }

    /// @notice Increments the stored number by 1
    function increment() public {
        uint256 oldNumber = favoriteNumber;
        favoriteNumber += 1;
        emit NumberUpdated(oldNumber, favoriteNumber, msg.sender);
    }
}
