USE [p_drive]
GO
/****** Object:  Table [dbo].[users]    Script Date: 05/19/2016 22:30:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[u_id] [nvarchar](200) NOT NULL,
	[u_pw] [nvarchar](200) NOT NULL,
	[u_name] [nvarchar](30) NOT NULL,
	[u_tel] [nvarchar](30) NOT NULL,
	[u_email] [nvarchar](50) NOT NULL,
	[u_grade] [int] NOT NULL,
	[u_qpw] [nvarchar](50) NOT NULL,
	[u_apw] [nvarchar](50) NOT NULL,
	[u_auth] [int] NOT NULL,
	[d_id] [int] NULL,
 CONSTRAINT [XPKusers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[department]    Script Date: 05/19/2016 22:30:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[department](
	[d_id] [int] NOT NULL,
	[d_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [XPKdepartmant] PRIMARY KEY CLUSTERED 
(
	[d_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[drive]    Script Date: 05/19/2016 22:30:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[drive](
	[drive_id] [int] IDENTITY(1,1) NOT NULL,
	[drive_name] [nvarchar](50) NOT NULL,
	[d_id] [int] NULL,
	[id] [int] NULL,
 CONSTRAINT [XPKdrive] PRIMARY KEY CLUSTERED 
(
	[drive_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[share_folder]    Script Date: 05/19/2016 22:30:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[share_folder](
	[sfolder_id] [int] IDENTITY(1,1) NOT NULL,
	[sfolder_name] [nvarchar](100) NOT NULL,
	[drive_id] [int] NULL,
	[sfolder_pw] [nvarchar](200) NULL,
 CONSTRAINT [XPKshare_folder] PRIMARY KEY CLUSTERED 
(
	[sfolder_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[share]    Script Date: 05/19/2016 22:30:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[share](
	[share_id] [int] NOT NULL,
	[id] [int] NOT NULL,
	[sfolder_id] [int] NOT NULL,
 CONSTRAINT [XPKshare] PRIMARY KEY CLUSTERED 
(
	[share_id] ASC,
	[id] ASC,
	[sfolder_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sfiles]    Script Date: 05/19/2016 22:30:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sfiles](
	[sfiles_id] [int] NOT NULL,
	[sfiles_name] [nvarchar](100) NOT NULL,
	[sfiles_size] [varbinary](max) NOT NULL,
	[sfiles_date] [nvarchar](30) NOT NULL,
	[share_id] [int] NULL,
	[id] [int] NULL,
	[sfolder_id] [int] NULL,
 CONSTRAINT [XPKsfiles] PRIMARY KEY CLUSTERED 
(
	[sfiles_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[folder]    Script Date: 05/19/2016 22:30:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[folder](
	[folder_id] [int] IDENTITY(1,1) NOT NULL,
	[folder_name] [nvarchar](100) NOT NULL,
	[drive_id] [int] NULL,
	[parent_id] [int] NULL,
	[sfolder_pw] [nvarchar](30) NULL,
 CONSTRAINT [XPKfolder] PRIMARY KEY CLUSTERED 
(
	[folder_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[files]    Script Date: 05/19/2016 22:30:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[files](
	[files_id] [int] IDENTITY(1,1) NOT NULL,
	[files_name] [nvarchar](100) NOT NULL,
	[files_size] [int] NOT NULL,
	[files_date] [nvarchar](30) NOT NULL,
	[folder_id] [int] NULL,
	[files_body] [varbinary](max) NULL,
 CONSTRAINT [XPKfiles] PRIMARY KEY CLUSTERED 
(
	[files_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[my_join_folder]    Script Date: 05/19/2016 22:30:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[my_join_folder](
	[join_id] [int] IDENTITY(1,1) NOT NULL,
	[id] [int] NOT NULL,
	[folder_id] [int] NOT NULL,
 CONSTRAINT [XPKmy_join_folder] PRIMARY KEY CLUSTERED 
(
	[join_id] ASC,
	[id] ASC,
	[folder_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[my_join_drive]    Script Date: 05/19/2016 22:30:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[my_join_drive](
	[join_id] [char](18) NOT NULL,
	[id] [int] NOT NULL,
	[drive_id] [int] NOT NULL,
 CONSTRAINT [XPKmy_join_drive] PRIMARY KEY CLUSTERED 
(
	[join_id] ASC,
	[id] ASC,
	[drive_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[professor]    Script Date: 05/19/2016 22:30:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[professor](
	[id2] [int] IDENTITY(1,1) NOT NULL,
	[p_id] [varchar](50) NOT NULL,
	[p_pw] [nvarchar](200) NOT NULL,
	[p_name] [nvarchar](30) NOT NULL,
	[p_tel] [nvarchar](30) NOT NULL,
	[p_email] [nvarchar](50) NOT NULL,
	[p_code] [int] NULL,
	[p_qpw] [nvarchar](50) NOT NULL,
	[p_aqw] [nvarchar](50) NOT NULL,
	[d_id] [int] NULL,
 CONSTRAINT [XPKprofessor] PRIMARY KEY CLUSTERED 
(
	[id2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [fk_driveuser]    Script Date: 05/19/2016 22:30:37 ******/
