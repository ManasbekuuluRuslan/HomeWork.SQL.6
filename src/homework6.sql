create type Genre as enum(
    'DETECTIVE',
    'DRAMA',
    'HISTORY',
    'ROMANCE',
    'BIOGRAPHY',
    'FANTASY'            );

create type Gender as enum(
    'MALE','FEMALE'       );

create table publishers(
                           id serial primary key,
                           name varchar
);
insert into publishers(name)
values ('RELX Group'),
       ('Thomson Reuters'),
       ('Holtzbrinck Publishing Group'),
       ('Shanghai Jiao Tong University Press'),
       ('Wolters Kluwer'),
       ('Hachette Livre'),
       ('Aufbau-Verlag'),
       ('Macmillan'),
       ('Harper Collins'),
       ('China Publishing Group'),
       ('Springer Nature'),
       ('Grupo Planeta'),
       ('Books.Ru Ltd.St Petersburg'),
       ('The Moscow Times'),
       ('Zhonghua Book Company');

create table authors(
                        id serial primary key ,
                        first_name varchar,
                        last_name varchar,
                        email varchar,
                        date_of_birth date,
                        country varchar,
                        Gender gender
);
alter table authors add unique (email);

insert into authors(first_name, last_name, email, date_of_birth, country, Gender)
values ('Sybilla', 'Toderbrugge', 'stoderbrugge0@jugem.jp', '1968-9-25', 'France','FEMALE'),
       ('Patti', 'Walster', 'pwalster1@addtoany.com', '1965-10-31', 'China','MALE'),
       ('Sonnie', 'Emmens', 'semmens2@upenn.edu', '1980-5-16', 'Germany','MALE'),
       ('Brand', 'Burel', 'bburel3@ovh.net', '1964-4-24', 'United States','MALE'),
       ('Silvan', 'Smartman', 'ssmartman4@spiegel.de', '1967-7-3', 'France','MALE'),
       ('Alexey', 'Arnov', 'larnoldi5@writer.com', '1964-12-29', 'Russia','MALE'),
       ('Bunni', 'Aggio', 'baggio6@yahoo.co.jp', '1983-12-14', 'China','FEMALE'),
       ('Viole', 'Sarath', 'vsarath7@elegantthemes.com', '1960-1-29', 'United States','FEMALE'),
       ('Boigie', 'Etridge', 'betridge8@ed.gov', '1978-11-17', 'France','MALE'),
       ('Hilliard', 'Burnsyde', 'hburnsyde9@omniture.com', '1962-9-8', 'Germany','MALE'),
       ('Margarita', 'Bartova', 'mbartova@example.com', '1984-12-3', 'Russia','FEMALE'),
       ('Innis', 'Hugh', 'ihughb@marriott.com', '1983-8-28', 'Germany','MALE'),
       ('Lera', 'Trimnella', 'ltrimnellc@msn.com', '1980-3-28', 'Russia','FEMALE'),
       ('Jakob', 'Bransby', 'jbransbyd@nasa.gov', '1966-8-5', 'Spain','MALE'),
       ('Loretta', 'Gronaver', 'lgronavere@technorati.com', '1962-10-17', 'United States','FEMALE');

update authors set Gender = 'FEMALE' where id in(1,7,8,11,13,15);
update authors set Gender = 'MALE' where id in(2,3,4,5,6,9,10,12,14);

create table books(
                      id serial primary key ,
                      name varchar,
                      country varchar,
                      published_year date,
                      price numeric,
                      Genre genre
);
alter table books add column language_id int references languages(id);
alter table books add column publisher_id int references publishers(id);
alter table books add column author_id int references authors(id);

