window.addEventListener('load', () => {
  
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    
    // カンマ区切りはhttps://qiita.com/zawascript/items/922b5db574ef2b126069を参照
    // 販売手数料
    const addTaxDom = document.getElementById("add-tax-price");
    const add_tax_price = Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = add_tax_price.toLocaleString();
    // 販売利益
    const addProfit = document.getElementById("profit");
    const add_profit = (inputValue - add_tax_price);
    addProfit.innerHTML = add_profit.toLocaleString();
  })
 
  

  
});