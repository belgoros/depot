require "test_helper"

class CartTest < ActiveSupport::TestCase
  def setup
    @cart  = Cart.create
    @book_one = products(:pragprog)
    @book_two  = products(:two)
  end

  test "add unique products" do
    @cart.add_product(@book_one).save!
    @cart.add_product(@book_two).save!
    assert_equal 2, @cart.line_items.size
    assert_equal @book_one.price + @book_two.price, @cart.total_price
  end

  test "add duplicate product" do
    @cart.add_product(@book_one).save!
    @cart.add_product(@book_one).save!
    assert_equal 2*@book_one.price, @cart.total_price
    assert_equal 1, @cart.line_items.size
    assert_equal 2, @cart.line_items[0].quantity
  end
end
