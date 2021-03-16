class CashRegister
    attr_accessor :total, :discount, :price
    
  
    def initialize(discount = 0)
      @total = 0
      @discount = discount
      @cart = []
    end
  
    def add_item(item, price, quantity = 1)
      # Need the price variable to keep track of the cost for the last item added
      @price = price * quantity
      cart2 = {}
      cart2[:name] = item
      cart2[:price] = price
      cart2[:quantity] = quantity
  
      @cart << cart2
  
      @total += price * quantity
  
    end
  
    def apply_discount
      if @discount == 0
        return "There is no discount to apply."
      end
      @total -= @total * @discount / 100
      return "After the discount, the total comes to $#{@total}."
    end 
  
    def items
      item_names = []
      @cart.each do |cart2|
        for each_item in 1..cart2[:quantity] 
          item_names << cart2[:name]
        end 
      end 
      item_names
    end 
  
    def void_last_transaction
      @total -= @price
    end

  end