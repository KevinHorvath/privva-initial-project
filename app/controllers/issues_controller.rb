class IssuesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  set_tab :issues

  def index
    @issues = Issue.all
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = current_user.reported_issues.build(issue_params)
    if @issue.save
      redirect_to issues_path, notice: 'Issue was successfully created.'
    else
      render 'new'
    end
  end

  private

  def issue_params
    params.require(:issue).permit(:summary, :status, :assignee_id)
  end
end
