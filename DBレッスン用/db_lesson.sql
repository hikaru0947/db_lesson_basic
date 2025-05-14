# Q1
CREATE TABLE departments (
    department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);



# Q2
ALTER TABLE people 
ADD COLUMN department_id INT UNSIGNED AFTER email;

# Q3
INSERT INTO departments (name)
VALUES 
  ('営業'), ('開発'), ('経理'), ('人事'), ('情報システム');

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



# Q4
UPDATE people
SET department_id = 1
WHERE department_id IS NULL;


# Q5
SELECT name, age FROM people WHERE gender = 1 ORDER BY age DESC;


# Q6
SELECT
  `name`, `email`, `age`
FROM
  `people`
WHERE
  `department_id` = 1
ORDER BY
  `created_at`;/

# peopleテーブルの中から、
# department_idカラムの値が1であるレコードを探して、
# そのレコードの中の
# nameカラム、emailカラム、 ageカラムのデータを取り出し、
# created_atカラムの値が古い順に並べる。


# Q7
SELECT name
FROM people
WHERE (gender = 2 AND age BETWEEN 20 AND 29)
   OR (gender = 1 AND age BETWEEN 40 AND 49);


# Q8
SELECT p.*
FROM people AS p
JOIN departments AS d ON p.department_id = d.department_id
WHERE d.name = '営業'
ORDER BY p.age ASC;


# Q9
SELECT AVG(p.age) AS average_age
FROM people AS p
JOIN departments AS d ON p.department_id = d.department_id
WHERE d.name = '開発' AND p.gender = 2;


# Q10
SELECT p.name, d.name AS department_name, r.content
FROM people AS p
JOIN departments AS d ON p.department_id = d.department_id
JOIN reports AS r ON p.person_id = r.person_id;


# Q11
SELECT p.name
FROM people AS p
LEFT JOIN reports AS r ON p.person_id = r.person_id
WHERE r.person_id IS NULL;



