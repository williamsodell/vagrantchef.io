require 'zip'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @boxes = YAML.load(File.open(Rails.root.join('info', 'boxes.yml')))
    @configurations = YAML.load(File.open(Rails.root.join('info', 'configurations.yml')))
    @cookbooks = YAML.load(File.open(Rails.root.join('info', 'cookbooks.yml')))
  end

  def download
  	@cookbooks = []
  	
	stringio = Zip::OutputStream::write_buffer do |zio|
		zio.put_next_entry("vagrant.yml")
		zio.write ERB.new(File.read("#{Rails.root}/generators/vagrant.yml.erb")).result
		zio.put_next_entry("Cheffile")
		zio.write ERB.new(File.read("#{Rails.root}/generators/Cheffile.erb")).result
		zio.put_next_entry("Vagrantfile")
		zio.write File.read("#{Rails.root}/generators/Vagrantfile")
	end

	send_file stringio.string.force_encoding('binary'), :type => 'application/zip',
		:disposition => 'attachment',
		:filename => "VagrantChef.zip"
	t.close
  end
end
