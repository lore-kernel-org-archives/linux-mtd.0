Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6219C87FCF
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Aug 2025 19:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FkzvKtyGb6cP9sTVZxhdc/XA1vm65ZQwTo57l+NHFA4=; b=yJyrhTkt20TSbE
	OQ6pfhrSBvQuVyPCxrnfX3d+S8qiKMyPhJn0lBy7gCCQedlGsEhh1thU/dYy66n5usKCIbb25JKGe
	Zg8GcrBjWSsriQPw23I8Gjt/bmF38/jPN1RsdvrSwRSoJ5YBA2b6OTcePO5jRtQ1VA/KNG+cxvZKe
	uPhoH0URN9fjpAVvHmvRczfCnAOkSvbnp5loMh9/8EAOceoZ8nEIvukM9N8CpOll4JccjmjNdPTku
	E0ZH0FFk9XoAriqEcvobxVRLq3KhugAJOZRlXnl1JsQntXvyxDmcXKMDt/aTTE7eNJ96ctYxP1BB3
	LJLVHQYcfKkfKygWp2uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj0sY-0000000BESs-15Yc;
	Mon, 04 Aug 2025 19:29:50 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj0ky-0000000BDQp-1jQa;
	Mon, 04 Aug 2025 19:22:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e4d/w6FkHmtkY6JUkE3pJeXFxG2h1MT4aO9gGvOLl/hz3JQA+c/03h5TQmCQAl22R1VOkZbzBsnJ2tJ1Eu0Wzqt9WOAHFpPKd9lDpHCXePa7fIFAf4bM2JJFmgkNGW57qmgdN3aryTVkI59jm+RnNk5K4AXCDWzRwQjeKjzyjyYz6uJ3fc1ttC9uRPMoLIf/QTROFQkpfxlYxZD8kq0byhrEo/vSo9pk1TrQXOLJtbUftiYxLK08SNwy1lrf24LKBnLVfse9AMCxFIZSkcE44mxM7aHRcNVYL++QJfRl0FBUAgRYK7RxgSu8kT4NqhpsgRIJNw2A7cUhOQlA00JzRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBShVbwgHH/AhZfRCHhKRES2mNxkwK7WJ3UZ3dwEL4k=;
 b=tTziFOF9x4V4By4stzltc64rLEKYmWTXoU9ejzMsL+khAh3lMuG0pnCiY9lzi0S1U4jeFWHZlLU4JAwKHiPwZjT7JjXEMjHBcgpFAMZui6y3XqcdVRWXPvcScMon61UBersEfYXGCsRI2RnOlatIGaATY1nfsFe29+ZX5MQUDthinmK6C3OlqnAyk7tXNeGPm+q9IUSnmktenvjqvBtXdwoK9pYiQ7W3xE3Wx6xmDCvvf1Mm5DpTSvO5exM2+822Js+CdZ3iHW5ZD3fKtmepVZepYftjVliRQlW/5ELQXPHR9cJyb+IB1eFRyk5jxv08h2c0oUjqQVJ/OHUyFQ5OgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GBShVbwgHH/AhZfRCHhKRES2mNxkwK7WJ3UZ3dwEL4k=;
 b=gvi/cFVldKWdJSrZ9RKTtOe3bJeOG+EXARY6/QeqjY1MoNYGjU3kXY6iAG3McoC0hv+YSb1jD4bbAT+oF+25jKvaOc1hVKHLHri8hXFeIuY8SOLdfgv5o85hK/gxBpBmKkUv2ej3fZVcYt2KbxU4M2y1WzUeTW53Y6NFQaDnWiA6IkQKXIkp8od50AHsGcLmcgBMCREWBftcg2eoYc+Ew8tOFYBScTT5KvYsUMQpRKtXZSRj1KyYS+zMkxjFsyMTZg+dMroyIWJv6ZhgmJgVI+DYNKnv218+vE+zcJXy4yAyv5RTspQwcCDZuO6ChDVoiNEnONA2nzMxCYqONjMShQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by DBBPR08MB10844.eurprd08.prod.outlook.com (2603:10a6:10:538::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Mon, 4 Aug
 2025 19:21:46 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.8989.018; Mon, 4 Aug 2025
 19:21:46 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Martin Kurbanov <mmkurbanov@salutedevices.com>,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH 3/4] drivers: mtd: spi-nand: repeat reading in regular mode if continuous reading fails
