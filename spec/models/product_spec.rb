require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should create a new product' do
      @category = Category.new(name: "Electronics")
      @category.save
      @product = Product.new(
        name: 'iPhone', 
        price: 2000, 
        quantity: 1, 
        category: @category)
      expect(@product).to be_valid
      puts @product.errors.full_messages
    end

    it 'should fail if product name is missing' do
      @category = Category.new(name: "Electronics")
      @category.save
      @product = Product.new(
        price: 1000, 
        quantity: 10, 
        category: @category)
      expect(@product).not_to be_valid
      puts @product.errors.full_messages
    end

    it 'should fail if product price is missing' do
      @category = Category.new(name: "Electronics")
      @category.save
      @product = Product.new(
        name: 'iPhone', 
        quantity: 15, 
        category: @category)
      expect(@product).not_to be_valid
      puts @product.errors.full_messages
    end 

    it 'should fail if product quantity is missing' do
      @category = Category.new(name: "Electronics")
      @category.save
      @product = Product.new(
        name: 'iPhone', 
        price: 1500, 
        category: @category)
      expect(@product).not_to be_valid
      puts @product.errors.full_messages
    end 

    it 'should fail if product category is missing' do
      @category = Category.new(name: "Electronics")
      @category.save
      @product = Product.new(
        name: 'iPhone', 
        price: 2000, 
        quantity: 1)
      expect(@product).not_to be_valid
      puts @product.errors.full_messages
    end 
  end
end