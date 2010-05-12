class ModifyContributorProfileModules < ActiveRecord::Migration
  class Profile < ActiveRecord::Base
    include BareMigration

    serialize :profiles
  end

  def self.up
      Profile.find_by_label('contributor').update_attributes(:modules => [:dashboard, :profile, :write])
  end

  def self.down
    Profile.find_by_label('contributor').update_attributes(:modules => [:dashboard, :profile])
  end
end
