CREATE TABLE IF NOT EXISTS worker (
    id IDENTITY PRIMARY KEY,
    name VARCHAR(1000) NOT NULL,
    birthday DATE CHECK (birthday > '1900-12-31'),
    level ENUM('Trainee', 'Junior', 'Middle', 'Senior') NOT NULL,
    salary INT CHECK (salary >= 100 AND salary < 100000), CONSTRAINT namechk CHECK (LENGTH(name) >= 2)
)


CREATE TABLE IF NOT EXISTS client (
    id IDENTITY PRIMARY KEY,
    name VARCHAR(1000) NOT NULL,
    CONSTRAINT name_check CHECK (LENGTH(name) >= 2)
)


CREATE TABLE IF NOT EXISTS project (
    id IDENTITY PRIMARY KEY,
    client_id INT NOT NULL,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE CHECK (start_date > '1990-12-31'),  
    finish_date DATE CHECK (finish_date > '1990-12-31'),
    CONSTRAINT project_client_id_fk FOREIGN KEY (client_id) 
    REFERENCES client(id)
)


CREATE TABLE IF NOT EXISTS project_worker (
    project_id INT NOT NULL,
    worker_id INT NOT NULL,
    CONSTRAINT project_worker_pk PRIMARY KEY (project_id, worker_id),
    CONSTRAINT project_worker_project_id_fk FOREIGN KEY (project_id) 
    REFERENCES project(id),
    CONSTRAINT project_worker_worker_id_fk FOREIGN KEY (worker_id) 
    REFERENCES worker(id)
)

