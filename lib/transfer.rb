require 'pry'

class Transfer

  attr_reader :sender, :receiver
  attr_accessor :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if
      valid? && @status == "pending" && sender.balance > @amount

      #if valid, sender sends money
      #sender loses money (amount)
      #receiver gets money (amount increases)
      #status = complete
      @receiver.deposit(@amount)
      @sender.deposit(-@amount)
      @status = "complete"

    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end


  def reverse_transfer
    if @status == "complete"
      @receiver.deposit(-@amount)
      @sender.deposit(@amount)
      @status = "reversed"
    end

  end

end
