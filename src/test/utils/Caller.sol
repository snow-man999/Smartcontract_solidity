// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.20;

contract Caller {
    error CallFailed(address target, bytes data);

    /**
     * @notice Calls an external contract with arbitrary calldata
     * @param target Address of the contract to call
     * @param data Calldata to send
     * @return returnData Raw returned data from the call
     */
    function externalCall(
        address target,
        bytes calldata data
    ) external payable returns (bytes memory returnData) {
        require(target != address(0), "Invalid target");

        (bool success, bytes memory result) = target.call{value: msg.value}(data);

        if (!success) {
            revert CallFailed(target, result);
        }

        return result;
    }
}
