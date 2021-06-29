class StagingMailInterceptor
  def self.delivering_email(message)
    message.to = "staging@example.org"
    message.subject = "[STAGING] #{message.subject}"
  end
end

# if Rails.env.staging?
  ActionMailer::Base.register_interceptor(StagingMailInterceptor)
# end

class StagingMailObserver
  def self.delivered_email(message)
    Rails.logger.debug "SENT EMAIL"
  end
end

ActionMailer::Base.register_observer(StagingMailObserver)
