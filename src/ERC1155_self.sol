// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

import "openzeppelin-contracts/contracts/token/ERC1155/IERC1155.sol";
import "openzeppelin-contracts/contracts/token/ERC1155/IERC1155Receiver.sol";
import "openzeppelin-contracts/contracts/token/ERC1155/extensions/IERC1155MetadataURI.sol";
import "openzeppelin-contracts/contracts/utils/Address.sol";
import "openzeppelin-contracts/contracts/utils/Strings.sol";
import "openzeppelin-contracts/contracts/utils/introspection/IERC165.sol";

contract ERC1155 is IERC1155，IERC165, IERC1155MetadataURI {
    using Address for address;
    using Strings for uint256;

    string public name;
    string public symbol;
    // 代币种类id => 账号account => 余额balances
    mapping (uint256 => mapping (address => uint256)) private _balances;
    // 账号account => 授权人地址address => 是否授权
    mapping (address => mapping (address => bool)) private _operatorApprovals;
    constructor(string memory name_, string memory symbol_) {
        name = name_;
        symbol = symbol_;
    }
}