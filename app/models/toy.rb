class Toy < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  has_one_attached :image

  scope :recent, -> { order(created_at: :desc) }


  def self.csv_attributes
    ["name", "description", "created_at", "updated_at"]
  end

  def self.generate_csv
    CSV.generate(headers: true) do |csv|
      csv << csv_attributes
      all.each do |toy|
        csv << csv_attributes.map{ |attr| toy.send(attr) }
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      toy = new
      toy.attributes = row.to_hash.slice(*csv_attributes)
      toy.save!
    end
  end

  private 
  def set_nameless_name
    self.name = "名前なし" if name.blank?
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[name]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

end
