class CashRegister
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    attr_accessor :total, :discount, :items, :last_price, :last_quantity

    def add_item(item_name, price, quantity = 1)
        self.total += price * quantity
        self.last_quantity = quantity
        while quantity > 0
            self.items << item_name
            quantity -= 1
        end
        self.last_price = price
    end

    def apply_discount
        self.total = (self.total * ((100.0 - discount) / 100.0)).to_i
        return "After the discount, the total comes to $#{self.total}." if self.discount != 0
        return "There is no discount to apply." if self.discount == 0
    end

    def void_last_transaction
        self.total -= self.last_price * self.last_quantity
        while self.last_quantity > 0
            self.items.pop
            self.last_quantity -= 1
        end
    end
end
