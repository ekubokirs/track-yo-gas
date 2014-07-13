class Car < ActiveRecord::Base
  belongs_to  :user
  has_many    :tanks

  def name
    make+" "+brand
  end
end
