require "pry"
class CashRegister
    attr_accessor :total, :discount 
    def initialize(total = 0, discount = 0)
        @total = total
        @discount = discount
        @items = []
    end
    def add_item(title, price, quantity = 0)
        if quantity > 0
            @last_total = @total 
            @price = price 
            @total += price * quantity
            @items << ("#{title}," * quantity).split(",") 
        else
            @total += price
            @items << title 
        end
        self.total 
    end
    def apply_discount
        if @discount != 0
            @total = (@total - (@total * (@discount.to_f/100))).to_i 
            "After the discount, the total comes to $#{self.total}." 
        else
            "There is no discount to apply." 
        end 
    end
    def items
        @items.flatten!  
    end
    def void_last_transaction
        @total - @price  
        @total = @last_total 
    end
end
