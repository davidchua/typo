class AddModeratorToProfile < ActiveRecord::Migration
  class Profile < ActiveRecord::Base
    include BareMigration
  
    serialize :profiles
  end

  def self.up
    STDERR.puts "Creating moderator profile"
    Profile.transaction do
      Profile.create(:label => 'moderator', :nicename => 'Moderator')
      Profile.find_by_label('moderator').update_attributes(:modules => [:dashboard, :users, :profile, :feedback, :moderate ])
    end
  end

  def self.down
    Profile.find_by_label('moderator').destroy
  end
end
