require 'pry'

class Transfer
  attr_reader :sender, :receiver, :amount, :status, :transfer_amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @transfer_amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
    if @sender.valid? && @sender.balance > @amount
      @status = "complete"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @amount = 0
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @status = "reversed"
      @sender.balance += @transfer_amount
      @receiver.balance -= @transfer_amount
    end
  end

end


class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name, balance=1000, status="open")
    @name = name
    @balance = balance
    @status = status
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    if @status != "open"
      return false
    else
      @balance > 0 ? true : false
    end
  end

  def close_account
    @status = "closed"
  end

end
