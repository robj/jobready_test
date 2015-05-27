### JobReady Sales Taxes Test


#### Usage 

Ensure the Virtus Gem is installed (https://github.com/solnic/virtus)

```bash
$ gem install virtus
```

Print Receipt (Input: CSV file, Outout: STDOUT)

```bash
$ ./register.rb test_input.csv
```

#### Testing

Run Specs

```bash
$ rspec
```


#### Notes


- Virtus used to add ActiveModel like functionality to POROs. (Initialization from hash, Type coercion)
- Due to time constraints, spec coverage is limited - Please see http://robj.github.io for a better example of TDD