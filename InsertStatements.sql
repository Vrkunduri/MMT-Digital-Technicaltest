USE [MMTShop]
GO
INSERT [dbo].[Test_Category] ([SKU], [CATEGORY]) VALUES (N'1KTC1', N'home')
INSERT [dbo].[Test_Category] ([SKU], [CATEGORY]) VALUES (N'1KTC2', N'home')
INSERT [dbo].[Test_Category] ([SKU], [CATEGORY]) VALUES (N'1KTC3', N'home')
INSERT [dbo].[Test_Category] ([SKU], [CATEGORY]) VALUES (N'2GAR1', N'garden')
INSERT [dbo].[Test_Category] ([SKU], [CATEGORY]) VALUES (N'2GAR2', N'garden')
INSERT [dbo].[Test_Category] ([SKU], [CATEGORY]) VALUES (N'3ELE1', N'electronic')
INSERT [dbo].[Test_Category] ([SKU], [CATEGORY]) VALUES (N'4FIT1', N'fitness')
INSERT [dbo].[Test_Category] ([SKU], [CATEGORY]) VALUES (N'5TOY1', N'toys')
GO
INSERT [dbo].[Test_Products] ([ID], [SKU], [NAME], [DESCRIPTION], [PRICE]) VALUES (1, N'1KTC1', N'Table', N'Dining table', CAST(450.00 AS Decimal(8, 2)))
INSERT [dbo].[Test_Products] ([ID], [SKU], [NAME], [DESCRIPTION], [PRICE]) VALUES (2, N'1KTC2', N'TV', N'Telivision', CAST(1250.00 AS Decimal(8, 2)))
INSERT [dbo].[Test_Products] ([ID], [SKU], [NAME], [DESCRIPTION], [PRICE]) VALUES (3, N'2GAR1', N'Planter', N'Pant pot', CAST(5.00 AS Decimal(8, 2)))
INSERT [dbo].[Test_Products] ([ID], [SKU], [NAME], [DESCRIPTION], [PRICE]) VALUES (4, N'2GAR2', N'Ornament', N'Garden Ornament', CAST(55.00 AS Decimal(8, 2)))
GO
