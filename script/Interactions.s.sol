// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

// Fund
// Withdraw

import {Script, console} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundFundMe is Script {
    uint256 constant SEND_VALUE = 0.01 ether;

    function fundFundMe(address mostRecentDeploy) public {
        vm.startBroadcast();
        FundMe(payable(mostRecentDeploy)).fund{value: SEND_VALUE}();
        vm.stopBroadcast();

        console.log("Funded FundMe with %s", SEND_VALUE);
    }

    function run() external {
        address mostRecentDeploy = DevOpsTools.get_most_recent_deployment(
            "FundMe",
            block.chainid
        );
        fundFundMe(mostRecentDeploy);
    }
}

contract WithdrawFundMe is Script {
    uint256 constant SEND_VALUE = 0.01 ether;

    function withdrawFundMe(address mostRecentDeploy) public {
        vm.startBroadcast();
        FundMe(payable(mostRecentDeploy)).withdraw();
        vm.stopBroadcast();
        console.log("Withdraw FundMe balance!");
    }

    function run() external {
        address mostRecentDeploy = DevOpsTools.get_most_recent_deployment(
            "FundMe",
            block.chainid
        );
        withdrawFundMe(mostRecentDeploy);
    }
}
