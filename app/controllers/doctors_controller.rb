class DoctorsController < ApplicationController
    def index
    end
    def meetings
        if current_user && current_user.uid == params[:user_uid]
            @search, @order_column, @order_direction, recs =
              all_recordings(current_user.rooms.pluck(:bbb_id), params.permit(:search, :column, :direction), true)
            @pagy, @recordings = pagy_array(recs)
          else
            redirect_to root_path
          end
    end
end