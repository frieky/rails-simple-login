require 'test_helper'
require 'minitest/autorun'
require 'rest-client'
require 'json'

class LoginControllerTest < ActionController::TestCase
  def setup
  end

  def test_single_role
    response = RestClient.post("http://localhost:3000/user/login",
                               {
                                   "Content-Type" => "application/json",
                                   "name" => "locationMgr",
                                   "password" => "password"
                               }
    )
    @data = JSON.parse response.body

    puts "Data: #{@data}"

    roles = @data['roles']
    assert_equal roles.size, 1
    assert_equal roles[0], 'Location Manager'
  end

  def test_multiple_roles
    response = RestClient.post("http://localhost:3000/user/login",
                               {
                                   "Content-Type" => "application/json",
                                   "name" => "programMgr",
                                   "password" => "password"
                               }
    )
    @data = JSON.parse response.body

    puts "Data: #{@data}"

    roles = @data['roles']

    puts "Roles: #{roles}"

    assert_equal roles.size, 2
    assert_equal roles[0], 'Program Manager'
    assert_equal roles[1], 'Administrator'
  end
end

