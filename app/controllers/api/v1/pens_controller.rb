
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
 
              else 
 
              end
            end
                    
            private 
            def pen_params
              params.require(:pen).permit(:name, :password, :token)
            end
  end
end
