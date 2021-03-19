gem 'haml-rails'

rails_command "generate haml:application_layout convert"
run "rm app/views/layouts/application.html.erb"

environment do <<-CODE
  config.generators do |g|
    g.template_engine :haml
    g.stylesheets false
    g.helper false
  end
CODE
end

generate(:controller, "pages", "home")
route "root to: 'pages#home'"

after_bundle do
  git :init
  git add: "."
  git commit: %Q{ -m 'Initial commit' }
end
