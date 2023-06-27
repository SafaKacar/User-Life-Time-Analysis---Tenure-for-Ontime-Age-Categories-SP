USE [DWH_Database]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Safa Kaçar>
-- =============================================

ALTER PROCEDURE [dbo].[spMonthlyUserLifeTimeTenures] 
 as
	declare @m		 as int  = 1,
		    @BaseDay as Date = CAST(GETDATE() AS DATE)
			IF DAY(@BaseDay) = 1
			   BEGIN
				SET @m = @m + 1
			   END
	DELETE FROM DWH_Database..FACT_MonthlyUserLifeTimeTenures WHERE MonthKey = format(getdate()-1, 'yyyyMM')
	INSERT INTO DWH_Database..FACT_MonthlyUserLifeTimeTenures
		SELECT
												    FORMAT(p1.StartofMonth,'yyyyMM') MonthKey
																		,CASE
																			WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	-2 AND RemittanceType = 	 -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 0 AND RemittanceType = 	 -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	1
																			WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 1 AND RemittanceType = 	 -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 1 AND RemittanceType = 	101 AND  FeatureSubType = 101 AND IsPhysicalCardTx =  0 THEN 	0
																			WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 1 AND RemittanceType = 	101 AND  FeatureSubType = 101 AND IsPhysicalCardTx =  1 THEN 	0
																			WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 1 AND RemittanceType = 	101 AND  FeatureSubType = 101 AND IsPhysicalCardTx =  2 THEN 	0
																			WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 1 AND RemittanceType = 	101 AND  FeatureSubType = 101 AND IsPhysicalCardTx =  3 THEN 	0
																			WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 2 AND RemittanceType = 	 -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	1
																			WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 3 AND RemittanceType = 	 -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	1
																			WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 4 AND RemittanceType = 	 -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 5 AND RemittanceType = 	 -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	1
																			WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 6 AND RemittanceType = 	 -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	1
																			WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 8 AND RemittanceType = 	 -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType =  7 AND Currency  = 0 AND CardTxType = 	-1 AND RemittanceType = 	 -7 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	1
																			WHEN FeatureType =  7 AND Currency  = 0 AND CardTxType = 	-1 AND RemittanceType =    0 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	1
																			WHEN FeatureType =  7 AND Currency  = 0 AND CardTxType = 	-1 AND RemittanceType = 	  1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType =  8 AND Currency  = 0 AND CardTxType = 	-1 AND RemittanceType =   -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType = 11 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType = 	 -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType = 12 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType = 	  0 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType = 12 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType = 	  1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType = 13 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType = 	 -1 AND  FeatureSubType = 50  AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType = 13 AND Currency = 	1 AND CardTxType = 	-1 AND RemittanceType = 	 -1 AND  FeatureSubType = 50  AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType = 13 AND Currency = 	2 AND CardTxType = 	-1 AND RemittanceType = 	 -1 AND  FeatureSubType = 50  AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType = 13 AND Currency = 	4 AND CardTxType = 	-1 AND RemittanceType = 	 -1 AND  FeatureSubType = 50  AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType = 13 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType = 	 -1 AND  FeatureSubType = 51  AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType = 13 AND Currency = 	1 AND CardTxType = 	-1 AND RemittanceType = 	 -1 AND  FeatureSubType = 51  AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType = 13 AND Currency = 	2 AND CardTxType = 	-1 AND RemittanceType = 	 -1 AND  FeatureSubType = 51  AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType = 13 AND Currency = 	4 AND CardTxType = 	-1 AND RemittanceType = 	 -1 AND  FeatureSubType = 51  AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType = 14 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType = 	 -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType = 15 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType = 	 -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType = 17 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType = 	 -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType = 18 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType = 	 -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType = 19 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType = 	 -1 AND  FeatureSubType = 50  AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType = 19 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType = 	 -1 AND  FeatureSubType = 51  AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType = 20 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType =    0 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	1
																			WHEN FeatureType = 20 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType =    1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType = 22 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType =   -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType = 22 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType =   -1 AND  FeatureSubType = 100 AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType = 23 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType =   -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType = 25 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType =   -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType = 27 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType =   -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType = 28 AND Currency = 	1 AND CardTxType = 	-1 AND RemittanceType =   -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType = 29 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType =   -1 AND  FeatureSubType = 0   AND IsPhysicalCardTx = -1 THEN 	1
																			WHEN FeatureType = 29 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType =   -1 AND  FeatureSubType = 1   AND IsPhysicalCardTx = -1 THEN 	1
																			WHEN FeatureType = 29 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType =   -1 AND  FeatureSubType = 2   AND IsPhysicalCardTx = -1 THEN 	1
																			WHEN FeatureType = 101 AND Currency = 0 AND CardTxType =   101 AND RemittanceType =  101 AND  FeatureSubType = 101 AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType = 101 AND Currency = 1 AND CardTxType =   101 AND RemittanceType =  101 AND  FeatureSubType = 101 AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType = 101 AND Currency = 2 AND CardTxType =   101 AND RemittanceType =  101 AND  FeatureSubType = 101 AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType = 101 AND Currency = 3 AND CardTxType =   101 AND RemittanceType =  101 AND  FeatureSubType = 101 AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType = 101 AND Currency = 4 AND CardTxType =   101 AND RemittanceType =  101 AND  FeatureSubType = 101 AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType = 24  AND Currency = 0 AND CardTxType =	-1 AND RemittanceType =   -1 AND  FeatureSubType = 99	AND IsPhysicalCardTx = -1 THEN	0

																			WHEN FeatureType =2 and	Currency = 0 and	CardTxType =  1 and	RemittanceType = 101 and	FeatureSubType = 101 and	IsPhysicalCardTx = -1 THEN	1
																			WHEN FeatureType =7 and	Currency = 1 and	CardTxType = -1 and	RemittanceType = -7  and	FeatureSubType = 99 and	IsPhysicalCardTx = -1 THEN	1
																			WHEN FeatureType =7 and	Currency = 1 and	CardTxType = -1 and	RemittanceType = 0   and	FeatureSubType = 99 and	IsPhysicalCardTx = -1 THEN	1
																			WHEN FeatureType =7 and	Currency = 1 and	CardTxType = -1 and	RemittanceType = 1   and	FeatureSubType = 99 and	IsPhysicalCardTx = -1 THEN	1
																			WHEN FeatureType =7 and	Currency = 2 and	CardTxType = -1 and	RemittanceType = -7  and	FeatureSubType = 99 and	IsPhysicalCardTx = -1 THEN	1
																			WHEN FeatureType =7 and	Currency = 2 and	CardTxType = -1 and	RemittanceType = 0   and	FeatureSubType = 99 and	IsPhysicalCardTx = -1 THEN	1
																			WHEN FeatureType =7 and	Currency = 2 and	CardTxType = -1 and	RemittanceType = 1   and	FeatureSubType = 99 and	IsPhysicalCardTx = -1	THEN	1
																			WHEN FeatureType =7 and	Currency = 4 and	CardTxType = -1 and	RemittanceType = -7  and	FeatureSubType = 99 and	IsPhysicalCardTx = -1 THEN	1
																			WHEN FeatureType =7 and	Currency = 4 and	CardTxType = -1 and	RemittanceType = 0   and	FeatureSubType = 99 and	IsPhysicalCardTx = -1 THEN	1
																			WHEN FeatureType =7 and	Currency = 4 and	CardTxType = -1 and	RemittanceType = 1   and	FeatureSubType = 99 and	IsPhysicalCardTx = -1 THEN	1
																			WHEN FeatureType =8 and	Currency = 1 and	CardTxType = -1 and	RemittanceType = -1  and	FeatureSubType = 99 and	IsPhysicalCardTx = -1 THEN	1
																			WHEN FeatureType =29 and	Currency = 0 and	CardTxType = -1 and	RemittanceType = -1  and	FeatureSubType = 99 and	IsPhysicalCardTx = -1 THEN	1
																			WHEN FeatureType =2 and	Currency = 0 and	CardTxType = 7 and	RemittanceType = -1  and	FeatureSubType = 99 and	IsPhysicalCardTx = -1 THEN	1

																			WHEN FeatureType =33 and	Currency = 0 and	CardTxType = -1  and	RemittanceType = -1  and	FeatureSubType = 99 and	IsPhysicalCardTx = -1 THEN	1

																			WHEN FeatureType = 28 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType =   -1 AND  FeatureSubType = 50  AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType = 28 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType =   -1 AND  FeatureSubType = 51  AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType = 28 AND Currency = 	0 AND CardTxType =   -1 AND	RemittanceType = -1  AND  FeatureSubType =-28  AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType = 32 AND Currency =  0 AND CardTxType =	-1 AND RemittanceType = -32  AND  FeatureSubType =99	AND IsPhysicalCardTx = -1 THEN	0
																			WHEN FeatureType = 32 AND Currency =  0 AND CardTxType =	-1 AND RemittanceType =   0  AND  FeatureSubType =99	AND IsPhysicalCardTx = -1 THEN	0
																			WHEN FeatureType = 32 AND Currency =  0 AND CardTxType =	-1 AND RemittanceType =   1  AND  FeatureSubType =99	AND IsPhysicalCardTx = -1 THEN	0
																		ELSE -1
																		END IsDirectRevenue
																	   ,CASE
																			WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	-2 AND RemittanceType = 	 -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																			WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 0 AND RemittanceType = 	 -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	1
																			WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 1 AND RemittanceType = 	 -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	2
																			WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 1 AND RemittanceType = 	101 AND  FeatureSubType = 101 AND IsPhysicalCardTx =  0 THEN 	3
																			WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 1 AND RemittanceType = 	101 AND  FeatureSubType = 101 AND IsPhysicalCardTx =  1 THEN 	4
																			WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 1 AND RemittanceType = 	101 AND  FeatureSubType = 101 AND IsPhysicalCardTx =  2 THEN 	5
																			WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 1 AND RemittanceType = 	101 AND  FeatureSubType = 101 AND IsPhysicalCardTx =  3 THEN 	6
																			WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 2 AND RemittanceType = 	 -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	7
																			WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 3 AND RemittanceType = 	 -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	8
																			WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 4 AND RemittanceType = 	 -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	9
																			WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 5 AND RemittanceType = 	 -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	10
																			WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 6 AND RemittanceType = 	 -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	11
																			WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 8 AND RemittanceType = 	 -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	12
																			WHEN FeatureType =  7 AND Currency  = 0 AND CardTxType = 	-1 AND RemittanceType = 	 -7 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	13
																			WHEN FeatureType =  7 AND Currency  = 0 AND CardTxType = 	-1 AND RemittanceType =    0 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	14
																			WHEN FeatureType =  7 AND Currency  = 0 AND CardTxType = 	-1 AND RemittanceType = 	  1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	15
																			WHEN FeatureType =  8 AND Currency  = 0 AND CardTxType = 	-1 AND RemittanceType =   -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	16
																			WHEN FeatureType = 11 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType = 	 -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	17
																			WHEN FeatureType = 12 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType = 	  0 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	18
																			WHEN FeatureType = 12 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType = 	  1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	19
																			WHEN FeatureType = 13 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType = 	 -1 AND  FeatureSubType = 50  AND IsPhysicalCardTx = -1 THEN 	20
																			WHEN FeatureType = 13 AND Currency = 	1 AND CardTxType = 	-1 AND RemittanceType = 	 -1 AND  FeatureSubType = 50  AND IsPhysicalCardTx = -1 THEN 	21
																			WHEN FeatureType = 13 AND Currency = 	2 AND CardTxType = 	-1 AND RemittanceType = 	 -1 AND  FeatureSubType = 50  AND IsPhysicalCardTx = -1 THEN 	22
																			WHEN FeatureType = 13 AND Currency = 	4 AND CardTxType = 	-1 AND RemittanceType = 	 -1 AND  FeatureSubType = 50  AND IsPhysicalCardTx = -1 THEN 	23
																			WHEN FeatureType = 13 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType = 	 -1 AND  FeatureSubType = 51  AND IsPhysicalCardTx = -1 THEN 	24
																			WHEN FeatureType = 13 AND Currency = 	1 AND CardTxType = 	-1 AND RemittanceType = 	 -1 AND  FeatureSubType = 51  AND IsPhysicalCardTx = -1 THEN 	25
																			WHEN FeatureType = 13 AND Currency = 	2 AND CardTxType = 	-1 AND RemittanceType = 	 -1 AND  FeatureSubType = 51  AND IsPhysicalCardTx = -1 THEN 	26
																			WHEN FeatureType = 13 AND Currency = 	4 AND CardTxType = 	-1 AND RemittanceType = 	 -1 AND  FeatureSubType = 51  AND IsPhysicalCardTx = -1 THEN 	27
																			WHEN FeatureType = 14 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType = 	 -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	28
																			WHEN FeatureType = 15 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType = 	 -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	29
																			WHEN FeatureType = 17 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType = 	 -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	30
																			WHEN FeatureType = 18 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType = 	 -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	31
																			WHEN FeatureType = 19 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType = 	 -1 AND  FeatureSubType = 50  AND IsPhysicalCardTx = -1 THEN 	32
																			WHEN FeatureType = 19 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType = 	 -1 AND  FeatureSubType = 51  AND IsPhysicalCardTx = -1 THEN 	33
																			WHEN FeatureType = 20 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType =    0 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	34
																			WHEN FeatureType = 20 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType =    1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	35
																			WHEN FeatureType = 22 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType =   -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	36
																			WHEN FeatureType = 22 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType =   -1 AND  FeatureSubType = 100 AND IsPhysicalCardTx = -1 THEN 	37
																			WHEN FeatureType = 23 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType =   -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	38
																			WHEN FeatureType = 25 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType =   -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	39
																			WHEN FeatureType = 27 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType =   -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	40
																			WHEN FeatureType = 28 AND Currency = 	1 AND CardTxType = 	-1 AND RemittanceType =   -1 AND  FeatureSubType = 99  AND IsPhysicalCardTx = -1 THEN 	41
																			WHEN FeatureType = 29 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType =   -1 AND  FeatureSubType = 0   AND IsPhysicalCardTx = -1 THEN 	42
																			WHEN FeatureType = 29 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType =   -1 AND  FeatureSubType = 1   AND IsPhysicalCardTx = -1 THEN 	43
																			WHEN FeatureType = 29 AND Currency = 	0 AND CardTxType = 	-1 AND RemittanceType =   -1 AND  FeatureSubType = 2   AND IsPhysicalCardTx = -1 THEN 	44
																			WHEN FeatureType = 101 AND Currency = 0 AND CardTxType =   101 AND RemittanceType =  101 AND  FeatureSubType = 101 AND IsPhysicalCardTx = -1 THEN 	45
																			WHEN FeatureType = 101 AND Currency = 1 AND CardTxType =   101 AND RemittanceType =  101 AND  FeatureSubType = 101 AND IsPhysicalCardTx = -1 THEN 	46
																			WHEN FeatureType = 101 AND Currency = 2 AND CardTxType =   101 AND RemittanceType =  101 AND  FeatureSubType = 101 AND IsPhysicalCardTx = -1 THEN 	47
																			WHEN FeatureType = 101 AND Currency = 3 AND CardTxType =   101 AND RemittanceType =  101 AND  FeatureSubType = 101 AND IsPhysicalCardTx = -1 THEN 	48
																			WHEN FeatureType = 101 AND Currency = 4 AND CardTxType =   101 AND RemittanceType =  101 AND  FeatureSubType = 101 AND IsPhysicalCardTx = -1 THEN 	49
																			WHEN FeatureType = 24  AND Currency = 0 AND CardTxType =	-1 AND RemittanceType =   -1 AND  FeatureSubType = 99	AND IsPhysicalCardTx = -1 THEN	50

																			WHEN FeatureType =2 and	Currency = 0 and	CardTxType =  1 and	RemittanceType = 101 and	FeatureSubType = 101 and	IsPhysicalCardTx = -1 THEN	51
																			WHEN FeatureType =7 and	Currency = 1 and	CardTxType = -1 and	RemittanceType = -7  and	FeatureSubType = 99 and	IsPhysicalCardTx = -1 THEN	52
																			WHEN FeatureType =7 and	Currency = 1 and	CardTxType = -1 and	RemittanceType = 0   and	FeatureSubType = 99 and	IsPhysicalCardTx = -1 THEN	53
																			WHEN FeatureType =7 and	Currency = 1 and	CardTxType = -1 and	RemittanceType = 1   and	FeatureSubType = 99 and	IsPhysicalCardTx = -1 THEN	54
																			WHEN FeatureType =7 and	Currency = 2 and	CardTxType = -1 and	RemittanceType = -7  and	FeatureSubType = 99 and	IsPhysicalCardTx = -1 THEN	55
																			WHEN FeatureType =7 and	Currency = 2 and	CardTxType = -1 and	RemittanceType = 0   and	FeatureSubType = 99 and	IsPhysicalCardTx = -1 THEN	56
																			WHEN FeatureType =7 and	Currency = 2 and	CardTxType = -1 and	RemittanceType = 1   and	FeatureSubType = 99 and	IsPhysicalCardTx = -1	THEN	57
																			WHEN FeatureType =7 and	Currency = 4 and	CardTxType = -1 and	RemittanceType = -7  and	FeatureSubType = 99 and	IsPhysicalCardTx = -1 THEN	58
																			WHEN FeatureType =7 and	Currency = 4 and	CardTxType = -1 and	RemittanceType = 0   and	FeatureSubType = 99 and	IsPhysicalCardTx = -1 THEN	59
																			WHEN FeatureType =7 and	Currency = 4 and	CardTxType = -1 and	RemittanceType = 1   and	FeatureSubType = 99 and	IsPhysicalCardTx = -1 THEN	60
																			WHEN FeatureType =8 and	Currency = 1 and	CardTxType = -1 and	RemittanceType = -1  and	FeatureSubType = 99 and	IsPhysicalCardTx = -1 THEN	61
																			WHEN FeatureType =29 and	Currency = 0 and	CardTxType = -1 and	RemittanceType = -1  and	FeatureSubType = 99 and	IsPhysicalCardTx = -1 THEN	62
																			WHEN FeatureType =2 and	Currency = 0 and	CardTxType = 7 and	RemittanceType = -1  and	FeatureSubType = 99 and	IsPhysicalCardTx = -1 THEN	63
																			WHEN FeatureType =33 and	Currency = 0 and	CardTxType = -1 and	RemittanceType = -1  and	FeatureSubType = 99 and	IsPhysicalCardTx = -1 THEN	64

																			WHEN FeatureType = 28 AND Currency = 	0 AND CardTxType =   -1 AND	RemittanceType = -1  AND  FeatureSubType = 50  AND IsPhysicalCardTx = -1 THEN 	65
																			WHEN FeatureType = 28 AND Currency = 	0 AND CardTxType =   -1 AND	RemittanceType = -1  AND  FeatureSubType = 51  AND IsPhysicalCardTx = -1 THEN 	66
																			WHEN FeatureType = 28 AND Currency = 	0 AND CardTxType =   -1 AND	RemittanceType = -1  AND  FeatureSubType =-28  AND IsPhysicalCardTx = -1 THEN 	67
																			WHEN FeatureType = 32 AND Currency =  0 AND CardTxType =   -1 AND RemittanceType = -32   AND  FeatureSubType = 99	AND IsPhysicalCardTx = -1 THEN	68
																			WHEN FeatureType = 32 AND Currency =  0 AND CardTxType =   -1 AND RemittanceType =   0   AND  FeatureSubType = 99	AND IsPhysicalCardTx = -1 THEN	69
																			WHEN FeatureType = 32 AND Currency =  0 AND CardTxType =   -1 AND RemittanceType =   1   AND  FeatureSubType = 99	AND IsPhysicalCardTx = -1 THEN	70
																		ELSE -1
																		END CombinationType
												,	[LifeTime_Interval]
												,   FeatureType
												,   Currency
												,   CardTxType
												,   RemittanceType
												,   FeatureSubType
												,   IsPhysicalCardTx
												,	TotalTxCount
												,	TotalTxVolume
												,	TotalTxFee
												,	AvgAgebyUU
												,   AvgTicketSize
												,	AvgTxVolumePerCapita
												,	AvgTxCountPerCapita
									--			,   AvgAgebyTx
												,	UUwithTx
												--,	CASE WHEN LEN(CONVERT(CHAR(4),AvgTime)) = 4 THEN CONVERT(TIME,LEFT(CONVERT(CHAR(4),AvgTime),2) + ':' + RIGHT(CONVERT(CHAR(4),AvgTime),2),8)
												--		 WHEN LEN(CONVERT(CHAR(4),AvgTime)) = 3 THEN CONVERT(TIME,LEFT(CONVERT(CHAR(4),AvgTime),1) + ':' + RIGHT(CONVERT(CHAR(4),AvgTime),2),8)
												--		 WHEN LEN(CONVERT(CHAR(4),AvgTime)) = 2 THEN CONVERT(TIME,LEFT(00,2)					   + ':' + LEFT (CONVERT(CHAR(4),AvgTime),2),8)
												--		 else null end AvgTime
												,	AvgDistinctTxDay
										--		,AvgUserLifeTimebyTx

		--INTO  DWH_Workspace..MonthlyUserLifeTimeTenureX
		--INTO DWH_Workspace..MonthlyLifeTimeTenures
		FROM
				(

											SELECT
												 a.YearDate, a.MonthDate --	'GroupedMonthDate'
												 ,StartofMonth
												,a.FeatureType
												,a.Currency
												,CardTxType
												,RemittanceType 
												,FeatureSubType
												,IsPhysicalCardTx
 	
												,ISNULL(SUM(a.TxCount),0)															TotalTxCount
												,ISNULL(ABS(SUM(a.TotalVolume)),0)													TotalTxVolume
												,ISNULL(ABS(SUM(a.TotalFee)),0)														TotalTxFee
												,ISNULL(AVG( UserAge),0)															AvgAgebyUU	
 								         --       ,ISNULL(SUM(UserAgeTxCountParameter),0)/ISNULL(SUM(a.TxCount),0)					AvgAgebyTx
												,AVG(DistinctTxDay*1.00)															AvgDistinctTxDay
												,ISNULL(COUNT(DISTINCT a.UserKey),0)					 							UUwithTx
												
 
												
												/*DIVISIONS*/
												
 										--		,	COALESCE(SUM((DATEDIFF(DAY,CreatedAt,  StartofMonth)/(365.25))*TxCount)/(NULLIF(SUM(a.TxCount), 0)), 0)								AvgUserLifeTimebyTx		
												,	COALESCE(ABS(ABS(SUM(a.TotalVolume)))*1.000/(NULLIF(SUM(a.TxCount), 0)), 0)															AvgTicketSize
												,	COALESCE(ABS(ABS(SUM(a.TotalVolume)))*1.000/(NULLIF(COUNT(DISTINCT a.UserKey), 0)), 0)												AvgTxVolumePerCapita
												,	COALESCE(SUM(a.TxCount)*1.000 /	(NULLIF(COUNT(DISTINCT a.UserKey), 0)), 0)															AvgTxCountPerCapita
												--,(COALESCE(SUM(a.SumParameterTime_hh) /(NULLIF(SUM(a.TxCount), 0)), 0))*100 + (COALESCE(SUM(a.SumParameterTime_mm) /(NULLIF(SUM(a.TxCount), 0)), 0))					AvgTime




												,CASE WHEN [LifeTime]<=          1		              THEN 0
													  WHEN [LifeTime]>1		and [LifeTime]<=3		  THEN 1
													  WHEN [LifeTime]>3		and [LifeTime]<=6		  THEN 2
													  WHEN [LifeTime]>6		and [LifeTime]<=12		  THEN 3
													  WHEN [LifeTime]>12	and [LifeTime]<=24		  THEN 4
													  WHEN [LifeTime]>		    24					  THEN 5
																						       END	[LifeTime_Interval]



											FROM
															(
																Select  K.UserKey
																	   ,u.CreatedAt
																	   ,k.Currency
																	   ,k.TxCount
																	   ,k.TotalVolume
																	   ,k.TotalFee
																	   --,(COALESCE(k.SumParameterTime_hh /(NULLIF(k.TxCount, 0)), 0))*100 + (COALESCE(k.SumParameterTime_mm /(NULLIF(k.TxCount, 0)), 0)) AvgParameterTime
																	   --,NTILE(4) OVER (order by ((COALESCE(k.SumParameterTime_hh /(NULLIF(k.TxCount, 0)), 0))*100 + (COALESCE(k.SumParameterTime_mm /(NULLIF(k.TxCount, 0)), 0)))) QuartileParameterTime
																	   --,k.SumParameterTime_hh
																	   --,k.SumParameterTime_mm
																	   ,k.YearDate
																	   ,k.MonthDate
																	   ,k.StartofMonth
																	   ,DistinctTxDay
																	   ,k.FeatureType
																	   ,k.CardTxType
																	   ,k.RemittanceType
																	   ,k.FeatureSubType
																	   ,k.IsPhysicalCardTx
																	   , CASE WHEN DateOfBirth < StartofMonth AND DateOfBirth IS NOT NULL THEN DATEDIFF(DAY,DateOfBirth,StartofMonth)/(365.25) ELSE NULL END as UserAge
					--neden sorunlu anlamadim					--	   ,(CASE WHEN DateOfBirth < StartofMonth AND DateOfBirth IS NOT NULL THEN DATEDIFF(DAY,DateOfBirth,StartofMonth)/(365.25) ELSE NULL END) * k.TxCount UserAgeTxCountParameter
																	   ,DATEDIFF(MONTH, u.Createdat, StartofMonth) [LifeTime]




																From
																			(
																			/**/
																						select   count(Id)							   'TxCount'
																							  ,  sum(Amount)						   'TotalVolume'
																							  ,  sum(Fee)							   'TotalFee'
																					--		  ,SUM(CAST(FORMAT(CreatedAt,'HH') AS TINYINT)) SumParameterTime_hh
																					--		  ,SUM(CAST(FORMAT(CreatedAt,'mm') AS TINYINT)) SumParameterTime_mm
																							  ,APPROX_COUNT_DISTINCT(CONVERT(DATE,CreatedAt)  )    DistinctTxDay
																					--		  ,APPROX_COUNT_DISTINCT(MONTH(CreatedAt))			   DistinctTxMonth
																					--		  ,(COALESCE(SUM(CAST(FORMAT(CreatedAt,'HH') AS TINYINT)) /(NULLIF(count(Id), 0)), 0))*100 + (COALESCE(SUM(CAST(FORMAT(CreatedAt,'mm') AS TINYINT)) /(NULLIF(count(Id), 0)), 0))   AvgParameterTime
																					--		  ,NTILE(4) OVER (order by ((COALESCE(SUM(CAST(FORMAT(CreatedAt,'HH') AS TINYINT)) /(NULLIF(count(Id), 0)), 0))*100 + (COALESCE(SUM(CAST(FORMAT(CreatedAt,'mm') AS TINYINT)) /(NULLIF(count(Id), 0)), 0)))) QuartileParameterTime
																							  ,YEAR(CreatedAt)  YearDate
																							  ,MONTH(CreatedAt) MonthDate
																							  ,dateadd(day, 1, eomonth(CreatedAt, -1)) StartofMonth	
																							  ,UserKey
																							  ,FeatureType
																							  ,Currency
																							  ,CASE WHEN IsPhysicalCardTx		   IS NULL THEN -1 ELSE IsPhysicalCardTx		  END IsPhysicalCardTx
																							  ,CASE WHEN CardTxType  IS NULL THEN -1 ELSE CardTxType  END CardTxType
																							  ,CASE WHEN FeatureSubType	   IS NULL THEN 99 ELSE FeatureSubType	  END FeatureSubType
																							  ,CASE WHEN RemittanceType IS NULL THEN -1 ELSE RemittanceType END RemittanceType		
																						from (
											  Select Id, Currency, ABS(Amount)/*Mutlak deger aldik.*/ Amount, Fee, CreatedAt, CreatedAt_DateKey, UserKey,	FeatureType,'101'   FeatureSubType, CardTxType,'101' RemittanceType, CASE WHEN IsPhysicalCardTx IS NULL AND OperatorUserKey IS NOT NULL THEN 2 WHEN IsPhysicalCardTx IS NULL AND OperatorUserKey IS NULL AND IsCancellation = 1 THEN 3 ELSE IsPhysicalCardTx END IsPhysicalCardTx FROM FACT_Ledger	 (nolock) where FeatureType = 2 AND CardTxType = 1 AND CreatedAt >= dateadd(day, 1, eomonth(getdate(), -@m)) AND CreatedAt < @BaseDay
											  UNION all	
											  Select Id, Currency, Amount, Fee, CreatedAt, CreatedAt_DateKey, UserKey, '101' FeatureType,'101'   FeatureSubType,'101'  CardTxType,'101' RemittanceType, '-1' IsPhysicalCardTx  FROM FACT_Ledger	 (nolock) where FeatureType IN (8,26,7,2,11,12,13,14,15,17,18,19,20,22,23,24,25,27,28,29,32,33) AND CreatedAt >= dateadd(day, 1, eomonth(getdate(), -@m)) AND CreatedAt < @BaseDay
											  UNION all	 																															 

											  Select Id, Currency, Amount, Fee, CreatedAt, CreatedAt_DateKey, UserKey, FeatureType,		CASE WHEN FeatureType = 19 AND SIGN(Amount) = -1 AND IsCancellation = 0 THEN 51
																																			 WHEN FeatureType = 19 AND SIGN(Amount) =  1 AND IsCancellation = 0 THEN 50
																																			 WHEN FeatureType = 13 AND SIGN(Amount) = -1 AND IsCancellation = 0 THEN 51
																																			 WHEN FeatureType = 13 AND SIGN(Amount) =  1 AND IsCancellation = 0 THEN 50
																																			 WHEN FeatureType = 28 AND SIGN(Amount) = -1 AND IsCancellation = 0 AND Currency = 0 THEN 51
																																			 WHEN FeatureType = 28 AND SIGN(Amount) =  1 AND IsCancellation = 0 AND Currency = 0 THEN 50
																																		ELSE FeatureSubType END FeatureSubType,		CardTxType,	  RemittanceType, '-1' IsPhysicalCardTx  FROM FACT_Ledger			  (nolock) where FeatureType IN (8,26,7,2,11,12,13,14,15,17,18,19,20,22,23,24,25,27,28,29,32) AND CreatedAt >= dateadd(day, 1, eomonth(getdate(), -@m)) AND CreatedAt < @BaseDay
											  UNION all	 																															 
											  Select Id, Currency, Amount, Fee, CreatedAt, FORMAT(CreatedAt,'yyyyMMdd') CreatedAt_DateKey, UserKey, FeatureType, '99' FeatureSubType, '-1'  CardTxType,'-1' RemittanceType, '-1' IsPhysicalCardTx  FROM FACT_ExternalLedger	  (nolock) where FeatureType = 24 AND CreatedAt >= dateadd(day, 1, eomonth(getdate(), -@m)) AND CreatedAt < @BaseDay
											  --UNION all																																 
											  --Select Id, Currency, Amount, Fee, CreatedAt, CreatedAt_DateKey, UserKey, FeatureType, '99' FeatureSubType,		CardTxType,	  RemittanceType, '-1' IsPhysicalCardTx  FROM FACT_Ledger_Before2020 (nolock) where FeatureType IN (8,26,7,2,11,12,15) AND CreatedAt >= dateadd(day, 1, eomonth(getdate(), -@m)) AND CreatedAt < @BaseDay
											  UNION all	
											  Select Id, Currency, CASE WHEN FeatureType IN (7,28/*INVESTMENT OVERALL-2023-04-27_ADDED*/,32) THEN ABS(Amount) ELSE Amount END Amount, Fee, CreatedAt, CreatedAt_DateKey, UserKey, FeatureType, CASE WHEN FeatureType = 28 THEN -28/*INVESTMENT OVERALL-2023-04-27_ADDED*/ ELSE '99' END FeatureSubType, CASE WHEN FeatureType = 2 THEN -2 ELSE NULL END CardTxType, CASE WHEN FeatureType = 7 THEN -7 WHEN FeatureType = 32 THEN -32 ELSE NULL END RemittanceType, '-1' IsPhysicalCardTx FROM FACT_Ledger			 (nolock) where FeatureType IN (2,7,28/*INVESTMENT OVERALL-2023-04-27_ADDED*/,32,33) AND CreatedAt >= dateadd(day, 1, eomonth(getdate(), -@m)) AND CreatedAt < @BaseDay
											  --UNION all	
											  --Select Id, Currency, CASE WHEN FeatureType = 7 THEN ABS(Amount) ELSE Amount END Amount, Fee, CreatedAt, CreatedAt_DateKey, UserKey, FeatureType, '99' FeatureSubType, CASE WHEN FeatureType = 2 THEN -2 ELSE NULL END CardTxType, CASE WHEN FeatureType = 7 THEN -7 ELSE NULL END RemittanceType, '-1' IsPhysicalCardTx FROM FACT_Ledger_Before2020 (nolock) where FeatureType IN (2,7) AND CreatedAt >= dateadd(day, 1, eomonth(getdate(), -@m)) AND CreatedAt < @BaseDay																			
																																															
																								
																							 ) m
																						group by  UserKey
																								 ,FeatureType
																						--		 ,RemittanceType
																								 ,Currency
																								 ,CASE WHEN IsPhysicalCardTx		 IS NULL  THEN -1 ELSE IsPhysicalCardTx		 END
																								 ,CASE WHEN CardTxType IS NULL  THEN -1 ELSE CardTxType  END
																								 ,CASE WHEN RemittanceType IS NULL THEN -1 ELSE RemittanceType END
																								 ,CASE WHEN FeatureSubType  IS NULL	  THEN 99 ELSE FeatureSubType		 END
																								 ,dateadd(day, 1, eomonth(CreatedAt, -1))
																								 ,YEAR(CreatedAt)
																								 ,MONTH(CreatedAt)
																			) K
																					inner join DIM_Users u on u.User_Key=K.UserKey
															) a
											GROUP BY a.YearDate, a.MonthDate, StartofMonth
													,a.FeatureType
													,CardTxType
													,RemittanceType
													,Currency
													,FeatureSubType
													,IsPhysicalCardTx
													,CASE WHEN [LifeTime]<=          1		          THEN 0
													  WHEN [LifeTime]>1		and [LifeTime]<=3		  THEN 1
													  WHEN [LifeTime]>3		and [LifeTime]<=6		  THEN 2
													  WHEN [LifeTime]>6		and [LifeTime]<=12		  THEN 3
													  WHEN [LifeTime]>12	and [LifeTime]<=24		  THEN 4
													  WHEN [LifeTime]>		    24					  THEN 5
																									   END												
) P1
ORDER BY MonthKey, CombinationType, LifeTime_Interval