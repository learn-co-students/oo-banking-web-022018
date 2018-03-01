require 'pry'
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender,receiver,amount)
    @sender=sender
    @receiver=receiver
    @amount=amount
    @status='pending'
  end
  def valid?
    sender.valid? && receiver.valid?
  end
  def execute_transaction
    if @status=='pending'
      if @sender.valid? && @sender.balance - @amount > 0
        @sender.deposit(-@amount)
        @receiver.deposit(@amount)
        @status='complete'
      else
        @status='rejected'
        return "Transaction rejected. Please check your account balance."
      end
    end
  end
  def reverse_transfer
    if @status=='complete'
      if @receiver.valid? && @receiver.balance - @amount > 0
        @receiver.deposit(-@amount)
        @sender.deposit(@amount)
        @status='reversed'
      else
        @status='rejected'
        return "Transaction rejected. Please check your account balance."
      end
    end
  end
end
