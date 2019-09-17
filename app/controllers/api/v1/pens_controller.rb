
module Api::V1
  class PensController < ApiController
  respond_to :json

    # POST /v1/users
              def index
                @pens = Pen.all
              respond_with @pens
              end
            
            def update
              if (authenticate_pen!)
              @pen.update( params.require(:pen).permit(:name, :password))
              render json:{status: 'Success', message:'created User', data:@pen}
              else 
                render json:{status: 'Error', message:'created User failed', data:@pen.errors}
              end
            end
                    
            private 
            def pen_params
              params.require(:pen).permit(:name, :password, :token)
            end
  end
end
