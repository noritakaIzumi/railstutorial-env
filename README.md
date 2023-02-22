# railstutorial

https://railstutorial.jp/ をやっていくやつ

## 初回環境構築メモ

コンテナを起動する

```shell
cd env
docker compose up -d
```

プロジェクトを作成する

```shell
docker compose exec -it -u $(id -u):$(id -g) ruby bash
```

```shell
mkdir -p app && cd app
rails _7.0.4_ new hello_app -O --skip-bundle
cd hello_app
```

出来上がった `hello_app` の `Gemfile` を以下のように変更する

```ruby
source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem "rails", "7.0.4"
gem "sprockets-rails", "3.4.2"
gem "importmap-rails", "1.1.0"
gem "turbo-rails", "1.1.1"
gem "stimulus-rails", "1.0.4"
gem "jbuilder", "2.11.5"
gem "puma", "5.6.4"
gem "bootsnap", "1.12.0", require: false

group :development, :test do
  gem "debug", "1.5.0", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console", "4.2.0"
end

group :test do
  gem "capybara", "3.37.1"
  gem "selenium-webdriver", "4.2.0"
  gem "webdrivers", "5.0.0"
end
```

パッケージのインストール

```shell
bundle install
```

キャッシュ書き込み不可能の旨と大量のエラーが出た

<details>
<summary>エラー内容</summary>
I have no name!@9f93ba28e81e:/repo/app/hello_app$ bundle install
`/` is not writable.
Bundler will use `/tmp/bundler20230217-161-u7ecn2161' as your home directory temporarily.
Fetching gem metadata from https://rubygems.org/...........
Resolving dependencies...
Using rake 13.0.6
Using builder 3.2.4
Fetching io-console 0.6.0
Fetching regexp_parser 2.7.0
Fetching racc 1.6.2
Using crass 1.0.6
Using rack 2.2.6.2
Using thor 1.2.1
Using websocket-extensions 0.1.5
Using zeitwerk 2.6.7
Using mini_mime 1.1.2
Fetching rubyzip 2.3.2
Fetching websocket 1.2.9
Fetching date 3.3.3
Fetching msgpack 1.6.0
Using bundler 2.3.14
Using matrix 0.4.2
Using websocket-driver 0.7.5
Using concurrent-ruby 1.2.0
Fetching public_suffix 5.0.1
Using i18n 1.12.0
Using tzinfo 2.0.6
Fetching sprockets 4.2.0
Fetching minitest 5.17.0
Using marcel 1.0.2
Using rexml 3.2.5
Fetching timeout 0.3.2
Fetching bindex 0.8.1
Using rack-test 2.0.2
Fetching childprocess 4.1.0
Using erubi 1.12.0
Using method_source 1.0.0
Using nio4r 2.5.8
Fetching puma 5.6.4

Retrying download gem from https://rubygems.org/ due to error (2/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/websocket-1.2.9.gem`. It is likely that you need to grant write permissions for that path.

Retrying download gem from https://rubygems.org/ due to error (2/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/rubyzip-2.3.2.gem`. It is likely that you need to grant write permissions for that path.

Retrying download gem from https://rubygems.org/ due to error (2/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/io-console-0.6.0.gem`. It is likely that you need to grant write permissions for that path.

Retrying download gem from https://rubygems.org/ due to error (2/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/timeout-0.3.2.gem`. It is likely that you need to grant write permissions for that path.

Retrying download gem from https://rubygems.org/ due to error (2/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/racc-1.6.2.gem`. It is likely that you need to grant write permissions for that path.

Retrying download gem from https://rubygems.org/ due to error (2/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/date-3.3.3.gem`. It is likely that you need to grant write permissions for that path.

Retrying download gem from https://rubygems.org/ due to error (2/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/regexp_parser-2.7.0.gem`. It is likely that you need to grant write permissions for that path.

Retrying download gem from https://rubygems.org/ due to error (2/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/bindex-0.8.1.gem`. It is likely that you need to grant write permissions for that path.

Retrying download gem from https://rubygems.org/ due to error (2/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/msgpack-1.6.0.gem`. It is likely that you need to grant write permissions for that path.

