###
#
#  Provides GET and POST login API endpoints
#
###
class LoginController < ApplicationController
  #Necessary to allow unauthenticated REST calls
  skip_before_filter  :verify_authenticity_token

  # POST /user/login
  # POST /user/login.json
  def login
    begin
      @user = User.find_by! name: params['name'], password: params['password']
    rescue Exception => e
      puts e.message
      puts e.backtrace.inspect
      #User was not found
      message = 'No such user was found.'
      render :json => {id: '', roles: '', message: message}, :status => :unauthorized
    end

    if (@user != nil)

    begin
      roleNames = @user.user_roles.collect { |uRole| uRole.role.role_name }
      roleNames.each { |i|
        puts "#{i}"
      }
      render :json => {id: @user.id, roles: roleNames}, :status => :ok
    rescue Exception => e
      puts e.message
      puts e.backtrace.inspect
      #User has no roles
      roleName = ['none']
      render :json => {id: @user.id, roles: roleName}
      message = 'No roles found for user'
      render :json => {id: @user.id, roles: roleName, message: message}
    end

    end

  end

  # GET /user/login/1
  # GET /user/login/1.json
  def getLogin
    begin
      @user = User.find_by! name: params['name']
      raise Exception.new unless @user

    rescue Exception => e
      puts e.message
      puts e.backtrace.inspect
      #User was not found
      message = 'No such user was found.'
      puts message
      render :json => {id: '', roles: [], message: message}, :status => :unauthorized
    end

    if (@user != nil)
    begin
      rolenames = @user.user_roles.collect { |uRole| uRole.role.role_name }
      rolenames.each { |i|
        puts "#{i}"
      }
      render :json => {id: @user.id, roles: roleNames}
    rescue Exception => e
      puts e.message
      puts e.backtrace.inspect
      #User has no roles
      rolename = ['none']
      message = 'No roles found for user'
      render :json => {id: @user.id, roles: rolename, message: message}
    end

    else
      message = 'No such user was found.'
      puts message
    end
  end

=begin
  def options
    set_headers
    # this will send an empty request to the clien with 200 status code (OK, can proceed)
    render :text => '', :content_type => 'text/plain'
  end

  private
  # Set CORS
  def set_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Expose-Headers'] = 'Etag'
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, PATCH, OPTIONS, HEAD'
    headers['Access-Control-Allow-Headers'] = '*, x-requested-with, Content-Type, If-Modified-Since, If-None-Match'
    headers['Access-Control-Max-Age'] = '86400'
  end
=end

end
