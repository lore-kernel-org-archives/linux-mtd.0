Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BDECA1013
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Sep 2025 18:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=158nOUDr8tKQBMSh9w481VNgOTOrPfJMd6CcG3ILsIs=; b=4baGLVVfuwImUr
	l2All75ji5shvcZSyzUNYcT1bniPAeYZCCSL/GkqLHHQd8K5LvPtukGTtKZpXs8DVtdWUhXu+6F0J
	pTIJ/BJI1M5gefdqM6pZsQ0tjHBSjimYzCYZ+jDYNYY4hq2eQwFRXSiyQDmRrGEKhXDz3WEXSyNNN
	9m+7heSPJBKkNFCdmg37sdc2J8p/gWePPtLGnbEB7n8eKthrjzPYMC+GexBTIvF57VTxXyEJlrQv5
	2AwF5brXIjnWG3kRpldaa4RXnSWGIPa2EYGCYKcHvmo19Gcq11W4mmdKQkBikkEFSLuaejY82gxkJ
	AYYs3PIRe/d7R0NDMzIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuElx-0000000Dcqg-2xUA;
	Thu, 04 Sep 2025 18:33:25 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuAnA-0000000C9gR-26f3
	for linux-mtd@lists.infradead.org;
	Thu, 04 Sep 2025 14:18:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A63niwAE42Yw74RmqHZaf1u4bbS1WA13qKtQ6h/wLq4PzZkdqhU41ygw21dY0NBKPhHNMrNCn2P64nr7pOlYDruZtQNY+Slp/IHUwf/5/vMjW+ZqIyB5uSAxcGfSWHtiRlUtvKe5mzT+5OWwn7PUVL+a4bodFBA0ccUqDq6oIvYzvNAVZA4hrq98gWxomyJM/wTX1/MactipsB1GoFerXsLiNvMEhXWkWvybOOXMmrgfEzuCymf5TwNsNT3gQVpCCSBnkkRc+XUZdlevHIVqlsaeaZVaf1gFhe6preEtUgMguPNkzNpACK99qHmSUKuNACzWCsrQGL1fs+ShumFAmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kjmf3YIogIlr7PHbp3AGaPikD/o2Vv5hem7hDQQfpDA=;
 b=fb3TrBAs/ZS7rAPb6YOIlvZ/LhzyoFUPico5f6VjVqRiG0Epb5PVSrdaG7So/Ga5g0++pkq55+8txvdq1ujrUNZ4cl0yii/0FzxFXA7C+hpWqlkn6uVyyBiVO1Fr1VjIqWdPBFEMfXfVI2jHrcx8dVCtD2uxNpjqa1L6iXEZeDcz43hLRURCSUxrfYaA6gyhEcPR17Q1SU/RVA8/oyfyD0nTxc0fBakygIXH9ykcrVNBHgOv5/TzyJ4AkvLWtIETW99pBX+Ts4teMHjp41wI8Px2J5Q6zAWPfiQIzXcRA8w5dLFgnc5ztY6Aa0TL9bul8g3qSg+yE790qtTZB7W+dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kjmf3YIogIlr7PHbp3AGaPikD/o2Vv5hem7hDQQfpDA=;
 b=ikLZ0dmFc9sQXe+iO7LsC4CK4uD5zO0RhEo3lX5ML1p2xMVCLpgVZQRuT/SrVNoXD3yxBLaPVgicSa2jJiKf/SaYyGgLuBSflw0AwX6SFouVjbd1LPv9HEBajF7hTw0l1hUxLMSPtOSIfkkihT6aYfnl7FKMe/ym6L+XRWgC7qwmmWdnbHJckZV3NJt78OwCvYrqmo6GDBF6jMwzW3yCQhk9ttUWd+lizlDOB5IlnBsWwcvXo3fOq898pAXjjIRolt16b7fUOdppx8+b2fXBFx5OYYgMaQt+DseDloL66C3Y1NhGHG2DuuxVlzi6jKQLzTpiAyhqbCIOVViK0z/3Sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by GV1PR08MB7875.eurprd08.prod.outlook.com (2603:10a6:150:5e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 14:18:15 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.9094.017; Thu, 4 Sep 2025
 14:18:15 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Martin Kurbanov <mmkurbanov@salutedevices.com>,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH RESEND v5 2/3] mtd: spinand: try a regular dirmap if creating a dirmap for continuous reading fails
