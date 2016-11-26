class LikesController < ApplicationController
  def create
    
    like = Like.new(set_likeparam)
    like.user_id = current_user.id
    #like.timeline_id = :timeline_id
    
    if like.valid? # バリデーションチェック
      like.save!
    else
      flash[:alert] = like.errors.full_messages
    end
    
    redirect_to timelines_path
  end
  
  private
  def set_likeparam
  params.permit(
      :timeline_id,
      current_user.id
      )
  end
end
