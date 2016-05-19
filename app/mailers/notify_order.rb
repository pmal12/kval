class NotifyOrder < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notify_order.received.subject
  #
  def received(order)
    @order = order
    mail to: order.email, subject: 'Order confirmation'
  end
end