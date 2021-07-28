USE [MMTShop]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF not exists(select* from dbo.sysobjects where id = object_id(N'[dbo].Test_Category]'))
BEGIN
PRINT N'creating table "Test_Category"' 
CREATE TABLE [dbo].[Test_Category](
[SKU][varchar](5) Not Null,
[CATEGORY][VARCHAR](20) Not Null

CONSTRAINT[pkeysku]PRIMARY KEY CLUSTERED
(
[SKU] ASC
)WITH (PAD_INDEX=OFF,STATISTICS_NORECOMPUTE=OFF,IGNORE_DUP_KEY = OFF,ALLOW_ROW_LOCKS=ON,ALLOW_PAGE_LOCKS=ON)ON[PRIMARY]
)ON [PRIMARY]

END
ELSE
BEGIN
print N'TABLE "Test_Category" exists,checking required columns exist'

IF not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE table_name='Test_Category' AND Column_name='SKU')
BEGIN
ALTER TABLE [dbo].[Test_Category]ADD [SKU][varchar](20) NOT NULL DEFAULT(space(20))
END
IF not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE table_name='Test_Category' AND Column_name='Category')
BEGIN
ALTER TABLE [dbo].[Test_Category]ADD [Category][varchar](9) NOT NULL DEFAULT(space(9))
END

END


