require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'shoud create a user successfully if all details are entered' do
      @user = User.new(
        name: 'Mo Salah',
        email: 'mosalah@lfc.com',
        password: 'lfc1',
        password_confirmation: 'lfc1')
      
      expect(@user).to be_valid
      puts @user.errors.full_messages
    end

    it 'should not pass if password and password_confirmation do not match' do
      @user = User.new(
        name: 'Mo Salah',
        email: 'mosalah@lfc.com',
        password: 'lfc1',
        password_confirmation: 'lfc11')
      
      expect(@user).not_to be_valid
      puts @user.errors.full_messages
    end

    it 'should not pass if password and password confirmation are nil' do
      @user = User.new(
        name: 'Mo Salah',
        email: 'mosalah@lfc.com',
        password: nil,
        password_confirmation: nil)
        
      expect(@user).not_to be_valid
      puts @user.errors.full_messages
    end
    
    it 'should not pass if password is less than 4 characters' do
      @user = User.new(
        name: 'Mo Salah',
        email: 'mosalah@lfc.com',
        password: 'lfc',
        password_confirmation: 'lfc')
        
      expect(@user).not_to be_valid
      puts @user.errors.full_messages
    end
  
    it 'should not pass if name is not entered' do
      @user = User.new(
        name: nil,
        email: 'mosalah@lfc.com',
        password: 'lfc1',
        password_confirmation: 'lfc1')
          
      expect(@user).not_to be_valid
      puts @user.errors.full_messages
    end

    it 'should not pass if email is not entered' do
      @user = User.new(
        name: 'Mo Salah',
        email: nil,
        password: 'lfc1',
        password_confirmation: 'lfc1')
        
      expect(@user).not_to be_valid
      puts @user.errors.full_messages
    end
        
    it 'should not pass if email already exists' do
      @user = User.new(
        name: 'Mo Salah',
        email: 'mosalah@lfc.com',
        password: 'lfc1',
        password_confirmation: 'lfc1')
          
      @user.save!

      @user2 = User.new(
        name: 'Roberto Firminio',
        email: 'mosalah@lfc.com',
        password: 'lfc1',
        password_confirmation: 'lfc1')
            
      expect(@user2).not_to be_valid
      puts @user2.errors.full_messages
    end

    describe '.authenticate_with_credentials' do

      it 'should return nil when logging in with a invalid  password' do
        user = User.authenticate_with_credentials(
          'hbhandal80@hotmail.com',
          '1234')
        
        expect(user).to be_nil
      end

      it 'should return nil when logging if user does not exist' do
        user = User.authenticate_with_credentials(
          'hbhandal@hotmail.com',
          '1234')
          
        expect(user).to be_nil
      end
    end
  end
end