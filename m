Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8422E109316E
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Mar 2026 03:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o9hGNj4JvRgC0/A7SLnsGHgiwQNMw/ZBEzCFi7SZ1Do=; b=gca0qHssF10BKX
	IyzGBIMOlfUPU9pZH7042qsbIqG/kvZ4yFHgH0SucNS41B1H8jyU67T+ppNKSHYGvkXjrgVQwuXvV
	LGm+KaUTZ0/V+5wefP1oJuZvRgImvlCuQlEj6CvM5zT6ytlzwSx6+QqI8UBqclmAgbTQSvt0mEBe2
	s6BNELkeJ6YoHG7FSa8rZBP/kz8vV9OstBcCOHIi/q1q+lQmlWqc0yWFtRcp5oj+UJZgBufrgwm6o
	V3cA0zbFjW/WN1gfFO4Xor1h7VnNn8Oh0TxniaVaLBR7J4ShVx8RGYZ6qCYRmwZjBONTiCnL7VuVU
	68oSfoFXIkZ0e1G9Gpng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3QAU-0000000BxF2-2jQr;
	Fri, 20 Mar 2026 03:04:58 +0000
Received: from mail-japaneastazon11023098.outbound.protection.outlook.com ([52.101.127.98] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3QAQ-0000000BxEV-2Ubz
	for linux-mtd@lists.infradead.org;
	Fri, 20 Mar 2026 03:04:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KzAUlTWawEICXLFIPu8zysiHgbQ65eatuk4PHy9kFRotmTpPRECwrkVd9BpziANR67FJLLRRPAtUOyQIhVWv867M1eRJYDlPtwLeUgLISYOoD5AoN0Y5U4TffNmcRlnwblDiEfUfUW+rIcu8SZEBUK1Hz8cufH2FGyfiWnE0f+Szn7sK+u2EupdJVlPJKPVMdYvaWtM2/9DFP7A32w+5QzlnI+OzAKwMGG0iJxPpBlaVWMooMnA2yrZMPxsQm2UmlVNmv5f1EaajXEtPqt0fXFWrxf7vytm5LGFebR1r43ir24BuBp/41FRV2zBN+vqITmmxBFZeU8peh6g6+XUirQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVHtTDvoIsCcoeFrwNz6tmITm63nUHoulo7Co2qAxeI=;
 b=HvA1LYXLMhV4w4XpPTAEkByt4l0ckt1H+CuoiC82afBwM/9Ke2LfnqN7+sjiKt8+bJeEwQynIg5VfdJyx3wWRL4fOXx0Dgy8U49Ux409WaxtiuMbPsijM8hjXNQk/xtzlpNSKJ5q8mSBUYdiw1npDfX3UfO4RIKYm5kgmaIIfOvz5JnLd2fNYfPCEF1AJAwpaN+76fF7oStdfnwSIXYk4UlpkknscRU73bQoBJE8h5foiyjhPcWnwjXSDsmS2WSzWSt268YQPc1ttdXvAM8BDJc8iGVvUsQrmy8zeih8GIw5u5QH1EcS+neuLWWo6s2136v5CflAaMWqU85hB30l4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gigadevice.com; dmarc=pass action=none
 header.from=gigadevice.com; dkim=pass header.d=gigadevice.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gigadevice.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVHtTDvoIsCcoeFrwNz6tmITm63nUHoulo7Co2qAxeI=;
 b=Upc1tMsbiSjp/qmyXmLHOfF8FneK7GC91uuLC5bWjoRMH1JvHMlSXPIbvO6zgWiDs6b8+BhdtI8ZGZBWMpEXVW5glTyt+0gSDOrIRbiSCuEONslo7PN+Ka+oS3PJMlINk3p/R98YMRAX3pzZML1o1yeXKR3Uor24AdJ3qS3wq/Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gigadevice.com;
Received: from OS8PR06MB7358.apcprd06.prod.outlook.com (2603:1096:604:286::8)
 by TYSPR06MB7305.apcprd06.prod.outlook.com (2603:1096:405:99::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Fri, 20 Mar
 2026 03:04:46 +0000
Received: from OS8PR06MB7358.apcprd06.prod.outlook.com
 ([fe80::7663:8299:6284:bbc1]) by OS8PR06MB7358.apcprd06.prod.outlook.com
 ([fe80::7663:8299:6284:bbc1%5]) with mapi id 15.20.9723.019; Fri, 20 Mar 2026
 03:04:46 +0000
From: Victor <vlim@gigadevice.com>
To: git@amd.com,
	havish.mutya@amd.com,
	marek.vasut@gmail.com,
	tudor.ambarus@microchip.com,
	dwmw2@infradead.org,
	computersforpeace@gmail.com,
	bbrezillon@kernel.org,
	richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: vlim@gigadevice.com
Subject: [PATCH V1 0/1] drivers/mtd/spi-nor: add new part numbers
Date: Thu, 19 Mar 2026 20:04:29 -0700
Message-Id: <20260320030430.14064-1-vlim@gigadevice.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: DM6PR02CA0125.namprd02.prod.outlook.com
 (2603:10b6:5:1b4::27) To OS8PR06MB7358.apcprd06.prod.outlook.com
 (2603:1096:604:286::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS8PR06MB7358:EE_|TYSPR06MB7305:EE_
X-MS-Office365-Filtering-Correlation-Id: d87a4b58-809f-42c1-922c-08de862d70ee
X-LD-Processed: f84ba339-959c-4ab1-9b67-1e43414f945e,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|366016|10070799003|1800799024|56012099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: 2nL7cqLlJE7GN/cxxNSDh+A/DkWB4mOEZUtwgJJd45tvyPtcLg00M36dWwwScnhYHLPFQiEdR1X3ZnjvzfW+u2ke8Lyth6titnQ4AVt2QKgxAF7qhUn9rJyQHIpmcd1t8vA1j8iJOOfjSVljvRjI+uBfPZolZxCb/xHyLt0bFsxHybovR6NwJ+b6HWvv43Wc5VwoifRsvaQhHGe0CkFgJjPq9+gky6Ictv3uV9WvVXGD65WixAsxTMYKrGTSaS/JPnus19I9p2DqU6Gs/KdH5SfC9Jp7W8mXyLvTRcemV5r6SnVMKfQm1P4OipZBZ8L9hf0v2jTyr8v7OU/2zKlhO9OVMe6PNwswSaAlXue1EB+F+BrH0f1iQD0Dwftei8+RYfRFgJlyUujATYNgCW3jQFb2E/aePBFfSbcC/yE02KIRRtDCMs+zRpPR7i3gWcToEspgCyDDnmoYBW1+lifgqL2xwmkotb18+KDyVQ15YGlGb/dz/tOLcr4AeiBs2RLDiIbv9e/Kj056rK6/Y7W4TOh8gw71GQQr5POYhzezhDZLDxpsk1df8oMsN1M+JRvQCW+UY1iXgJ8g5UwpDp/U+miLsCl+7lGhm42yFkzTdfGTcREO2H8gAmiJqFllU8obKXBqu8xpidJoaknHMnnNhQ5whIk5o+i5s6parmz/EBkYsZI/99/L6rPo+jveivAYGogkzEwZTYVuqJSQ1n8ELIr7ZwoGjRUx8a3+4pIT0znd2dCJr3RCpaQ5M8FzrFGQyZGokdjU/iXjXTBwsPpuUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7358.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(10070799003)(1800799024)(56012099003)(18002099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iI0e6xiaKRkp9a797awHbf0XLRoxvCetuzhODq1sDvviv/JaebUIMT8AQxP8?=
 =?us-ascii?Q?esX1SdSxrIydNKWHG9dbpIykHROT+LMfRWUypVdeOV1yplcnBlkNDo0NWDbL?=
 =?us-ascii?Q?YwOzPZ+ADFY8KQeWV2zXxnU4UvEzp/yqXlNsxW8QBDX9ljf4hTtcZFp09up5?=
 =?us-ascii?Q?r4BfznHV12Y31TPGvh1sf4TrWusiBGZ4Wb31JdlOwKMof3yM8VNnY3zRDRuk?=
 =?us-ascii?Q?9VIEOi9FcniV5bxmFf247dw2SUbmEGunVEHLMBmSuddQZcuQx+p0IaHpNFMe?=
 =?us-ascii?Q?H1j41XbvdK7UpmbzRzTRn3tPjMUICl2iFfJpADGFcZ/MIupCVxJc7k+SRQBn?=
 =?us-ascii?Q?oRnIQzUwdc1glz3f/S88IbmNBuxw2+TCYmw6AI5c2HFwR4CBJUj8cyAxcs2v?=
 =?us-ascii?Q?ZzUnmCnP9Ycyzn2HIv+go7hck3uQzYOMh2Fs8JaFCVINte4CDE4mWba1ior9?=
 =?us-ascii?Q?kFcBH1P3yjLfs4liiCcQSRRsQUOFjCDCvHmcCyySFtfn46ag4zb2ucXoKvyR?=
 =?us-ascii?Q?55eXrPadopi+QHs5ec+THAD3CEDQoNJ3Vd7uuzjZ4mPwLOnD36Z8aUBPxj2c?=
 =?us-ascii?Q?WlXEa5FIBj/QdhTxuF8YMrhpW/MzTfh2ztbHCz2lHh77+WXEEU8GPVnphMGQ?=
 =?us-ascii?Q?vuQWs9tHpM6HfEk0rI8emkWM02YBJuCHqTdYlZgkYupSPYFNAUioK/3ZRAJK?=
 =?us-ascii?Q?Dkp+eOlB19xbw+feya1/4y9/4vLkoAyPdNpTWlwvWzEVITvy0379gSEpSA+X?=
 =?us-ascii?Q?oSlq/uABe6Cj1klLrF7aYCarodBj9ieUplLWnf/42r4EAv0XFdsqsto/YL9m?=
 =?us-ascii?Q?+iHH75YemzyPBdEo9Seyhqc9u4U4XQ3BYTvCUCAC663yXTygZDM/sh1N88lk?=
 =?us-ascii?Q?QWvyawL2YpfY9h2SlcHTPouCwYeUcZiubR62wTPZwO8QMiHMOF0LPgSduHvA?=
 =?us-ascii?Q?4jcfP2BdvS89TptD7rbj6l+GDJgILkdPva66TTFx2SJkc8Q65zvdi2AMPZXJ?=
 =?us-ascii?Q?A77HQe0+LxDSic3xBC5jogiUxv9gIRjRvc4Oqoy/e6MpoHOGHzPONOW7DHkE?=
 =?us-ascii?Q?75s4Rdf7fU6b0M38YHktcXxLkT8xOLpT+hMX/NLQb6+B+bQX6q4mL2HzofZ4?=
 =?us-ascii?Q?W0up0PhyqOUZMylfldQDKIat35rrbZJVNWMmUyI4wQxaMJkMGnCmkVClzfDf?=
 =?us-ascii?Q?4PSdz53AVpfhRLSPnidtniwewwxnGr6QfX98x5MPnpc0pApgERAxGhFFWIGx?=
 =?us-ascii?Q?SXXuBrU1WzWa323G0xDkgJ+nczmKnt8M3QJQnTrPp5FA5o/Dcwi10wHsY4lR?=
 =?us-ascii?Q?pcgyiBFOwvPiVig7gyq+2xDMP0K0KhG70qUwlo3/lF3H6ZzrM190ssLEYeYk?=
 =?us-ascii?Q?CgE3D148Ri5Bp1AXIV5/UPuhH8n7pDE+ODNah9IXuW/USgisSaOXaVDTCwHr?=
 =?us-ascii?Q?PYzoy+z43Z2Dd/2EEpZqpC/PCLlZuXQNE7R4T3lJ8ShY3hrIJHFIoiP718mK?=
 =?us-ascii?Q?OlmcNoTepEs3ZrU8R8f1bDlEK9u2WWJUiWO0A2qUqC9XlY1t4/W4xDGEAVjf?=
 =?us-ascii?Q?JUmyvw+BOTfQEsdC/uw/XN7MGa2GbQ4rwEpma86TnAOdt1VSE6/N5B+sJqic?=
 =?us-ascii?Q?smXXhZYI45HI83h7yuPuoD5+r+uIlCGf567+iw1q9IO2Wirk5xwHtkzP4/3j?=
 =?us-ascii?Q?JwQ0wf9En8UfdtXyUDLUHrpcqmdyzy/KyfOp6rwK61ME862xosYHTTGdhfh2?=
 =?us-ascii?Q?2ezaR1eQg55HXl5PZcgAMIgUS7T1MXr1j+uZi6gN8/lKJb9lg6UE5qgrvq3q?=
X-MS-Exchange-AntiSpam-MessageData-1: MlLR7pb7ICImLw==
X-OriginatorOrg: gigadevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d87a4b58-809f-42c1-922c-08de862d70ee
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7358.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 03:04:46.2890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f84ba339-959c-4ab1-9b67-1e43414f945e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DieymvDgelzu2hnWB6pO5qjh7+AkML2FThR/gzgP2YqWpJ01YjPiVFEaUS3yAAWvOMt5ygXD8YmiUDuLXlKBSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB7305
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_200454_647336_40F58547 
X-CRM114-Status: UNSURE (   4.48  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

These are part numbers added
I can send the datasheet through email

gd25f64
gd25f128
gd25lq128
gd25lf128
gd25f256
gd25lq256
gd25lf256
gd25b512
gd25f512
gd25lb512
gd25lf512
gd55b01g
gd55f01g
gd55lb01g
gd55lf01g
gd55b02g
gd55f02g
gd55lb02g
gd55lf02g

Victor (1):
  drivers/mtd/spi-nor: add new part numbers

 drivers/mtd/spi-nor/spi-nor.c | 96 ++++++++++++++++++++++++++++++++++-
 1 file changed, 95 insertions(+), 1 deletion(-)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
