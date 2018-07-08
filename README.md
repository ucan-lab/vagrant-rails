# vagrant-rails

```
$ git clone https://github.com/ucan-lab/vagrant-rails
$ cd vagrant-rails
$ vagrant up
```

## rails install

```
$ vagrant ssh
$ cd work

$ bundle init
$ sed -i -e "s/# gem \"rails\"/gem \"rails\"/" Gemfile
$ bundle install --path vendor/bundle
$ bundle exec rails new .
```

## 環境

| 項目       | 値            |
| ---------- | ------------- |
| CentOS     | 7.5           |
| Ruby       | 2.5.1         |
| MySQL      | 5.7.x         |
| Node(npm)  | 10.6.x(6.1.x) |
| yarn       | 1.7.x         |
| Git        | 2.x           |
| heroku-cli | 7.5.x         |
