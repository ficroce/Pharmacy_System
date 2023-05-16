CREATE TABLE AdminTable (
    id int(12) NOT NULL,
    UserName varchar(100) NOT NULL,
    Password varchar(100) NOT NULL
);

INSERT INTO AdminTable (id, UserName, Password) VALUES
(1, 'admin', 'FPvWiNRLErhaO3t');

CREATE TABLE ServiceUserTable (
    id int(12) NOT NULL,
    FullName varchar (100) NOT NULL,
    MobileNumber char(12) NOT NULL,
    EmailAddress varchar(100) NOT NULL,
    Sex varchar(20) NOT NULL,
    Age int(12) NOT NULL,
    Address varchar (300) NOT NULL,
    PrescribedMedication varchar (500) NOT NULL,
    FreePrescription BIT(1) NOT NULL
);

INSERT INTO ServiceUserTable (id, FullName, MobileNumber, EmailAddress, Sex, Age, Address, PrescribedMedication, FreePrescription) VALUES 
    (1, 'Nina Oliver', '7223627246', 'ninaoliver@gmail.com', 'Female', 25, 'Primrose Cottage CF47 9YL', 'Amlodipine', 1),
    (2, 'Bob Hiram', '7700054861', 'bhiram@gmail.com', 'Male', 39, 'Brynhyfryd Bryngwyn SA38 9PJ', 'Naproxen', 0),
    (3, 'Danika Sophy', '7381672454', 'danika@gmail.com', 'Female', 44, '110 Victoria Avenue WS3 3HT', 'Meloxicam', 0),
    (4, 'Arn Patrick', '7109816326', 'patricka@gmail.com', 'Male', 22, '1 Windsor Drive Dersingham PE31 6JL', 'Omeprazole', 1),
    (5, 'Evonne Cucinotta', '7457082996', 'evonnecucinotta@gmail.com', 'Female', 19, '33 The Meadows Tonyrefail CF39 8BS', 'Cephalexin', 1)
;

CREATE TABLE EmployeeTable (
    emp_id int(12) NOT NULL,
    FullName varchar (100) NOT NULL,
    MobileNumber char(12) NOT NULL,
    EmailAddress varchar(100) NOT NULL,
    Sex varchar(20) NOT NULL,
    Age int(12) NOT NULL,
    Address varchar (300) NOT NULL,
    DOB date NOT NULL, 
    Role varchar(20) NOT NULL,
    UserName varchar (70) DEFAULT NULL
);

INSERT INTO EmployeeTable (emp_id, FullName, MobileNumber, EmailAddress, Sex, Age, Address, DOB, Role, UserName) VALUES
    (1, 'Levi Gerolamo', '7522698842', 'lgerolamo@business.com', 'Male', 29, 'Flat 5 28 Store Street London WC1E 7BS', '1997-08-18', 'pharmacist', 'levigerolamo'),
    (2, 'Lynsay Irene', '7371700981', 'lirene@business.com', 'Female', 45, '111 Westfields St Albans AL3 4JR', '1970-03-09', 'administrator', 'lynsayirene'),
    (3, 'Avianna Sloane', '7700086292', 'asloanne@business.com', 'Female', 31, '37 Millers Wood Penmaen NP12 0FE', '1985-05-10', 'supervisor', 'aviannasloane'),
    (4, 'Ansley Caomhán', '7911049799', 'acaomhán@business.com', 'Male', 35, 'The Old Granary Middle Street Montacute TA15 6UZ', '1981-10-17', 'administrator', 'ansleycaomhán'),
    (5, 'Valter Boone', '7878882579', 'vboone@business.com', 'Male', 22, '5 Austin Street Hunstanton PE36 6AJ', '2001-08-19', 'pharmacist', 'valterboone')

;

CREATE TABLE MedicationTable (
    id int(12) NOT NULL,
    MedicationName varchar(200) DEFAULT NULL,
    BatchNumber varchar (20) NOT NULL,
    Manufacturer varchar(40) DEFAULT NULL,
    EntryDate date NOT NULL
);

INSERT INTO MedicationTable (id, MedicationName, BatchNumber, Manufacturer, EntryDate) VALUES
    (1, 'Amlodipine', 00001, 'PharmaSupply', '2020-09-01'),
    (2, 'Naproxen', 00002, 'PharmaSupply', '2020-09-01'),
    (3, 'Meloxicam', 00003, 'PharmaSupply', '2020-09-01'),
    (4, 'Omeprazole', 00004, 'PharmaSupply', '2020-09-01'),
    (5, 'Cephalexin', 00005, 'PharmaSupply', '2020-09-01')
;

CREATE TABLE MedicationStockTable (
    stock_id int(20) NOT NULL, 
    MedicationName varchar(200) DEFAULT NULL,
    Availability BIT(1),
    BatchNumber varchar (20) NOT NULL,
    ExpiryDate date NOT NULL, 
    Category varchar(50) DEFAULT NULL
);

INSERT INTO MedicationStockTable (stock_id, MedicationName, Availability, BatchNumber, ExpiryDate, Category) VALUES
    (1, 'Amlodipine', 1, 00001, '2023-12-01', 'tablet'),
    (2, 'Naproxen', 1, 00002 ,'2023-12-01', 'tablet'),
    (3, 'Meloxicam', 0, 00003, '2023-12-01', 'tablet'),
    (4, 'Omeprazole', 1, 00004, '2023-12-01', 'tablet'),
    (5, 'Cephalexin', 0, 00005, '2023-12-01', 'tablet')
;

CREATE TABLE MedicationSupplierTable (
    supplier_id int(20) NOT NULL, 
    SupplierName varchar(200) NOT NULL, 
    EmailAddress varchar(100) DEFAULT NULL,
    PhoneNumber char(12) NOT NULL, 
    Address varchar(300) NOT NULL 
);

INSERT INTO MedicationSupplierTable (supplier_id, SupplierName, EmailAddress, PhoneNumber, Address) VALUES 
    (1, 'Pharmalange', 'pharmalangemedsupply@domain.com', 88855566, 'Summerhill Sandy Cross TN21 8QN');



ALTER TABLE EmployeeTable
  ADD KEY empfk (UserName);

CREATE TABLE trigger_test (
    message varchar(100)
);

DELIMITER $$
CREATE TRIGGER my_trigger BEFORE INSERT ON EmployeeTable
FOR EACH ROW  INSERT INTO trigger_test VALUES('added new employee');
    END$$
DELIMITER ;

INSERT INTO EmployeeTable
VALUES (6, 'Maryanne Coreen', '7454822057', 'mcoreen@business.com', 'Female', 32, '10 Link Road Sale M33 4HP', '1980-06-22', 'supervisor', 'mcoreen');
