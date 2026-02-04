// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "./utils/Caller.sol";
import {OnlyAuthorized} from "../src/OnlyAuthorized.sol";

contract OnlyAuthorizedTest is Test {
    OnlyAuthorized private oa;

    function setUp() public {
        oa = new OnlyAuthorized();
    }

    function testOwnerCanChangeOwner() public {
        address newOwner = address(0x1);

        oa.changeOwner(newOwner);

        assertEq(oa.owner(), newOwner);
    }

    function testNonOwnerCannotChangeOwner() public {
        Caller user = new Caller();

        (bool ok, ) = user.externalCall(
            address(oa),
            abi.encodeWithSelector(
                OnlyAuthorized.changeOwner.selector,
                address(0xdeadbeef)
            )
        );

        assertFalse(ok);
    }

    function testRevertOnZeroAddress() public {
        vm.expectRevert(OnlyAuthorized.ZeroAddress.selector);
        oa.changeOwner(address(0));
    }
}
