class EmailsController < ApplicationController
  def index
    @all_emails = Email.all
  end

  def create
    @email = Email.new(object: Faker::Lorem.word, body: Faker::Lorem.sentence(word_count: 10))

    respond_to do |format|
      if @email.save
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity}
      end
    end

    # redirect_to emails_path

  end 

  private 
  
  def email_params
    params.permit(:title, :author)
  end
end


# <!-- <%= turbo_frame_tag "email-details" do %> -->
#   <!--     <%= render "email", @email: @email%> -->
#   <!-- <% end %> -->