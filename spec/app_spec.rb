require_relative 'spec_helper'

describe 'App' do
  it 'should work' do
    get '/'
    last_response.must_be :ok?
  end
end
