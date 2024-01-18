# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'the LICENSE' do # rubocop:disable RSpec/DescribeClass
  let(:license) { Pathname('LICENSE.txt') }

  it 'exists' do
    expect(license).to exist
  end
end
