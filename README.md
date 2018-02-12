# WEEK 6

This week, we will cover:

* RESTful HTTP Requests (review)
* User Accounts (new)
* Login/Logout with Cookies (new)
* User Authentication (new)
* Model Validations (maybe)

### Getting Started

1. Download a ZIP of this repository.  Unzip the contents.
2. In your Terminal or Command Prompt, `cd` to the application's root directory.
3. `bundle install`
4. `rails db:migrate db:seed` (you can specify multiple tasks on the command line)
6. `rails server`.  Puma should start up on port 3000.
7. Browse to `localhost:3000`.

## User Accounts

Every meaningful web application has a notion of a _user_.  Sometimes
it feels like users are special cases, but in fact they are just another
model: a software representation of a real-world thing.

Typical model names are `User`, `Account`, `Participant`, and so on.  I will
use `User` for these examples.

There are a couple reasons why User objects might feel different from
most other models:

* Users login and logout, which seem to be special abilities
* Users seem to come in different types: administrators, guests, etc.
* Sometimes we want to lock down parts of the application to only certain
users or certain user types

### Login and Logout

Most login and logout systems use _browser cookies_ to track user identity.

Rails provides two hashes for this purpose:

* The `cookies[]` hash
* The `session[]` hash

Both hashes are convenience facilities provided by Rails.  Both hashes are
initialized based on the contents of the `Cookie:` request header, and affect
the outgoing value of the `Set-Cookie:` response header.  

Each key in the `cookies` hash maps to an independent browser cookie.  Keys
and values in the `session` hash, however, are combined together into a
single cookie, which is both encrypted and and digitally signed.

Since all HTTP 1.1. headers are text values, any keys and values you use must be serializable into strings.  Rails recommends using JSON for structures like arrays or other hashes:

* `JSON.parse(...)`
* `JSON.generate(...)`
