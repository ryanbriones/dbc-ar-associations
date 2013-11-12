class Shirt < ActiveRecord::Base
  # - foreign key "designer_id" exists on this table
  # - needs :class_name because class Designer for this relation does not exist
  belongs_to :designer, class_name: "User"
  
  # - foreign key "shirt_id" exists on the relation's table (purchases)
  # - needs :class_name because class Sale for this relation does not exist
  has_many :sales, class_name: "Purchase"
  # - buyer relation on sales relation exists. Works by default
  has_many :buyers, through: :sales
end