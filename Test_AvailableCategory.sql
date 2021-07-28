USE [MMTShop]
GO

set nocount on
print 'Script to create Test_AvailableCategories stored procedure'
print ' '
go

print 'Dropping existing procedure'
if Object_id('Test_AvailableCategories')is not null
begin
drop procedure Test_AvailableCategories
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

CREATE Procedure Test_AvailableCategories
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

	if(@category = 'ALL')
	begin
	SELECT CATEGORY FROM [dbo].[Test_Category] ORDER BY Category asc;
	end
	else
	begin
	SELECT DISTINCT tc.Category FROM [dbo].[Test_Products] tp
	INNER JOIN [dbo].[Test_Category] tc on tp.sku=tc.sku
	ORDER BY TC.Category asc;
	end
	
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
print 'Error creating procedure Test_AvailableCategories'
end
else
begin
print 'procedure Test_AvailableCategories created'
end
