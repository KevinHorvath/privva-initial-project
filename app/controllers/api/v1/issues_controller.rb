module Api
  module V1
    class IssuesController < ActionController::API
      include IssuesHelper

      def index
        render json: get_api_issues(params)
      end
    end
  end
end
