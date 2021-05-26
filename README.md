# Codegram(added filter by theme)

This is all features added to site.
- Getting started:
  -	Page routing.
  -	Adding, editing, deleting posts.
  -	Adding and deleting comments, which are connected to post.
  -	Validating all forms with length and regular expressions.
  -	Added bootstrap to all pages.
- Authentication:
  -	Added gem devise.
  -	Customers can register on website.
  -	Customize forms for: log in, sign up, forgot password.
  -	User has email, username and password.
  -	Posts are connected to authors.
  -	All users can write comments under other users post and can delete comments under theirs own posts.
  -	Unauthorized users can`t create posts and comments, edit and delete other users posts.
- Authentication for roles:
  -	Added gem Pundit.
  -	Added roles: admin(can edit, delete all posts and comments), moderator(can delete all comments), user.
- Pagination:
  -	Added gem will_paginate.
  -	Only 2 post are in one page.
- Search:
  -	Users can search posts by title and by content.
  -	Search is possible if the word starts correctly.
- Filter by theme:
  -	User can add theme to their post and edit later.
  -	User can also filter post by theme in the main page.
