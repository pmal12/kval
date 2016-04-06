module ApplicationHelper
	def hidden_div_if (condition, attributes = {}, &block)
		if condition
			attributes["style"] = "display: none"
		end
		content_tag("div", attributes, &block)
	end

	def bootstrap_class_for flash_type
	    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-success" }[flash_type] || flash_type.to_s
	  end

	  def flash_messages(opts = {})
	    flash.each do |msg_type, message|
	      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do 
	              concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
	              concat message 
	            end)
	    end
	    nil
	  end
end
