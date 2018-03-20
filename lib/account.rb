require 'date'

class Account
  STANDARD_VALIDITY_YRS = 5
  attr_reader :exp_date, :account_status, :owner

  def initialize(attrs = {})
    @exp_date = set_expiry_date
    @account_status = :active
    set_owner(attrs[:owner])
  end

  def set_expiry_date
    Date.today.next_year(STANDARD_VALIDITY_YRS).strftime('%m/%y')
  end

  def self.deactivate(account)
    account.account_status = :deactivated
  end

  def deactivate
    @account_status = :deactivated
  end

  def missing_owner
    raise "An Account owner is required"
  end

  private
  def set_owner(obj)
    obj == nil ? missing_owner : @owner = obj
  end
end
