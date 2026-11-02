Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852C0606A326
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2026 18:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p5GaZgh+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=AkDbAgLN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=B98Lt4mydz8B1wS74BbyfgF62WrxsJMbS9AfEbzOCYQ=; b=p5GaZgh+7lNCvzDITACDDlTfgO
	CPEq9zmo/SGVdpUFuCpV1EW7f+cYvbd5hY9C2qNinWnaHe1rRfCGHysaFwBAD+yqwlxzE17dPPWeg
	6HF0CUFA5fApfozYakZ6s/NobKAtLXlLPyIqW3vUIcOphB0T8HNwR4/3lstCTFkBqUTuQWnitHM5H
	6rGqHZ0qaRyilSGx38y50v2KmA4JvXCqndM9WynOPMLnem5j1/kTR9fwD2UUSbWvDNqdSDhW0LT/X
	U8B4QIvblBVLadpGyzdC3/w4zqKQ0PlAq5sxLXqNTG6Lx78ZJSTLFT9/w7l1/dNW9KCMux63B2ycU
	6ctZhNtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNwY0-0000000HZIp-2CjN;
	Mon, 02 Nov 2026 18:14:20 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNwXx-0000000HZIM-3UW5;
	Mon, 02 Nov 2026 18:14:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9t2gTtzpG2d4Etpgfmb8oGlpKc9jOcaWxR3C5JjiQlto4FgyMsZZ5tXZaHvoZBREbpYLfyA3C5UmGPcdFIu7E0iOL5ks78MMjd/LCYRb6HhESuUya/cFHPIs+s2p3nZ352XjV2gzZv07xBA6oVyf7P5LkC3wx0MXtpWpK/CS7TNRJ7gCPBuSn5PVziUVgYwXUHVpY3s2vbkRH8IaeIx59zxuSymxa6J2zdyFh+iaTcC3tufY7MuL4Bd3sq8J9C4W0TV680bbSFJx6OGiHnuRg+aLqc9239fyKComCQjvtad2+PMTE4yrAVglbLf5OfrZDxdD3s8zH8+9HMy8eGzlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQA36f9YUS1vMk6hJDcPYVnkMaOfqBEsahZNbSftY0M=;
 b=v5QO52leGGFkYJzucIoVg42YcDyPE3vkIegjlEvP2y9Me4zE7qx7h9zeJeXuPBa/8Gsu4V8Oeg/ois1+0XgfjpAxHLxKAQg+heyyhCeLLjKzYvET3mt37g8LKKAaUPT7siofGHgNPR3NSWauMyTpEOFFPFmkBOsOeK1ZOFXzXd0t2Cdr0jmEhgWgWbXO92HnSSftHWNBwCQarEpCJsSpJF82aodW2eTNCp6Wgs24/BMIgXbyK/GzKAVj9HdIWg+HSEiH95H8uDW3M2UqdA94dXjrVp5yGFrbMvrixuMGS8k3aphbxtkhSdlruq24sM/fATacCDukgH2mCUQdC3w4OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQA36f9YUS1vMk6hJDcPYVnkMaOfqBEsahZNbSftY0M=;
 b=AkDbAgLN8L5479NTUM4NVh3BJ/sKgR5bchqslCUQpsBa7beMnJ3OE+LgTuY8zpYF41aNDXkyNiu9F+LkAhohvlSk9flH6yoH0sIHKav5Qjte0spVQrSYO1awecn3ogc7ADiWOPh27EtPLd1wdaPCw6Dc4N/irmbdJ4MM0HKV7RMxozfslRBEcjzvTlf7gse/UWwHINwbxnRIItDT85KkxWCUdPWBh3B5MNMtcf3WEHiy1wAyvD33vXEp216vq0HMY36w99nHKFIq3Z2MLnDBTMYo5ho1FQvSN8RTgpE7J8rex0bmLq2wir6Z/+iKMw7Y28G5khD5vYoJBlWT5qpESw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DBBPR04MB7772.eurprd04.prod.outlook.com (2603:10a6:10:1e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 18:14:13 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 18:14:13 +0000
From: Frank.Li@oss.nxp.com
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Han Xu <han.xu@nxp.com>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rosen Penev <rosenp@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Wentao Liang <vulab@iscas.ac.cn>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Triet Hoang <triet.hoang.dev@gmail.com>,
	linux-mtd@lists.infradead.org (open list:HYPERBUS SUPPORT),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Microchip (AT91) SoC support),
	imx@lists.linux.dev (open list:FREESCALE GPMI NAND DRIVER),
	linux-mips@vger.kernel.org (open list:MIPS/LOONGSON1 ARCHITECTURE),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE)
