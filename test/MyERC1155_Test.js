const { assert } = require("console");

const MyERC1155 = artifacts.require('My1155');

contract('My1155', ()=> {

    let deployer = '0x0c22e735DEA5Bc8fbe92b58b3912963323D330f9'; //Address of the contract deployer
    //First in the ganache address list
    let myERC1155 = null;

    const GOLD = 1;
    const SILVER = 2;
    const THORS_HAMMER = 3;
    const SWORD = 4;
    const SHIELD = 5;

    before( async ()=> {
        myERC1155 = await MyERC1155.deployed(); 
    } );

    it('Should minted Sword', async ()=> {
        const checkSword = await myERC1155.balanceOf( deployer, SWORD);
        console.log('Sword bal >', checkSword.toString());
        assert( checkSword.toString() === '1000000000' );
    }); 
    
    it('Should minted Thors_Hammer', async ()=> {
        const checkHammer = await myERC1155.balanceOf( deployer, THORS_HAMMER);
        console.log('Thors Hammer bal >', checkHammer.toString());
        assert( checkHammer.toString() === '1' );
    }) 

    it('Should get URI', async ()=> {
        const uriHammer = await myERC1155.uri(THORS_HAMMER);
        console.log('Thors Hammer uri>', uriHammer );
        assert( uriHammer !== null );
    }) 

});

/*
Testing on cmd truffle
truffle init
truffle compile
truffle migrate --network develop
truffle test --network develop
*/