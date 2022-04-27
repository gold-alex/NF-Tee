// SPDX-License-Identifier: UNLICENSED 


import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
pragma solidity ^0.8.1; 

import "hardhat/console.sol";

contract nfTee is ERC721URIStorage {

    // Keeping track of token IDs - (using OpenZeppelin)
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    // Assigning the name of the token and it's symbol
    constructor() ERC721 ("NF-Tee", "NFTEE") {
        console.log('This is my NFT contract');
    }

    // Function used for user getting NFT
    function makeAnNFT() public {
        // Get current ID of token. (Starts from zero)
        uint256 newItemId = _tokenIds.current();

        // Actually mint the NFT to the sender using msg.sender
        _safeMint(msg.sender, newItemId);

        // Set the data of the NFT
        _setTokenURI(newItemId, "https://jsonkeeper.com/b/8OEA");

        console.log("Successfully minted NF-Tee with ID of %s to %s", newItemId, msg.sender);

        // Increment counter for each NFT minted
        _tokenIds.increment();

    }
}