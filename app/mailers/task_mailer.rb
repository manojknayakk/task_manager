class TaskMailer < ApplicationMailer

  def deadline_notification_email
    @task = params[:task]
    @user = @task.user
    mail(to: @user.email, subject: 'Task dealine is soon')
  end
end
