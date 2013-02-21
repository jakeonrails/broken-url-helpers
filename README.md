#Changing default_url_options[:host] does not work with Capybara 2 in spec/features

With the latest versions of rails, rspec-rails and capybara:

```ruby
gem 'rails', '3.2.12'
gem 'rspec-rails', '~> 2.12.2'
gem 'capybara', '~> 2.0.2'

# spec/features/projects_spec.rb

require 'spec_helper'

describe 'In spec/features' do

  before do
    Rails.application.routes.default_url_options[:host] = 'www.jakeonrails.com'
  end

  it 'I should be able to change the URL helper host' do
    projects_url.should == 'http://www.jakeonrails.com/projects'
  end

end

# spec/requests/projects_spec.rb

require 'spec_helper'

describe 'In spec/requests' do

  before do
    Rails.application.routes.default_url_options[:host] = 'www.jakeonrails.com'
  end

  it 'I should be able to change the URL helper host' do
    projects_url.should == 'http://www.jakeonrails.com/projects'
  end

end

```

With the output:


```shell
No DRb server is running. Running in local process instead ...
Rack::File headers parameter replaces cache_control after Rack 1.5.

In spec/features
  I should be able to change the URL helper host (FAILED - 1)

In spec/requests
  I should be able to change the URL helper host

Failures:

  1) In spec/features I should be able to change the URL helper host
     Failure/Error: projects_url.should == 'http://www.jakeonrails.com/projects'
       expected: "http://www.jakeonrails.com/projects"
            got: "http://www.example.com/projects" (using ==)
     # ./spec/features/projects_spec.rb:10:in `block (2 levels) in <top (required)>'

Finished in 0.00906 seconds
2 examples, 1 failure

Failed examples:

rspec ./spec/features/projects_spec.rb:9 # In spec/features I should be able to change the URL helper host

Randomized with seed 19163
```

Why is this?
