class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount

    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid? && status == "pending" && sender.balance >= amount
      #self.sender.balance = self.sender.balance - amount
      #self.receiver.balance = self.receiver.balance + amount
      sender.deposit(-amount)
      receiver.deposit(amount)
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if status == "complete"
      # self.sender.balance = self.sender.balance + amount
      # self.receiver.balance = self.receiver.balance - amount
      receiver.deposit(0 - amount)
      sender.deposit(amount)
      self.status = "reversed"
    end
  end

end
