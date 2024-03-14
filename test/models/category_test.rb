require "test_helper"

class CategoryTest < ActiveSupport::TestCase

  test "should create category" do

    user = User.create(email: "mail@mail.com")

    category = Category.new(name: "Work", user: user)
    assert category.save, "Failed to save category: #{category.errors.full_messages.to_sentence}"
  end

end
