ActiveAdmin.register School do
  permit_params :name, :location, :description, :website_url, :logo,
    logo_attributes: [:_destroy],
    photos_attributes: [:attachment, :owner_id, :owner_type, :_destroy, :_create, :_update]

  index do
    selectable_column
    id_column
    column :name
    column 'Logo', sortable: :logo_file_name do |firmware| link_to firmware.logo_file_name, firmware.logo.url end
    column :location
    column :type
    column :created_at
    actions
  end

  form do |f|
    f.inputs "New School" do
      f.input :name
      f.input :location
      f.input :description, as: :ckeditor
      f.input :website_url
      f.input :logo, hint: f.school.logo? ? image_tag(f.school.logo.url(:medium)) : content_tag(:span, "Upload JPG/PNG/GIF image")
      if f.object.logo.present?
        f.semantic_fields_for :logo_attributes do |logo_fields|
          logo_fields.input :_destroy, as: :boolean, label: 'Delete?'
        end
      end

      f.inputs 'Photos' do
        f.has_many :photos, allow_destroy: true do |p|
          p.input :attachment, hint: p.object.attachment? ? image_tag(p.object.attachment.url(:medium)) : content_tag(:span, "Upload JPG/PNG/GIF image")
        end
      end
    end
    f.actions
  end

end