Retrying download gem from https://rubygems.org/ due to error (2/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/childprocess-4.1.0.gem`. It is likely that you need to grant write permissions for that path.

Retrying download gem from https://rubygems.org/ due to error (3/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/io-console-0.6.0.gem`. It is likely that you need to grant write permissions for that path.

Retrying download gem from https://rubygems.org/ due to error (3/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/websocket-1.2.9.gem`. It is likely that you need to grant write permissions for that path.

Retrying download gem from https://rubygems.org/ due to error (3/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/rubyzip-2.3.2.gem`. It is likely that you need to grant write permissions for that path.

Retrying download gem from https://rubygems.org/ due to error (3/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/timeout-0.3.2.gem`. It is likely that you need to grant write permissions for that path.

Retrying download gem from https://rubygems.org/ due to error (2/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/sprockets-4.2.0.gem`. It is likely that you need to grant write permissions for that path.

Retrying download gem from https://rubygems.org/ due to error (2/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/minitest-5.17.0.gem`. It is likely that you need to grant write permissions for that path.

Retrying download gem from https://rubygems.org/ due to error (3/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/bindex-0.8.1.gem`. It is likely that you need to grant write permissions for that path.

Retrying download gem from https://rubygems.org/ due to error (4/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/timeout-0.3.2.gem`. It is likely that you need to grant write permissions for that path.

Retrying download gem from https://rubygems.org/ due to error (3/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/racc-1.6.2.gem`. It is likely that you need to grant write permissions for that path.

Retrying download gem from https://rubygems.org/ due to error (4/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/io-console-0.6.0.gem`. It is likely that you need to grant write permissions for that path.

Retrying download gem from https://rubygems.org/ due to error (3/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/date-3.3.3.gem`. It is likely that you need to grant write permissions for that path.

Retrying download gem from https://rubygems.org/ due to error (4/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/websocket-1.2.9.gem`. It is likely that you need to grant write permissions for that path.

Retrying download gem from https://rubygems.org/ due to error (3/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/childprocess-4.1.0.gem`. It is likely that you need to grant write permissions for that path.

Retrying download gem from https://rubygems.org/ due to error (2/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/public_suffix-5.0.1.gem`. It is likely that you need to grant write permissions for that path.

Retrying download gem from https://rubygems.org/ due to error (4/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/rubyzip-2.3.2.gem`. It is likely that you need to grant write permissions for that path.


Retrying download gem from https://rubygems.org/ due to error (4/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/bindex-0.8.1.gem`. It is likely that you need to grant write permissions for that path.

Retrying download gem from https://rubygems.org/ due to error (3/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/regexp_parser-2.7.0.gem`. It is likely that you need to grant write permissions for that path.



Retrying download gem from https://rubygems.org/ due to error (4/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/childprocess-4.1.0.gem`. It is likely that you need to grant write permissions for that path.

Retrying download gem from https://rubygems.org/ due to error (3/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/msgpack-1.6.0.gem`. It is likely that you need to grant write permissions for that path.


Retrying download gem from https://rubygems.org/ due to error (3/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/sprockets-4.2.0.gem`. It is likely that you need to grant write permissions for that path.


Retrying download gem from https://rubygems.org/ due to error (4/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/racc-1.6.2.gem`. It is likely that you need to grant write permissions for that path.

Retrying download gem from https://rubygems.org/ due to error (3/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/minitest-5.17.0.gem`. It is likely that you need to grant write permissions for that path.

Retrying download gem from https://rubygems.org/ due to error (4/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/date-3.3.3.gem`. It is likely that you need to grant write permissions for that path.

Retrying download gem from https://rubygems.org/ due to error (2/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/puma-5.6.4.gem`. It is likely that you need to grant write permissions for that path.

Retrying download gem from https://rubygems.org/ due to error (4/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/regexp_parser-2.7.0.gem`. It is likely that you need to grant write permissions for that path.

Retrying download gem from https://rubygems.org/ due to error (3/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/public_suffix-5.0.1.gem`. It is likely that you need to grant write permissions for that path.



