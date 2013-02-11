# RSAsync for Rails Assets Pipeline

[RSAsync](https://github.com/KevBurnsJr/rsasync) Javascript
asynchronous rsa key generation - extends
[jsbn](http://www-cs-students.stanford.edu/~tjw/jsbn/).


## Usage

  * Include `rsasync-rails` in the `Gemfile`:

        #!ruby
        gem 'rsasync-rails', '13.2.11.1', git: 'https://bitbucket.org/gimiscale/rsasync-rails.git'

  * Add to `app/assets/javascripts/applications.js`:

        #!javascript
        // RSA keygen, encoding, decoding, etc...
        //= require rsasync-rails
        // RSA (public/private) key formatting for SSH
        //= require ssh-format-rails

    Optional:

        #!javascript
        // SHA-1 hash function
        //= require jsbn-sha1-rails
        
        // Elliptic Curve Math
        //= require jsbn-ecc-rails

  * For best results, put code like following in your main HTML
    document.
  
        #!html
        <body onClick='rng_seed_time();' onKeyPress='rng_seed_time();'>

  * Example use in JavaScript:

        #!javascript
        key = new RSAKey();
        key.generateAsync(512, "03", function(){
            var pubKey = generatePublicKey(key);
            var priKey = generatePrivateKeyBlock(key);
            alert(pubKey);
            alert(priKey);
        });

## License

See `LICENSE.md`.
