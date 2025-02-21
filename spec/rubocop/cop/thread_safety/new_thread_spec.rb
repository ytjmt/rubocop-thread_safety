# frozen_string_literal: true

RSpec.describe RuboCop::Cop::ThreadSafety::NewThread, :config do
  it 'registers an offense for starting a new thread' do
    expect_offense(<<~RUBY)
      Thread.new { do_work }
      ^^^^^^^^^^ Avoid starting new threads.
    RUBY
  end

  it 'registers an offense for starting a new thread with top-level constant' do
    expect_offense(<<~RUBY)
      ::Thread.new { do_work }
      ^^^^^^^^^^^^ Avoid starting new threads.
    RUBY
  end

  it 'does not register an offense for calling new on other classes' do
    expect_no_offenses('Other.new { do_work }')
  end
end
