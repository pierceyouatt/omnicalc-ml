# Omnicalc ML

For this assignment, we're going to be extending your work with Omnicalc by exploring a machine learning API marketplace called [Algorithmia](https://algorithmia.com/). It's a fantastic resource that connects us to a large number of machine learning APIs, including many that do text and image analysis.

You'll get practice using forms to capture and process user input using some interesting applications including:

 - a service that auto-tags large blocks of text
 - a service that colorizes black and white images
 - a service that auto-tags images with descriptive keywords

### [Here is the target you will ultimately build.](https://omnicalc-ml-target.herokuapp.com/)

**Note: You may see unusual warning messages like the following lines when you run `rails grade`.**

```
/home/ubuntu/workspace/omnicalc-ml/spec/features/algorithmia_spec.rb:29: warning: already initialized constant Algorithmia
/usr/local/rvm/gems/ruby-2.4.3/gems/algorithmia-1.0.1/lib/algorithmia/algorithm.rb:1: warning: previous definition of Algorithmia was here
/home/ubuntu/workspace/omnicalc-ml/spec/features/algorithmia_spec.rb:66: warning: already initialized constant Algorithmia
/home/ubuntu/workspace/omnicalc-ml/spec/features/algorithmia_spec.rb:29: warning: previous definition of Algorithmia was here
/home/ubuntu/workspace/omnicalc-ml/spec/features/algorithmia_spec.rb:102: warning: already initialized constant Algorithmia
/home/ubuntu/workspace/omnicalc-ml/spec/features/algorithmia_spec.rb:66: warning: previous definition of Algorithmia was here
```

**You can safely ignore these messages.**

## Project Specific Setup

 1. Clone this project to your Cloud9 workspace as usual.
 1. `cd omnicalc-ml`
 1. `bin/setup`
 1. `bin/server`
 1. Navigate to the Preview of the running application in Chrome — there's nothing there but the default Rails welcome screen.
 1. **This is a brand new, untouched Rails application.** All we've done is add the instructions you're reading in this README. **You could generate the exact same thing right now.**
 1. As you work, `rails grade:all` in a separate tab for feedback.

### API Setup

First, visit [Algorithmia](https://algorithmia.com/) and sign up for an account. You'll be able to find your API keys by visiting 'https://algorithmia.com/users/[your username]' or by clicking on the profile icon at the top right and clicking the 'My API Keys' link. You'll need this key to complete the homework exercises below.

We'll also need to make sure your API key stays hidden, in case your project ever gets pushed to Github or another public repository. Unsavory types like to scrape Github for sensitive information like API keys and run up huge bills for compromised users. In this specific case, you didn't have to tie your API key to a credit card, but protecting your API keys is generally good practice.

We've already got the infrastructure for this in place. Our class project apps come bundled with a gem called `dotenv` which lets us store sensitive information just in our local development environment and hide that info from Git so it doesn't get pushed anywhere with our code. The info is stored in a file called `.env` that exists in the root folder of your application. Create a new file at the root directory of your application and call it `.env`. In the file place, the following code:

```
ALGORITHMIA_KEY="replace_me_with_your_key"
```

This is just a key-value pair that we can access anywhere in our Rails environment using the ENV hash. For example, to access this 'sensitive' info, we can open up Rails console and type in:

```
ENV['ALGORITHMIA_KEY']
```

and we should see output of

```
"replace_me_with_your_key"
```

Next, restart your Rails server so that it picks up this information. Find the Terminal tab where you did `bin/server`, <kbd>Ctrl</kbd>+<kbd>C</kbd> to shut it down, and `bin/server` again to restart it.

You can use this pattern throughout your Rails app to pull up any sensitive info. Practice by using the `.env` file to store your actual Algorithmia API key.

### Problem 1 - Auto-tag Text

The first service we'll use auto-tags blocks of text.

Here's how it should work:

- If I visit `/text-tag`, I should see a form that has a single textarea element which lets me enter text for tagging. If you'd like an example, you can use this excerpt from the Paul Graham essay, [Do Things That Don't Scale](http://www.paulgraham.com/ds.html):

```
One of the most common types of advice we give at Y Combinator is to do things that don't scale. A lot of would-be founders believe that startups either take off or don't. You build something, make it available, and if you've made a better mousetrap, people beat a path to your door as promised. Or they don't, in which case the market must not exist.
```
- The textarea should have a label of `Text` and the button you click to submit the form should be called `Generate Tags`.
- When the form is submitted, I should see an unordered list of tags corresponding to the submitted text. If you used the example text, you should see the following tags:
```
beat
case
door
exist
market
path
people
promise
```

Visit the [AutoTag page](https://algorithmia.com/algorithms/nlp/AutoTag), and follow the instructions at the bottom of the page to integrate the API in your controller. ** You do not need to include the `require 'algorithmia'` statement from the instructions**

### Problem 2 - Colorize Images

The next service we'll use colorizes black and white images.

Here's how it should work:

- If I visit `/colorize`, I should see a form that has a single input which lets me enter the URL of a black and white image. You can use [https://cdn.vox-cdn.com/uploads/chorus_asset/file/4863353/grantpark-1.0.jpg](https://cdn.vox-cdn.com/uploads/chorus_asset/file/4863353/grantpark-1.0.jpg) as an example. The smaller the image, the better. Try not to go beyond 800x800px.
- The input should have a label of `Image URL` and the button you click to submit the form should be called `Colorize`.
- When the form is submitted, I should see a colorized version of the original black and white picture

The API needs a bit of time to do it's work, so expect it to take about 30 seconds or so for the request to complete.

Visit the [Image Colorization page](https://algorithmia.com/algorithms/deeplearning/ColorfulImageColorization), and follow the instructions at the bottom of the page to integrate the API in your controller.

### Problem 3 - Auto-tag Images

The next service we'll use tags images.

Here's how it should work:

- If I visit `/image-tag`, I should see a form that has a single input which lets me enter the URL of an image. You can use [http://www.pjproductions.co.uk/blog_images/Chicago-Booth-Group-photo-Pete-Jones.jpg](http://www.pjproductions.co.uk/blog_images/Chicago-Booth-Group-photo-Pete-Jones.jpg) as an example. Try to make sure you use images with people in it, since the tags are not as descriptive for pictures with inanimate objects or animals.
- The input should have a label of `Image URL` and the button you click to submit the form should be called `Colorize`.
- When the form is submitted, I should see a set of tags inside an unordered list.

The API needs a bit of time to do it's work, so expect it to take about 30 seconds or so for the request to complete.

Visit the [Illustration Tagger page](https://algorithmia.com/algorithms/deeplearning/IllustrationTagger), and follow the instructions at the bottom of the page to integrate the API in your controller.
