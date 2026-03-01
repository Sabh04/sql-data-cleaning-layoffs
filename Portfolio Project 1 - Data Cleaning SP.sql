-- Data Cleaning

Select *
From layoffs;

-- 1. Remove Duplicates
-- 2. Standardize the data
-- 3. Null values or blank values
-- 4. Remove any Columns or Rows


Create Table layoffs_staging
Like layoffs;

Select *
from layoffs_staging;

Insert layoffs_staging
Select*
From layoffs ;


Select*,
Row_number() over(
Partition by Company, industry, total_laid_off, percentage_laid_off, 'date') as row_num
From layoffs_staging ;

with duplicate_cte as
(
Select*,
Row_number() over(
Partition by Company, location,
 industry, total_laid_off, percentage_laid_off, 'date', stage, country,
 funds_raised_millions) as row_num
From layoffs_staging
)
select*
from duplicate_cte
where row_num > 1;

select*
from layoffs_staging
where company = 'casper';



Select*,
Row_number() over(
Partition by Company, industry, total_laid_off, percentage_laid_off, 'date') as row_num
From layoffs_staging ;

with duplicate_cte as
(
Select*,
Row_number() over(
Partition by Company, location,
 industry, total_laid_off, percentage_laid_off, 'date', stage, country,
 funds_raised_millions) as row_num
From layoffs_staging
)
delete 
from duplicate_cte
where row_num > 1;



CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


Select*
from layoffs_staging2
where row_num > 1;

Insert Into layoffs_staging2
select*,
Row_number() over(
Partition by Company, location,
 industry, total_laid_off, percentage_laid_off, 'date', stage, country,
 funds_raised_millions) as row_num
From layoffs_staging;


delete
from layoffs_staging2
where row_num > 1;

select*
from layoffs_staging2;


-- Strandardizing data

select company,Trim(company)
from layoffs_staging2;

Update layoffs_staging2
set company = Trim(company);

select distinct industry
from layoffs_staging2;

update layoffs_staging2
set industry = 'crypto'
where industry like 'crypto%';

select distinct country, Trim(Trailing '.' from country)
from layoffs_staging2
order by 1;

update layoffs_staging2
set country = Trim(Trailing '.' from country)
where country like 'United States%';

select `date`
From layoffs_staging2;

update layoffs_staging2
set `date` = str_to_date(`date`, '%m/%d/%Y');


Alter table layoffs_staging2
modify column `date` Date;

select*
from layoffs_staging2
where total_laid_off is Null
and percentage_laid_off is null;

update layoffs_staging2
set industry = null
where industry = "";

select *
from layoffs_staging2
where industry is null
or industry = "";


select *
from layoffs_staging2
where company like 'bally%';


select t1.industry, t2.industry
from layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company = t2.company
    and t1.location = t2.location
where (t1.industry is null or t1.industry = '')
and t2.industry is not null;

update layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company = t2.company
set t1.industry = t2.industry
where t1.industry is null 
and t2.industry is not null;


select *
from layoffs_staging2;

select*
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

delete 
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;


select*
from layoffs_staging2;

Alter table layoffs_staging2
drop column row_num;