class PagesController < ApplicationController
  def home
    @posts = Blog.all   # Blog.all is the model. this line grabs all the posts, and stores in "instance variable "posts". Also, anything that happens here, including this model request, is available to the view (as an instance variable)
    @skills = Skill.all
  end

  def about
  end

  def contact
  end
end

# anything in each of these actions will be run when the matching route is hit. ie pages/home will run 'home' code
