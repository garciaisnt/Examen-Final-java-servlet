USE [Empleados]
GO
/****** Object:  Table [dbo].[Departamentos]    Script Date: 13/12/2020 12:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Departamentos](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[NomDepa] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 13/12/2020 12:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empleados](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](100) NOT NULL,
	[Apellidos] [varchar](100) NULL,
	[Direccion] [varchar](250) NULL,
	[IdDepartamento] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Departamentos] ON 

GO
INSERT [dbo].[Departamentos] ([Id], [NomDepa]) VALUES (1, N'Departamento #1')
GO
INSERT [dbo].[Departamentos] ([Id], [NomDepa]) VALUES (2, N'Departamento #2')
GO
INSERT [dbo].[Departamentos] ([Id], [NomDepa]) VALUES (3, N'Departamento #3')
GO
INSERT [dbo].[Departamentos] ([Id], [NomDepa]) VALUES (4, N'Departamento #4')
GO
INSERT [dbo].[Departamentos] ([Id], [NomDepa]) VALUES (5, N'Departamento #5')
GO
SET IDENTITY_INSERT [dbo].[Departamentos] OFF
GO
SET IDENTITY_INSERT [dbo].[Empleados] ON 

GO
INSERT [dbo].[Empleados] ([Id], [Nombres], [Apellidos], [Direccion], [IdDepartamento]) VALUES (11, N'equi', N'a', N'a', 2)
GO
INSERT [dbo].[Empleados] ([Id], [Nombres], [Apellidos], [Direccion], [IdDepartamento]) VALUES (12, N'Carlos', N'Garcia', N'La casita', 2)
GO
INSERT [dbo].[Empleados] ([Id], [Nombres], [Apellidos], [Direccion], [IdDepartamento]) VALUES (13, N'Josue', N'Garcia', N'Lalasota', 2)
GO
INSERT [dbo].[Empleados] ([Id], [Nombres], [Apellidos], [Direccion], [IdDepartamento]) VALUES (10002, N'chepe', N'Garcia', N'Lalasota', 2)
GO
SET IDENTITY_INSERT [dbo].[Empleados] OFF
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD FOREIGN KEY([IdDepartamento])
REFERENCES [dbo].[Departamentos] ([Id])
GO
