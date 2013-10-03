require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user should enter a first name" do
	  user = User.new
	  assert !user.save
	  assert !user.errors[:first_name].empty?
  end  	


  test "a user should enter a last name" do
	  user = User.new
	  assert !user.save
	  assert !user.errors[:last_name].empty?
  end  

   test "a user should enter a profile name" do
	  user = User.new
	  assert !user.save
	  assert !user.errors[:profile_name].empty?
  end  

  test "a user should have a unique profile name" do
  	user = User.new
  	user.profile_name = "justinasv"
  	user.email = "justinasvaiciulis@gmail.com"
  	user.first_name = "Justinas"
  	user.last_name = "Vaiciulis"
  	user.password = "asd256zxc1234"
  	user.password_confirmation = "asd256zxc1234"
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a profile name without spaces" do
    user = User.new 
    user.profile_name = "My Profile With Spaces"

    assert !user.save
    assert !user.errors[:profile_name].empty?
    assert user.errors[:profile_name].include?("Must be formated correctly.")
  end
end

