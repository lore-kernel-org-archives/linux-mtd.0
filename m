Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2514CA0FE7
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Aug 2025 18:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wEFlGWoisN2CWD98BZubwNgHUpV+R6aeHgAOJTmnwOc=; b=yvJhO/IoxggDOU
	0N0xa6hpb7kdVrgXsqtGP3wss7FNc4H8j2qYAya0IS03kW06Sjb1WVnn3YE3e6uye+7gtoufHREAg
	nYgFUjpX4p2UtWD7glr8Ln+vT32bFcyDKCaUrqBh0JQzpY60BBTxLCdXu79oRmoDzU8uTV7YOWgrd
	MjV7thjS+yB4saJEtx6xGLNiCRBgaeiTDJD2BSzXd4Aa/b3hdbhlGI31bOE1vDVszInYwV9niMxwW
	n9KBpDauIauvk2UJwzZf1zuNyiz4YFM14ogggtHtemqB3gHrQ8addeqtNN4QMQjLVI4IpVYSTzd41
	BP51ymMTDXKwt549J6rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqFbb-00000006S95-3bYI;
	Sun, 24 Aug 2025 18:38:15 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqFJ5-00000006R1h-0F3g
	for linux-mtd@lists.infradead.org;
	Sun, 24 Aug 2025 18:19:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v33iZQ1XF+qi4slfmoabIWOM4vzVxTKYR0AKSBWXu0rPCFo4YIsY0TslwRdO/WaXBaRpQaCmU9nGAvy5O6M8cqMTvbQnpicKFmy0x15hbcUgMvwDVBSlItm8MY56RRJ/o2Hghk3kloGlOzR1UIowPokUplzgOZRpLKq597aSXlqT4mOyE4io3DU0RyA311TAN1rIXvYIxABZGLIyj8UruoCdS/j3J3A+GuKvNhZ8QQNaeKrqXkOQVGt5pUxU1CfM2OYNQnwVEMZTPOvvwsaA6bJMsQT/SHIWTnpOQV7TfHJJWwJzeJpjEr59DYgyTsANz/ezdYXGU5GxjsgZcXWv3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/w2WIgLnuWOWmC0UgqGOLyNjwGVYChlJl+uuUstHaw=;
 b=uBx64VxuJ9uVRd+91Bi2dJom+rAWX8JDghwKHST7SBqvtq4Lwf9CpPIORPvPQW8UuHFIDwGqthIDpuWVQ6ykWg+m+Q1BT7cufLW/I7DoEwFEj4zPCqNST7hna2Ju+1FlmqCDOJhTjzgFaQ6exFe7aKVbIhHs2ejuy4v8/ZeIJjWMKNMPvAphbNOnrPyXpjR9OxgaYQt2PHfJYnBiL1CHzgTd6sp8AphHMkYvOojkXDV4F+SSMe2kDt7r17f9NdM1nmUjKzD6bDLQCnKkPsJk/y6aDX67H9TWZ/7mhkG5pUbWcZ8taEBzTgLCtDGgeUHEck4/aO6xT+EXFNCsyNtylg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/w2WIgLnuWOWmC0UgqGOLyNjwGVYChlJl+uuUstHaw=;
 b=CeimQxlQsoLB6QvcojJpD5R7A74p7F6ddTn59XjbY4tEhGrOjYrZotzA5EBkU2Mk8oPYYckqOn0uWuv1wPMN3RrxuLsOv8jw5lP5Hf5EaOR77pb7oigdH7wVyPKtNulqlOD00eRqlAXi51vZk3raw40/B7Fh7rwdSRF4/yBobxy5kGWCPnCxzgTBhXNZwovE281TZMDAmFUl2stdUUINJhdePy5UaqTM1ADxbaOI0e+FMyLV0+fDpW0dQMlM0j/SWuSHcvTVP5S9dtGyYk3I9oucrp/36aAzi2/Wd1F/CxTMg1+aaQOEEFqNr4NDAOZ+WIv305jOYAJ1Yg5RfIfXjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by AM8PR08MB5810.eurprd08.prod.outlook.com (2603:10a6:20b:1d2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Sun, 24 Aug
 2025 18:18:59 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.9031.018; Sun, 24 Aug 2025
 18:18:59 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Martin Kurbanov <mmkurbanov@salutedevices.com>,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v5 1/3] mtd: spinand: fix direct mapping creation sizes
