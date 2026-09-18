/* =========================================================
   SCHEMA
   ========================================================= */

IF NOT EXISTS (
    SELECT 1
    FROM sys.schemas
    WHERE name = 'azure_company'
)
BEGIN
    EXEC('CREATE SCHEMA azure_company');
END;


/* =========================================================
   CONSULTAR CONSTRAINTS DO SCHEMA
   ========================================================= */

SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = 'azure_company';


/* =========================================================
   EMPLOYEE
   ========================================================= */

CREATE TABLE azure_company.employee (
    Fname       VARCHAR(15) NOT NULL,
    Minit       CHAR(1),
    Lname       VARCHAR(15) NOT NULL,
    Ssn         CHAR(9) NOT NULL,
    Bdate       DATE,
    Address     VARCHAR(30),
    Sex         CHAR(1),
    Salary      DECIMAL(10,2),
    Super_ssn   CHAR(9),
    Dno         INT NOT NULL
        CONSTRAINT df_employee_dno DEFAULT 1,

    CONSTRAINT chk_salary_employee
        CHECK (Salary > 2000.0),

    CONSTRAINT pk_employee
        PRIMARY KEY (Ssn)
);


/* =========================================================
   DEPARTMENT
   ========================================================= */

CREATE TABLE azure_company.departament (
    Dname             VARCHAR(15) NOT NULL,
    Dnumber           INT NOT NULL,
    Mgr_ssn           CHAR(9) NOT NULL,
    Mgr_start_date    DATE,
    Dept_create_date  DATE,

    CONSTRAINT chk_date_dept
        CHECK (
            Dept_create_date IS NULL
            OR Mgr_start_date IS NULL
            OR Dept_create_date < Mgr_start_date
        ),

    CONSTRAINT pk_dept
        PRIMARY KEY (Dnumber),

    CONSTRAINT unique_name_dept
        UNIQUE (Dname),

    CONSTRAINT fk_dept
        FOREIGN KEY (Mgr_ssn)
        REFERENCES azure_company.employee (Ssn)
);


/* =========================================================
   EMPLOYEE → DEPARTMENT
   ========================================================= */


ALTER TABLE azure_company.employee
ADD CONSTRAINT fk_employee_department
    FOREIGN KEY (Dno)
    REFERENCES azure_company.departament (Dnumber);


/* =========================================================
   EMPLOYEE → EMPLOYEE
   SELF-REFERENCING FOREIGN KEY
   ========================================================= */


ALTER TABLE azure_company.employee
ADD CONSTRAINT fk_employee
    FOREIGN KEY (Super_ssn)
    REFERENCES azure_company.employee (Ssn)
    ON DELETE NO ACTION;


/* =========================================================
   DEPT_LOCATIONS
   ========================================================= */

CREATE TABLE azure_company.dept_locations (
    Dnumber     INT NOT NULL,
    Dlocation   VARCHAR(15) NOT NULL,

    CONSTRAINT pk_dept_locations
        PRIMARY KEY (Dnumber, Dlocation),

    CONSTRAINT fk_dept_locations
        FOREIGN KEY (Dnumber)
        REFERENCES azure_company.departament (Dnumber)
        ON DELETE CASCADE
);


/* =========================================================
   PROJECT
   ========================================================= */

CREATE TABLE azure_company.project (
    Pname       VARCHAR(15) NOT NULL,
    Pnumber     INT NOT NULL,
    Plocation   VARCHAR(15),
    Dnum        INT NOT NULL,

    CONSTRAINT pk_project
        PRIMARY KEY (Pnumber),

    CONSTRAINT unique_project
        UNIQUE (Pname),

    CONSTRAINT fk_project
        FOREIGN KEY (Dnum)
        REFERENCES azure_company.departament (Dnumber)
);


/* =========================================================
   WORKS_ON
   ========================================================= */

CREATE TABLE azure_company.works_on (
    Essn    CHAR(9) NOT NULL,
    Pno     INT NOT NULL,
    Hours   DECIMAL(3,1) NOT NULL,

    CONSTRAINT pk_works_on
        PRIMARY KEY (Essn, Pno),

    CONSTRAINT fk_employee_works_on
        FOREIGN KEY (Essn)
        REFERENCES azure_company.employee (Ssn),

    CONSTRAINT fk_project_works_on
        FOREIGN KEY (Pno)
        REFERENCES azure_company.project (Pnumber)
);


/* =========================================================
   DEPENDENT
   ========================================================= */

CREATE TABLE azure_company.dependent (
    Essn             CHAR(9) NOT NULL,
    Dependent_name   VARCHAR(15) NOT NULL,
    Sex              CHAR(1),
    Bdate            DATE,
    Relationship     VARCHAR(8),

    CONSTRAINT pk_dependent
        PRIMARY KEY (Essn, Dependent_name),

    CONSTRAINT fk_dependent
        FOREIGN KEY (Essn)
        REFERENCES azure_company.employee (Ssn)
);


/* =========================================================
   LISTAR TABELAS
   ========================================================= */

SELECT
    TABLE_SCHEMA,
    TABLE_NAME,
    TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'azure_company'
ORDER BY TABLE_NAME;


/* =========================================================
   DESCRIBIR EMPLOYEE
   ========================================================= */

SELECT
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    NUMERIC_PRECISION,
    NUMERIC_SCALE,
    IS_NULLABLE,
    COLUMN_DEFAULT
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'azure_company'
  AND TABLE_NAME = 'employee'
ORDER BY ORDINAL_POSITION;


/* =========================================================
   DESCRIBIR DEPARTAMENT
   ========================================================= */

SELECT
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    NUMERIC_PRECISION,
    NUMERIC_SCALE,
    IS_NULLABLE,
    COLUMN_DEFAULT
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'azure_company'
  AND TABLE_NAME = 'departament'
ORDER BY ORDINAL_POSITION;


/* =========================================================
   DESCRIBIR DEPT_LOCATIONS
   ========================================================= */

SELECT
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    NUMERIC_PRECISION,
    NUMERIC_SCALE,
    IS_NULLABLE,
    COLUMN_DEFAULT
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'azure_company'
  AND TABLE_NAME = 'dept_locations'
ORDER BY ORDINAL_POSITION;


/* =========================================================
   DESCRIBIR PROJECT
   ========================================================= */

SELECT
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    NUMERIC_PRECISION,
    NUMERIC_SCALE,
    IS_NULLABLE,
    COLUMN_DEFAULT
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'azure_company'
  AND TABLE_NAME = 'project'
ORDER BY ORDINAL_POSITION;


/* =========================================================
   DESCRIBIR WORKS_ON
   ========================================================= */

SELECT
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    NUMERIC_PRECISION,
    NUMERIC_SCALE,
    IS_NULLABLE,
    COLUMN_DEFAULT
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'azure_company'
  AND TABLE_NAME = 'works_on'
ORDER BY ORDINAL_POSITION;


/* =========================================================
   DESCRIBIR DEPENDENT
   ========================================================= */

SELECT
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    NUMERIC_PRECISION,
    NUMERIC_SCALE,
    IS_NULLABLE,
    COLUMN_DEFAULT
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'azure_company'
  AND TABLE_NAME = 'dependent'
ORDER BY ORDINAL_POSITION;


/* =========================================================
   LISTAR TODAS AS CONSTRAINTS
   ========================================================= */

SELECT
    TABLE_NAME,
    CONSTRAINT_NAME,
    CONSTRAINT_TYPE
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = 'azure_company'
ORDER BY TABLE_NAME, CONSTRAINT_NAME;
