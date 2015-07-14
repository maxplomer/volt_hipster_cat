# By default Volt generates this controller for your Main component
require 'opal-jquery'
module Main
  class MainController < Volt::ModelController
    model :store

    def index
      # Add code for when the index view is loaded
      Document.ready? do
        Element.find('#clickme').on :click do
          alert "The header was clicked!"
        end
      end
    end

    def add_todo
      Volt.current_user.id.then do |result|
        _todos << { name: page._new_todo, user_id: result }
        page._new_todo = ''
      end
    end

    def login_to_demo_account
      Volt.login('hello@world.com', 'helloworld')
    end

    def create_new_account
      redirect_to '/signup'
    end

    def about
      # Add code for when the about view is loaded
    end

    private

    # The main template contains a #template binding that shows another
    # template.  This is the path to that template.  It may change based
    # on the params._component, params._controller, and params._action values.
    def main_path
      "#{params._component || 'main'}/#{params._controller || 'main'}/#{params._action || 'index'}"
    end

    # Determine if the current nav component is the active one by looking
    # at the first part of the url against the href attribute.
    def active_tab?
      url.path.split('/')[1] == attrs.href.split('/')[1]
    end
  end
end