ALTER TABLE [dbo].[drive]  WITH CHECK ADD  CONSTRAINT [fk_driveuser] FOREIGN KEY([id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[drive] CHECK CONSTRAINT [fk_driveuser]
GO
/****** Object:  ForeignKey [R_4]    Script Date: 05/19/2016 22:30:37 ******/
ALTER TABLE [dbo].[drive]  WITH CHECK ADD  CONSTRAINT [R_4] FOREIGN KEY([d_id])
REFERENCES [dbo].[department] ([d_id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[drive] CHECK CONSTRAINT [R_4]
GO
/****** Object:  ForeignKey [R_15]    Script Date: 05/19/2016 22:30:37 ******/
ALTER TABLE [dbo].[files]  WITH CHECK ADD  CONSTRAINT [R_15] FOREIGN KEY([folder_id])
REFERENCES [dbo].[folder] ([folder_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[files] CHECK CONSTRAINT [R_15]
GO
/****** Object:  ForeignKey [R_13]    Script Date: 05/19/2016 22:30:37 ******/
ALTER TABLE [dbo].[folder]  WITH CHECK ADD  CONSTRAINT [R_13] FOREIGN KEY([drive_id])
REFERENCES [dbo].[drive] ([drive_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[folder] CHECK CONSTRAINT [R_13]
GO
/****** Object:  ForeignKey [R_23]    Script Date: 05/19/2016 22:30:37 ******/
ALTER TABLE [dbo].[folder]  WITH CHECK ADD  CONSTRAINT [R_23] FOREIGN KEY([parent_id])
REFERENCES [dbo].[folder] ([folder_id])
GO
ALTER TABLE [dbo].[folder] CHECK CONSTRAINT [R_23]
GO
/****** Object:  ForeignKey [R_1]    Script Date: 05/19/2016 22:30:37 ******/
ALTER TABLE [dbo].[my_join_drive]  WITH CHECK ADD  CONSTRAINT [R_1] FOREIGN KEY([id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[my_join_drive] CHECK CONSTRAINT [R_1]
GO
/****** Object:  ForeignKey [R_2]    Script Date: 05/19/2016 22:30:37 ******/
ALTER TABLE [dbo].[my_join_drive]  WITH CHECK ADD  CONSTRAINT [R_2] FOREIGN KEY([drive_id])
REFERENCES [dbo].[drive] ([drive_id])
GO
ALTER TABLE [dbo].[my_join_drive] CHECK CONSTRAINT [R_2]
GO
/****** Object:  ForeignKey [FK__my_join_f__folde__3D5E1FD2]    Script Date: 05/19/2016 22:30:37 ******/
ALTER TABLE [dbo].[my_join_folder]  WITH CHECK ADD FOREIGN KEY([folder_id])
REFERENCES [dbo].[folder] ([folder_id])
GO
/****** Object:  ForeignKey [FK__my_join_fold__id__3C69FB99]    Script Date: 05/19/2016 22:30:37 ******/
ALTER TABLE [dbo].[my_join_folder]  WITH CHECK ADD FOREIGN KEY([id])
REFERENCES [dbo].[users] ([id])
GO
/****** Object:  ForeignKey [fk_joinfolder]    Script Date: 05/19/2016 22:30:37 ******/
ALTER TABLE [dbo].[my_join_folder]  WITH CHECK ADD  CONSTRAINT [fk_joinfolder] FOREIGN KEY([folder_id])
REFERENCES [dbo].[folder] ([folder_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[my_join_folder] CHECK CONSTRAINT [fk_joinfolder]
GO
/****** Object:  ForeignKey [R_17]    Script Date: 05/19/2016 22:30:37 ******/
ALTER TABLE [dbo].[professor]  WITH CHECK ADD  CONSTRAINT [R_17] FOREIGN KEY([d_id])
REFERENCES [dbo].[department] ([d_id])
GO
ALTER TABLE [dbo].[professor] CHECK CONSTRAINT [R_17]
GO
/****** Object:  ForeignKey [R_11]    Script Date: 05/19/2016 22:30:37 ******/
ALTER TABLE [dbo].[sfiles]  WITH CHECK ADD  CONSTRAINT [R_11] FOREIGN KEY([share_id], [id], [sfolder_id])
REFERENCES [dbo].[share] ([share_id], [id], [sfolder_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sfiles] CHECK CONSTRAINT [R_11]
GO
/****** Object:  ForeignKey [R_12]    Script Date: 05/19/2016 22:30:37 ******/
ALTER TABLE [dbo].[share]  WITH CHECK ADD  CONSTRAINT [R_12] FOREIGN KEY([sfolder_id])
REFERENCES [dbo].[share_folder] ([sfolder_id])
GO
ALTER TABLE [dbo].[share] CHECK CONSTRAINT [R_12]
GO
/****** Object:  ForeignKey [R_8]    Script Date: 05/19/2016 22:30:37 ******/
ALTER TABLE [dbo].[share]  WITH CHECK ADD  CONSTRAINT [R_8] FOREIGN KEY([id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[share] CHECK CONSTRAINT [R_8]
GO
/****** Object:  ForeignKey [R_24]    Script Date: 05/19/2016 22:30:37 ******/
ALTER TABLE [dbo].[share_folder]  WITH CHECK ADD  CONSTRAINT [R_24] FOREIGN KEY([drive_id])
REFERENCES [dbo].[drive] ([drive_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[share_folder] CHECK CONSTRAINT [R_24]
GO
