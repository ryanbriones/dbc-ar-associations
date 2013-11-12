User.create!([
  {name: "Ryan"},
  {name: "Jonathan"},
  {name: "Mike"},
  {name: "Torey"},
])

# Shirt.create!([
#   {user_id: 2},
#   {user_id: 1},
#   {user_id: 2},
#   {user_id: 4}
# ])

Shirt.create!([
  {designer_id: 2},
  {designer_id: 1},
  {designer_id: 2},
  {designer_id: 4}
])

Purchase.create!([
  {shirt_id: 1, purchaser_id: 1},
  {shirt_id: 3, purchaser_id: 1},
  {shirt_id: 4, purchaser_id: 3},
  {shirt_id: 1, purchaser_id: 3},
])