insert into books(name, country, published_year, price, Genre, language_id, publisher_id, author_id)
values('Taina', 'Russia', '2021-11-12', '568','DETECTIVE', 5, 12, 6),
      ('Zvezdopad', 'Russia', '2004-12-9', '446', 'ROMANCE', 5, 13, 11),
      ('Homo Faber', 'Germany', '2022-4-10', '772','FANTASY',3,5,3),
      ('Der Richter und Sein Henker', 'Germany', '2011-2-1', '780','DETECTIVE',3,3,10),
      ('Lord of the Flies', 'United States', '2015-7-11', '900','FANTASY',1,2,4),
      ('Un soir au club', 'France', '2018-1-12', '480','DRAMA',2,1,1),
      ('Voina', 'Russia', '2004-12-6', '880',  'HISTORY',5,4,13),
      ('Sun Tzu', 'China', '2022-9-5', '349',  'HISTORY',4,4,2),
      ('Emil und die Detektive', 'Germany', '2010-6-11', '228','DETECTIVE',3,5,10),
      ('Coule la Seine', 'France', '2015-3-1', '732','FANTASY',2,6,1),
      ('Love and hatred', 'Russia', '2012-2-3', '763', 'ROMANCE',5,14,13),
      ('Fantastic Mr Fox', 'United States', '2018-3-10', '309','FANTASY',1,9,8),
      ('Contes de la Bécasse', 'France', '2019-10-5', '378', 'ROMANCE',2,6,9),
      ('“The Death of Ivan Ilyich', 'Russia', '2000-9-24', '814','DRAMA',5,6,6),
      ('Bonjour Tristesse', 'France', '2015-8-2', '502', 'ROMANCE',2,8,5),
      ('Die Verwandlung', 'Germany', '2008-6-19', '305', 'DETECTIVE',3,7,12),
      ('The Inspector Barlach Mysteries', 'Germany', '2007-3-10', '566','DETECTIVE',3,3,3),
      ('LÉtranger', 'France', '2017-11-14', '422', 'ROMANCE',2,8,5),
      ('Lao Tse', 'China', '2005-7-16', '900','FANTASY',4,4,2),
      ('Semya', 'Russia', '2004-4-12', '194','DRAMA',5,13,11),
      ('Empty World', 'United States', '2008-1-4', '324','FANTASY',1,11,15),
      ('Domainer', 'Germany', '2020-1-6', '420', 'ROMANCE',3,5,10),
      ('The Fault in Our Stars', 'United States', '2008-2-13', '396', 'ROMANCE',1,9,4),
      ('Die R uber', 'Germany', '2020-6-25', '300', 'ROMANCE',3,7,12),
      ('Jung Chang', 'China', '2021-5-14', '600',  'HISTORY',4,10,7),
      ('Les Aventures de Tintin', 'France', '2015-4-10', '582','DRAMA',2,1,5),
      ('Unvollendete Geschichte', 'Germany', '2010-12-12', '269','DETECTIVE',3,5,10),
      ('Amy Tan', 'China', '2023-1-9', '486','DRAMA',4,4,7),
      ('Krasnaya luna', 'Russia', '2020-2-7', '550','FANTASY',5,12,11),
      ('Emma', 'United States', '2021-10-11', '599', 'BIOGRAPHY',1,2,15);

update books set Genre = 'DETECTIVE' where id in(1,4,9,16,17,27);
update books set Genre = 'ROMANCE' where  id in(2,11,13,15,18,22,23,24);
update books set Genre = 'FANTASY' where id in(3,5,10,12,19,21,23,29);
update books set Genre = 'DRAMA' where id in(6,14,20,26,28);
update books set Genre = 'HISTORY' where id in(7,8,25);
update books set Genre = 'BIOGRAPHY' where id in(30);

create table languages(
                          id serial primary key ,
                          language varchar not null
);

insert into languages(language)
values ('English'),
       ('French'),
       ('German'),
       ('Chinese'),
       ('Russian'),
       ('Spanish');
------------------------------------------- Zaprosy->

select distinct country from authors;
select name,published_year,Genre from books;
select * from books where published_year between '2020-1-1' and '2023-1-1';
select name,Genre from books where Genre = 'DETECTIVE';
select concat(first_name,' ',last_name) as author from authors;
select concat(first_name,' ',last_name) as author from authors
where country in('Germany','France')  order by author asc;
select name,country,published_year,price,Genre from books
where Genre <> 'ROMANCE' group by name, country, published_year,price,Genre having price< 500;
select * from authors where Gender = 'FEMALE' limit 3;
select * from authors where Gender = 'FEMALE' and email like '%.com' and first_name like '____';
select country,count(*) as count from authors group by country;
select country from authors  group by country having count(country)=3 order by country asc ;
select sum(price) from books;
select min(price)  as min_price from books where Genre in ('ROMANCE','DETECTIVE');
select name,Genre, count(*) as count from books where Genre in ('HISTORY','BIOGRAPHY') group by name, Genre;
select b.name,p.name as publisher,j.language from books as b join publishers p on b.publisher_id = p.id
                                                             join languages j on b.language_id = j.id;
select * from authors left join publishers p on not null;
select concat(a.first_name,' ',a.last_name) as author_full_name, b.name as
                                               book_name from books as b right join authors a on b.author_id = a.id;
select language,count(*) as books_count from languages as l join books b
on l.id = b.language_id group by language order by books_count desc ;
select p.name as publisher, round(avg(price)) as avg_price from books b join publishers p on b.publisher_id = p.id
group by p.name;
select b.name as book_name, concat(a.first_name,' ',a.last_name) as author_full_name from books b join authors a on
        b.author_id = a.id where b.published_year between '2010-1-1' and '2015-1-1' group by b.name, concat(a.first_name,' ',a.last_name);

select b.name as book_name, concat(a.first_name,' ',a.last_name) as author_full_name,
       sum(price) as sum_author_price from books b join authors a on
        b.author_id = a.id where b.published_year between '2010-1-1' and '2015-1-1'
group by b.name, concat(a.first_name,' ',a.last_name );