Date: Thu,  4 Sep 2025 17:18:03 +0300
Message-ID: <20250904141804.655608-3-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250904141804.655608-1-mikhail.kshevetskiy@iopsys.eu>
References: <20250904141804.655608-1-mikhail.kshevetskiy@iopsys.eu>
X-ClientProxiedBy: FR4P281CA0161.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::13) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|GV1PR08MB7875:EE_
X-MS-Office365-Filtering-Correlation-Id: 832bc168-c0c4-44e1-7b87-08ddebbde37b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yMupC7kK+vxIA96AMbH9rtllhIJxfb26FcOGPvNmbED9zqozzn35NPcG9glx?=
 =?us-ascii?Q?u5GeYZguVnV+WtpyMdeZmUdCxL11YiQYK8kS030LEiFZI0zVgrQgbzByI7wn?=
 =?us-ascii?Q?RQZVPV1vhW97qC8XG494pmAk1FCrazvjR7HpzhOTUuOIgzgYUUKt7PoTBh9h?=
 =?us-ascii?Q?D33HzH2gEbYfFlznp6DzGbCuYsLd85zZIaV6gPBIHRw1bO7OCESvg7obbX7C?=
 =?us-ascii?Q?+HD6sbiGxXN5+2aUxY/rduiX0xW5m3iCtwGNZe2TQ+XjWgYqCNhhLbG5JBQ1?=
 =?us-ascii?Q?w1IC13l6XAXDAm+Rq1Jh1XFsGBGH5ys3tFLvhrKd/jdnHIZbWVkmMqO94W3E?=
 =?us-ascii?Q?HMyXullGD004XnBkg2CFF9P4hL0GRwHuMnFhb7pFeAEYDsL7E/ZJlpr78j1L?=
 =?us-ascii?Q?5oHcZn/Yp/rbyetQVKLjXS/PZigKHgooJIoNtUt0VQdj/zS0ekGsA/JxbD6m?=
 =?us-ascii?Q?ojOUtK9zq5kfn5je+XWGvd74QoDFD+REdxS1dmIEf7Sg9hZfL9TyEJ/jvzQy?=
 =?us-ascii?Q?HoITItuzXtbWrSt4LqXxBwuNw/v3r9swcWo1o9BpCrVYHsirKaYZ8BQS7DSh?=
 =?us-ascii?Q?+zDitOtMf6bu0A9bffv8pejZQdv89PyhW9F+DBlDWiL+vJvhrRHzhBiwP2sc?=
 =?us-ascii?Q?xm16gUMO7qiNsJyWlpn9VIhaHtNlj9YqhVD0zfySjA7LAj3T9Gofgco1Bbl9?=
 =?us-ascii?Q?FPiNrgZKN418gHrlSm0u0DZKdvIu6YxZCtwXxzQ3p9wlm4mYrpuXKarsCXgL?=
 =?us-ascii?Q?zoiNpUEVsgeldzq2g+ojgUwp6OKKXXVoBzV8/rlYvfRmy6RX7thhikUwVuXj?=
 =?us-ascii?Q?rKl7Qz/LHDRbJD57SUdF9h6z1TU2ynYxi6PMrMyz8q8K1endvMp6wNwc7UUN?=
 =?us-ascii?Q?AEpGLveto/5yqqrX7thQiDWf+NM66k5/yNNRN5bU7hiaoNA8B7La8lSfmBBP?=
 =?us-ascii?Q?vtOvD1Xl+MgaZHh2l5nSl5OuZBelh2YmGGAVuH/nI54rjArGr/LeGyxsu/h7?=
 =?us-ascii?Q?3yf9c/4vCvEWgszNuqdxo4gdfAT4t/246BM9drC0Ccj8x76Ht50CXStcvIiE?=
 =?us-ascii?Q?lZrNAMfioXFoV+s75H1Wd1l7WkzSHreBlhxtZ9eCeYNnVa42w4zAsYw4gyFV?=
 =?us-ascii?Q?QA9bGSLFKymO3bOx92nvdmp7AxsokFLH/bOWQZR+xzUP78Va+64INbssm7da?=
 =?us-ascii?Q?WXurv5yfG6mhxpbeds8en/7wGgqWH8XMXRQRNsJ4h7ZEfJf08pF7Yzt8kEpF?=
 =?us-ascii?Q?8O1QhQEQvSra3bIszHvNf8mK7/o39vujXcWG5UUxYiFLLdvaAlMfW7xqImHP?=
 =?us-ascii?Q?2qxMuvUPpyKLDGeekWlbBx1HXlUNHap0q+Vd3+cNXebniBPi4fbKptYA+8zs?=
 =?us-ascii?Q?SKd4RgKNbNqdzExQFeoZ403Y5TyG6ITCAeOwY7O15ieWCFjlChtfl/iBfzZ3?=
 =?us-ascii?Q?feu6woGdfRM8Enp8+UY4BdFHrYq++ml2YqQXZOnw4OLOo3czcWh3Ij/KJYaC?=
 =?us-ascii?Q?KP5TMo/b1c9w9Us=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A+t9KyoJPu8gHflLqdIA2ZPjAEJPX6pbqLnmUHWIiOzVJDEq6cYVYTUKf7/r?=
 =?us-ascii?Q?nqMZ9xr+vSB85buzi+kuVpTo87oyuXnxGkVkSz2VRvbLz3wXUO4SMyrZeYxx?=
 =?us-ascii?Q?zkiIVF52Zq22qdeeOp0BEkPdsarxuGh1eg38EXwcgiZUFLAVZZi1Ur201mmx?=
 =?us-ascii?Q?JZUp0iy8ye3r/R+BkiijhjZpaBXMwtlQk836atFgUyqdIBMvt9OTknSpHiBu?=
 =?us-ascii?Q?K9fTP1sFSNG24G0nMJ/ZqXuFRL8NqcaKR7W9wchNMMRtbOphNfAVz8sd5g70?=
 =?us-ascii?Q?ko8yx+c7UjSQJj+YU+4P4vTuPhPGAeMh6VNXHGrxVo7byRCa+qkZqmhStPPz?=
 =?us-ascii?Q?ANgD2f2ws+x/nPgsLXQWS7p3A/jHEh6B/tgNcxyjSQC5ZqiV/3RRvpq9br7G?=
 =?us-ascii?Q?busB5RJbUHvnL1qd8rvzLGYRC52COJDwrT1+8xMYuW5UBCVY4SpotvA9339Y?=
 =?us-ascii?Q?P1E4RHuhRmu/9UV5hczfNhwVctB0rBtOnXInEJxd1OXGEuTKt0ZglgjlIqwx?=
 =?us-ascii?Q?6jo0AgaUjqePFa7LLnWUQ5r3viR6pYS9ZGvLrcZ82I1gCtLH/6XYMfBHHuSE?=
 =?us-ascii?Q?J3+xwLWQhjYT6UmwRDtQ1NQfEl2Yz9RfHlgjvlAKdBWQdXd0991wxs4lFt3k?=
 =?us-ascii?Q?SsJXAfCEBcO/pdyubufOzlZfpmPAwkT+/GpSugdZryvs/xZRzBqGiVymCo7d?=
 =?us-ascii?Q?oG8bAIRF7Opk/CPtigO5CrZYNssivxOU/iRyuBR+qFiP+DjomH89vHtZA88l?=
 =?us-ascii?Q?lhYaOBi3SZoh2WSlNNalqHryImiGqHWxu+jcIEfbTnDXHfsGTWBAXVTi/E9V?=
 =?us-ascii?Q?z09OHF0cKOFDdL7cLFCYgK0R6dwF2NV5ajupiV4N6tu0jp+bMYq1EZRLfT33?=
 =?us-ascii?Q?fR63I5XgCaTkP3a3S8oc5KQHAqDoJDP/hcl83giUKejyjfbLgyIQILiW1EFH?=
 =?us-ascii?Q?+Gk/XmccH+CLrjcpxUC3zg4A3VHg/7jDcxP/Vzr/4UiTricOqlLgueS8RyBu?=
 =?us-ascii?Q?9xADtX5f0zOVcSz2rDHYSXswbtfN3di8NFa+SASZRcK4pK92t2fVkZdKWZEq?=
 =?us-ascii?Q?E4Qtt9l1dkE0H7bz7eDRA2tKIbAMjvnCwF2F/kPPvG/0WmiXHZPb7e3hNR+u?=
 =?us-ascii?Q?3xRlkEmw3Gz/H99DDxeDk9bPSZylgQKwF7yqI/Ziw/TfoBILoMpJN+C7L7f2?=
 =?us-ascii?Q?r44afpqw1lG+4UAxGmHKcyXUNPwKG9YOGHVfsEhDOkodJPzq43l5gndR24ss?=
 =?us-ascii?Q?pFtkgtpcJpqZNSx249QUkAKfXwZZ3s2z6yLg3Fq2seUf19AFcvncRMNL/AZG?=
 =?us-ascii?Q?nm0rIA3sWS7QGJBcdo60dXB8R4LkbFd8lm3L8/9oEQOUjeNXBBleaoWi2ppG?=
 =?us-ascii?Q?DMgDYdso0MXT+DlK98lh/ZDAgsjkzh1hro1jlWzZ04Ycw8RzEI4njMVkKnRo?=
 =?us-ascii?Q?jRc+xyNF8eZ2qXD12s7xpmdSz2ptXagvcmXR81oL8a70kwyAMNWhtkYWaOqK?=
 =?us-ascii?Q?EzawYuoTgrXCzTOOPrnPBuc5FcmIsk+ZNQolGVjgkxPr2l/iB2jlqQ+kqPUE?=
 =?us-ascii?Q?eqXPXE4aC6O1GDY4Z4EokdAEahwnUQMgF1JTM+3t5jih8oKlNzTIfIGAH302?=
 =?us-ascii?Q?pa7uIjazC8pFFV793LRrECs=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 832bc168-c0c4-44e1-7b87-08ddebbde37b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 14:18:15.5988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fAl/CNcFcxJ3r25Vzh8YT4C1uZWli4HOy94T4J8d/KCgyubpgfjAdRWDyTOEXmcLSSTP33eD3CZC5SKiY6oIQKQ4r0gcVvRzFSpn/7x+n0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7875
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_071824_542409_5F00F256 
X-CRM114-Status: GOOD (  16.05  )
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
operation. Typically only one flash page has read/written (a little bit
more than 2-4 Kb), but continuous reading requires the spi controller
to read up to 512 Kb in one operation without toggling CS in beetween.

