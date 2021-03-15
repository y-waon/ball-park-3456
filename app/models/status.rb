class Status < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '広い' },
    { id: 3, name: '普通' },
    { id: 4, name: '狭い' }
  ]
  include ActiveHash::Associations
  has_many :tweets
end