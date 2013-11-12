require ::File.expand_path('../config/environment', __FILE__)

# Include all of ActiveSupport's core class extensions, e.g., String#camelize
require 'active_support/core_ext'

namespace :generate do
  desc "Create an empty model in app/models, e.g., rake generate:model NAME=User"
  task :model do
    unless ENV.has_key?('NAME')
      raise "Must specificy model name, e.g., rake generate:model NAME=User"
    end

    model_name     = ENV['NAME'].camelize
    model_filename = ENV['NAME'].underscore + '.rb'
    model_path = APP_ROOT.join('app', 'models', model_filename)

    if File.exist?(model_path)
      raise "ERROR: Model file '#{model_path}' already exists"
    end

    puts "Creating #{model_path}"
    File.open(model_path, 'w+') do |f|
      f.write(<<-EOF.strip_heredoc)
        class #{model_name} < ActiveRecord::Base
          # Remember to create a migration!
        end
      EOF
    end
  end

  desc "Create an empty migration in db/migrate, e.g., rake generate:migration NAME=create_tasks"
  task :migration do
    unless ENV.has_key?('NAME')
      raise "Must specificy migration name, e.g., rake generate:migration NAME=create_tasks"
    end

    name     = ENV['NAME'].camelize
    filename = "%s_%s.rb" % [Time.now.strftime('%Y%m%d%H%M%S'), ENV['NAME'].underscore]
    path     = APP_ROOT.join('db', 'migrate', filename)

    if File.exist?(path)
      raise "ERROR: File '#{path}' already exists"
    end

    puts "Creating #{path}"
    File.open(path, 'w+') do |f|
      f.write(<<-EOF.strip_heredoc)
        class #{name} < ActiveRecord::Migration
          def change
          end
        end
      EOF
    end
  end

  desc "Create an empty model spec in spec, e.g., rake generate:spec NAME=user"
  task :spec do
    unless ENV.has_key?('NAME')
      raise "Must specificy migration name, e.g., rake generate:spec NAME=user"
    end

    name     = ENV['NAME'].camelize
    filename = "%s_spec.rb" % ENV['NAME'].underscore
    path     = APP_ROOT.join('spec', filename)

    if File.exist?(path)
      raise "ERROR: File '#{path}' already exists"
    end

    puts "Creating #{path}"
    File.open(path, 'w+') do |f|
      f.write(<<-EOF.strip_heredoc)
        require 'spec_helper'

        describe #{name} do
          pending "add some examples to (or delete) #{__FILE__}"
        end
      EOF
    end
  end

end

namespace :db do
  def config
    db = URI.parse(ENV['DATABASE_URL'])
    config = {
      :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
      :host     => db.host,
      :port     => db.port,
      :username => db.user,
      :password => db.password,
      :database => db.path[1..-1],
      :encoding => 'utf8'
    }
  end

  desc "Create the database at #{config[:database]}"
  task :create do
    puts "Creating database #{config[:database]} if it doesn't exist..."

    ActiveRecord::Base.establish_connection(config.merge(
      :database => 'postgres',
      :schema_search_path => 'public'
    ))

    begin
      ActiveRecord::Base.connection.create_database(config[:database])
    rescue ActiveRecord::ActiveRecordError => e
    end

    ActiveRecord::Base.establish_connection(config)
  end

  desc "Drop the database at #{config[:database]}"
  task :drop do
    puts "Dropping database #{config[:database]}..."

    ActiveRecord::Base.establish_connection(config.merge(
      :database => 'postgres',
      :schema_search_path => 'public'
    ))
    ActiveRecord::Base.connection.drop_database(config[:database])
  end

  desc "Migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)."
  task :migrate do
    ActiveRecord::Migrator.migrations_paths << File.dirname(__FILE__) + 'db/migrate'
    ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
    ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths, ENV["VERSION"] ? ENV["VERSION"].to_i : nil) do |migration|
      ENV["SCOPE"].blank? || (ENV["SCOPE"] == migration.scope)
    end
  end

  desc "Populate the database with dummy data by running db/seeds.rb"
  task :seed do
    require APP_ROOT.join('db', 'seeds.rb')
  end

  desc "Returns the current schema version number"
  task :version do
    puts "Current version: #{ActiveRecord::Migrator.current_version}"
  end
end

desc 'Start IRB with application environment loaded'
task "console" do
  exec "irb -r./config/environment"
end