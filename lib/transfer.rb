require "pry"

class Transfer
  # your code here

  attr_accessor :status, :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance > @amount
  end

  def execute_transaction
    if self.valid? && @status == "pending"
      @sender.balance -= @amount
      @receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete" && @receiver.balance > @amount
      # Transfer.new(@receiver, @sender, @amount)
      @sender.deposit(@amount)
      @receiver.balance -= @amount
      @status = "reversed"
    else
      "Transfer cannot be reversed"
    end
  end
end