Retrying download gem from https://rubygems.org/ due to error (4/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/msgpack-1.6.0.gem`. It is likely that you need to grant write permissions for that path.

Retrying download gem from https://rubygems.org/ due to error (4/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/sprockets-4.2.0.gem`. It is likely that you need to grant write permissions for that path.

Retrying download gem from https://rubygems.org/ due to error (4/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/minitest-5.17.0.gem`. It is likely that you need to grant write permissions for that path.



Retrying download gem from https://rubygems.org/ due to error (4/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/public_suffix-5.0.1.gem`. It is likely that you need to grant write permissions for that path.



Retrying download gem from https://rubygems.org/ due to error (3/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/puma-5.6.4.gem`. It is likely that you need to grant write permissions for that path.



Retrying download gem from https://rubygems.org/ due to error (4/4): Bundler::PermissionError There was an error while trying to write to `/usr/local/bundle/cache/puma-5.6.4.gem`. It is likely that you need to grant write permissions for that path.

Bundler::PermissionError: There was an error while trying to write to `/usr/local/bundle/cache/minitest-5.17.0.gem`. It is likely that you need to grant write permissions for that path.
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/shared_helpers.rb:105:in `rescue in filesystem_access'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/shared_helpers.rb:102:in `filesystem_access'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/rubygems_integration.rb:494:in `block in download_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/retry.rb:40:in `run'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/retry.rb:30:in `attempt'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/rubygems_integration.rb:485:in `download_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/source/rubygems.rb:530:in `download_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/source/rubygems.rb:479:in `fetch_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/source/rubygems.rb:165:in `install'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/gem_installer.rb:54:in `install'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/gem_installer.rb:16:in `install_from_spec'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/parallel_installer.rb:186:in `do_install'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/parallel_installer.rb:177:in `block in worker_pool'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:62:in `apply_func'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:57:in `block in process_queue'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:54:in `loop'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:54:in `process_queue'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:91:in `block (2 levels) in create_threads'

An error occurred while installing minitest (5.17.0), and Bundler cannot continue.

In Gemfile:
rails was resolved to 7.0.4, which depends on
actioncable was resolved to 7.0.4, which depends on
actionpack was resolved to 7.0.4, which depends on
actionview was resolved to 7.0.4, which depends on
rails-dom-testing was resolved to 2.0.3, which depends on
activesupport was resolved to 7.0.4, which depends on
minitest


Bundler::PermissionError: There was an error while trying to write to `/usr/local/bundle/cache/racc-1.6.2.gem`. It is likely that you need to grant write permissions for that path.
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/shared_helpers.rb:105:in `rescue in filesystem_access'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/shared_helpers.rb:102:in `filesystem_access'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/rubygems_integration.rb:494:in `block in download_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/retry.rb:40:in `run'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/retry.rb:30:in `attempt'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/rubygems_integration.rb:485:in `download_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/source/rubygems.rb:530:in `download_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/source/rubygems.rb:479:in `fetch_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/source/rubygems.rb:165:in `install'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/gem_installer.rb:54:in `install'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/gem_installer.rb:16:in `install_from_spec'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/parallel_installer.rb:186:in `do_install'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/parallel_installer.rb:177:in `block in worker_pool'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:62:in `apply_func'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:57:in `block in process_queue'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:54:in `loop'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:54:in `process_queue'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:91:in `block (2 levels) in create_threads'

An error occurred while installing racc (1.6.2), and Bundler cannot continue.

In Gemfile:
rails was resolved to 7.0.4, which depends on
actioncable was resolved to 7.0.4, which depends on
actionpack was resolved to 7.0.4, which depends on
actionview was resolved to 7.0.4, which depends on
rails-dom-testing was resolved to 2.0.3, which depends on
nokogiri was resolved to 1.14.2, which depends on
racc