Date: Mon,  4 Aug 2025 22:21:31 +0300
Message-ID: <20250804192132.1406387-4-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250804192132.1406387-1-mikhail.kshevetskiy@iopsys.eu>
References: <20250804192132.1406387-1-mikhail.kshevetskiy@iopsys.eu>
X-ClientProxiedBy: FR4P281CA0219.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::9) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|DBBPR08MB10844:EE_
X-MS-Office365-Filtering-Correlation-Id: 4804a28d-ef6f-4eb3-bd02-08ddd38c2756
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Jbg9eRQ9XK/uTGzBsL1HnJsPTIUOh/z8w0oOJO/DCEV8SFPSP9ER8eLdiFIb?=
 =?us-ascii?Q?GwKsjtH/UK81eP43Bu98luli975jEjG/LuhaQOjhyPsb3MD5bOuhgsSi5mwY?=
 =?us-ascii?Q?F70buPdKqdDYPFAnqVzY5VAPKxTRt9AyXHuzVk4zeRZPmmTjClblBOCNBQnc?=
 =?us-ascii?Q?fJJsnR5/n5qd4dmzxj/5FaXf3zvZL5wSc8LzjJbD4p64KmAvad+LDHRCbPk5?=
 =?us-ascii?Q?Z5draVJB1FVoPOf53ONIkfx3KTAgrZB+0t2q1vxPAOHFqh354j9Na14tQocq?=
 =?us-ascii?Q?ioqZx10YLn5xGUW7jO6sZA1KA1gZNKzRtN2etBepLX8H0BbNB3ZmhlONYBsN?=
 =?us-ascii?Q?VlaI2/V14gY17/S89b9rkwulNvwUf13gzASSaZoPlKVr8bv7ToME+YaGUpr6?=
 =?us-ascii?Q?jejPTHR7FWJ318FFIbLzOnuneMWbpFR30+6sQTZVG6HsevfwpTKWw55Gqd6i?=
 =?us-ascii?Q?jCjqO7jAx3HYJAeobqNsXvpvvoMeazhyUyWoAMJHXAaI4RUfdrqWI0pgD9Cp?=
 =?us-ascii?Q?Giqm5t2+eMlgQfLxVF0GtQJdrTeDbEdQczEosZcykfDNrTSX6tzZYZ0sLNsX?=
 =?us-ascii?Q?SqVCye21amtaltxEBzU94e/wudt3mgBF6KFRvjOE+R8OjUClklNapDtneUUv?=
 =?us-ascii?Q?JVfxNupJtkuKNRZ8P3sDAzx55G/ojdrKQDxSwTKZUTQYCFfWgKrgN2Y1PWzj?=
 =?us-ascii?Q?2ogFoG3RMobaG1gp1XVTEN17KTlqcFKTH8addDZ5zDE6cTqEanxQrHgrSBaX?=
 =?us-ascii?Q?+F8BlVbh9/E67xBQXDluUHe3m198X4PJsG5HxSyS40f/tk1aGu10AnDAEi7L?=
 =?us-ascii?Q?gbxfmgPhyh1nj5NGWJR8st3CrEa9GiKrwSIi8zXXvbwgYsc4UubTjW/Xw8BG?=
 =?us-ascii?Q?Z9/0JEOfeiP5lV2WRWcLZWHgaGHKRWoVdWyouTy8Qf9Y729sCJOFHG1DOHGq?=
 =?us-ascii?Q?jj6yfTgWdM/PBiIMrA3bexiDaiTB7xIdyf1FfGk5Xd4rtOs4eBqbD55iXQTD?=
 =?us-ascii?Q?T5n/S6QRDYcD5sw7oled3KDrPeu+FA5wC+My2CE1DUOGvlSSvQbMtXEUHYjf?=
 =?us-ascii?Q?LOv0LRzDYiGqASqVWlM6q8/xIqiSpqpl6R1DxFQarIm4OL9s3posztBIjjYf?=
 =?us-ascii?Q?eFKsM2zsC+6Nbd/TSQajXx1VoeBDVBL+qILLg17Qh3BWIwyXh8APML1+A9Xd?=
 =?us-ascii?Q?9dwhCOQjX2wXZok1uTFSKFhazcPbB89/LfstWKLUsMoJWlDIJZ2R4+qXNZ8d?=
 =?us-ascii?Q?4uUg+3ElCpo7ZfIzBbqddTH0kWvX4ewYtHGZ7XCQQZQHkh7i75mZdBVG3PLL?=
 =?us-ascii?Q?clKrJztNDuXNEuPkobpgn6ugcnI3PGnU7+BlUS/ASQST3B3l8oV6WqrwQEgo?=
 =?us-ascii?Q?xb/VLYTVHogu8G3TGqkZhf7zANgyrS00Hdp0L7IBrIjhvAJkvqsyWIGiciYX?=
 =?us-ascii?Q?QhA+IXYKLIQV54i/InnbTNSHRVByzk3pAGfl209INCFSFcTiNyd0vMW1NdBA?=
 =?us-ascii?Q?csPIhGsHUekv3W8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V65mN8l76JviN5iEAokl9pFFKxWBzC4/zgOepJq0vqpXkz3nO3bsqGRxnVHi?=
 =?us-ascii?Q?/EbZkXl0WDubNkBXPshGVzdsLiSzn7Y5HzF1wQhA8Ucv3yluaWkL7jX0JQs/?=
 =?us-ascii?Q?KxRylVcHRY6xR4qepI4d1a2VCVPzKAJjxZPZTLoItsKC9khijEzB+WI6F0yl?=
 =?us-ascii?Q?AtqrpVM0uGNlF2objoSdYDzOiOLUEI1BCIpUBs7jZcB+MMNM0/qZTqxrqBFY?=
 =?us-ascii?Q?uMwyxYXpDTWaQCZqTkMcaHWPjjWOWO382PR29aQkMYrRIxlLZ4UJzFxikvPR?=
 =?us-ascii?Q?bvwFIl55sFJ0wNF9IzHaYboTvk3DVsEuvPp3frOZWxkJ9A3fi9xYTW7GthZo?=
 =?us-ascii?Q?EL80jrCZWVj8oXz8H4yiQN4626jo6oXT1zgFYkJbOnDMnR6hX5x4JTyVPDh+?=
 =?us-ascii?Q?DvHqYrgGuQX4rzLClpFNWMDTBD3kF6iHBEEKEOOj90RtriCyndM1yHvRsIXV?=
 =?us-ascii?Q?ex93NvxVlmdoKILB3xFriuYf5jBLtOYhSj1ohgP+1BrbsZHuoYBhUBNgh1d9?=
 =?us-ascii?Q?iKAw4rUYjTpEyZPsGXZ14poykn6aS46QfOqr8GY6JDRciUOQaGE935/XYEyn?=
 =?us-ascii?Q?v5U6VcFHDoN9fhs9jzBfREYIZhxtCgN5wi3Wo6I8bMr5X/DcYYfWrKqrLmUj?=
 =?us-ascii?Q?vO2syLRREd2b0N+AtcpieNe3HwHZQjCFw8r37gy5KnqmV2sRuVq7B0XC71pT?=
 =?us-ascii?Q?dBRRBgwgkdNqJn5Pb0Dkf20L40YXMijLNpddQKV6JQ09IYVI2l3clJKfRsLY?=
 =?us-ascii?Q?BKPB6J6H50JxJYA5VhvznzuqZETQff6XAGmsxhqOa1Ly1ntsXU+E5zcj5jVW?=
 =?us-ascii?Q?zc+TNrUpUnQl6vjhRGEG14B+KJlzMlCS+SZTMS3QYowUZ7yb0Z8EgjQEqroX?=
 =?us-ascii?Q?a4K1k3kKGIk8De8RTeBlXVhEE3REFGXPKIvsWZze+x+H15hnEqSOZVuCzC1m?=
 =?us-ascii?Q?HnYJNn5ioSFmQqKdN9m6I3vPgJuyTuYPI4fMZm6b8WKEYeacYn9raiykadYD?=
 =?us-ascii?Q?1EAw9motOhQDBR6nVtHPRPaJdjjeISIpVr8t4UpTfPKxbFkCpdiXk4y0kmMt?=
 =?us-ascii?Q?cZPogfuxVC/K2QHmuU6nYSvJR7wcBb9kluGA+803FD7ZARGP1gLOaNJr8usv?=
 =?us-ascii?Q?oFW46hUU4IQgShzfm0K4Fqiw4bd6LHhgLXXZ/CxOQcmKN6peen7GfTxZePy8?=
 =?us-ascii?Q?y9KzI5MAVyigSlJIvK1HUVaSvKr4E6q02w5KHEGuyrfVqjf6a8PcxSpJ6D7I?=
 =?us-ascii?Q?TDN5OeklQxoe3GWYHlcb6WU3u9ww2+227wKsGyKwFWi+hY7cJK5sIT5ksscT?=
 =?us-ascii?Q?jRc/BK+Y1PwdmkAeo8DbIP4X6zhpZ7v2BgHAFNV/5Br7rFeQWyy6DyuNxIjr?=
 =?us-ascii?Q?TYRcVs0n0vpEUXrZMhIwhwS02yClbIquostzMm0K1/B0Sqz7WlrLj8jg0T6H?=
 =?us-ascii?Q?SpVY/iTZgtLR2a9QcryhrxoyAFR+TsDTl6Jbt7T7AwowbAXib6F5s0DwCvB2?=
 =?us-ascii?Q?CnAOgcbkfhoseV+5hkEO9giY2Q6fPhJWxTjrOdK9xk4yAQd6J75LM1CfwdvT?=
 =?us-ascii?Q?KOcxtAQTOMGVF5lw0lMzMJs4UzlW7hN1ftOOZha5Fnygs1XVq6B42ZA/rCVw?=
 =?us-ascii?Q?9Q=3D=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 4804a28d-ef6f-4eb3-bd02-08ddd38c2756
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 19:21:46.6920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J8xN9G9yRJFl+X3Ny5o5yDyWFTWY69/OvCTWDypDvvszWektt25ipikZzFwO5BLmatJvOLY2CT+aPwjIEr4D5p3rDJBu67VqnKKc32DIt6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10844
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_122200_459179_06C38FD8 
X-CRM114-Status: GOOD (  13.76  )
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

