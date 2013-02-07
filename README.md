# RSAsync for Rails Assets Pipeline

[RSAsync](https://github.com/KevBurnsJr/rsasync) Javascript
asynchronous rsa key generation - extends
[jsbn](http://www-cs-students.stanford.edu/~tjw/jsbn/).


## Usage

  * Include `rsasync-rails` in the `Gemfile`

        #!ruby
        gem 'rsasync-rails', '13.2.7', git: 'https://bitbucket.org/gimiscale/rsasync-rails.git'

  * Add to `app/assets/javascripts/applications.js`

        #!javascript
        //= require rsasync-rails

  * Use in JavaScript

        #!javascript
        key = new RSAKey();
        key.generateAsync(512, "03", function(){
            var pubKey = hex2b64(key.n.toString(16));
            alert(pubKey);
        });


## License

See `LICENSE.md`.
