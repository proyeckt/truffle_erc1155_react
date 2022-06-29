// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Burnable.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Supply.sol";

import "@openzeppelin/contracts/utils/Strings.sol";

contract My1155 is ERC1155, Ownable, ERC1155Burnable, ERC1155Supply {

    uint256 public constant GOLD = 1;
    uint256 public constant SILVER = 2;
    uint256 public constant THORS_HAMMER = 3;
    uint256 public constant SWORD = 4;
    uint256 public constant SHIELD = 5;

    constructor()
        ERC1155("https://gateway.pinata.cloud/ipfs/QmVJaBrvYC8N5tfPb6UbgSWxMbRcknFmiP1W75QCQETPxL/{tokenID}.json")
    {
        _mint(msg.sender, GOLD, 10**18, "");
        _mint(msg.sender, SILVER, 10**27, "");
        _mint(msg.sender, THORS_HAMMER, 1, "");
        _mint(msg.sender, SWORD, 10**9, "");
        _mint(msg.sender, SHIELD, 10**9, "");
    }

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function uri(uint256 _tokenId ) override public pure returns(string memory) {

        return string( abi.encodePacked( 
            'https://gateway.pinata.cloud/ipfs/QmVJaBrvYC8N5tfPb6UbgSWxMbRcknFmiP1W75QCQETPxL/',
            Strings.toString(_tokenId), '.json')); 
   
       }

    function mint(address account, uint256 id, uint256 amount, bytes memory data)
        public
        onlyOwner
    {
        _mint(account, id, amount, data);
    }

    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        public
        onlyOwner
    {
        _mintBatch(to, ids, amounts, data);
    }

    // The following functions are overrides required by Solidity.
    function _beforeTokenTransfer(address operator, address from, address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        internal
        override(ERC1155, ERC1155Supply)
    {
        super._beforeTokenTransfer(operator, from, to, ids, amounts, data);
    }
}
