require 'pry'


class BankAccount

  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def display_balance
    return "Your balance is $#{@balance}."
  end

 def deposit(number)
   @balance += number
 end

  def valid?
    if @balance <= 0 || @status == "closed"
      return false
    else
      return true
    end
  end

  def close_account
    @status = "closed"
  end 

end
