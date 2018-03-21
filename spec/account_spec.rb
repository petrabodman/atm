require './lib/account.rb'
require 'date'

describe Account do

  let(:person) {instance_double('Person', name: 'Petra')}
  subject { described_class.new({owner: person})}

  it 'is expected to have an owner' do
    expect(subject.owner).to eq person
  end

  it 'is expected to raise error if no owner is set' do
    expect { described_class.new}.to raise_error 'An Account owner is required'
  end

  it 'has expiry date set on initialize' do
    expected_output = Date.today.next_year(5).strftime('%m/%y')
    expect(subject.exp_date).to eq expected_output
  end

  it 'is expected to have :active status on initialize' do
    expect(subject.status).to eq :active
  end

  it 'deacivates account using Insance method' do
    subject.deactivate
    expect(subject.status).to eq :deactivated
  end
end