Roughly speaking spi controllers can be divided on 2 categories:
 * spi controllers without dirmap acceleration support
 * spi controllers with dirmap acceleration support

Firt of them will have issues with continuous reading if restriction on
the transfer length is implemented in the adjust_op_size() handler.
Second group often supports acceleration of single page only reading.
Thus enabling of continuous reading can break flash reading.

This patch tries to create dirmap for continuous reading first and
fallback to regular reading if spi controller refuses to create it.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/mtd/nand/spi/core.c | 43 ++++++++++++++++++++++++++++++-------
 1 file changed, 35 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 09dd6e40e308..02e322490110 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1093,6 +1093,39 @@ static int spinand_mtd_block_isreserved(struct mtd_info *mtd, loff_t offs)
 	return ret;
 }
 
+static struct spi_mem_dirmap_desc *spinand_create_rdesc(
+					struct spinand_device *spinand,
+					struct spi_mem_dirmap_info *info)
+{
+	struct nand_device *nand = spinand_to_nand(spinand);
+	struct spi_mem_dirmap_desc *desc = NULL;
+
+	if (spinand->cont_read_possible) {
+		/*
+		 * spi controller may return an error if info->length is
+		 * too large
+		 */
+		info->length = nanddev_eraseblock_size(nand);
+		desc = devm_spi_mem_dirmap_create(&spinand->spimem->spi->dev,
+						  spinand->spimem, info);
+	}
+
+	if (IS_ERR_OR_NULL(desc)) {
+		/*
+		 * continuous reading is not supported by flash or
+		 * its spi controller, use regular reading
+		 */
+		spinand->cont_read_possible = false;
+
+		info->length = nanddev_page_size(nand) +
+			       nanddev_per_page_oobsize(nand);
+		desc = devm_spi_mem_dirmap_create(&spinand->spimem->spi->dev,
+						  spinand->spimem, info);
+	}
+
+	return desc;
+}
+
 static int spinand_create_dirmap(struct spinand_device *spinand,
 				 unsigned int plane)
 {
@@ -1112,11 +1145,8 @@ static int spinand_create_dirmap(struct spinand_device *spinand,
 
 	spinand->dirmaps[plane].wdesc = desc;
 
-	if (spinand->cont_read_possible)
-		info.length = nanddev_eraseblock_size(nand);
 	info.op_tmpl = *spinand->op_templates.read_cache;
-	desc = devm_spi_mem_dirmap_create(&spinand->spimem->spi->dev,
-					  spinand->spimem, &info);
+	desc = spinand_create_rdesc(spinand, &info);
 	if (IS_ERR(desc))
 		return PTR_ERR(desc);
 
@@ -1139,12 +1169,9 @@ static int spinand_create_dirmap(struct spinand_device *spinand,
 
 	spinand->dirmaps[plane].wdesc_ecc = desc;
 
-	if (spinand->cont_read_possible)
-		info.length = nanddev_eraseblock_size(nand);
 	info.op_tmpl = *spinand->op_templates.read_cache;
 	info.op_tmpl.data.ecc = true;
-	desc = devm_spi_mem_dirmap_create(&spinand->spimem->spi->dev,
-					  spinand->spimem, &info);
+	desc = spinand_create_rdesc(spinand, &info);
 	if (IS_ERR(desc))
 		return PTR_ERR(desc);
 
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
