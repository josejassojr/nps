require "test_helper"

class PersonTest < ActiveSupport::TestCase
  include ActionMailer::TestHelper
  # test "the truth" do
  #   assert true
  # end
  test "has score of 1 by default" do
    person = people(:one)
    puts "Passed Test 'has score of 1 by default' ." if assert_equal 1, person.score
  end

  test "send nps email" do
    person = people(:one)
    assert_emails 1 do
      person.send_nps_email
    end

    assert_enqueued_email_with PersonMailer, :nps, args: [person] do
      person.send_nps_email
    end
  end
end
