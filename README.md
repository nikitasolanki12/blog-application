# README

This README would normally document whatever steps are necessary to get the
application up and running.

This is a simple Ruby on Rails 7 application that includes user authentication, an admin role, blog functionality, and AJAX features. The application allows users to create, edit, delete blogs and also includes filtering options.

Things you may want to cover:

* Ruby version 2.7.5

User Authentication
User authentication is implemented without using any gem. Users can sign up, log in, and log out.

Users can be assigned an admin role. Only admin-approved blogs will be visible on the user's blog index page.

CRUD Operations for User's Blog

Users can perform CRUD operations on their blogs, where each blog has a title, content, and publication date fields.

AJAX Features

AJAX is implemented for editing and deleting a blog without a page refresh.
Filtering on User's Blog Index Page
Users can filter blogs using title and publication date.
A date picker is provided to choose the date for the filter.

* run the test suite
Test Cases
Test cases are included to ensure the functionality of the application. Run tests using: rails test command

