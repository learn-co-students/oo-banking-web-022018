class Transfer
attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  def valid?
    if sender.valid? == true && receiver.valid? == true
      true
    else
      false
    end
  end
  def execute_transaction
    if valid? && self.status == "pending" && self.amount < sender.balance
        sender.balance -= self.amount
        receiver.balance += self.amount
        self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    if valid? && self.status == "complete" && self.amount < receiver.balance
        sender.balance += self.amount
        receiver.balance -= self.amount
        self.status = "reversed"
    end 
  end
end
