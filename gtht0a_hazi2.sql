CREATE TABLE Hazifeladat(
	LOGIN nvarchar(255) MASKED WITH (Function = 'partial(1,"XXX",1)') NOT NULL ,
	EMAIL nvarchar(255) MASKED WITH (function = 'email()') NOT NULL,
	NEV nvarchar(255) NOT NULL,
	SZULEV int MASKED WITH (FUNCTION = 'random(1,100)') NULL,
	NEM nvarchar(1) NULL,
	CIM nvarchar(255) NULL,
PRIMARY KEY (LOGIN))

INSERT INTO Hazifeladat (LOGIN, EMAIL, NEV, SZULEV, NEM, CIM)
SELECT LOGIN, EMAIL, NEV, SZULEV, NEM, CIM FROM Ugyfel;

CREATE USER MaskUser WITHOUT LOGIN;

GRANT SELECT ON Hazifeladat TO MaskUser;

-- GRANT UNMASK TO MaskUser;     Akkor adjuk meg, ha szeretnénk, hogy lássa maszkolás nélkül

EXECUTE AS USER = 'MaskUser';
SELECT * FROM Hazifeladat;
REVERT;
