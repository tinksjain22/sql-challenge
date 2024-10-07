

DROP TABLE IF EXISTS 'departments';  	-- Drop the 'departments' table if it exists
DROP TABLE IF EXISTS 'titles'; 			-- Drop the 'titles' table if it exists
DROP TABLE IF EXISTS 'employees';		-- Drop the 'employees' table if it exists
DROP TABLE IF EXISTS 'salaries'; 		-- Drop the 'salaries' table if it exists
DROP TABLE IF EXISTS 'dept_emp'; 		-- Drop the 'dept_emp' table if it exists
DROP TABLE IF EXISTS 'dept_manager'; 	-- Drop the 'dept_manager' table if it exists


-- 1. Create the 'departments' table
CREATE TABLE departments (
    dept_no VARCHAR(10) PRIMARY KEY,       -- Department number is the primary key
    dept_name VARCHAR(100) NOT NULL UNIQUE -- Department name must be unique and not null
);

-- 2. Create the 'titles' table
CREATE TABLE titles (
    title_id VARCHAR(10) PRIMARY KEY,      -- Title ID is the primary key
    title VARCHAR(50) NOT NULL UNIQUE      -- Title must be unique and not null
);

-- 3. Create the 'employees' table
CREATE TABLE employees (
    emp_no INT PRIMARY KEY,                -- Employee number is the primary key
    emp_title_id VARCHAR(10) NOT NULL,     -- Title ID is required and references 'titles'
    birth_date DATE NOT NULL,              -- Birth date is required
    first_name VARCHAR(50) NOT NULL,       -- First name is required
    last_name VARCHAR(50) NOT NULL,        -- Last name is required
    sex CHAR(1) NOT NULL,                  -- Sex is required (M/F)
    hire_date DATE NOT NULL,               -- Hire date is required
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id) -- Foreign key to 'titles'
);

-- 4. Create the 'salaries' table
CREATE TABLE salaries (
    emp_no INT,                             -- Employee number references 'employees'
    salary FLOAT NOT NULL,                  -- Salary is required
    PRIMARY KEY (emp_no),                   -- Employee number is the primary key
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no) -- Foreign key to 'employees'
);

-- 5. Create the 'dept_emp' table
CREATE TABLE dept_emp (
    emp_no INT,                             -- Employee number references 'employees'
    dept_no VARCHAR(10),                    -- Department number references 'departments'
    PRIMARY KEY (emp_no, dept_no),          -- Composite primary key (emp_no, dept_no)
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),  -- Foreign key to 'employees'
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no) -- Foreign key to 'departments'
);

-- 6. Create the 'dept_manager' table
CREATE TABLE dept_manager (
    dept_no VARCHAR(10),                    -- Department number references 'departments'
    emp_no INT,                             -- Employee number references 'employees'
    PRIMARY KEY (dept_no, emp_no),          -- Composite primary key (dept_no, emp_no)
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no), -- Foreign key to 'departments'
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)      -- Foreign key to 'employees'
);

