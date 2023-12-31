USE [RepairShop]
GO
/****** Object:  Table [dbo].[Заказ]    Script Date: 12.06.2023 18:08:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказ](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Дата] [date] NULL,
	[Заказчик и исполнитель] [text] NULL,
	[Статус] [text] NULL,
 CONSTRAINT [PK_Заказ] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ЗаказТехника]    Script Date: 12.06.2023 18:08:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ЗаказТехника](
	[Заказ Id] [int] NOT NULL,
	[Техника Id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Клиент]    Script Date: 12.06.2023 18:08:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиент](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ФИО] [text] NULL,
	[Телефон] [nchar](10) NULL,
	[Адрес] [text] NULL,
	[Заказ Id] [int] NOT NULL,
 CONSTRAINT [PK_Клиент] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Мастер]    Script Date: 12.06.2023 18:08:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Мастер](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ФИО] [text] NULL,
	[Специализация] [text] NULL,
	[График работы] [text] NULL,
	[Заказ Id] [int] NOT NULL,
	[Ремонт Id] [int] NOT NULL,
	[Техника Id] [int] NOT NULL,
 CONSTRAINT [PK_Мастер] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ремонт]    Script Date: 12.06.2023 18:08:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ремонт](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Дата] [date] NULL,
	[Статус] [text] NULL,
	[Стоимость] [text] NULL,
	[Гарантия] [text] NULL,
 CONSTRAINT [PK_Ремонт] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[РемонтТехника]    Script Date: 12.06.2023 18:08:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[РемонтТехника](
	[Ремонт Id] [int] NOT NULL,
	[Техника Id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Техника]    Script Date: 12.06.2023 18:08:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Техника](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Название] [text] NULL,
	[Модель и марка] [text] NULL,
	[Описание неисправности] [text] NULL,
 CONSTRAINT [PK_Техника] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ЗаказТехника]  WITH CHECK ADD  CONSTRAINT [FK_ЗаказТехника_Заказ] FOREIGN KEY([Заказ Id])
REFERENCES [dbo].[Заказ] ([Id])
GO
ALTER TABLE [dbo].[ЗаказТехника] CHECK CONSTRAINT [FK_ЗаказТехника_Заказ]
GO
ALTER TABLE [dbo].[ЗаказТехника]  WITH CHECK ADD  CONSTRAINT [FK_ЗаказТехника_Техника] FOREIGN KEY([Техника Id])
REFERENCES [dbo].[Техника] ([Id])
GO
ALTER TABLE [dbo].[ЗаказТехника] CHECK CONSTRAINT [FK_ЗаказТехника_Техника]
GO
ALTER TABLE [dbo].[Клиент]  WITH CHECK ADD  CONSTRAINT [FK_Клиент_Заказ] FOREIGN KEY([Заказ Id])
REFERENCES [dbo].[Заказ] ([Id])
GO
ALTER TABLE [dbo].[Клиент] CHECK CONSTRAINT [FK_Клиент_Заказ]
GO
ALTER TABLE [dbo].[Мастер]  WITH CHECK ADD  CONSTRAINT [FK_Мастер_Заказ] FOREIGN KEY([Заказ Id])
REFERENCES [dbo].[Заказ] ([Id])
GO
ALTER TABLE [dbo].[Мастер] CHECK CONSTRAINT [FK_Мастер_Заказ]
GO
ALTER TABLE [dbo].[Мастер]  WITH CHECK ADD  CONSTRAINT [FK_Мастер_Ремонт] FOREIGN KEY([Ремонт Id])
REFERENCES [dbo].[Ремонт] ([Id])
GO
ALTER TABLE [dbo].[Мастер] CHECK CONSTRAINT [FK_Мастер_Ремонт]
GO
ALTER TABLE [dbo].[Мастер]  WITH CHECK ADD  CONSTRAINT [FK_Мастер_Техника] FOREIGN KEY([Техника Id])
REFERENCES [dbo].[Техника] ([Id])
GO
ALTER TABLE [dbo].[Мастер] CHECK CONSTRAINT [FK_Мастер_Техника]
GO
ALTER TABLE [dbo].[РемонтТехника]  WITH CHECK ADD  CONSTRAINT [FK_РемонтТехника_Ремонт] FOREIGN KEY([Ремонт Id])
REFERENCES [dbo].[Ремонт] ([Id])
GO
ALTER TABLE [dbo].[РемонтТехника] CHECK CONSTRAINT [FK_РемонтТехника_Ремонт]
GO
ALTER TABLE [dbo].[РемонтТехника]  WITH CHECK ADD  CONSTRAINT [FK_РемонтТехника_Техника] FOREIGN KEY([Техника Id])
REFERENCES [dbo].[Техника] ([Id])
GO
ALTER TABLE [dbo].[РемонтТехника] CHECK CONSTRAINT [FK_РемонтТехника_Техника]
GO
