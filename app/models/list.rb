class List < ApplicationRecord
  has_many :tasks

  # def complete_all_tasks!
  #   tasks.each do |task|
  #     task.update(complete: true)
  #   end
  # end

  # def snooze_all_tasks!
  #   tasks.each do |task|
  #     task.snooze_hour!
  #   end
  # end

  # def total_duration
  #   total = 0
  #   tasks.each do |task|
  #     total += task.duration
  #   end
  #   return total
  # end

  # def incomplete_tasks
  #   array_of_tasks = []
  #   tasks.each do |task|
  #     if !task.complete
  #       array_of_tasks << task
  #     end
  #   end
  #   return array_of_tasks
  # end

  # def favorite_tasks
  #   array_of_tasks = []
  #   tasks.each do |task|
  #     if task.favorite
  #       array_of_tasks << task
  #     end
  #   end
  #   return array_of_tasks
  # end

  def complete_all_tasks!
    tasks.update_all(complete: true)
  end

  def snooze_all_tasks!
    tasks.each { |task| task.snooze_hour! }
  end

  def total_duration

    tasks.sum("duration")  #this one is just a SQL process to a database

    # Rails guides the active record queries page
    # Ruby Docs for array and enumerable and Rails Guides

    # tasks.sum {|task| task.duration }
    #^this (.sum) is an enumerable. Each is under the hood, but it is also summing the return values of task.duration. 


    # An Active Record query is writing Ruby to produce SQL
    # SQL is the only thing that talks to the database
  end

  def incomplete_tasks
    tasks.select {|task| !task.complete }
    #Ruby way of doing it


    tasks.where(complete: false)
    #Active Record way of doing it (directly with SQL)
  end

  def favorite_tasks
    tasks.where(favorite: true)
  end

end
