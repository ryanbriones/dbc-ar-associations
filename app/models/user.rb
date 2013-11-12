class User < ActiveRecord::Base
  # - foreign key exists on the relation's table (shirts)
  # - needs :class_name to find the proper class for the relation
  # - needs :foreign_key to find the related user in the relation's table
  has_many :designed_shirts, class_name: "Shirt", foreign_key: "designer_id"
  
  # - foreign key exists on the relation's table (purchases)
  # - needs :foreign_key to find the related user in the relation's table
  has_many :purchases, foreign_key: "purchaser_id"
  # - needs :through because "shirts" are found via a join on purchases
  # - needs :source as purchases does not have a purchased_shirts relation
  #   and needs a relation to use to traverse the relationship
  has_many :purchased_shirts, through: :purchases, source: :shirt
end