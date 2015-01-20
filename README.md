# Cider-CI Support for Rspec

This gem provides convenience executables to work with Rspec and Cider-CI.

See also [Cider-CI Support for Ruby and Ruby on Rails][].

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cider_ci-rspec_support', '~> 1.0.0'
```

## Usage


### Update 

    bundle exec cider-ci_rspec-support update spec/

This will read all specs and update or create the corresponding Cider-CI tasks
in `./cider-ci/tasks/rspec-tasks.yml` and
`./cider-ci/tasks/rspec-feature-tasks.yml` respectively. The target files can
be configured, try 

    bundle exec cider-ci_rspec-support --help


### Check 

    bundle exec cider-ci_rspec-support check spec/

This will check if an update is required. It will print out a warning and exit
with non zero if so. It is recommended to use this command in a Cider-CI task
to tests if the specification is up to date.


  [Cider-CI Support for Ruby and Ruby on Rails]: https://github.com/cider-ci/cider-ci_ruby-support

