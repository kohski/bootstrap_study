class Blog < ApplicationRecord
  validates :title, presence: true
  validates :content, length:{ minimum:1,maximum:140}
end
