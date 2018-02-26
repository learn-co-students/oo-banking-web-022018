require 'pry'

class Transfer


  attr_accessor  :sender, :receiver, :status, :amount, :balance


  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @balance = 1000
  end

  def valid?
    sender.valid?
    receiver.valid?
  end

  def execute_transaction
    if sender.valid? && sender.balance > amount && status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."

    end
  end


  def reverse_transfer
      if receiver.valid? && receiver.balance > amount && status == "complete"
        receiver.balance -= amount
        sender.balance += amount
        self.status = "reversed"
      end

  end

end
