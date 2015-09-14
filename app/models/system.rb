class System < ActiveRecord::Base

  after_create :downcase_name

  has_many :requests

  private

  def downcase_name
    name = name.downcase unless name.nil?
    save
  end

end
