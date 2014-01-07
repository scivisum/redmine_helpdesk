class CreateCustomCcEmailField < ActiveRecord::Migration
  def self.up
    c = CustomField.new(
      :name => 'Cc Emails',
      :editable => true,
      :field_format => 'string',
      :default_value => '',)
    c.type = 'IssueCustomField' # cannot be set by mass assignement!
    c.save
    Tracker.all.each do |t|
      execute "INSERT INTO custom_fields_trackers (custom_field_id,tracker_id) VALUES (#{c.id},#{t.id})"
    end
  end

  def self.down
    c = CustomField.find_by_name('Cc Emails')
    execute "DELETE FROM custom_fields_trackers WHERE custom_field_id=#{c.id}"
    c.delete
  end
end
