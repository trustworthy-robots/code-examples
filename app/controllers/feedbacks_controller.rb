class FeedbacksController < ApplicationController
  def create
    Feedback.create(feedback_params).send_to_robots!
    head :ok
  end

  private
    def feedback_params
      params.require(:feedback).permit(:user_name, :user_email, :body)
    end
end
