Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3E5CDB474
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Oct 2023 11:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jx4ucodHpI+Dezx/0v4eZuzycF/0Q8JOUPjU08WVWZo=; b=cPuK6bWAr7tudb
	Q4KkJ/NNQuRxV814pFlbfHwobfC0DkRQL0T41al/fMuhWg1j4E/zvIj+rBbCTDYKVJRLL2TG+2px9
	ZQOX1HnSCYtXVLSCqwELpywvTj3tiKzochW3hGkgsJCjcTHZPqwyheg41yc8MSCL6mga6V4PHuPt7
	243Jk/1+mf7Qgf32Kk3rD2Z2R9GIUpPpJ6oERUSYbzmD5BIkHAP1ILko3Bq2AfDxhE5oBEKekrrGy
	4nwp1hsn9tsF5khzm1/u6ZcEV9sfDmC56FzjsxdKGBlVOntOnMIigDQ/9BTahNZHKxWtJoqaiOIEu
	25slKM5DixBu3YzL2r4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtnem-0028PR-0m;
	Fri, 20 Oct 2023 11:27:08 +0000
Received: from mail-db8eur05on20608.outbound.protection.outlook.com ([2a01:111:f400:7e1a::608] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtnek-0028P1-0T
	for linux-mtd@lists.infradead.org;
	Fri, 20 Oct 2023 11:27:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iq26TNuOpYuzGASPJ5l0m/RHvSpdTg5oTwPmAOQQ9PVbJXPaQGfni4sFvO0Y+uPqoAVLAymg9zxxdH+6v7g2m9Bs7Ux7jaJbZvQWofnPhNsVPRYbrnrI4EHNxt2ndof6zmd6YOQ+pxfmCveZXujWT+wNHyCyy500jkfFVoAtTbrW6qWleIOvQnMZgpBhBsS/zN0uhrzy8zdXx+li0cX8mBQfiq/oPRScBz0GYeLfJvAL8ItzhqWEDLUAuyiTPckpLQpC61p1+BUTTqeM19VGGTZDX3EgM3GZjOA5zk0L21TjmkMhsIf6JeMQVCfkdNcKeCwNI7bU/eB+PpY1tS6zDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHnoJCpJeHJJToBLqSi0cVCKvHXLFmb1QAC0+kxyM54=;
 b=nCzg8UlUzJjrXoBG/xpw+T3d92zv0Dvrbmv8D0/dHtK1MGkAVP0M3SnFep0NKCf6PQSab/dbVqYBUmzPM3AZdtYeANeI6JrH9FrQwWimxx+wq3PADvnzpBolRFGVuMMH+D2qdk7R8jDLgf/yz5GHsIM8dzE1raABpa24ZXRozoxkXZIjwFTX2IsC5KNDTRTvE7AbSTCP+w9Zjl+Wp0Uzw86GQbzyYzJsqCwtpmSNvKYHcY50RU/gZEyEPG/jWYTZaBHzNnbwRdjj6ea8EnU9FoLmpaVQxJScnMCxQFWvbpAq4wkpsvsSqUDoAJsA5InxZVijPNBbsMgb4qyo2oOPqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHnoJCpJeHJJToBLqSi0cVCKvHXLFmb1QAC0+kxyM54=;
 b=ba5uaFsRNdCuvaguhy96v4TcrWA3ERWBTy90Gf/JtNTXddV828dE8eyOMpkor0KHB6C9U2fLsjP5iaOagn5n+Hr4i5VGB004kEcy0V65W8Gp/5SMCyqyQp0I+3rpCkcmMSUBTGTyCb68nMWXcKjYi3Ukp90Im1I+SYVeEi70dlg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4010.eurprd04.prod.outlook.com (2603:10a6:5:21::30) by
 AS8PR04MB7624.eurprd04.prod.outlook.com (2603:10a6:20b:291::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.8; Fri, 20 Oct
 2023 11:26:56 +0000
Received: from DB7PR04MB4010.eurprd04.prod.outlook.com
 ([fe80::e796:8366:5d4:4188]) by DB7PR04MB4010.eurprd04.prod.outlook.com
 ([fe80::e796:8366:5d4:4188%4]) with mapi id 15.20.6933.008; Fri, 20 Oct 2023
 11:26:56 +0000
From: haibo.chen@nxp.com
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: haibo.chen@nxp.com,
	olivier.maignial@hotmail.fr,
	linux-imx@nxp.com,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spinand: winbond: Add support for W25N02KW
Date: Fri, 20 Oct 2023 19:32:02 +0800
Message-Id: <20231020113202.2782891-1-haibo.chen@nxp.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To DB7PR04MB4010.eurprd04.prod.outlook.com
 (2603:10a6:5:21::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4010:EE_|AS8PR04MB7624:EE_
X-MS-Office365-Filtering-Correlation-Id: ca2ee159-7c0e-457d-82a9-08dbd15f7766
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eeZJVZyDElmjLqTjOJKm+1xN/U5rS6vAkflNy5E6VnfBvTj7iU/hExGxUmRQir/ar2Vkr+uY17qsyKC4mbhtG00TleGifHrT+SLcj7toeS8+N57sSY1URjXDk6FbIdu5nLGbYwZpfH0bQyWYxwv5AfWV4MrRbm3IfYAyCUfCHlbKsrVJBvYL/Da92ZoWdSTE2RwZVusA4QFIV1AN+IKWuXyS23hDrKfkKD5IEd7pmL4jWQoDheUsVvGCth7VpS4/ZEZtF3wPN9ZyaK+mIjaZKx0yzoZXLWJ3QK1dL5uTJckd9pNdxGfoom43ct6h4j978l+T7VH9W9XPts0+PDj0LjDp8ZrTPZpieWTDaf0iHPA+/JfOurNFs78nB0iPJhF76ZTYKOFUZy6vKlxieqM8POKYtInkZn/Ex5hp/O1tU95FUMsXcd+yR825aSHvUCsiL79QWGlRxMYkiENcP2v/kgEJ9kcjdakcMLNd7e3PaNRdYqmlkwuvztpfVrhxwwgckezmfQYTULAuYJTRzuxQhsRH+KUS14lbURH5t2b9WMdZDP9/ZaLrL09xktYHOEADs+TQ74ruGlTZonv2tC/kbDUM9dOaCz/b2yBoJzveiSnpD4tKx0Z4guxnNnu76KIb
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4010.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(366004)(346002)(376002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(38350700005)(36756003)(6666004)(478600001)(6486002)(5660300002)(86362001)(38100700002)(4744005)(2906002)(83380400001)(26005)(1076003)(2616005)(316002)(52116002)(9686003)(6512007)(4326008)(66556008)(6506007)(41300700001)(66476007)(66946007)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8PyTAT8J5ycPARAmHH3jfwWQb9oovjDf6oicqRTyNxHwBqDIjgg80ltQcesT?=
 =?us-ascii?Q?rJ3SbiEiwDfjbk+/C4x+rE0DhfcZm5nLhKU176BWXRBg8L5Mjl0MaulgMNoJ?=
 =?us-ascii?Q?OH3UKVJi2cW7cKMP+ru0q+u2NOjd2Pm4ZNTYYynOO52XMFb+ZyFzoYNSIow0?=
 =?us-ascii?Q?sqyF/9VMN4DB5yGveGisFWXOh8/BAIaefwp4wYElzAcPWHo49NYa+YgS4rZ/?=
 =?us-ascii?Q?rh8mWF0amtP0qn5unqgEbUaCt1fE93KpJfBVgIsI6/IEHnCdrOOOVlFgeoW7?=
 =?us-ascii?Q?k5xQqXZ5NyWt3x0iRDXEYd0gjDDqmjjOje/qKrpN3Xllz6VPaJrZY/A8O1N2?=
 =?us-ascii?Q?qR0IqPHYRnN8QovoSrg2OIm+AGOsG7ioZ5nj+NsmVtHct7Sn/+4xyxR9sQfs?=
 =?us-ascii?Q?yCTjDsAtlkmOzUhMCrTcFVSqTz5Z9sz1TcvrZwu7zJy25gOj2flxMI+Gy3k5?=
 =?us-ascii?Q?n5QwpZt2HTXbIp3d3Sr22O0YAmJBJUtVjcnSO9ZzMd9fHxaQK7bkdotHmgAc?=
 =?us-ascii?Q?VahaSHMz4/5D4/rg84fTrdQZefXJY7Rg8f6rOH2EPsQcjvuncMGj3gIBx8M9?=
 =?us-ascii?Q?fOVr3BPaqUjEXWUKtyi+5SajmSr8IqJ/cizSi0Qiw+zoXqUF1SBrIks2iZNw?=
 =?us-ascii?Q?ahFqvdaCeD6o5aodzUslUdN+xPDumSxlSzA9NULPcs2TR+hQVDRTMrrNFCqO?=
 =?us-ascii?Q?YcnnhvkXR/HLE3iIzLIaAc93FliKlK5FwCCpd/nmlVhN+grkxkjlDGV8cnd+?=
 =?us-ascii?Q?l827GXAlyKL6yAwbA1WUMUL8tERO2nA+PrEddL74D/Skya13BBm51rKWEvat?=
 =?us-ascii?Q?5nx4uJavXrChkhxKsPKgsUFPLnSkPjJHoAroGM1KW+5dWZcLUSpANx6XOEld?=
 =?us-ascii?Q?rd1FwppCyFAB9NdALPL3H4hSB5v38EZsUAJYCS7CglFnSwHKZWHx1kEerAl6?=
 =?us-ascii?Q?7r2IkHPLOIfViycyKuW3b4asBjuXFDLwg21x5H6Vs9T32oCJ+FelVS4JY3G9?=
 =?us-ascii?Q?k89iAuPCrmeoGj/bbDmH6u6fGJj9PWk9xABCfVOs4RFlc3xhiwIdGf3+HfQM?=
 =?us-ascii?Q?fzPpU3aVQt/gPZa5ssMw8CJAfZyM9vp7EQU5xqeMfMM+5UlbqxyvdC6YWqM9?=
 =?us-ascii?Q?MPyeJChaWMD2ib7gPuBAoN0oE6tk6+8Jws1UrZ4Fa8VuidanUEplPNRs0XOr?=
 =?us-ascii?Q?GjhTbwI8IBEbHtvjZkRSozo7LL9IIUARD4ylgoY0ouhPQjPxjf/mtX+hVJsE?=
 =?us-ascii?Q?+3t481/Q9KhMWZCE9YhM8VS7vQBrhVLJYeOKY4Oh2wUccp+LcxLqd2oY/H2g?=
 =?us-ascii?Q?H9yeQZpB4YfiIqHDQ1FebTYXA3YKbb1OMS9X/5HPUS4et38qT85kvp50DCuh?=
 =?us-ascii?Q?Z6xWI7p+bnrZjAg8Wk40hhXaSyfNp1F4as9G/HOLNPQbuPO0W4D4jwnC67yC?=
 =?us-ascii?Q?QOOhywAn3hBY7mHTBaMjcRlrbYMLlXGyjoH1FEBn4yfwJF/7/ozG8u7K7AFA?=
 =?us-ascii?Q?SearchgZFvn3JFOdwiudxclHOR18nJAbV8EDNduhZ4UoTL3CUVeNv+fh8bXS?=
 =?us-ascii?Q?htQL9KD//+zj9oAcsELhkg2IHBKiPwKtm2x0BFmC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca2ee159-7c0e-457d-82a9-08dbd15f7766
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4010.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 11:26:56.1546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fFVs8W9wTs5b9xXBRr5sL40moMyJIE1yTxT9vzqdsdcowgPsKwf74JD4M4rLZxhb6noNC0cnXsn1uwzslRm6bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7624
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_042706_210114_B451F910 
X-CRM114-Status: UNSURE (   8.18  )
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

From: Haibo Chen <haibo.chen@nxp.com>

Add the necessary info to support W25N02KW.

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/mtd/nand/spi/winbond.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index f507e3759301..5c759656c4f9 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -169,6 +169,15 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &update_cache_variants),
 		     0,
 		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
+	SPINAND_INFO("W25N02KW",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xba, 0x22),
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
 };
 
 static int winbond_spinand_init(struct spinand_device *spinand)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
