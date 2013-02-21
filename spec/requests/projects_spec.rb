require 'spec_helper'

describe 'In spec/requests' do

  before do
    Rails.application.routes.default_url_options[:host] = 'www.jakeonrails.com'
  end

  it 'I should be able to change the URL helper host' do
    projects_url.should == 'http://www.jakeonrails.com/projects'
  end

end
