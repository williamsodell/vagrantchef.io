class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @boxes = YAML.load(File.open(Rails.root.join('info', 'boxes.yml')))
    @configurations = YAML.load(File.open(Rails.root.join('info', 'configurations.yml')))
    @cookbooks = YAML.load(File.open(Rails.root.join('info', 'cookbooks.yml')))
  end
end
