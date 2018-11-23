pragma solidity ^0.4.24;

contract Land_Record{
    
    struct Land{
        address ownerAddress;
        uint price;
    }
    
    event ownerChange(string message, address ownerAddress);
    
    event priceChange(string message, uint price);
    
    Land[4] public lands;
    
    constructor(){
        lands[0].ownerAddress= tx.origin;
        lands[0].price= 1;
        lands[1].ownerAddress= tx.origin;
        lands[1].price= 2;
        lands[2].ownerAddress= tx.origin;
        lands[2].price= 3;
        lands[3].ownerAddress= tx.origin;
        lands[3].price= 4;
    }
    
    function changeLandOwner(uint index, address changedOwner) public returns(address){
        require(msg.sender == lands[index].ownerAddress);
        require(lands[index].ownerAddress != changedOwner);
        lands[index].ownerAddress= changedOwner;
        emit ownerChange("Owner is changed!!", changedOwner);
        return changedOwner;
        
    }
    
    function changeLandPrice(uint index, uint changedPrice) public returns(uint){
        require(msg.sender == lands[index].ownerAddress, "Unauthenticated Person!!");
        require (changedPrice > 0, "Price should be greater than 0!!");
        lands[index].price = changedPrice;
        emit priceChange("Price is changed!!", changedPrice);
        return changedPrice;
    }
    
}
