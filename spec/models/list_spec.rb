require 'rails_helper'

RSpec.describe List, type: :model do

  describe '#complete_all_tasks!' do 
    it 'should mark all tasks from the list as complete' do
      list = List.create(name: "Chores")
      Task.create(complete: false, list_id: list.id, name: "Take out papers")
      Task.create(complete: false, list_id: list.id, name: "Take out Trash")
      Task.create(complete: true, list_id: list.id, name: "Spend some spending cash")

      list.complete_all_tasks!

      expect(list.tasks[0].complete).to eq(true)
      expect(list.tasks[1].complete).to eq(true)
      expect(list.tasks[2].complete).to eq(true)
    end
  end

  describe '#snooze_all_tasks!' do
    it 'should delay the deadline of all tasks by one hour' do
      list = List.create(name: "Vacations")
      time_stamp = Time.now

      Task.create(deadline: time_stamp, list_id: list.id, name: "Toothbrush")
      Task.create(deadline: time_stamp, list_id: list.id, name: "Toothpaste")
      Task.create(deadline: time_stamp, list_id: list.id, name: "Comb")

      list.snooze_all_tasks!

      expect(list.tasks[0].deadline).to eq(time_stamp + 1.hour)
      expect(list.tasks[1].deadline).to eq(time_stamp + 1.hour)
      expect(list.tasks[2].deadline).to eq(time_stamp + 1.hour)
    end
  end

  describe '#total_duration' do
    it 'should calculate the duration of all tasks in a list' do
      list = List.create(name: "Homework")

      Task.create(duration: 40, list_id: list.id, name: "Ruby")
      Task.create(duration: 30, list_id: list.id, name: "Javascript")
      Task.create(duration: 20, list_id: list.id, name: "Relaxation")

      expect(list.total_duration).to eq(90)
    end
  end

  describe '#incomplete_tasks' do
    it 'should return all the tasks in a list that are incomplete' do
      list = List.create(name: "Incomplete")

      task_1 = Task.create(complete: false, list_id: list.id, name: "Dishes")
      task_2 = Task.create(complete: false, list_id: list.id, name: "Laundry")
      task_3 = Task.create(complete: true, list_id: list.id, name: "Make Bed")
      task_4 = Task.create(complete: true, list_id: list.id, name: "Clean Bathroom")

      # expect(list.incomplete_tasks).to eq([list.tasks[0], list.tasks[1]])


      # list.incomplete_tasks.each do |task|
      #   expect(task.complete).to eq(false)
      # end


      # expect(list.incomplete_tasks.length).to eq(2)


    end
  end


  describe '#favorite_tasks' do
    it 'should return all the tasks in a list with the favorite set to true' do
      list = List.create(name: "Duties")

      task_1 = Task.create(favorite: true, list_id: list.id, name: "Call Mom")
      task_2 = Task.create(favorite: true, list_id: list.id, name: "Call Dad")
      task_3 = Task.create(favorite: false, list_id: list.id, name: "Chew Gum")

      expect(list.favorite_tasks).to match_array([task_1, task_2])
    end
  end
end



# Return method or the value of the task itself?

# All the ones with a bang affect an attribute. 

# Blocks for something caused by the method. 