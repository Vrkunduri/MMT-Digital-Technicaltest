USE [MMTShop]
GO

set nocount on
print 'Script to create Test_ProductByCategories stored procedure'
print ' '
go

print 'Dropping existing procedure'
if Object_id('Test_ProductByCategories')is not null
begin
drop procedure Test_ProductByCategories
if @@error <> 0
begin
print  ' ERROR dropping procedure Test_AvailabeCategories'
end
else
begin
print ' procedure Test_AvailabeCategories dropped'
end
end
go
print 'creating new procedure'
go

SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE Procedure Test_ProductByCategories
(
@category varchar(20)
)

AS BEGIN
DECLARE @RETVAL int

SET NOCOUNT ON
SELECT @RETVAL=1

IF(NOT EXISTS (SELECT 1 FROM [dbo].[Test_Products]))
BEGIN

    GOTO ERR_HANDLER
	END


	SELECT tp.[NAME],tp.[DESCRIPTION],tp.[PRICE] FROM [dbo].[Test_Products] tp
	INNER JOIN [dbo].[Test_Category] tc on tp.sku=tc.sku
	where tc.CATEGORY = @category
	ORDER BY TC.Category asc;
	
	SET NOCOUNT OFF
	RETURN @RetVal
	
 ERR_HANDLER:
 SELECT @RetVal=0
 SET NOCOUNT OFF
 RETURN @Retval

end
 
GO
IF @@ERROR<>0
begin 
print 'Error creating procedure Test_ProductByCategories'
end
else
begin
print 'procedure Test_ProductByCategories created'
end
