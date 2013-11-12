# Dev Bootcamp ActiveRecord Associations Examples

Example of advanced options used on ActiveRecord relationships (e.g. :class\_name, :foreign\_key, :source)

## Getting started

Prerequisites:

* Ruby >= 1.9.3
* Bundler
* postgresql

        $ bundle install
        $ rake db:create db:migrate db:seed

## Usage

Run queries using `rake console` which opens up an IRB session with the ActiveRecord connection established and the models loaded.

    $ rake console
    1.9.3-p448 :001 > User.find(1).purchased_shirts
    D, [2013-11-12T09:01:49.032942 #6871] DEBUG -- :   User Load (23.9ms)  SELECT "users".* FROM "users" WHERE "users"."id" = $1 LIMIT 1  [["id", 1]]
    D, [2013-11-12T09:01:49.120097 #6871] DEBUG -- :   Shirt Load (13.3ms)  SELECT "shirts".* FROM "shirts" INNER JOIN "purchases" ON "shirts"."id" = "purchases"."shirt_id" WHERE "purchases"."purchaser_id" = 1
     => [#<Shirt id: 1, designer_id: 2>, #<Shirt id: 3, designer_id: 2>]

## Contact

Ryan Briones <ryan@devbootcamp.com>
