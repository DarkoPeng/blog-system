CREATE DATABASE IF NOT EXISTS blog_system;

CREATE TABLE user (
    id          INT PRIMARY KEY AUTO_INCREMENT,
    username    VARCHAR(50) NOT NULL,
    password    VARCHAR(50) NOT NULL,
    e
    mail       VARCHAR(50) NOT NULL,
    create_at   DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_at   DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_admin    BOOL DEFAULT FALSE,
    is_blocked  BOOL DEFAULT FALSE
);

CREATE TABLE article (
    id             INT PRIMARY KEY AUTO_INCREMENT,
    title          VARCHAR(100) NOT NULL,
    content        TEXT NOT NULL,
    author_id      INT NOT NULL,
    category_id    INT NOT NULL,
    tag_ids        VARCHAR(255),
    create_at      DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_at      DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    view_count     INT DEFAULT 0,
    like_count     INT DEFAULT 0,
    share_count    INT DEFAULT 0,
    FOREIGN KEY (author_id) REFERENCES user(id),
    FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE category (
    id         INT PRIMARY KEY AUTO_INCREMENT,
    name       VARCHAR(50) NOT NULL,
    create_at  DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_at  DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE comment (
    id          INT PRIMARY KEY AUTO_INCREMENT,
    content     TEXT NOT NULL,
    author_id   INT NOT NULL,
    article_id  INT NOT NULL,
    parent_id   INT,
    create_at   DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_at   DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_approved BOOL DEFAULT FALSE,
    FOREIGN KEY (author_id) REFERENCES user(id),
    FOREIGN KEY (article_id) REFERENCES article(id)
);

CREATE TABLE like (
    id          INT PRIMARY KEY AUTO_INCREMENT,
    user_id     INT NOT NULL,
    article_id  INT NOT NULL,
    create_at   DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (article_id) REFERENCES article(id)
);

CREATE TABLE share (
    id          INT PRIMARY KEY AUTO_INCREMENT,
    user_id     INT NOT NULL,
    article_id  INT NOT NULL,
    create_at   DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (article_id) REFERENCES article(id)
);