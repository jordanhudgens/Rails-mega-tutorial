class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

# two ways of doing the same thing... For practice only ...
  def self.angular
    where(subtitle: 'Angular')
  end
  # Custome scope...Lambda
  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }
  ##########################################################

  after_initialize :set_defaults   # initialize happens when the new action is called in the portfolio ctlr...when a NEW portfolio object is created based on this Portfolio class

  def set_defaults
    self.main_image ||= "http://placehold.it/600x400"
    self.thumb_image ||= "http://placehold.it/350x200"
  end
end
