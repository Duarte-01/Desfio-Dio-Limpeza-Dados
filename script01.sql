-- Cria o schema se não existir
CREATE SCHEMA IF NOT EXISTS azure_company;

-- Utiliza o schema criado
SET search_path TO azure_company;

-- Consulta as constraints do schema
SELECT * FROM information_schema.table_constraints
    WHERE constraint_schema = 'azure_company';

-- Criação da tabela employee
CREATE TABLE employee (
    Fname VARCHAR(15) NOT NULL,
    Minit CHAR,
    Lname VARCHAR(15) NOT NULL,
    Ssn CHAR(9) NOT NULL, 
    Bdate DATE,
    Address VARCHAR(30),
    Sex CHAR,
    Salary DECIMAL(10,2),
    Super_ssn CHAR(9),
    Dno INT NOT NULL DEFAULT 1,
    CONSTRAINT chk_salary_employee CHECK (Salary > 2000.0),
    CONSTRAINT pk_employee PRIMARY KEY (Ssn)
);

-- Adiciona chave estrangeira com ações de deleção e atualização
ALTER TABLE employee 
    ADD CONSTRAINT fk_employee 
    FOREIGN KEY (Super_ssn) REFERENCES employee (Ssn)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Descrição da tabela employee
SELECT column_name, data_type, character_maximum_length
FROM information_schema.columns
WHERE table_name = 'employee';

-- Criação da tabela departament
CREATE TABLE departament (
    Dname VARCHAR(15) NOT NULL,
    Dnumber INT NOT NULL,
    Mgr_ssn CHAR(9) NOT NULL,
    Mgr_start_date DATE, 
    Dept_create_date DATE,
    CONSTRAINT chk_date_dept CHECK (Dept_create_date < Mgr_start_date),
    CONSTRAINT pk_dept PRIMARY KEY (Dnumber),
    CONSTRAINT unique_name_dept UNIQUE (Dname),
    FOREIGN KEY (Mgr_ssn) REFERENCES employee (Ssn)
);

-- Modificação da constraint fk_dept em departament
ALTER TABLE departament
    DROP CONSTRAINT IF EXISTS departament_Mgr_ssn_fkey;
ALTER TABLE departament
    ADD CONSTRAINT fk_dept FOREIGN KEY (Mgr_ssn) REFERENCES employee (Ssn)
    ON UPDATE CASCADE;

-- Descrição da tabela departament
SELECT column_name, data_type, character_maximum_length
FROM information_schema.columns
WHERE table_name = 'departament';

-- Criação da tabela dept_locations
CREATE TABLE dept_locations (
    Dnumber INT NOT NULL,
    Dlocation VARCHAR(15) NOT NULL,
    CONSTRAINT pk_dept_locations PRIMARY KEY (Dnumber, Dlocation),
    CONSTRAINT fk_dept_locations FOREIGN KEY (Dnumber) REFERENCES departament (Dnumber)
);

-- Modificação da constraint fk_dept_locations em dept_locations
ALTER TABLE dept_locations
    DROP CONSTRAINT IF EXISTS dept_locations_Dnumber_fkey;
ALTER TABLE dept_locations
    ADD CONSTRAINT fk_dept_locations FOREIGN KEY (Dnumber) REFERENCES departament (Dnumber)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- Criação da tabela project
CREATE TABLE project (
    Pname VARCHAR(15) NOT NULL,
    Pnumber INT NOT NULL,
    Plocation VARCHAR(15),
    Dnum INT NOT NULL,
    PRIMARY KEY (Pnumber),
    CONSTRAINT unique_project UNIQUE (Pname),
    CONSTRAINT fk_project FOREIGN KEY (Dnum) REFERENCES departament (Dnumber)
);

-- Criação da tabela works_on
CREATE TABLE works_on (
    Essn CHAR(9) NOT NULL,
    Pno INT NOT NULL,
    Hours DECIMAL(3,1) NOT NULL,
    PRIMARY KEY (Essn, Pno),
    CONSTRAINT fk_employee_works_on FOREIGN KEY (Essn) REFERENCES employee (Ssn),
    CONSTRAINT fk_project_works_on FOREIGN KEY (Pno) REFERENCES project (Pnumber)
);

-- Criação da tabela dependent
DROP TABLE IF EXISTS dependent;
CREATE TABLE dependent (
    Essn CHAR(9) NOT NULL,
    Dependent_name VARCHAR(15) NOT NULL,
    Sex CHAR,
    Bdate DATE,
    Relationship VARCHAR(8),
    PRIMARY KEY (Essn, Dependent_name),
    CONSTRAINT fk_dependent FOREIGN KEY (Essn) REFERENCES employee (Ssn)
);

-- Exibe as tabelas no schema
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'azure_company';

-- Descrição da tabela dependent
SELECT column_name, data_type, character_maximum_length
FROM information_schema.columns
WHERE table_name = 'dependent';
