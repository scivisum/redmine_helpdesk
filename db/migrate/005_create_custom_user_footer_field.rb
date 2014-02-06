class CreateCustomUserFooterField < ActiveRecord::Migration
  def self.up
    c = CustomField.new(
      :name => 'helpdesk-user-email-footer',
      :editable => true,
      :field_format => 'string')
    c.type = 'UserCustomField' # cannot be set by mass assignement!
    c.save
  end

  def self.down
    CustomField.find_by_name('helpdesk-user-email-footer').delete
  end
end