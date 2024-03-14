require "test_helper"

class TaskTest < ActiveSupport::TestCase

  test "should create task under category" do

    user = User.create(email: "mail@mail.com")

    category = Category.new(name: "Work", user: user)
    assert category.save, "Failed to save category: #{category.errors.full_messages.to_sentence}"

    task = category.tasks.new(title: "my task for work category")
    assert task.save, "Failed to save task: #{task.errors.full_messages.to_sentence}"
  end
end
