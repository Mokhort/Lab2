USE master;
GO
CREATE DATABASE ConstCompany;
GO
USE ConstCompany
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Accountant](
	[AccountantID] [int] NOT NULL,
	[SalaryFix] [int] NULL,
	[EmployeeID] [int] NOT NULL,
 CONSTRAINT [PK_Accountant] PRIMARY KEY CLUSTERED 
(
	[AccountantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Bilders](
	[BilderID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[WorkTime] [int] NULL,
	[ConstructionSiteID] [int] NULL,
 CONSTRAINT [PK_Bilders] PRIMARY KEY CLUSTERED 
(
	[BilderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[ConstructSite](
	[ConstructSiteID] [int] NOT NULL,
	[DateStart] [date] NULL,
	[DateEnd] [date] NULL,
	[ManagerID] [int] NULL,
 CONSTRAINT [PK_ConstructSite] PRIMARY KEY CLUSTERED 
(
	[ConstructSiteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Drivers](
	[DriverID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[TruckID] [int] NOT NULL,
 CONSTRAINT [PK_Drivers] PRIMARY KEY CLUSTERED 
(
	[DriverID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] NOT NULL,
	[First Name] [char](10) NOT NULL,
	[Last Name] [char](10) NOT NULL,
	[Position] [char](10) NOT NULL,
	[Salary] [money] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Managers](
	[ManagerID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[Qyt bilders] [int] NULL,
 CONSTRAINT [PK_Managers] PRIMARY KEY CLUSTERED 
(
	[ManagerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Materials](
	[MaterialsID] [int] NOT NULL,
	[Name] [nchar](10) NOT NULL,
	[Quantity] [nchar](10) NULL,
	[StorehouseID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[VendorID] [int] NOT NULL,
 CONSTRAINT [PK_Materials] PRIMARY KEY CLUSTERED 
(
	[MaterialsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Storehouse](
	[StorehouseID] [int] NOT NULL,
	[Name] [nchar](10) NULL,
	[Address] [nchar](10) NULL,
	[Capacity] [int] NULL,
 CONSTRAINT [PK_Storehouse] PRIMARY KEY CLUSTERED 
(
	[StorehouseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Transfer](
	[TransferID] [int] NOT NULL,
	[DriverID] [int] NOT NULL,
	[TruckID] [int] NOT NULL,
	[Current Weight] [int] NULL,
	[StorehouseID] [int] NOT NULL,
	[ConstructSiteID] [int] NULL,
 CONSTRAINT [PK_Transfer] PRIMARY KEY CLUSTERED 
(
	[TransferID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Trucks](
	[TruckID] [int] NOT NULL,
	[Max weight] [int] NULL,
 CONSTRAINT [PK_Truck] PRIMARY KEY CLUSTERED 
(
	[TruckID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Vendor](
	[VendorID] [int] NOT NULL,
	[Name] [nchar](10) NOT NULL,
	[Address] [nchar](10) NULL,
 CONSTRAINT [PK_Vendor] PRIMARY KEY CLUSTERED 
(
	[VendorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



ALTER TABLE [dbo].[Accountant]  WITH CHECK ADD  CONSTRAINT [FK_Accountant_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO

ALTER TABLE [dbo].[Accountant] CHECK CONSTRAINT [FK_Accountant_Employees]
GO


ALTER TABLE [dbo].[Bilders]  WITH CHECK ADD  CONSTRAINT [FK_Bilders_ConstructSite] FOREIGN KEY([ConstructionSiteID])
REFERENCES [dbo].[ConstructSite] ([ConstructSiteID])
GO

ALTER TABLE [dbo].[Bilders] CHECK CONSTRAINT [FK_Bilders_ConstructSite]
GO

ALTER TABLE [dbo].[Bilders]  WITH CHECK ADD  CONSTRAINT [FK_Bilders_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO

ALTER TABLE [dbo].[Bilders] CHECK CONSTRAINT [FK_Bilders_Employees]
GO


ALTER TABLE [dbo].[ConstructSite]  WITH CHECK ADD  CONSTRAINT [FK_ConstructSite_Managers] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[Managers] ([ManagerID])
GO

ALTER TABLE [dbo].[ConstructSite] CHECK CONSTRAINT [FK_ConstructSite_Managers]
GO


ALTER TABLE [dbo].[Managers]  WITH CHECK ADD  CONSTRAINT [FK_Managers_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO

ALTER TABLE [dbo].[Managers] CHECK CONSTRAINT [FK_Managers_Employees]
GO


ALTER TABLE [dbo].[Drivers]  WITH CHECK ADD  CONSTRAINT [FK_Drivers_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO

ALTER TABLE [dbo].[Drivers] CHECK CONSTRAINT [FK_Drivers_Employees]
GO


ALTER TABLE [dbo].[Materials]  WITH CHECK ADD  CONSTRAINT [FK_Materials_Storehouse] FOREIGN KEY([StorehouseID])
REFERENCES [dbo].[Storehouse] ([StorehouseID])
GO

ALTER TABLE [dbo].[Materials] CHECK CONSTRAINT [FK_Materials_Storehouse]
GO

ALTER TABLE [dbo].[Materials]  WITH CHECK ADD  CONSTRAINT [FK_Materials_Vendor] FOREIGN KEY([VendorID])
REFERENCES [dbo].[Vendor] ([VendorID])
GO

ALTER TABLE [dbo].[Materials] CHECK CONSTRAINT [FK_Materials_Vendor]
GO

ALTER TABLE [dbo].[Transfer]  WITH CHECK ADD  CONSTRAINT [FK_Transfer_ConstructSite] FOREIGN KEY([ConstructSiteID])
REFERENCES [dbo].[ConstructSite] ([ConstructSiteID])
GO

ALTER TABLE [dbo].[Transfer] CHECK CONSTRAINT [FK_Transfer_ConstructSite]
GO

ALTER TABLE [dbo].[Transfer]  WITH CHECK ADD  CONSTRAINT [FK_Transfer_Drivers] FOREIGN KEY([DriverID])
REFERENCES [dbo].[Drivers] ([DriverID])
GO

ALTER TABLE [dbo].[Transfer] CHECK CONSTRAINT [FK_Transfer_Drivers]
GO

ALTER TABLE [dbo].[Transfer]  WITH CHECK ADD  CONSTRAINT [FK_Transfer_Storehouse] FOREIGN KEY([StorehouseID])
REFERENCES [dbo].[Storehouse] ([StorehouseID])
GO

ALTER TABLE [dbo].[Transfer] CHECK CONSTRAINT [FK_Transfer_Storehouse]
GO

ALTER TABLE [dbo].[Transfer]  WITH CHECK ADD  CONSTRAINT [FK_Transfer_Trucks] FOREIGN KEY([TruckID])
REFERENCES [dbo].[Trucks] ([TruckID])
GO

ALTER TABLE [dbo].[Transfer] CHECK CONSTRAINT [FK_Transfer_Trucks]
GO
