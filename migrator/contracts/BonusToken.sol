// yhpark. 솔리티디 컴파일러 버전 때문에 수정.
// 최신 버전의  uniswap/v2-periphery 와 openzeppelin 의 솔리디티 컴파일러가 0.8 버전 이상이어서
// migration 의 solidity 컴파일러 버전을 0.6.6 버전 이상으로 변경함.
pragma solidity >=0.6.6;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract BonusToken is ERC20 {
  address public admin;
  address public liquidator;
  constructor() ERC20('Bonus Token', 'BTK') public {
    admin = msg.sender;
  }

  function setLiquidator(address _liquidator) external {
    require(msg.sender == admin, 'only admin');
    liquidator = _liquidator;
  }

  function mint(address to, uint amount) external {
    require(msg.sender == liquidator, 'only liquidator');
    _mint(to, amount); 
  }
}