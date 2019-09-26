module ApplicationHelper
  # def flash_class(level)
  #   case level
  #     when 'notice' then "alert alert-info"
  #     when 'success' then "alert alert-success"
  #     when 'error' then "alert alert-danger"
  #     when 'alert' then "alert alert-warning"
  #   end
  # end

  def bootstrap_class_for flash_type
    { success: "alert alert-success", error: "alert alert-danger", alert: "alert alert-warning", notice: "alert alert-info" }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in", id: "flash") do
        concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
        concat message
      end)
    end
    nil
  end
end
