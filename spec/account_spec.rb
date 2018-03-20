require './lib/account.rb'
require 'date'
describe Account do
  it 'has expiry date set on initialize' do
    expected_output = Date.today.next_year(5).strftime('%m/%y')
    expect(subject.exp_date).to eq expected_output
  end

  it 'is expected to have :active status on initialize' do
    expect(subject.account_status).to eq :active
  end

  it 'deacivates account using Insance method' do
    subject.deactivate
    expect(subject.account_status).to eq :deactivated
  end
end
