-- 1  => 27 records

select m.title , m.description , d.full_name , json_arrayagg(w.full_name) as writers, m.`length` , m.rating
from movie m
left join director d
	on m.id_director = d.id 
left join movie_writers mw 
	on m.id = mw.id_movie 
left join writers w 
	on mw.id_writer = w.id 
where m.id_title_type = (select tt.id from title_type tt where tt.name = 'MOVIE')
group by m.id 
	
-- 2 => 10 records
select m.name , count(m2.id) as number_movies
from manufacturer m 
left join movie_manufacturer mm 
	on m.id = mm.id_manufacturer 
left join movie m2 
	on mm.id_movie = m2.id 
group by m.id 	
	
-- 3 => 10 records

select m.* 
from movie m 
inner join title_type tt 
	on m.id_title_type = tt.id 
where m.episode  = m.current_episode and tt.name = 'TV Series'

-- 4 => 150 records

select m.title , t.link as link_trailer
from movie m 
left join movie_trailer mt 
	on m.id = mt.id_movie 
left join trailer t 
	on mt.id_trailer = t.id 
where mt.status = 'active'

-- 5 = 27 records
select m.title , m.description , m.poster, m.`length` , m.imdb 
from movie m 
where m.id_title_type = (select tt.id from title_type tt where tt.name = 'Movie')
order by m.imdb desc

-- 6  => 52 records
select m.title, m.description, m.poster, m.`length`, json_arrayagg(g.name) as genres_name, m.episode , m.current_episode 
from movie m 
left join movie_genres mg 
	on m.id = mg.id_movie 
left join genres g 
	on mg.id_genres = g.id 
where m.id_title_type = (select tt.id from title_type tt where tt.name = 'TV Mini Series')	
group by m.id
order by m.release_date desc
	
-- 7 => 10 records
select m.title , m.description , d.full_name, json_arrayagg(w.full_name) as writers, m.poster , m.`length`, json_arrayagg(g.name) as genres, json_arrayagg(a.full_name) as actors 
from movie m 
left join director d 
	on m.id_director = d.id 
left join movie_writers mw 
	on m.id = mw.id_movie 
left join writers w 
	on mw.id_writer = w.id 
left join movie_genres mg 
	on m.id = mg.id_movie 
left join genres g 
	on mg.id_genres = g.id 
left join movie_actor ma 
	on m.id  = ma.id_movie 
left join actor a 
	on ma.id_actor = a.id 
where m.id_title_type = (select tt.id from title_type tt where tt.name = 'Movie')	
group by m.id 
order by m.imdb desc
limit 10