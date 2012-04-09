rrrspec
=======

_re-running rspec tests until they pass_ 

Disclaimer: this is not the way to go. Needing this is a smell that your tests are too brittle. They need to be made more robust. rrrspec can be used as workaround to verify all the tests pass before modifying the scripts. 

usage
-----
    rrrspec <spec>

the story
---------

I had a large set a acceptance tests written with rspec. For *some reasons*, at one time, some tests did not pass. Investigation showed this was due to a timing issue. The tests were probably executed on a faster box than before ; and they was quierying the system before it was ready to answer.

tests
-----

I couldn't commit without test. The `rrrspec-sample.rb` is a contrived example using the Ruby ``rand()` function. It is used by default, if it exists in the current directory.
