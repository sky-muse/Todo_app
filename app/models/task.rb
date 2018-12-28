class Task < ApplicationRecord
  belongs_to :user

  enum status: { not_started_yet: 0, processing: 1, done: 2}

end
