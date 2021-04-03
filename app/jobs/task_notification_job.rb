class TaskNotificationJob < ApplicationJob
  queue_as :default

  def perform(task)
    TaskMailer.with(task: task).deadline_notification_email.deliver_later unless task.done?
  end
end
