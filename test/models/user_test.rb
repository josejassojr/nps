require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "can update first name" do
    users(:regular).update(first_name: "Jose")
    assert_equal "Jose", users(:regular).first_name
  end

  test "has first name" do
    assert_equal "Regular", users(:regular).first_name
  end
  #
  # test "created timestamp should be set to the current time" do
  #   assert_equal Time.current, User.create.created_at
  # end
end
