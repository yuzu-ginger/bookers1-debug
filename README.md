# bookers1 debug
## debugした項目
### 1. ルーティング
homes/topをルートパスにしたい<br>
=> config/routes.rb に`root to: 'homes#top'`を追記
<br><br>
### 2. Homesコントローラのエラー
app/controllers/homes_controller.rbのクラス定義が間違っている<br>
=> `class Controller < ApplicationController`から`class HomesController < ApplicationController`に変更
<br><br>
### 3. topページのstartをクリックしても遷移しない
homes/top.html.erbの記述`<p><%= link_to "start" %></p>`の部分で、遷移先のpathを指定する<br>
=> `<p><%= link_to "start", books_path %></p>`に変更。bookの一覧ページに遷移する
<br><br>
### 4. bookのNoMethodエラー
form_withの1行目`book`がおかしいと書かれる<br>
=> form_withは部分テンプレートでviews/books/_form.html.erbにある<br>
  index.html.erbからは`render`の部分で呼び出している<br>
  ここでbookを指定していないので、index.html.erbの`<%= render 'form' %>`を`<%= render 'form', book:@book %>`に変更
<br><br>
### 5. indexでeditのパスエラー
どのbookの編集画面なのか指定されていない<br>
=> views/index.html.erbの`edit_book_path`を`edit_book_path(book)`に変更
<br><br>
### 6. bookのtitleカラムがない
- `rails db:migrate`を既にした場合
  ```bash
  $ rails db:rollback
  $ rails db:migrate:status  # downと出たらmigrationファイルを編集
  ```
  db/migrate/(作成日時)_create_books.rbに`t.string :title`を追記して`rails db:migrate`<br>
- `rails db:migrate`をまだしていない場合<br>
  db/migrate/(作成日時)_create_books.rbに`t.string :title`を追記して`rails db:migrate`<br>
<br><br>
### 7. updateできない
booksコントローラのupdateアクションで`@book.update()`で指定されていないので、`@book.update(book_params)`に変更<br>
views/books/edit.html.erbのformの部分テンプレートを呼び出す前後で`<form>`タグで括っていて、2重になっているのでこれを消す