Bundler::PermissionError: There was an error while trying to write to `/usr/local/bundle/cache/date-3.3.3.gem`. It is likely that you need to grant write permissions for that path.
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/shared_helpers.rb:105:in `rescue in filesystem_access'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/shared_helpers.rb:102:in `filesystem_access'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/rubygems_integration.rb:494:in `block in download_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/retry.rb:40:in `run'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/retry.rb:30:in `attempt'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/rubygems_integration.rb:485:in `download_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/source/rubygems.rb:530:in `download_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/source/rubygems.rb:479:in `fetch_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/source/rubygems.rb:165:in `install'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/gem_installer.rb:54:in `install'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/gem_installer.rb:16:in `install_from_spec'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/parallel_installer.rb:186:in `do_install'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/parallel_installer.rb:177:in `block in worker_pool'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:62:in `apply_func'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:57:in `block in process_queue'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:54:in `loop'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:54:in `process_queue'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:91:in `block (2 levels) in create_threads'

An error occurred while installing date (3.3.3), and Bundler cannot continue.

In Gemfile:
rails was resolved to 7.0.4, which depends on
actionmailbox was resolved to 7.0.4, which depends on
mail was resolved to 2.8.1, which depends on
net-imap was resolved to 0.3.4, which depends on
date


Bundler::PermissionError: There was an error while trying to write to `/usr/local/bundle/cache/timeout-0.3.2.gem`. It is likely that you need to grant write permissions for that path.
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/shared_helpers.rb:105:in `rescue in filesystem_access'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/shared_helpers.rb:102:in `filesystem_access'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/rubygems_integration.rb:494:in `block in download_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/retry.rb:40:in `run'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/retry.rb:30:in `attempt'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/rubygems_integration.rb:485:in `download_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/source/rubygems.rb:530:in `download_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/source/rubygems.rb:479:in `fetch_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/source/rubygems.rb:165:in `install'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/gem_installer.rb:54:in `install'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/gem_installer.rb:16:in `install_from_spec'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/parallel_installer.rb:186:in `do_install'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/parallel_installer.rb:177:in `block in worker_pool'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:62:in `apply_func'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:57:in `block in process_queue'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:54:in `loop'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:54:in `process_queue'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:91:in `block (2 levels) in create_threads'

An error occurred while installing timeout (0.3.2), and Bundler cannot continue.

In Gemfile:
rails was resolved to 7.0.4, which depends on
actionmailbox was resolved to 7.0.4, which depends on
mail was resolved to 2.8.1, which depends on
net-imap was resolved to 0.3.4, which depends on
net-protocol was resolved to 0.2.1, which depends on
timeout


Bundler::PermissionError: There was an error while trying to write to `/usr/local/bundle/cache/bindex-0.8.1.gem`. It is likely that you need to grant write permissions for that path.
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/shared_helpers.rb:105:in `rescue in filesystem_access'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/shared_helpers.rb:102:in `filesystem_access'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/rubygems_integration.rb:494:in `block in download_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/retry.rb:40:in `run'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/retry.rb:30:in `attempt'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/rubygems_integration.rb:485:in `download_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/source/rubygems.rb:530:in `download_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/source/rubygems.rb:479:in `fetch_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/source/rubygems.rb:165:in `install'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/gem_installer.rb:54:in `install'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/gem_installer.rb:16:in `install_from_spec'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/parallel_installer.rb:186:in `do_install'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/parallel_installer.rb:177:in `block in worker_pool'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:62:in `apply_func'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:57:in `block in process_queue'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:54:in `loop'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:54:in `process_queue'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:91:in `block (2 levels) in create_threads'

An error occurred while installing bindex (0.8.1), and Bundler cannot continue.

In Gemfile:
web-console was resolved to 4.2.0, which depends on
bindex


Bundler::PermissionError: There was an error while trying to write to `/usr/local/bundle/cache/msgpack-1.6.0.gem`. It is likely that you need to grant write permissions for that path.
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/shared_helpers.rb:105:in `rescue in filesystem_access'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/shared_helpers.rb:102:in `filesystem_access'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/rubygems_integration.rb:494:in `block in download_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/retry.rb:40:in `run'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/retry.rb:30:in `attempt'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/rubygems_integration.rb:485:in `download_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/source/rubygems.rb:530:in `download_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/source/rubygems.rb:479:in `fetch_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/source/rubygems.rb:165:in `install'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/gem_installer.rb:54:in `install'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/gem_installer.rb:16:in `install_from_spec'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/parallel_installer.rb:186:in `do_install'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/parallel_installer.rb:177:in `block in worker_pool'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:62:in `apply_func'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:57:in `block in process_queue'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:54:in `loop'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:54:in `process_queue'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:91:in `block (2 levels) in create_threads'

