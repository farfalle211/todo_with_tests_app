require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '#toggle_complete!' do
    it 'should switch complete attribute to false if it began as true' do
      task = Task.create(complete: true)
      task.toggle_complete!
      expect(task.complete).to eq(false)
    end

    it 'should switch complete attribute to true if it began as false' do
      task = Task.create(complete: false)
      task.toggle_complete!
      expect(task.complete).to eq(true)
    end
  end

  describe '#toggle_favorite!' do
    it 'should switch favorite attribute to false if it began as true' do
      task = Task.create(favorite: true)
      task.toggle_favorite!
      expect(task.favorite).to eq(false)
    end
    it 'should switch favorite attribute to true if it began as false' do
      task = Task.create(favorite: false)
      task.toggle_favorite!
      expect(task.favorite).to eq(true)
    end
  end

  describe '#overdue?' do
    it 'should return true if current time is more recent than deadline' do
      task = Task.create(deadline: Time.now + 1.hour)
      expect(task.overdue?).to eq(false)
    end
  end

  describe '#increment_priority!' do
    it 'should increase the priority of the task if the tasks priority is less than ten' do
      task = Task.create(priority: 4)
      task.increment_priority!
      expect(task.priority).to eq(5)
    end

    describe '#decrement_priority!' do
      it 'should decrease the priorty of the task if the task is greater than one' do
        task = Task.create(:priority => 4)
        task.decrement_priority!
        expect(task.priority).to eq(3)
      end
    end
  end

    describe '#snooze_hour!' do
      it 'should increase the deadline by one hour' do
        time = Time.now
        task = Task.create(deadline: time)
        task.snooze_hour!
        expect(task.deadline).to eq(time + 1.hour)
      end
    end
end