Date: Sun, 24 Aug 2025 21:18:48 +0300
Message-ID: <20250824181850.3994184-2-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250824181850.3994184-1-mikhail.kshevetskiy@iopsys.eu>
References: <20250824171331.3964537-1-mikhail.kshevetskiy@iopsys.eu>
 <20250824181850.3994184-1-mikhail.kshevetskiy@iopsys.eu>
X-ClientProxiedBy: GVZP280CA0096.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:275::14) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|AM8PR08MB5810:EE_
X-MS-Office365-Filtering-Correlation-Id: 54af146a-c3e3-444c-4016-08dde33ab1fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?siqESdLeWOsV4wiQW824HIw4vQtszzWBeluQUox+mMCQ0SHUD04+7IL4T6iS?=
 =?us-ascii?Q?Df1wjv2smxFYQs/cMWGrNQW5w7q9Z7rtIcmKOJa214ctbDkVmftLjJYg33Zn?=
 =?us-ascii?Q?nF/MrHIktN4LA6A8pTbZM7Bg13FdgkTTaduDiC/1ZmBG9f6BRmDRql1+e/pc?=
 =?us-ascii?Q?PXhI02ic0o5Rzp207Gf98ukXA1qgQ6kRSoTCPBGkeny5hc1ATLRCK2huTDJP?=
 =?us-ascii?Q?H6BugvOLj8Uj9dKq2+HVfFDeMIU8fK1+uTSB1V52YOY4i7qmCwyaHUekgJs8?=
 =?us-ascii?Q?rcId8MDxHvxXz91l8cFkjW+aGTW8wH8kbMhFrTr7QlT+7W4GTntmpbwPoqkI?=
 =?us-ascii?Q?FF24LLx8fBxwKy18bF/oAYmPZ5qZNWvDWuxM4aW70TDQs0ehpKagCQjy9u5Y?=
 =?us-ascii?Q?A/PWkn5iks57LHivGlYU8rurOV0mpGqLatgkSds1VQl6gSCnSdfwS9z8U9MG?=
 =?us-ascii?Q?EEHUSSfz5kNjXskESVjKvyKpKfdA32LJF5ls9ILAMTtk9Z/r1V+1PWqZeBk0?=
 =?us-ascii?Q?WadlOE/Nb0Poo9PpREuzKvYvSeKz7tbObt8di1Hs20+GcSz0vrKlasn2JCYo?=
 =?us-ascii?Q?psesEuP7XWdQ5ta80sKoDRG+LU4xxJFog+G0aWJLhvqX4gDTQr/FwJaNw0TO?=
 =?us-ascii?Q?oKYs3+mmLVhMt00jgrnmAzJxvOthLJo5hePDieQT+zyDDIUjeZqlMBj1oRnt?=
 =?us-ascii?Q?wsDE8m7NF+O6m/wjBRnEdw+1co/4jmAaH8bBTivIdpNA0mBLX+sVm2alRjnI?=
 =?us-ascii?Q?F8uOFzxXCYEhv0uZwPKQd4TWM/4/WmkA4kX+4JRVbGFcHd+/bYzAA9KMFDFn?=
 =?us-ascii?Q?e8dqtRpPohcKhrEqGH+Zn5HIFk0uaCojGs79lJDyVKdf/9IPXWipVGaF9HwP?=
 =?us-ascii?Q?j84ubNYswtg2a9rJ0U0cJFbvnSE5ShRQpB5MnKAxEGUVsBYBqwgLrjljHiUN?=
 =?us-ascii?Q?1ceXra8QDmK2hjMQfY+G31Kp6qk2OhUq5eqMR/0Cc+QNKWk45CPS4DqfK+AC?=
 =?us-ascii?Q?yiD3Za8jYo3FSpvI7zz8UNqe4VV7XjygEFPEet42BXj1fFySnncQhFGQ29OJ?=
 =?us-ascii?Q?pAO/zdgoFUgrTOsX0S+NaSE439PMs5/j/0lVaOdh6NMEP8Gtz6cIGjy2uT9s?=
 =?us-ascii?Q?KJQzagW6mVjvx4GFtnciWUovgGDYg+Icce/0RKM6fOqSWD32v81r89mCr402?=
 =?us-ascii?Q?PmKOwMjxw1oN9F0TPqwEZRyj5ICqkAEeYv4KIaR6zuhzsFu4amBVtMcCAVBX?=
 =?us-ascii?Q?59xnLKxe1EpCOEwbwaS4tc0obLtlPwHNvCok323x9tXJMjIJw5WTppR7lnCX?=
 =?us-ascii?Q?OgThYK3xXy3pCnLj2H7CrExu4lpF1pKXn8xf1QIzOCQIBRj/KHEyk8cgSLxt?=
 =?us-ascii?Q?hpo9AW9B8GX5FK8Y2dkhOh2YlzISLwR2uRmGUFSVNiKF1qp9zBzpu3rSLcyH?=
 =?us-ascii?Q?QqONE9LcezDIeFModNaqMD/ELcG/pM0k1ocoBNPRbKao8w5VtIx+aQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B6yrjB47NUq3AGISIdO6lFKLXCBsDu9Rh0OHOSBGWRyM8KrvJ4rphxcJkoow?=
 =?us-ascii?Q?WHEpqQYsAff7sNManUfPdP6PDMPbSZcWdadwwRI80pi4bcKPgrsLeR6dCTGd?=
 =?us-ascii?Q?NXk263Sb2CQDFBjGnKT2j9sGbu1C6Uej1x8VWN0DljtVmBVBdhtXX35PrQ1U?=
 =?us-ascii?Q?Wymm9v5Uu2CScqmKYJlEq8vuS6lErnrY1mYLM65rOjxdtsTklq6J1VuTiQs3?=
 =?us-ascii?Q?RFxKd3UVAt2Wnvnrb/cTzD8OOf4GXg6hOLxZh6Lc3P/HWWvQf1sqVNsILT+F?=
 =?us-ascii?Q?CMlTbFkfWlQv2WUZlENIEKTgZtDHb6dY6c7LFKaRJl9QDZRW6doPpxteBYvK?=
 =?us-ascii?Q?iuWKcZdT0QQIPWPcTTND5ApoPFuShr3yKQbdVNeH4MIFefewY/rJs7Y+tah/?=
 =?us-ascii?Q?lBqYzgjprtySG8TrUgq12X4hFM+l+CSkqqMcGbkfwlkHiSI+EYjct0ZNI/T2?=
 =?us-ascii?Q?Qzrx5ybX/ffdIj91GUPajH96REtMg/jtGHR0Kl1wRBUiSNPFYEbvohQCrUp4?=
 =?us-ascii?Q?vAZ6+sSclS1NSTHcmS9hOpfnUu3hm1wPaPihlejqlXsKRvv5wzaJfskg0om5?=
 =?us-ascii?Q?0NtoAlM6rRcn/kIDLtxAXx5H1sXHSnGH79dp3beCSDO2l3M0JycfeLTaCIbb?=
 =?us-ascii?Q?2ChEdrV67PAq9h395fUt1oHuzBqHNloPoBCe7/26kj04tuHVWFmhbiVfhQq/?=
 =?us-ascii?Q?h8ewSJ33bvBub6tO3V33Tg/NVLLTEHwbLnemgNn540S3U/8kVQapJbQG6WU1?=
 =?us-ascii?Q?tgg4v/mh6X65RwBfE6bZMMsSeAkvOjwrBDTM01VJm4rYc0skyL/qS2x3FlB8?=
 =?us-ascii?Q?CvbThygqtxUCZ166uQdfpdHD6sy0jiHXiwXoul5Ep+XeGWgIwX9+iyHmbVqC?=
 =?us-ascii?Q?W4T3UZ3P3G18JbeUMTHvLywcTgB8bY3850zIkOAbD5bHwfhIDKHse8ijIUfA?=
 =?us-ascii?Q?ikAG6UAnZPXSOD+5EwhuQLlqTkoV64XiR7JJeorBvMdI5p5gau3NgLaDUfFJ?=
 =?us-ascii?Q?8il+A+KV0O72XkJf81AsdxSaH22j/nYxXs7f3+vi9EcKyouMSCcC7s2ZMOkH?=
 =?us-ascii?Q?+7uQLmgfAzb4gQ1I/iSTqss9nWcGZ/prztuoR+uMenuerPsaOYxAOaF5zlSK?=
 =?us-ascii?Q?WZymXOcTKVYbKNC5Iu8ZAjdYcOLuemMk7XBR5CXBTrAB4IaUjTFJG3SaDxOr?=
 =?us-ascii?Q?3lVv472tCHN9B4wEj0pmBPJKEeOFRTprNmjXhLVbUIYMJBdyJ3Tx7BXqb0wY?=
 =?us-ascii?Q?6CXlgXXaacJnhyGNMWzgy43LvOYAGQ+6MU44zKUdne4F/YWZUCPf8n7JVBO2?=
 =?us-ascii?Q?i4NlVEvL9n45HUh+a86+ugWojrkZalz7qj2gAizoHuzX6UAFH+dy6szgRT7U?=
 =?us-ascii?Q?Hws/wHI86kunK/UBDrmssGoaNvPTGb+bMlhJI6m0yHgkkK50ObxdWbuKLLB9?=
 =?us-ascii?Q?NP2KkIgYCQvshuu1Im2rRpZ75AD6kcpOVa5x4vGQ8XUNXwA5YxQXPCfZQ54w?=
 =?us-ascii?Q?0u885SCGCmw6bfKgFrYbCX2kxFgCU2kIogdqdhV8QV8MJiWTY5jurIgElbxG?=
 =?us-ascii?Q?4tbx3VBlKQShGCwE/gtlFMw1IppF9MHOEki2/gdfmzYnPsiCbEZInGrwxp0i?=
 =?us-ascii?Q?3w9o40Bu2ZSoRz8vU9TOI28=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 54af146a-c3e3-444c-4016-08dde33ab1fd
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2025 18:18:59.1746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CnrWpvb0hDRFWf9CHzVDhq7xj/v2HibDl24V1usRkplk5pR2QS0HNdBmpq/UcWvHN/jtxcV+ZaG4N5ozwyi4Pa3anrypLb18JNqF7IgFNmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5810
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_111907_091963_240B9E77 
X-CRM114-Status: GOOD (  10.36  )
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

