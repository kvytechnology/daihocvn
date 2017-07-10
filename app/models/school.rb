class School < ApplicationRecord
  TYPES = ["public", "private", "international"]

  has_attached_file :logo,
    styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: "/images/:style/missing.png"

  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

  has_many :photos, as: :owner, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true

  def logo_attributes=(attributes)
    # Marks the attachment for destruction on next save,
    # if the attributes hash contains a _destroy flag
    # and a new logo was not uploaded at the same time:
    logo.clear if has_destroy_flag?(attributes) && !logo.dirty?
  end
end