An error occurred while installing msgpack (1.6.0), and Bundler cannot continue.

In Gemfile:
bootsnap was resolved to 1.12.0, which depends on
msgpack


Bundler::PermissionError: There was an error while trying to write to `/usr/local/bundle/cache/regexp_parser-2.7.0.gem`. It is likely that you need to grant write permissions for that path.
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/shared_helpers.rb:105:in `rescue in filesystem_access'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/shared_helpers.rb:102:in `filesystem_access'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/rubygems_integration.rb:494:in `block in download_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/retry.rb:40:in `run'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/retry.rb:30:in `attempt'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/rubygems_integration.rb:485:in `download_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/source/rubygems.rb:530:in `download_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/source/rubygems.rb:479:in `fetch_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/source/rubygems.rb:165:in `install'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/gem_installer.rb:54:in `install'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/gem_installer.rb:16:in `install_from_spec'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/parallel_installer.rb:186:in `do_install'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/parallel_installer.rb:177:in `block in worker_pool'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:62:in `apply_func'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:57:in `block in process_queue'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:54:in `loop'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:54:in `process_queue'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:91:in `block (2 levels) in create_threads'

An error occurred while installing regexp_parser (2.7.0), and Bundler cannot continue.

In Gemfile:
capybara was resolved to 3.37.1, which depends on
regexp_parser


Bundler::PermissionError: There was an error while trying to write to `/usr/local/bundle/cache/childprocess-4.1.0.gem`. It is likely that you need to grant write permissions for that path.
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/shared_helpers.rb:105:in `rescue in filesystem_access'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/shared_helpers.rb:102:in `filesystem_access'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/rubygems_integration.rb:494:in `block in download_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/retry.rb:40:in `run'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/retry.rb:30:in `attempt'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/rubygems_integration.rb:485:in `download_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/source/rubygems.rb:530:in `download_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/source/rubygems.rb:479:in `fetch_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/source/rubygems.rb:165:in `install'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/gem_installer.rb:54:in `install'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/gem_installer.rb:16:in `install_from_spec'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/parallel_installer.rb:186:in `do_install'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/parallel_installer.rb:177:in `block in worker_pool'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:62:in `apply_func'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:57:in `block in process_queue'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:54:in `loop'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:54:in `process_queue'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:91:in `block (2 levels) in create_threads'

An error occurred while installing childprocess (4.1.0), and Bundler cannot continue.

In Gemfile:
webdrivers was resolved to 5.0.0, which depends on
selenium-webdriver was resolved to 4.2.0, which depends on
childprocess


Bundler::PermissionError: There was an error while trying to write to `/usr/local/bundle/cache/io-console-0.6.0.gem`. It is likely that you need to grant write permissions for that path.
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/shared_helpers.rb:105:in `rescue in filesystem_access'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/shared_helpers.rb:102:in `filesystem_access'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/rubygems_integration.rb:494:in `block in download_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/retry.rb:40:in `run'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/retry.rb:30:in `attempt'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/rubygems_integration.rb:485:in `download_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/source/rubygems.rb:530:in `download_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/source/rubygems.rb:479:in `fetch_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/source/rubygems.rb:165:in `install'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/gem_installer.rb:54:in `install'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/gem_installer.rb:16:in `install_from_spec'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/parallel_installer.rb:186:in `do_install'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/parallel_installer.rb:177:in `block in worker_pool'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:62:in `apply_func'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:57:in `block in process_queue'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:54:in `loop'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:54:in `process_queue'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:91:in `block (2 levels) in create_threads'

An error occurred while installing io-console (0.6.0), and Bundler cannot continue.

In Gemfile:
debug was resolved to 1.5.0, which depends on
irb was resolved to 1.6.2, which depends on
reline was resolved to 0.3.2, which depends on
io-console


Bundler::PermissionError: There was an error while trying to write to `/usr/local/bundle/cache/rubyzip-2.3.2.gem`. It is likely that you need to grant write permissions for that path.
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/shared_helpers.rb:105:in `rescue in filesystem_access'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/shared_helpers.rb:102:in `filesystem_access'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/rubygems_integration.rb:494:in `block in download_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/retry.rb:40:in `run'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/retry.rb:30:in `attempt'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/rubygems_integration.rb:485:in `download_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/source/rubygems.rb:530:in `download_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/source/rubygems.rb:479:in `fetch_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/source/rubygems.rb:165:in `install'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/gem_installer.rb:54:in `install'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/gem_installer.rb:16:in `install_from_spec'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/parallel_installer.rb:186:in `do_install'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/parallel_installer.rb:177:in `block in worker_pool'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:62:in `apply_func'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:57:in `block in process_queue'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:54:in `loop'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:54:in `process_queue'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:91:in `block (2 levels) in create_threads'