Continuous reading may result in multiple flash pages reading in one
operation. Unfortunately, not all spi-nand controllers support such
large reading. They will read less data. Unfortunately, the operation
can't be continued.

In this case:
 * disable continuous reading on this (not good enough) spi controller
 * repeat reading in regular mode.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/mtd/nand/spi/core.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index ff6a1e2fcfdc..88e4c00cccc4 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -431,7 +431,7 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 		 * Toggling the CS during a continuous read is forbidden.
 		 */
 		if (nbytes && req->continuous)
-			return -EIO;
+			return -E2BIG;
 	}
 
 	if (req->datalen)
@@ -893,15 +893,26 @@ static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
 	struct spinand_device *spinand = mtd_to_spinand(mtd);
 	struct mtd_ecc_stats old_stats;
 	unsigned int max_bitflips = 0;
-	int ret;
+	int ret = -E2BIG;
 
 	mutex_lock(&spinand->lock);
 
 	old_stats = mtd->ecc_stats;
 
-	if (spinand_use_cont_read(mtd, from, ops))
+	if (spinand_use_cont_read(mtd, from, ops)) {
 		ret = spinand_mtd_continuous_page_read(mtd, from, ops, &max_bitflips);
-	else
+		if (ret == -E2BIG) {
+			/*
+			 * Some spi controllers may not support reading up to
+			 * erase block size. They will read less data than
+			 * expected. If this happen disable continuous mode
+			 * and repeat reading in normal mode.
+			 */
+			spinand->cont_read_possible = false;
+		}
+	}
+
+	if (ret == -E2BIG)
 		ret = spinand_mtd_regular_page_read(mtd, from, ops, &max_bitflips);
 
 	if (ops->stats) {
-- 
2.47.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
