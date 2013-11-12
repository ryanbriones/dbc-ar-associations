class Purchase < ActiveRecord::Base
  # - foreign key exists on this table
  # - needs :class_name since a matching class Buyer does not exist for this relation
  # - needs :foreign_key since expected key buyer_id does not exist on table
  belongs_to :buyer, class_name: "User", foreign_key: "purchaser_id"
  # - foreign key "shirt_id" exists on this table
  # - Works by default
  belongs_to :shirt
end