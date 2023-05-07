class PagesController < ApplicationController
  def home
    @title = "Home"
  end
  def aide
    @title = "Aide"
  end

  def contact
    @title = "Contact"
  end

end
