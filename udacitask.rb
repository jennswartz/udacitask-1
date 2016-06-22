require_relative 'todolist.rb'

# Creates a new todo list
mylist = TodoList.new("Jenn's Sports-Fandom To Do List")

# Add four new items
mylist.add_item("Watch Reds game")
mylist.add_item("Watch Reds lose again")
mylist.add_item("Complain that Reds lost again")
mylist.add_item("Count days until Buckeyes start season")

# Print the list
mylist.print_items

# Delete the first item
mylist.delete_item(0)

# Print the list
mylist.print_items

# Delete the second item
mylist.delete_item(1)

# Print the list
mylist.print_items

# Update the completion status of the first item to complete
mylist.update_item_status(0, true)


# Print the list
mylist.print_items

# Update the title of the list
mylist.rename_list_title("Reds & Buckeye Fan To Do List")

# Print the list
mylist.print_items