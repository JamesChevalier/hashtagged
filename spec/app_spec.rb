require_relative 'spec_helper'

describe 'App' do
  it 'should work' do
    get '/'
    expect(last_response).to be_ok
  end
end
