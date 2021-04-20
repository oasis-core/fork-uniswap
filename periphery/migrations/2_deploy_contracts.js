const Router = artifacts.require('UniswapV2Router02.sol');
const WETH = artifacts.require('WETH.sol');

module.exports = async function (deployer, _network, addresses) {
  let weth;
  // yhpark. core에서 배포한 UNISWAPV2FACTORY 어드레스. 트러플 결과창에서 확인 가능
  const FACTORY_ADDRESS = '0x9Ede61FCAA0Bd83C8d7b7Ff3563D5EF6123B56f3';

  if(_network === 'mainnet') {
    weth = await WETH.at('0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2');
  } else {
    await deployer.deploy(WETH);
    weth = await WETH.deployed();
  }

  await deployer.deploy(Router, FACTORY_ADDRESS, weth.address);
};