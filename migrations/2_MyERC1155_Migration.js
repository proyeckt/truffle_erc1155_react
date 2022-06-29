const MyERC1155 = artifacts.require("My1155");

module.exports = function (deployer) {
  deployer.deploy(MyERC1155); //If arguments needs to be passed to deploy method, can be done using ,
  //after MyERC1155, e.g deployer.deploy(MyERC1155,ownerAddress), depends on the constructor;
};
