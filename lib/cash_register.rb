require "pry"
class CashRegister
    attr_accessor :total, :discount 
    def initialize(total = 0, discount = 20)
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
        @total -= (@total * @discount.to_f / 100).to_i
        if @total == 0
            "There is no discount to apply." 
        else       
            "After the discount, the total comes to $#{@total}."   
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
