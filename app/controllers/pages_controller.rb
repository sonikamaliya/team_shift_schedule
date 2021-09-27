class PagesController < ApplicationController
  def home
  end

  def shift
    @teams = Team.all
    @shift = Shift.new
  end

  def tm_members
    
  end
end
