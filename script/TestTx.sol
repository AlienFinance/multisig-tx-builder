// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import { BatchScript } from "forge-safe/BatchScript.sol";
import { IERC20 } from "forge-std/interfaces/IERC20.sol";

contract ExampleScript is BatchScript {

    address multisig = 0x7a66F664FA2B8453C4df1F0243821cd1D4625d03;

    function run() external isBatch(multisig) {
        addToBatch(multisig, new bytes(0));
        addToBatch(multisig, new bytes(0));

        vm.startBroadcast();

        executeBatch(true, 4);

        vm.stopBroadcast();
    }
}
