/Q1
CREATE TABLE departments (
    department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);



/Q2
ALTER TABLE people 
ADD COLUMN department_id INT UNSIGNED AFTER email;

/Q3
-- 部署追加
INSERT INTO departments (name)
VALUES 
  ('営業'), ('開発'), ('経理'), ('人事'), ('情報システム');

追加する人の条件(people)
10人分のレコードを追加する
人数比率は営業3人、開発4人、経理1人、人事1人、情報システム1人
-- 人追加
INSERT INTO people (name, email, department_id, age, gender)
VALUES 
  ('田中太郎', 'tanaka@example.com', 1, 28, 1),
  ('鈴木一郎', 'suzuki@example.com', 1, 33, 1),
  ('佐藤花子', 'sato@example.com', 1, 25, 2),
  ('山本健', 'yamamoto@example.com', 2, 30, 1),
  ('高橋陽子', 'takahashi@example.com', 2, 27, 2),
  ('井上翔', 'inoue@example.com', 2, 29, 1),
  ('中村優', 'nakamura@example.com', 2, 31, 1),
  ('渡辺綾', 'watanabe@example.com', 3, 35, 2),
  ('小林直樹', 'kobayashi@example.com', 4, 26, 1),
  ('加藤真由', 'kato@example.com', 5, 24, 2);

追加する日報の条件(reports)
10件の日報を追加する
日報は誰に紐付けてもいいが、存在しないperson_idとは紐付けない
日報の文字数は最低10文字で、同じ日報を作成しない
-- 日報追加
INSERT INTO reports (person_id, content)
VALUES 
  (1, '今日は営業先を3件訪問しました。'),
  (2, 'クライアントと商談を行いました。'),
  (3, '新規顧客への電話対応をしました。'),
  (4, 'バックエンドのバグを修正しました。'),
  (5, 'UIデザインの改善案を提出しました。'),
  (6, 'コードレビューを実施しました。'),
  (7, '開発ミーティングに参加しました。'),
  (8, '経費処理を行いました。'),
  (9, '新入社員の面接を担当しました。'),
  (10, '社内ネットワークの設定を変更しました。');



/Q4
テーブルとレコードを追加しましたが、peopleテーブルに不完全なデータが混ざっています。
まずは以下のクエリを実行してレコードを取得してみましょう。

条件
存在する部署のIDが割り振られること
どう割り振るかは指定しませんが、必ずWHEREを使って条件を絞ってください/

UPDATE people
SET department_id = 1
WHERE department_id IS NULL;


/Q5
年齢の降順で男性の名前と年齢を取得してください。/

SELECT name, age FROM people WHERE gender = 1 ORDER BY age DESC;


/Q6
テーブル・レコード・カラムという3つの単語を適切に使用して、下記のSQL文を日本語で説明してください。

SELECT
  `name`, `email`, `age`
FROM
  `people`
WHERE
  `department_id` = 1
ORDER BY
  `created_at`;/

 peopleテーブルの中から、
 department_idカラムの値が1であるレコードを探して、
 そのレコードの中の
 nameカラム、emailカラム、 ageカラムのデータを取り出し、
 created_atカラムの値が古い順に並べる。


  Q7
20代の女性と40代の男性の名前一覧を取得してください。
SELECT name
FROM people
WHERE (gender = 2 AND age BETWEEN 20 AND 29)
   OR (gender = 1 AND age BETWEEN 40 AND 49);


Q8
営業部に所属する人だけを年齢の昇順で取得してください。
SELECT p.*
FROM people AS p
JOIN departments AS d ON p.department_id = d.department_id
WHERE d.name = '営業'
ORDER BY p.age ASC;


Q9
開発部に所属している女性の平均年齢を取得してください。

条件
カラム名はaverage_ageとなるようにしましょう

SELECT AVG(p.age) AS average_age
FROM people AS p
JOIN departments AS d ON p.department_id = d.department_id
WHERE d.name = '開発' AND p.gender = 2;


Q10
名前と部署名とその人が提出した日報の内容を同時に取得してください。（日報を提出していない人は含めない）
SELECT p.name, d.name AS department_name, r.content
FROM people AS p
JOIN departments AS d ON p.department_id = d.department_id
JOIN reports AS r ON p.person_id = r.person_id;


Q11
日報を一つも提出していない人の名前一覧を取得してください。

SELECT name
FROM people
WHERE person_id NOT IN (
    SELECT person_id FROM reports
);



