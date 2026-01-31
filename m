Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF372D73EB1
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Jan 2026 03:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=noDp5k8019uQKvpxvLLT616/6jot6C0kFBAA3OatLts=; b=cZqYrSCvCwPwVR
	CqoecXzIpjgkwyiG+XhXOGsnQYEg43QdsSMq5ck736hnWRtBMK92OEI9sBQYWz8rTuQhaS5HpwyC4
	w5NCtXp27ybkt7QIfXSHcuCaXuh9wltgZAjwX9FvkdumZJ4l4l6ljOlEPgbzBiOmAWo5xPPlevoel
	o8B28xlcDEIigd4w0STv+uX5Rvfyap+RwIea65DsH4Nw2farVoapaT/Zr3cBF1/nGiRGmcuRqnazD
	oxaDqrzsFEBYbLWaKXHErvJGU8IsCpJi7z6EH/D3uOX9K8lLVpSD2Kmi33HEo/thX01uFk0CdbAzE
	e9gIQyPc5x9e9TuDmt2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm1OJ-00000002GQT-13e7;
	Sat, 31 Jan 2026 03:11:19 +0000
Received: from mail-japaneastazolkn19010002.outbound.protection.outlook.com ([52.103.43.2] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm1Nu-00000002GQ0-2xzz
	for linux-mtd@lists.infradead.org;
	Sat, 31 Jan 2026 03:11:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cC/5KpzXUyz+y2O6YJcbixMwdwU8UjDRRMXn2fHCkUpuYKrwsAJL37mPYWOnbouzjCzJQiVyfxIDTn/o0XysCErOiGr57RkI6s8Dv7j0SMfSt/hnEad/dggsDURRYz3hC4DDJ1RerVo1QDt2y5qGogxd0S6mGTf6J2Y5o3fHtcyhwgzonrsdtNBh4XHqgynF/u1semE5Hs6gIoI1pVUKXF5d1amqszapbc/Bzey9+ZjYpY5RvrfPEDF5jHFDKYb0YtWPgkaK+mAOktO4TJgJFVBbs/da7h96B2OG5dzt9lcyoPApkdqgbftEH7UFU9PktAy76YBTit0hPp1E5qRdXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEGkF6KsWQCy/ANafeG257z0NedYz0j/XRhXPx7W/HU=;
 b=LUeDoRZPvtl+clSWqFe6JMZ4EFzM4ttpwoaybR/1cqxeb3C2Xxw6JAYx9rbsnljWBiGextfS1sivWolJUQAuWTvkZhk6g1U1+3lLxx5e+UDXslEnjefXecyGS3HuTgnCotl+XbrNPvukzaPb9SSjEcCd5oWNnlv4nIRSivLCqXaOXhutAQPAIO/D0eQPBKpwpGAfqC1vPXL/OIGSQAJ7d+f7VcsYecubMKpd8SvTxHY08ckrs2NJmWs+9dWxw8V3jzi18682n2p/Oq48humVyw3M+ZhEFip7DXSp4Bx5LnF+wYDwbL0c3aHxlQYx7dmB3E64D0sCzEqr0Y0Hg7BmcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CEGkF6KsWQCy/ANafeG257z0NedYz0j/XRhXPx7W/HU=;
 b=umG4S8Ar/uwQegJ084WsklE4NzAhyn3VbfSbZ5WIJwpL74eoBfIb6Wli4x3JIJdO7W1qas6zV0mrd58QIhQrXy/MiiEpw71hfBi6GaA3WthYVm2y5TSaIB/P+uzu/mV1oDVK38MW5k8VvdLq1t/aBY+7IiBxo8qxAIlMz/SNGmrv+kpD05QUMhsiX2GL16zUkVCoR1R+UV7ym0PVFhXAHthxOZ36pXMMyzMttm0EUkmpKKBK2Ri3BrihB6vqIRdxn5V5ukE0YywOEYD+PR+GB63d5dt/p3yBNAS3jxfob2WkIvmnA2/xldwrm/ntPAZQHd8c5FakJ7wSgZEAaaidnw==
Received: from OS7PR01MB13602.jpnprd01.prod.outlook.com (2603:1096:604:359::9)
 by OS3PR01MB6901.jpnprd01.prod.outlook.com (2603:1096:604:114::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.13; Sat, 31 Jan
 2026 03:10:46 +0000
Received: from OS7PR01MB13602.jpnprd01.prod.outlook.com
 ([fe80::18f0:95b7:632f:9ce6]) by OS7PR01MB13602.jpnprd01.prod.outlook.com
 ([fe80::18f0:95b7:632f:9ce6%5]) with mapi id 15.20.9564.010; Sat, 31 Jan 2026
 03:10:46 +0000
From: Shiji Yang <yangshiji66@outlook.com>
To: linux-mtd@lists.infradead.org
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	David Bauer <mail@david-bauer.net>,
	linux-kernel@vger.kernel.org,
	Shiji Yang <yangshiji66@outlook.com>
Subject: [PATCH] mtd: spi-nor: add support for BoyaMicro BY25Q128AS
Date: Sat, 31 Jan 2026 11:10:24 +0800
Message-ID: <OS7PR01MB1360230CC7F2682FDD26FE40ABC9CA@OS7PR01MB13602.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.51.0
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To OS7PR01MB13602.jpnprd01.prod.outlook.com
 (2603:1096:604:359::9)
X-Microsoft-Original-Message-ID: <20260131031024.24158-1-yangshiji66@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS7PR01MB13602:EE_|OS3PR01MB6901:EE_
X-MS-Office365-Filtering-Correlation-Id: e4562d76-9abd-402b-2d5f-08de607653db
X-MS-Exchange-SLBlob-MailProps: 7J/vb0KDx3hVaBXFi3Zmt48msziUWKBFbvLLDDi6XDGDUa3bkjNKR5mZwCW4MuAVUIjZ1FOY2bUZozbQC06eVFjL8Mn4pxJxkAKe2JngCYT4fpIp9S+uO5zy+cKk2FzX6DYA9dyDqpPjXDPorwcRDTO9e7+/e3fVnT1e6yFHmca+1LxK8XfkuTnvUVKnJcBACHxHMCsrx/WMVGGfPbJIiyKJkh5RVMMUgTrGl56kBsc/7Uts06jTZ6aSmaepVI2fGfZ0bdXH8X12jWJk2T9+bAnfSXjit7n5nwOVmINBiKWmywEPqf57ZdYSZsF8O2GcI4la+b9rzrpXJlOAYpTbrZ09cq2Bex4xc68Oet/svEiLYzm9n6D6gwZNtqUTWANj/Je086r6U8QyW3Bko19MUwf3bXsdqUVEx11lv/aQLc9R1DrMXcJXo+Z3vDl3M17cl47jb1UbkaTatTQ9Am5pAXeXRujpn24d/REd08L3ZfvRb0PoGEVmoTFmLTIMB5qV/XXEQG1mjb2ER02MvGlibEP1JCoeL8Vx0jioA4AEAvyNXNdo23VExav5SI6+X6R/mqim9VJM6FzNO5I1eHj1kjJkdcfr+2F+ptpG/mjNt/wC5Jn6dwEbwwvFfMov1zI1rN5flAVl2O6IAZHUEJD+12Wvgfs196Gy2Rs5v9Y7LkFJ525rm52Xc7NZUAeJwJ6qYLhwAYfzVbEUYnABdKK3OMP0hQ1AV4q64jl5/Xk0O/dyGSjRrjJk3hFGfQr02aGIhiuyVOgk9yhj8WpW+Yqjo3Jkq5UWDWRxuaLDB7/5StA=
X-Microsoft-Antispam: BCL:0;ARA:14566002|41001999006|15080799012|5072599009|461199028|51005399006|19110799012|5062599005|12121999013|8060799015|23021999003|3412199025|40105399003|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p1Gtu1FpmEtm7ctcpdok91QL2rE53n1u0X85P6EMUb4bKDBsPLsbwUIDkH29?=
 =?us-ascii?Q?CVzVWA8WEnaxdLa7mzEdVHcLnjmyJTyIrzp37KBukwKloX9eEf8Cf5h4tE7w?=
 =?us-ascii?Q?rq4pAFcf1A3gNH7H56fodUjtyylXIsi179TpArHEVvFynDVPyJMcyNmC0g2f?=
 =?us-ascii?Q?eVdhMlcW3xzwMSc3/r/9yvtdQndXN1aV57HTiA+dz+WEJPKYSwhuU8+VROO6?=
 =?us-ascii?Q?h39oB1oqRrLQfqJF2byfv1To5UG/w/VyI27Xjr+q5peUnRHydK5zgtMiySQz?=
 =?us-ascii?Q?Tdz1buWChddFjsOsIi/TSLrulkwBpSW8b0uacCWXAr/DeYWBybWwXxwTjohs?=
 =?us-ascii?Q?kMFwl1qAM9XNsGzi1mIuqWxEk1A9KBqS9juumH0B2NLHlVAiQ0DdXMNGJGNv?=
 =?us-ascii?Q?+DGRKWcAerKZhUorZxa/eJRLK3S4cuQDvG3LiQFSzCpp3ohKib64UX5Xcvwp?=
 =?us-ascii?Q?soKm9Q5tcwlwVvB6V5LX6Y991Z3SEPrq0823p2DPwevta2YItUsPexqWNuAl?=
 =?us-ascii?Q?cA4m7xL6M7g2v3+7rhtj4U6lNAzD+bCD/wkfZo294++q++ch2k4yQGpUPDaJ?=
 =?us-ascii?Q?Ac7/Jl9jmUS2/yjuKyPkPct92Sl8Tiw6mScHJQAlFQ8/CcDR9riwEIMG3Q5H?=
 =?us-ascii?Q?ojsSUoWrl27sSzwbTccwNBdJUM0QoJN3sG9++xxWkHZl2g5H5Juf1Uc11h82?=
 =?us-ascii?Q?bqrh2AgCUgPEfVco0yz6NVWdVcVbQ+nqXaC7KfFZKHmO+GIYTEBp3GbIFm+4?=
 =?us-ascii?Q?Rb3tapbyHzulyQ4aHkuaFMBcTU/zORfALGNg4qlyAJ9tza6KDYQKlI/R7U6U?=
 =?us-ascii?Q?vc5ZrXmS06yikWRNdXRXaM3/EFao2z3CVPpHsZbfvX1kN5DpoGd+R83F/wPG?=
 =?us-ascii?Q?208baXVEMP/gMA+5hOkPiOuDq+SFgeZiFyngELtGgSxe4yQ+NulCII7vRz7T?=
 =?us-ascii?Q?O6G334agehlm48rQXnFI7zs/ntmd1r6+Tv05H3+4cIvVmzvxYRkkiPUMiNkS?=
 =?us-ascii?Q?R630OKbXw7CwT9XsN2bbVCvz0slAsH8/SIcRPHKR7IARFpPH3E2NIKykZoVk?=
 =?us-ascii?Q?f+R/BQnvkyYdwdACQOyQ9BhU2zMWFPYTxVsC8OrG7UMpCqmtd4oRwm0kkEOw?=
 =?us-ascii?Q?Op/pDMGAQ5sDEwZwHiLL9XRNUuHF/vB0yJfYzYj+pDMfgl82a6vvE76GiD4L?=
 =?us-ascii?Q?kZjg/wuLRJoM0K+OVJvZr5PUOWKuBTn0ds59wzBpQa1im8de3Jcz1Id21ngR?=
 =?us-ascii?Q?IEXMRXPDFXj8L1uSxakcTX3zQfn3V7hy1JmxChIoYJpw+qWkx2zvp+Zy9q/N?=
 =?us-ascii?Q?N/M=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PD7roMZQPYlA7g1ENyVWLW05oH5CYU/MAT+GAvDQRly6IWiYDMFF6BoNlG/r?=
 =?us-ascii?Q?gqvOoH8Ow4PgEafWHdXn1/9jCOpoxXbRC7sDv1tsR72l6djeb6MB021iGJRd?=
 =?us-ascii?Q?6824P27ee+fjv4M/IH0IDrcYSkDXSdycmMEVDqYPuuxoMUDBkCGHdY2mf12a?=
 =?us-ascii?Q?8zvQ0zWM2Y4S9yEOHeLpe0P2jaAtWVFZ9YrALSUrLa0KNzzGop5m4hhAwOw1?=
 =?us-ascii?Q?35kkIhlgOA0hs584XHzQOj5nLOSXkOhjrFls8Dk7JpdOl3fSuJvlk8q+FEgS?=
 =?us-ascii?Q?umpfYjf9oidJYQfReBX3FU6YrDBRPLxDmFs5nm4tJmuc0YgEX9BkXRL7DT2s?=
 =?us-ascii?Q?DwtR1eL//7QJTgxPhH56HuI42a+T5hX4TYpry/h1Gw2FOZurpYffDAGNSnZt?=
 =?us-ascii?Q?N/+NnERnUhNJGP43rxMGFBmccp1QnbGr3QDPu0Hh26VxCtWihHC+FbDUgW76?=
 =?us-ascii?Q?8O4lX7NBipEiRYl10MgNhDXTIohmmH8cqSc03ctOqcWORAlSdKaVtixLs3Tg?=
 =?us-ascii?Q?T4Y/sPaZxZAT9DYKyYVgDaQc0AaYDWH1u70AuvGeMAj963fAfiFp8AV/I8AQ?=
 =?us-ascii?Q?mhvGpzSGR2BWE7xnrr4mLsMjv2KHMfosurRdWINh8wuVWA65M5qD9ECt/D0R?=
 =?us-ascii?Q?f0DXfH/uxetFCFg7bsQmhNWdrPHEVIImyRksdvLRKOOLj7k8d4QxOh0TbSU8?=
 =?us-ascii?Q?lZFTgr4HmdntiX0Jg8mFio1S5pUnjl4p1ZRduyCAbtpSWX4hozZ58H0BDamz?=
 =?us-ascii?Q?jLyUjRR2rvCwCKwHyT66iyWg8vGhV1mNH6XmzWOHvFy9upm/KbfeXee2YT5J?=
 =?us-ascii?Q?OVWBAsJrQmxErDnJ/QlyXHci88rAtzSsYRWIFUqrzUBGkadft9gxYLTFBaO9?=
 =?us-ascii?Q?Po8YGTn0PV7t06pYWbiuerxguGKeCn+ULpyVwe0JXLr0BJkMg/Bt2NT3nJNW?=
 =?us-ascii?Q?/ytHvUUi3tRL++omOtsEGHoUvjNoXVz/W8PKAQjhDIpdm6K0CLJ7B6aVGD0X?=
 =?us-ascii?Q?r58aYyehm9tncBGoYkGSl8HedYBDYKy6hMdTLi9Iqztyq4NbGcrbR1LWfgMr?=
 =?us-ascii?Q?mk0eGEAOxKvU+G81D3X5epap7yzTolJu8HM0R+YHYRwRaol5bLfBz6g00Woj?=
 =?us-ascii?Q?zveYTohbftF19gilkZxadvd4tVw0AxAllQERsfhqURPMCzpz/oBZ/qNQvGu2?=
 =?us-ascii?Q?S2dWTdNk/H24kgHd9AzyxGAjBTikNBnG9jkJwpnURz+KwOH7adQ23wYlkYqS?=
 =?us-ascii?Q?vYDEd30z/Cwf1vRlgjtSr/ZsOs9+mdpVgWXZgGRj3lhTpnCc3yjrVjEHbyW4?=
 =?us-ascii?Q?lHa1XtHts3qMhXN78vX63PqiPnMoZ7ITDyev82/jr2h5tHgixNDSu0WjuWkD?=
 =?us-ascii?Q?9ycVTPmTb081iESPBG5nvw8v8wXc?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4562d76-9abd-402b-2d5f-08de607653db
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB13602.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 03:10:46.4215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6901
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_191054_781045_D2CA9BE3 
X-CRM114-Status: GOOD (  18.66  )
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

Add new SPI NOR flash vendor BoyaMicro and flash chip BY25Q128AS.
This chip has 16MB of total capacity, divided into a total of 256
sectors, each 64KB sized. The chip also supports 4KB sectors.
Additionally, it supports dual and quad read modes. This chip does
not support 16 bit SR writing, so we have to introduce a fixup for
it to handle quad_enable mode correctly. SFDP dump:

00000000  53 46 44 50 00 01 01 ff  00 00 01 09 30 00 00 ff  |SFDP........0...|
00000010  68 00 01 03 60 00 00 ff  ff ff ff ff ff ff ff ff  |h...`...........|
00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000030  e5 20 f1 ff ff ff ff 07  44 eb 08 6b 08 3b 42 bb  |. ......D..k.;B.|
00000040  ee ff ff ff ff ff 00 ff  ff ff 44 eb 0c 20 0f 52  |..........D.. .R|
00000050  10 d8 00 ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000060  00 36 00 27 9e f9 77 64  fc eb ff ff              |.6.'..wd....|

Co-authored-by: David Bauer <mail@david-bauer.net>
Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
---
 drivers/mtd/spi-nor/Makefile    |   1 +
 drivers/mtd/spi-nor/boyamicro.c | 110 ++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/core.c      |   1 +
 drivers/mtd/spi-nor/core.h      |   1 +
 4 files changed, 113 insertions(+)
 create mode 100644 drivers/mtd/spi-nor/boyamicro.c

diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index 5dd9c35f6..0024ea03f 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -2,6 +2,7 @@
 
 spi-nor-objs			:= core.o sfdp.o swp.o otp.o sysfs.o
 spi-nor-objs			+= atmel.o
+spi-nor-objs			+= boyamicro.o
 spi-nor-objs			+= eon.o
 spi-nor-objs			+= esmt.o
 spi-nor-objs			+= everspin.o
diff --git a/drivers/mtd/spi-nor/boyamicro.c b/drivers/mtd/spi-nor/boyamicro.c
new file mode 100644
index 000000000..059eccb3d
--- /dev/null
+++ b/drivers/mtd/spi-nor/boyamicro.c
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/mtd/spi-nor.h>
+
+#include "core.h"
+
+#define BOYA_SPINOR_OP_WRSR2		0x31
+
+#define BOYA_SPI_NOR_WRSR2_OP(buf)					\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(BOYA_SPINOR_OP_WRSR2, 0),		\
+		   SPI_MEM_OP_NO_ADDR,					\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_DATA_OUT(1, buf, 0))
+
+static int boya_spi_nor_write_sr2(struct spi_nor *nor, const u8 *sr2)
+{
+	int ret;
+
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+
+	if (nor->spimem) {
+		struct spi_mem_op op = BOYA_SPI_NOR_WRSR2_OP(sr2);
+
+		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
+
+		ret = spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		ret = spi_nor_controller_ops_write_reg(nor, BOYA_SPINOR_OP_WRSR2,
+						       sr2, 1);
+	}
+
+	if (ret) {
+		dev_dbg(nor->dev, "error %d writing SR2\n", ret);
+		return ret;
+	}
+
+	return spi_nor_wait_till_ready(nor);
+}
+
+static int by25q128_sr2_bit1_quad_enable(struct spi_nor *nor)
+{
+	int ret;
+	u8 sr2_written;
+	u8 *sr2 = nor->bouncebuf;
+
+	/* Check current Quad Enable bit value. */
+	ret = spi_nor_read_cr(nor, sr2);
+	if (ret)
+		return ret;
+	if (*sr2 & SR2_QUAD_EN_BIT1)
+		return 0;
+
+	/* Update the Quad Enable bit. */
+	*sr2 |= SR2_QUAD_EN_BIT1;
+
+	ret = boya_spi_nor_write_sr2(nor, sr2);
+	if (ret)
+		return ret;
+
+	sr2_written = *sr2;
+
+	/* Read back and check it. */
+	ret = spi_nor_read_cr(nor, sr2);
+	if (ret)
+		return ret;
+
+	if (*sr2 != sr2_written) {
+		dev_dbg(nor->dev, "SR2: Read back test failed\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int
+by25q128_post_bfpt(struct spi_nor *nor,
+		   const struct sfdp_parameter_header *bfpt_header,
+		   const struct sfdp_bfpt *bfpt)
+{
+	/**
+	 * BY25Q128xS series SFDP table does not define the Quad
+	 * Enable methods. Overwrite the default Quad Enable method.
+	 */
+	nor->params->quad_enable = by25q128_sr2_bit1_quad_enable;
+
+	/* The 01H command can only be used to write SR1 */
+	nor->flags &= ~SNOR_F_HAS_16BIT_SR;
+
+	return 0;
+}
+
+static const struct spi_nor_fixups by25q128_fixups = {
+	.post_bfpt = by25q128_post_bfpt,
+};
+
+static const struct flash_info boyamicro_parts[] = {
+	{
+		/* BY25Q128AS, BY25Q128ES */
+		.id = SNOR_ID(0x68, 0x40, 0x18),
+		.fixups = &by25q128_fixups,
+	},
+};
+
+const struct spi_nor_manufacturer spi_nor_boyamicro = {
+	.name = "boyamicro",
+	.parts = boyamicro_parts,
+	.nparts = ARRAY_SIZE(boyamicro_parts),
+};
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index d3f8a78ef..b9adf5ca1 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1941,6 +1941,7 @@ int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor)
 
 static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_atmel,
+	&spi_nor_boyamicro,
 	&spi_nor_eon,
 	&spi_nor_esmt,
 	&spi_nor_everspin,
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 16b382d4f..b1667a08c 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -591,6 +591,7 @@ struct sfdp {
 
 /* Manufacturer drivers. */
 extern const struct spi_nor_manufacturer spi_nor_atmel;
+extern const struct spi_nor_manufacturer spi_nor_boyamicro;
 extern const struct spi_nor_manufacturer spi_nor_eon;
 extern const struct spi_nor_manufacturer spi_nor_esmt;
 extern const struct spi_nor_manufacturer spi_nor_everspin;
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
