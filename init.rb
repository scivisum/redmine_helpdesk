require 'redmine'
require 'helpdesk_hooks'
require 'helpdesk_mailer'
require 'redmine_helpdesk/journal_patch'
require 'redmine_helpdesk/mail_handler_patch'

Rails.configuration.to_prepare do
  unless MailHandler.included_modules.include? RedmineHelpdesk::MailHandlerPatch
    MailHandler.send(:include, RedmineHelpdesk::MailHandlerPatch)
  end
  unless MailHandler.included_modules.include? RedmineHelpdesk::JournalPatch
    Journal.send(:include, RedmineHelpdesk::JournalPatch)
  end
end

Redmine::Plugin.register :redmine_helpdesk do
  name 'Redmine helpdesk plugin'
  author 'Stefan Husch'
  description 'Redmine helpdesk plugin for netz98.de'
  version '0.0.5'
  requires_redmine :version_or_higher => '2.4.0'
end
