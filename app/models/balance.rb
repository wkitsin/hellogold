class Balance < ApplicationRecord
 
  def self.iteration_method(var)
    amount_array = []
    var.each do |i|
      amount_array << i.amount
    end
    return amount_array.sum
  end
end
