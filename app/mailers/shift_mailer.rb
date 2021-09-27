class ShiftMailer < ApplicationMailer
	default from: 'shiftschedule@example.com'

	def shift_email
    @user =  "cr_dev@full-cycle.com"
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Shift schedule of current week. ')
  end
end
