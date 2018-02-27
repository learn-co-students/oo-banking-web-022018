require "pry"

class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    self.sender.valid? && self.receiver.valid? ? true : false
  end

  def execute_transaction
    if @sender.balance >= amount && self.status == 'pending'
      @sender.balance -= amount
      @receiver.balance += amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    execute_transaction
    @sender.balance += amount
    @receiver.balance -= amount
    self.status = "reversed"
  end

  # binding.pry

end
