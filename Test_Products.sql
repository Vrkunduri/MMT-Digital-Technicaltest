USE [MMTShop]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF not exists(select * from dbo.sysobjects where id = object_id(N'[dbo].[Test_Products]'))
BEGIN

PRINT N'creating table "Test_Products"'

create table [dbo].[Test_Products](
[ID][int] Not Null,
[SKU][varchar](5) Not Null,
[NAME][varchar](250) NOT NULL,
[DESCRIPTION][varchar](max) ,
[PRICE][decimal](8,2) DEFAULT(0) Not Null


CONSTRAINT[pkeyId]PRIMARY KEY CLUSTERED
(
[ID] ASC
)WITH (PAD_INDEX=OFF,STATISTICS_NORECOMPUTE=OFF,IGNORE_DUP_KEY = OFF,ALLOW_ROW_LOCKS=ON,ALLOW_PAGE_LOCKS=ON)ON[PRIMARY]
)ON [PRIMARY]

ALTER TABLE[dbo].[Test_products]WITH CHECK ADD CONSTRAINT [ fkeysku] FOREIGN KEY([SKU])
REFERENCES [dbo].[Test_Category] ([SKU])

--ALTER TABLE [dbo].[Test_products] check constraint [fkeysku]

END

ELSE
BEGIN
print N'Table "Test_products" exists, checking required columns exist'
IF not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE Table_name = 'Test_Products' AND COLUMN_NAME='ID')
BEGIN 
    ALTER TABLE [dbo].[ID] ADD [ID][INT]NOT NULL
	END

	IF not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE Table_name = 'Test_Products' AND COLUMN_NAME='SKU')
BEGIN 
    ALTER TABLE [dbo].[Test_Products] ADD [SKU][varchar](5) NOT NULL
	END

	IF not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE Table_name = 'Test_Products' AND COLUMN_NAME='Name')
BEGIN 
    ALTER TABLE [dbo].[Test_Products] ADD [Name][varchar](250) NOT NULL DEFAULT (space(250))
	END

IF not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE Table_name = 'Test_Products' AND COLUMN_NAME='Description')
BEGIN 
    ALTER TABLE [dbo].[Test_Products] ADD [Description][varchar](max) NOT NULL DEFAULT (space(250))
	END

	IF not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE Table_name = 'Test_Products' AND COLUMN_NAME='Price')
BEGIN 
    ALTER TABLE [dbo].[Test_Products] ADD [Price][decimal](8,2) NOT NULL DEFAULT (0)
	END
	End