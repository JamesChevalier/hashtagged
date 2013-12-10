require_relative 'spec_helper'

describe 'App' do
  it 'should work' do
    get '/'
    last_response.should be_ok
  end
end
