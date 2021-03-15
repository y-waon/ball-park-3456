class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '球技全般' },
    { id: 3, name: '野球' },
    { id: 4, name: 'サッカー' },
    { id: 5, name: 'バスケットボール' },
    { id: 6, name: 'その他' },
    { id: 7, name: '球技禁止' },
  ]
  include ActiveHash::Associations
  has_many :tweets
end