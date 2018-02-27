require 'pry'
class Transfer
attr_accessor :status
attr_reader :sender, :receiver, :amount
  @@all = []
  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
   sender.valid? == true && receiver.valid? == true ? true : false
  end


  def execute_transaction
    if self.valid? == true && self.status == "pending" && sender.balance >= self.amount
      sender.deposit(-amount)
      receiver.deposit(amount)
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    if self.status == "complete"
      sender.deposit(amount)
      receiver.deposit(-amount)
      self.status = "reversed"
    end

  end


end