Continuous mode is only supported for data reads, thus writing
requires only single flash page mapping.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/mtd/nand/spi/core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index b0898990b2a5..09dd6e40e308 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1097,18 +1097,13 @@ static int spinand_create_dirmap(struct spinand_device *spinand,
 				 unsigned int plane)
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
-	struct spi_mem_dirmap_info info = {
-		.length = nanddev_page_size(nand) +
-			  nanddev_per_page_oobsize(nand),
-	};
+	struct spi_mem_dirmap_info info = { 0 };
 	struct spi_mem_dirmap_desc *desc;
 
-	if (spinand->cont_read_possible)
-		info.length = nanddev_eraseblock_size(nand);
-
 	/* The plane number is passed in MSB just above the column address */
 	info.offset = plane << fls(nand->memorg.pagesize);
 
+	info.length = nanddev_page_size(nand) + nanddev_per_page_oobsize(nand);
 	info.op_tmpl = *spinand->op_templates.update_cache;
 	desc = devm_spi_mem_dirmap_create(&spinand->spimem->spi->dev,
 					  spinand->spimem, &info);
@@ -1117,6 +1112,8 @@ static int spinand_create_dirmap(struct spinand_device *spinand,
 
 	spinand->dirmaps[plane].wdesc = desc;
 
+	if (spinand->cont_read_possible)
+		info.length = nanddev_eraseblock_size(nand);
 	info.op_tmpl = *spinand->op_templates.read_cache;
 	desc = devm_spi_mem_dirmap_create(&spinand->spimem->spi->dev,
 					  spinand->spimem, &info);
@@ -1132,6 +1129,7 @@ static int spinand_create_dirmap(struct spinand_device *spinand,
 		return 0;
 	}
 
+	info.length = nanddev_page_size(nand) + nanddev_per_page_oobsize(nand);
 	info.op_tmpl = *spinand->op_templates.update_cache;
 	info.op_tmpl.data.ecc = true;
 	desc = devm_spi_mem_dirmap_create(&spinand->spimem->spi->dev,
@@ -1141,6 +1139,8 @@ static int spinand_create_dirmap(struct spinand_device *spinand,
 
 	spinand->dirmaps[plane].wdesc_ecc = desc;
 
+	if (spinand->cont_read_possible)
+		info.length = nanddev_eraseblock_size(nand);
 	info.op_tmpl = *spinand->op_templates.read_cache;
 	info.op_tmpl.data.ecc = true;
 	desc = devm_spi_mem_dirmap_create(&spinand->spimem->spi->dev,
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
