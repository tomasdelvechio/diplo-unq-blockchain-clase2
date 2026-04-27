// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";

/// @title DeploySimpleStorage
/// @notice Script to deploy SimpleStorage
/// @dev Run with: forge script script/Deploy.s.sol --rpc-url $RPC_URL --broadcast --account dev-wallet
contract DeploySimpleStorage is Script {
    function run() external returns (SimpleStorage) {
        // Everything between startBroadcast and stopBroadcast
        // is executed as real transactions on the blockchain
        vm.startBroadcast();

        SimpleStorage simpleStorage = new SimpleStorage();

        vm.stopBroadcast();

        console.log("SimpleStorage deployed at:", address(simpleStorage));

        return simpleStorage;
    }
}
