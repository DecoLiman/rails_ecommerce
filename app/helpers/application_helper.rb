module ApplicationHelper
  def bootstrap_class_for flash_type
    { 
      success: "alert alert-success",
      error: "alert alert-danger",
      alert: "alert alert-warning",
      notice: "alert alert-info",
      danger: "alert alert-danger",
      warning: "alert alert-warning"
    }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "#{bootstrap_class_for(msg_type)} fade in text-center", id: "flash") do
        concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
        concat message
      end)
    end
    nil
  end
end