Cc: imx@lists.linux.dev,
	vkoul@kernel.org
Subject: [PATCH 1/1] mtd: use dmaengine_desc_set_callback()
Date: Mon,  2 Nov 2026 13:13:41 -0500
Message-ID: <20261102181406.3994422-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: DS1P221CA0025.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:8:242::16) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DBBPR04MB7772:EE_
X-MS-Office365-Filtering-Correlation-Id: 7566565d-1caf-4b02-b3e0-08df390d191f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|376014|23010399003|7416014|1800799024|10067099003|261102123227099003|18002099003|921020|56012099006|11063799006|261021121427099003|261021123027099003|261026121527099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: f6ZzAQDC1FUDoZM/b3SjyUqY20UXQkn3nYWacrpcX46EWK8vbeVvUkSCVqZHleLjeDeC27NkYl+48k1GIW8/osdzwAdwhQOJ2EBkdC+N3txj9qxft67YrqJEKeR3w1OCP7rfpU2VPcER+co4dtlZF7Yp9Q6+mkU6hhtvnTHAmv6jgsOBxQcbZs+GKzTFPMvzmveZtdzdRm6Wt3Qqn8kJdzekGIKNiUGTTa40geT9VPcx8W8a+iTLqzhLT/XFMdy2pu/BaviXNc2pLxNBZTU2NE0NiBM78adbXTIebk2CoeEo8AZ8N2qezLrgA7U6TuUvi0++hBGq5qCiJqmGk+5/RjLw+TB1/qepKjIibo8iKpOeUtVnnq4CogkZxI2998yxEIj4SFPxsbYo0T4t4sVjuQJtskWTYbkga/63Sp6LTDGzTjjnKW+lqHLlHIsd0K/BR0NpXwXFovnK2+GGfLu2gUr1t/OWx5gVbrkBrC7Hh/AvSA1DDPs7PwiazC03KS8bdUYmfpSvOacDVfDEfciI9TK3Kxt9U0NXalK/T1fckVgy2vpiiVRZ8O3CHAOfX0RBh6Plfy7SmmCqV6CORX+kKsNl1fjOnqnW4HaYDVmsvuizum5iNRKArSco1VAY4z3hteuVP6uLYhpH28XL3aHeL8GyyCtZ7D5m1CRaOnTOnsuQU2gs9VxvKrxt27tpQhexUwlmByyEPV1gOlNKMoFULA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(23010399003)(7416014)(1800799024)(10067099003)(261102123227099003)(18002099003)(921020)(56012099006)(11063799006)(261021121427099003)(261021123027099003)(261026121527099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QsfL7PvGwKbv9m6XpfN32Z4cT/2YwfeXL6nXsD0HMuwzBOECNrIoCGfxUFOI?=
 =?us-ascii?Q?aA4/WcMJLBkvNVwifqAc8mh1WrAEOFH/LkpV6sxGGB2e9RZks8ETrZEQEusr?=
 =?us-ascii?Q?mChJrJcVHuBI4wRZILIiX0yzNSbF5bw0DLhoOen1PBGY3n0bicdHqt2bNcRz?=
 =?us-ascii?Q?3ZXxyaGzFrjX9NlViADKLqsgnRh8II1VuOmH3ZJDMdMSUoLYR3N5gMr/AUBq?=
 =?us-ascii?Q?wh+kiuGT8d4NyX+9dr6IjFjkAP7xj/1y/FVw5ZJnHf0SkBO+WPl8mzMHqG2W?=
 =?us-ascii?Q?/MjzazQuaelxVSK2b+SXtPzKiPsiZaalE+sTnh0LF5emeJcp033vetZwbQRL?=
 =?us-ascii?Q?wIpiChw8o1tD6D5BkY6oK38ETxSiYZY78PMY+kw6EiFiAFb6aLEjhChBYzR0?=
 =?us-ascii?Q?cS54jsPnsyFasTFMGOWdz8uuXs7XpYFPmMdXLRj4zCm/cqJPovQgqkcWqqkZ?=
 =?us-ascii?Q?XoYVTgQIyApsXQ5B1lZ0uzpGIDn1QR/3r2yNGFWSUYLNedrQnFjApadPfqeL?=
 =?us-ascii?Q?cKHatVoxkAWSnPeJSFdJhJYaTDfoBKQphCwujXDLMC/dqf9UhSAMtfv/SdmL?=
 =?us-ascii?Q?df6pIUNRPvugmNIZItBwcenbYMrQ/v5trolW8vD5WRW2Fmf0Czr6OHzwFDJO?=
 =?us-ascii?Q?jpvGc+gk38Rm6buD7v/qpgboDnxWuQl3lBfUyIwFXAumTJSYYlHPDlVjf2uA?=
 =?us-ascii?Q?8cKCSTFnTtcTSx0lHTFBT3KKp7NMD/wm+wmwTAvgOkjjExTYJlA04KKPFb+v?=
 =?us-ascii?Q?YAYf1tqNfOCQ6nOKHEq3MsS17SMS+afYUay4HH1RsjTH8MAGwixfhQ3Hl6q2?=
 =?us-ascii?Q?bY1npkvMMRV1gdM0Gcs5xGFXm6mEqMH0SuOJLJ46bhL/l546nIdQcTAoFYq7?=
 =?us-ascii?Q?ng03nSp1sC4Qbv0Cyek/tloXdkfj5c1vUoO0N63DhUttZXwHDpARnrptKxRp?=
 =?us-ascii?Q?Boc70aG62uZnnxeJcZS488A6abfZB7fPjyqk1Cn/pUu//WGQVRXBnwLbtm3X?=
 =?us-ascii?Q?M+07CWheRI6el2wqsG0Lpilco/u8pVt4s7zU01gpjtedHBVTb29mDxGMdAUY?=
 =?us-ascii?Q?PsqHTemQYjKoCHf5DT2WFwlhoJKXPVEZBRtfsQqLdmxCm2BVEegZ6hWx5YZw?=
 =?us-ascii?Q?kICF0W5iUfJZ551UbIiA8xtKd5wIfcWVqvDJx7QIZ73xn8k5GgNLx1duUR6e?=
 =?us-ascii?Q?EdKRp8kDx4HfBOfEuvKSiMd/t/C1nrsHQJXSh4QJDxPN2gr+EU+936r/K+fX?=
 =?us-ascii?Q?FlcdDaVe+xmDQmw9WwF1ikR15AmuiWI0L5ky8LbD13RXu7JeqXcHqRjBD4LR?=
 =?us-ascii?Q?dC8cRfjkTGs5Sc//CP2AokgGjiBavG0eOIFvtOvsF1zKavwgV93RaAFsW4dx?=
 =?us-ascii?Q?Y9oxtFlpd7uu2rXFBY7RgkQXxQ5MPhslwFmp1ZG1oodYb9QSDuGhKoH5EU11?=
 =?us-ascii?Q?tLZOAjDNHLU5lBUXk63DEN7Ht8jRTg6SAnPfy1dJNxDHYSNFTMZDMymFsmOi?=
 =?us-ascii?Q?ivz4fPUg7G8BxJZ9NdZf3KCPeeOPuUCWybU/R70tO4vGS5p7j6BMnEQnqh4O?=
 =?us-ascii?Q?n9Ng6xmQeu+f+AH0wimL8M8VbfXGuN3yMik2Aj11X/ZyJAv4SJYJxMJ648l3?=
 =?us-ascii?Q?0a21dnXRnyY+sV1Z2GDUXXP3aFQm+WXaQ3SqYw2fbbo+b3tHc5dHhyb7Xbt+?=
 =?us-ascii?Q?X4a+EQqWzmh05cIekJEqED1zMT1hzAkgvDMcGGbmekc38B1+NUCCs0OZ1pYG?=
 =?us-ascii?Q?YaVlyjFs4T87O/bAJLHYrtPQTY0azmM4GKRnqPyd03VCBulcJOzb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7566565d-1caf-4b02-b3e0-08df390d191f
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 18:14:12.9949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XXI92vXzjojEzI1qV/hRkYtlTLh7rst2DH7AktqE9mz402/nOUGQ0ot142X51yEP9pJE/9eMDq2iatx/NvZde2+w8EQTr0GYnLus0mQM03iXXEteFHjQv2JJ8sRYO3Mg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_101418_046075_925C2A9C 
X-CRM114-Status: GOOD (  10.43  )
X-Spam-Score: 0.0 (/)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Frank Li <Frank.Li@nxp.com>

Replace open-coded assignments to callback and callback_param fields
of struct dma_async_tx_descriptor with calls to the
dmaengine_desc_set_callback() helper across sound drivers.

No functional change intended. Prepare to make struct
dma_async_tx_descriptor private to the DMA engine.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/mtd/hyperbus/hbmc-am654.c               | 3 +--
 drivers/mtd/nand/onenand/onenand_omap2.c        | 3 +--
 drivers/mtd/nand/qpic_common.c                  | 4 ++--
 drivers/mtd/nand/raw/atmel/nand-controller.c    | 3 +--
 drivers/mtd/nand/raw/cadence-nand-controller.c  | 3 +--
 drivers/mtd/nand/raw/fsmc_nand.c                | 3 +--
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c      | 3 +--
 drivers/mtd/nand/raw/intel-nand-controller.c    | 3 +--
 drivers/mtd/nand/raw/loongson-nand-controller.c | 3 +--
 drivers/mtd/nand/raw/lpc32xx_mlc.c              | 3 +--
 drivers/mtd/nand/raw/lpc32xx_slc.c              | 3 +--
 drivers/mtd/nand/raw/omap2.c                    | 3 +--
 drivers/mtd/nand/raw/sh_flctl.c                 | 3 +--
 drivers/mtd/nand/raw/stm32_fmc2_nand.c          | 8 ++++----
 14 files changed, 18 insertions(+), 30 deletions(-)

diff --git a/drivers/mtd/hyperbus/hbmc-am654.c b/drivers/mtd/hyperbus/hbmc-am654.c
index 8a14e908d0b53..56b265125c7e8 100644
--- a/drivers/mtd/hyperbus/hbmc-am654.c
+++ b/drivers/mtd/hyperbus/hbmc-am654.c
@@ -100,8 +100,7 @@ static int am654_hbmc_dma_read(struct am654_hbmc_device_priv *priv, void *to,
 	}
 
 	reinit_completion(&priv->rx_dma_complete);
-	tx->callback = am654_hbmc_dma_callback;
-	tx->callback_param = priv;
+	dmaengine_desc_set_callback(tx, am654_hbmc_dma_callback, NULL, priv);
 	cookie = dmaengine_submit(tx);
 
 	ret = dma_submit_error(cookie);
diff --git a/drivers/mtd/nand/onenand/onenand_omap2.c b/drivers/mtd/nand/onenand/onenand_omap2.c
index 644498187d8fa..5bd906cc02d82 100644
--- a/drivers/mtd/nand/onenand/onenand_omap2.c
+++ b/drivers/mtd/nand/onenand/onenand_omap2.c
@@ -337,8 +337,7 @@ static inline int omap2_onenand_dma_transfer(struct omap2_onenand *c,
 
 	reinit_completion(&c->dma_done);
 
-	tx->callback = omap2_onenand_dma_complete_func;
-	tx->callback_param = &c->dma_done;
+	dmaengine_desc_set_callback(tx, omap2_onenand_dma_complete_func, NULL, &c->dma_done);
 
 	cookie = dmaengine_submit(tx);
 	if (dma_submit_error(cookie)) {
diff --git a/drivers/mtd/nand/qpic_common.c b/drivers/mtd/nand/qpic_common.c
index 91ae970734f80..4d5d5edb63e99 100644
--- a/drivers/mtd/nand/qpic_common.c
+++ b/drivers/mtd/nand/qpic_common.c
@@ -584,8 +584,8 @@ int qcom_submit_descs(struct qcom_nand_controller *nandc)
 		cookie = dmaengine_submit(desc->dma_desc);
 
 	if (nandc->props->supports_bam) {
-		bam_txn->last_cmd_desc->callback = qcom_qpic_bam_dma_done;
-		bam_txn->last_cmd_desc->callback_param = bam_txn;
+		dmaengine_desc_set_callback(bam_txn->last_cmd_desc,
+					    qcom_qpic_bam_dma_done, NULL, bam_txn);
 
 		dma_async_issue_pending(nandc->tx_chan);
 		dma_async_issue_pending(nandc->rx_chan);
diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 0bdbcbb50d94c..45463b8d405ec 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -394,8 +394,7 @@ static int atmel_nand_dma_transfer(struct atmel_nand_controller *nc,
 		goto err_unmap;
 	}
 
-	tx->callback = atmel_nand_dma_transfer_finished;
-	tx->callback_param = &finished;
+	dmaengine_desc_set_callback(tx, atmel_nand_dma_transfer_finished, NULL, &finished);
 
 	cookie = dmaengine_submit(tx);
 	if (dma_submit_error(cookie)) {
diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index 4f5e6d2b128c7..de9bcbb6df901 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -1902,8 +1902,7 @@ static int cadence_nand_slave_dma_transfer(struct cdns_nand_ctrl *cdns_ctrl,
 		goto err_unmap;
 	}
 
-	tx->callback = cadence_nand_slave_dma_transfer_finished;
-	tx->callback_param = &finished;
+	dmaengine_desc_set_callback(tx, cadence_nand_slave_dma_transfer_finished, NULL, &finished);
 
 	cookie = dmaengine_submit(tx);
 	if (dma_submit_error(cookie)) {
diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 837c23c63aeb2..6f724819d2d95 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -522,8 +522,7 @@ static int dma_xfer(struct fsmc_nand_data *host, void *buffer, int len,
 		goto unmap_dma;
 	}
 
-	tx->callback = dma_complete;
-	tx->callback_param = host;
+	dmaengine_desc_set_callback(tx, dma_complete, NULL, host);
 	cookie = dmaengine_submit(tx);
 
 	ret = dma_submit_error(cookie);
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 0f1528710a6a1..ef355ba00c929 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2638,8 +2638,7 @@ static int gpmi_nfc_exec_op(struct nand_chip *chip,
 		       this->resources.bch_regs + HW_BCH_FLASH0LAYOUT1);
 	}
 
-	desc->callback = dma_irq_callback;
-	desc->callback_param = this;
+	dmaengine_desc_set_callback(desc, dma_irq_callback, NULL, this);
 	dma_completion = &this->dma_done;
 	bch_completion = NULL;
 
diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index 94d2161bf5a1a..4bada01c9b7d8 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -322,8 +322,7 @@ static int ebu_dma_start(struct ebu_nand_controller *ebu_host, u32 dir,
 		goto err_unmap;
 	}
 
-	tx->callback = callback;
-	tx->callback_param = ebu_host;
+	dmaengine_desc_set_callback(tx, callback, NULL, ebu_host);
 	cookie = dmaengine_submit(tx);
 
 	ret = dma_submit_error(cookie);
diff --git a/drivers/mtd/nand/raw/loongson-nand-controller.c b/drivers/mtd/nand/raw/loongson-nand-controller.c
index 935f66602de97..94caae1d8b390 100644
--- a/drivers/mtd/nand/raw/loongson-nand-controller.c
+++ b/drivers/mtd/nand/raw/loongson-nand-controller.c
@@ -438,8 +438,7 @@ static int loongson_nand_dma_transfer(struct loongson_nand_host *host, struct lo
 		ret = -ENOMEM;
 		goto err;
 	}
-	desc->callback = loongson_nand_dma_callback;
-	desc->callback_param = host;
+	dmaengine_desc_set_callback(desc, loongson_nand_dma_callback, NULL, host);
 
 	host->dma_cookie = dmaengine_submit(desc);
 	ret = dma_submit_error(host->dma_cookie);
diff --git a/drivers/mtd/nand/raw/lpc32xx_mlc.c b/drivers/mtd/nand/raw/lpc32xx_mlc.c
index d03486dc41150..dbeb2cbb93f42 100644
--- a/drivers/mtd/nand/raw/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_mlc.c
@@ -414,8 +414,7 @@ static int lpc32xx_xmit_dma(struct mtd_info *mtd, void *mem, int len,
 	}
 
 	init_completion(&host->comp_dma);
-	desc->callback = lpc32xx_dma_complete_func;
-	desc->callback_param = &host->comp_dma;
+	dmaengine_desc_set_callback(desc, lpc32xx_dma_complete_func, NULL, &host->comp_dma);
 
 	dmaengine_submit(desc);
 	dma_async_issue_pending(host->dma_chan);
diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index 638267d44360d..235e34b94b5df 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -460,8 +460,7 @@ static int lpc32xx_xmit_dma(struct mtd_info *mtd, dma_addr_t dma,
 	}
 
 	init_completion(&host->comp);
-	desc->callback = lpc32xx_dma_complete_func;
-	desc->callback_param = &host->comp;
+	dmaengine_desc_set_callback(desc, lpc32xx_dma_complete_func, NULL, &host->comp);
 
 	dmaengine_submit(desc);
 	dma_async_issue_pending(host->dma_chan);
diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index 4fa89aee934eb..3c486b33c157b 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -405,8 +405,7 @@ static inline int omap_nand_dma_transfer(struct nand_chip *chip,
 	if (!tx)
 		goto out_copy_unmap;
 
-	tx->callback = omap_nand_dma_callback;
-	tx->callback_param = &info->comp;
+	dmaengine_desc_set_callback(tx, omap_nand_dma_callback, NULL, &info->comp);
 	dmaengine_submit(tx);
 
 	init_completion(&info->comp);
diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_flctl.c
index 0497801d7059f..5980fdac326dc 100644
--- a/drivers/mtd/nand/raw/sh_flctl.c
+++ b/drivers/mtd/nand/raw/sh_flctl.c
@@ -407,8 +407,7 @@ static int flctl_dma_fifo0_transfer(struct sh_flctl *flctl, unsigned long *buf,
 		reg |= DREQ0EN;
 		writel(reg, FLINTDMACR(flctl));
 
-		desc->callback = flctl_dma_complete;
-		desc->callback_param = flctl;
+		dmaengine_desc_set_callback(desc, flctl_dma_complete, NULL, flctl);
 		cookie = dmaengine_submit(desc);
 		if (dma_submit_error(cookie)) {
 			ret = dma_submit_error(cookie);
diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 9f42f8ab3212a..f2da3a4c2dd03 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -893,8 +893,8 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
 
 	reinit_completion(&nfc->dma_data_complete);
 	reinit_completion(&nfc->complete);
-	desc_data->callback = stm32_fmc2_nfc_dma_callback;
-	desc_data->callback_param = &nfc->dma_data_complete;
+	dmaengine_desc_set_callback(desc_data, stm32_fmc2_nfc_dma_callback,
+				    NULL, &nfc->dma_data_complete);
 	ret = dma_submit_error(dmaengine_submit(desc_data));
 	if (ret)
 		goto err_unmap_data;
@@ -919,8 +919,8 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
 		}
 
 		reinit_completion(&nfc->dma_ecc_complete);
-		desc_ecc->callback = stm32_fmc2_nfc_dma_callback;
-		desc_ecc->callback_param = &nfc->dma_ecc_complete;
+		dmaengine_desc_set_callback(desc_ecc, stm32_fmc2_nfc_dma_callback,
+					    NULL, &nfc->dma_ecc_complete);
 		ret = dma_submit_error(dmaengine_submit(desc_ecc));
 		if (ret)
 			goto err_unmap_data;
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
