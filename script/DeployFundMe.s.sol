// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConFig} from "./Helperconfig.s.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe) {
        HelperConFig helperConFig = new HelperConFig();
        address ethUsdPriceFeed = helperConFig.activeNetworkConfig();

        vm.startBroadcast();
        FundMe fundMe = new FundMe(ethUsdPriceFeed);
        vm.stopBroadcast();
        return fundMe;
    }
}
