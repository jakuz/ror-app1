
# 4. Napisać pętlę, która przeiteruje się przez Comment i wyrzuci na konsolę ich autorów. (można użyć puts)
for comment in Comment.all do
    puts "Author of the comment no.#{comment.id}: #{comment.user.name}"
end; 0


# 5. Napisać query, które wyciągnie z bazy wszystkie obiekty Post użytkownika o podanym name.
User.find_by(name: 'Jan Kowalski').posts # 1. sposób
Post.joins(:user).where(users: { name: 'Jan Kowalski' }) # 2. sposób


# 6. Napisać query, które wyciągnie z bazy wszystkie obiekty Comment użytkownika o podanym name.
User.find_by(name: 'Jan Kowalski').comments
Comment.joins(:user).where(users: { name: 'Jan Kowalski' }) # 2. sposób


# 6. (trudne) Napisać query, które wyciągnie z bazy wszystkie obiekty Comment użytkownika o podanym name i podanym tytule posta.
Comment.joins(:user).where(users: { name: 'Jan Kowalski' }).joins(:post).where(posts: { title: 'Tytuł posta #2' })
Comment.joins(:user, :post).where(users: { name: 'Jan Kowalski' }, posts: { title: 'Tytuł posta #2' }) # krótszy zapis 


# 7. (trudne) Stworzyć jeszcze jeden obiekt Comment, którego pole created_at jest ustawione na datę jutrzejszą.
# Napisać query, które wyciągnie z bazy wszystkie wiadomości, które zostały stworzone wcześniej niż 5 minut temu i mają więcej niż 100 znaków.
Comment.create!(post_id: 1, user_id: 4, content: "Tomorrow's comment of user #4", created_at: (DateTime.now + 1))

input = { created_at_threshold: DateTime.now - 5.minutes, comment_length_threshold: 100 }
Comment.where("created_at < ? AND length(content) > ?", input[:created_at_threshold], input[:comment_length_threshold])

