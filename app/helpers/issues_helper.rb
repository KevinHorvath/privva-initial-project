module IssuesHelper
  DEFAULT_SORTING = {created_at: :desc}
  SORTABLE_FIELDS = [:summary, :status, :updated_at, :created_at]
  PER_PAGE = 10

  def get_api_issues(params)
    issues = Issue
      .all
      .order(sort_params)
      .paginate(page: current_page, per_page: page_size)
    issues = issues.where("LOWER(summary) LIKE ?", "%#{params[:summary].downcase}%") if params[:summary].present?
    issues = issues.joins(:reporter).where("LOWER(users.name) LIKE ?", "%#{params[:reporter]}%").references(:user) if params[:reporter].present?
    issues = issues.joins(:assignee).where("LOWER(assignees_issues.name) LIKE ?", "%#{params[:assignee]}%").references(:user) if params[:assignee].present?
    issues
  end

  private

  def current_page
    (params.to_unsafe_h.dig('page') || 1).to_i
  end

  def page_size
    (params.to_unsafe_h.dig('page_size') || PER_PAGE).to_i
  end

  def sort_params
    SortParams.sorted_fields(params[:sort], SORTABLE_FIELDS, DEFAULT_SORTING)
  end
end
