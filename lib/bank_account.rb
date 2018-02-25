class BankAccount
  attr_accessor :status, :balance
  attr_reader :name

  def display_balance
    "Your balance is $#{@balance}."
  end

  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
  end

  def deposit(amount)
    @balance += amount
  end

  def valid?
    @balance > 0 && @status == 'open'
  end

  def close_account
    @balance = 0
    @status = 'closed'
  end
end
