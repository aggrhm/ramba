# Ramba

Ramba is a simplified asset pipeline package manager for Ruby on Rails.

The Rails asset pipeline in theory is simple, but including third-party assets can be painful. The goal of Ramba is to make it ridiculously simple to import web assets into the Rails pipeline from ANY Github repository. By creating an Assetfile in addition to your Gemfile, you can denote the web assets your app depends on, and separate assets from ruby gems. Presently, the only requirement is that the web asset library stipulate a bower.json file (which most do).

This way, no more using "blahblah-rails" gems (which are often out-of-date, and the creation of these gems in the first place just to include some stylesheets and javascript files seems like overkill). You also don't have to use bower-rails which depends on having node installed, however Ramba presently doesn't support dependencies, so if you need dependency management bower-rails might be a better option. Again, the goal is to simply include versioned web assets into your asset pipeline from a web location (ideally Github).

## Available Packages

Currently, any package that stipulates a valid bower.json or component.json file in the root directory hosted on Github is available.

All javascripts, stylesheets, images, and fonts will be installed to:

	app / assets / [javascripts|stylesheets|images|fonts] / ramba / [package_name]

## Installation

Add this line to your application's Gemfile:

	gem 'ramba', github: "agquick/ramba"

And then execute:

	$ bundle install

## Usage

First, you will need to create your Assetfile. Place it in your application's root directory. In your Assetfile, stipulate the packages you need, along with their location and version.

		
	# vi:syntax=ruby		<-- for vim to highlight colors properly (optional)

	package "jquery", github: "jquery/jquery", tag: "2.1.0"
	package "bootstrap", github: "twbs/bootstrap", tag: "v3.1.1"
	package "quick_script", github: "agquick/quick_script.js", branch: "master"
	package "animate", github: "daneden/animate.css", branch: "master"

Install packages.

	$ bundle exec ramba install

Add Ramba to the begining of your application manifests.

	# in app/assets/javascripts/application.js
	//
	//= require ramba
	// ...

	# in app/assets/stylesheets/application.css
	/*
	*= require ramba
	* ...

That's it. Your packages should now be installed and included. Once you have added ramba to your application manifests, any new packages installed will automatically be included and available in the asset pipeline.

## Assetfile

### package

	package <name>, <options>

	OPTIONS:
	- github : github short path (user/repo)
	- tag : github repo tag
	- branch : github branch
	- path : path to package directory on filesystem
	- path_mode : [:copy, :live]
			:copy = copy files from source directory (default)
			:live = include source directly (must follow directory format)

## Ramba Commands

### Install

	$ bundle exec ramba install
	$ bundle exec ramba install <package name>

Cleans and installs packages, rebuilds manifests.

### Manifests

	$ bundle exec ramba manifests

Rebuilds ramba manifests file (usually for fixing errors).

### Clean

	$ bundle exec ramba clean
	$ bundle exec ramba clean <package name>

Removes directories for all packages or a single package.

## Contributing

1. Fork it ( http://github.com/<my-github-username>/ramba/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
