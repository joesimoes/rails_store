class OrderForm
  include ActiveModel::Model

  attr_accessor :user, :order #credit_card

  def save
    if valid?
      persist
      true
    else
      false
    end
  end

  def has_errors?
    user.errors.any?
  end

  private

  def valid?
    user.valid?
  end

  def persist
    #user.save
  end

end
