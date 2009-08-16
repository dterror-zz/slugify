$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib/'
require 'rubygems'
require 'spec'
require 'active_record'
require 'slugify'

ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :database => ':memory:'
)

def setup_db
  ActiveRecord::Schema.define do
    create_table :people, :force => true do |t|
      t.string :name, :slug
    end
    create_table :articles, :force => true do |t|
      t.string :title, :permalink
    end
  end
end