module ApplicationHelper
  def permited_attributes(params)
    return {} if params.present?
    params[:search].permit(:name, :model, :brand, :year, :ram, :external_storage).to_h
  end
end
