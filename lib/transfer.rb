require 'pry'

class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status, :transfers


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
   if self.sender.valid? && self.status == "pending" && self.sender.balance >= self.amount
     self.sender.balance -= @amount
     self.receiver.balance += @amount
     self.status = "complete"
   else
     @status = "rejected"
     "Transaction rejected. Please check your account balance."
   end
 end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
