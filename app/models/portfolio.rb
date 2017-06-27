class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                                reject_if: lambda { |attrs| attrs['name'].blank? }

  validates_presence_of :title, :body

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader



# two ways of doing the same thing... For practice only ...
  def self.angular
    where(subtitle: 'Angular')
  end

  ##########################################################

  def self.by_position
    order("position ASC")
  end

  # Custome scope...Lambda
  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }
end
