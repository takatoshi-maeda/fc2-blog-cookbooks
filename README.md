# FC2 Blog Cookbooks

__Please do not use in a production environment this cookbooks.__

__It is assumed only used in a test environment.__

## Requirements

- vagrant 1.+ (recommend 1.5.1)
- ruby 1.9.3 or higher (recommend 2.1.1)
- bundler
- safari or Internet Exploler(test access)

## Usage

```
$ git clone git@github.com:TakatoshiMaeda/fc2-blog-cookbooks.git
$ cd fc2-blog-cookbooks
```

please edit the `nodes/fc2blog.json` before execution.  
set your configration to `// please set` field.  
please see sample `nodes/example.json.sample`

or easily setup is rename `nodes/example.json.sample` to `nodes/fc2blog.json`

```
$ bundle install
$ bundle exec rake bootstrap
```

please access `localhost:8088/admin/install.php`. (In my environment did not work well in chrome and...  
your fc2blog is running locally!
