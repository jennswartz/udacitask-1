class TodoList
  attr_accessor :title, :items
  
  #methods and stuff go here
  def initialize(list_title)
    @title = list_title
    @items = Array.new
  end
  
  # Add new item to array
  def add_item(new_item)
    item = Item.new(new_item)
    @items.push(item)
  end
  
  # Delete items from the array using the index value
  def delete_item(index)
    @items.delete_at(index)
  end
  
  # Delete complete items from the list
  def delete_complete
    @items.select! { |item| !item.completed? }
 end

  # Update the status of an item (completed or not completed) using index,  
  # true for completed and false for not completed  
  def update_item_status(index, status)
    @items[index].change_completed_status(status)
  end
  
  def update_priority(index, priority)
    @items[index].change_priority(priority)
  end

  # Rename title of list
  def rename_list_title(new_list_title)
    @title = new_list_title
  end
  
  # Print the header for the To Do List  
  def print_list_header
    puts "-" * 30
    puts @title.upcase
    puts "-" * 30
    puts "TO DOs".ljust(45) + "Completed?".ljust(15)  + "Priority"
  end

  # Print the tasks in the list in a numbered fashion 
  def print_items
    print_list_header
    @items.each.with_index(1) do |task, index|
      puts "#{index} - " + "#{task.print_task}"
    end
    puts ""
  end

  # Print the task list to file  
  def print_file
    path = File.join(File.dirname(__FILE__), '../udacitask/udacitask.rb')
    file = File.read(path)
    new_file = File.new("todolist.txt", "w+")
    new_file.puts "-" * 30
    new_file.puts "#{@title.upcase}"
    new_file.puts"-" * 30
    new_file.puts "TO DOs".ljust(45) + "Completed?".ljust(15)  + "Priority"
    @items.each_with_index do |task, index|
      new_file.write("#{index + 1} - " + "#{task.print_task}\n")
    end
    new_file.close
  end    
end  

class Item
  attr_accessor :completed_status, :priority
  attr_reader :description

  # Initialize item with a description, marked as not complete, and status "Do Now"
  def initialize(item_description)
    @description = item_description
    @completed_status = false
    @priority = false
  end

  # Changes status of list from not complete to complete
  def change_completed_status(status)
    @completed_status = status
  end

  # Will return false if not completed and true if completed  
  def completed?
    @completed_status
  end
 
  # Changes the priority status
  def change_priority(priority)
    @priority = priority
  end
 
  def priority?
    @priority
  end
  
  # Print the task list
  def print_task
    "#{@description.ljust(42)} #{(completed? ? "[X]" : "[ ]").ljust(12)} #{priority? ? "Procrastinate" : "Do Now" }" 
  end 
end  

