#'index' and 'about' correspond to View names, a Rails convention known as "default rendering." Controllers for Views must be named for the View.

class WelcomeController < ApplicationController
  def index
  end

  def about
  end
end
