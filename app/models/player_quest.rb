class PlayerQuest < ApplicationRecord
  belongs_to :user
  belongs_to :quest
  before_save :update_starting_age

  def update_starting_age
    self.starting_age = self.user.age
  end

  def completion_age
    self.starting_age + self.quest.req_time
  end
end