An error occurred while installing rubyzip (2.3.2), and Bundler cannot continue.

In Gemfile:
webdrivers was resolved to 5.0.0, which depends on
selenium-webdriver was resolved to 4.2.0, which depends on
rubyzip


Bundler::PermissionError: There was an error while trying to write to `/usr/local/bundle/cache/websocket-1.2.9.gem`. It is likely that you need to grant write permissions for that path.
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/shared_helpers.rb:105:in `rescue in filesystem_access'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/shared_helpers.rb:102:in `filesystem_access'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/rubygems_integration.rb:494:in `block in download_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/retry.rb:40:in `run'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/retry.rb:30:in `attempt'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/rubygems_integration.rb:485:in `download_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/source/rubygems.rb:530:in `download_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/source/rubygems.rb:479:in `fetch_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/source/rubygems.rb:165:in `install'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/gem_installer.rb:54:in `install'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/gem_installer.rb:16:in `install_from_spec'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/parallel_installer.rb:186:in `do_install'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/parallel_installer.rb:177:in `block in worker_pool'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:62:in `apply_func'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:57:in `block in process_queue'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:54:in `loop'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:54:in `process_queue'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:91:in `block (2 levels) in create_threads'

An error occurred while installing websocket (1.2.9), and Bundler cannot continue.

In Gemfile:
webdrivers was resolved to 5.0.0, which depends on
selenium-webdriver was resolved to 4.2.0, which depends on
websocket


Bundler::PermissionError: There was an error while trying to write to `/usr/local/bundle/cache/sprockets-4.2.0.gem`. It is likely that you need to grant write permissions for that path.
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/shared_helpers.rb:105:in `rescue in filesystem_access'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/shared_helpers.rb:102:in `filesystem_access'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/rubygems_integration.rb:494:in `block in download_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/retry.rb:40:in `run'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/retry.rb:30:in `attempt'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/rubygems_integration.rb:485:in `download_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/source/rubygems.rb:530:in `download_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/source/rubygems.rb:479:in `fetch_gem'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/source/rubygems.rb:165:in `install'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/gem_installer.rb:54:in `install'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/gem_installer.rb:16:in `install_from_spec'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/parallel_installer.rb:186:in `do_install'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/installer/parallel_installer.rb:177:in `block in worker_pool'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:62:in `apply_func'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:57:in `block in process_queue'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:54:in `loop'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:54:in `process_queue'
/usr/local/bundle/gems/bundler-2.3.14/lib/bundler/worker.rb:91:in `block (2 levels) in create_threads'

An error occurred while installing sprockets (4.2.0), and Bundler cannot continue.

In Gemfile:
sprockets-rails was resolved to 3.4.2, which depends on
sprockets
</details>

Dockerfile で `/usr/local/bundle` 以下を書き込み可能にする

再実行

```shell
bundle install
```

Web コンソールへのアクセス許可を追加

`app/hello_app/config/environments/development.rb`

```ruby
  config.web_console.whitelisted_ips = '0.0.0.0/0'
```
