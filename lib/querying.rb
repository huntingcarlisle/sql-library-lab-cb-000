def select_books_titles_and_years_in_first_series_order_by_year
  "
  SELECT books.title, books.year
  FROM books
  WHERE series_id = 1
  ORDER BY year;
  "
end

def select_name_and_motto_of_char_with_longest_motto
  "
  SELECT name, motto
  FROM characters
  ORDER BY LENGTH(motto) DESC
  LIMIT 1;
  "
end


def select_value_and_count_of_most_prolific_species
  "
  SELECT species, COUNT(*)
  FROM characters
  GROUP BY species
  ORDER BY 2 DESC
  LIMIT 1;
  "
end

def select_name_and_series_subgenres_of_authors
  "
  WITH subgenres_by_series AS (
    SELECT series.author_id AS ai, series.subgenre_id, subgenres.name AS sg
    FROM subgenres
    JOIN series ON subgenres.id = series.subgenre_id)
  SELECT authors.name, subgenres_by_series.sg
  FROM authors
  JOIN subgenres_by_series ON authors.id = subgenres_by_series.ai;
  "
end

def select_series_title_with_most_human_characters
  "
  WITH filtered_characters AS (
    SELECT series_id, COUNT(*) AS number
    FROM characters
    WHERE species = 'human'
    GROUP BY series_id)
  SELECT series.title
  FROM series
  JOIN filtered_characters ON series.id = filtered_characters.series_id
  ORDER BY filtered_characters.number DESC
  LIMIT 1;
  "
end

def select_character_names_and_number_of_books_they_are_in
  "
  Join character_books to books.name on id as c_b_b
  Join characters to c_b_b.name on id
  WITH c_b_b AS (
    SELECT character_books
  )
  "
end
