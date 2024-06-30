// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe) {
        // Before startBroadcast -> not a "real" tx
        HelperConfig helperConfig = new HelperConfig();
        address priceFeedAddress = helperConfig.activeConfig();

        // After startBroadcast -> Real tx !
        vm.startBroadcast();
        FundMe fundMe = new FundMe(priceFeedAddress);
        vm.stopBroadcast();

        return fundMe;
    }
}
