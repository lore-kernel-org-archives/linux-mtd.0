Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D729C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Mar 2022 20:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cUEviOZ5wlZ35oQUBHEdv+r4iWxQ989Ohnc1qu4d2/o=; b=m7+IenUjJWLtjO
	dUK3ypLSbkhw6CWHVpFGq/D8arKoyMf7XyBVxUH+eerdJD9Y+mxgNZfwLxJlENgqREZergBI3i/y7
	9x0FHM4XRTZLff/1DdwDmt0ys4MdpzFam7GTCDfaTYntm6q9L42YZM9dAWIKKGKKUANMPAnJFPXDF
	cxx8NHy7uiH6ajblbspUtqUuKEbvBBhQvUjDr+ppi1MteHxBo2tJnInKdqlzARFsQDPgA5c4ZiwU5
	rM98XgPhzA0/oAeiVbeENxvhLt3Vv5UWkxmrVO9aj5OgrdNjBLqs5t//x97m1/JV52o09avcdCm/J
	wbZGWWMRgzek1dPNE3Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWOg5-0094i9-Vk; Mon, 21 Mar 2022 20:31:00 +0000
Received: from mail-db3eur04on0618.outbound.protection.outlook.com
 ([2a01:111:f400:fe0c::618]
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWOUW-008ztD-5s
 for linux-mtd@lists.infradead.org; Mon, 21 Mar 2022 20:19:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oDrg4GrcKCxQs1Vbbvm3OQRaK6zm4MozUklcU49I3mql7MGjztkml/5AP4o8P8RvU+zHif5Q0KXXqs0xqOlAqv9Fr/ETXcKPFniFNbyclL3ujqrW9yM0EazuUOPoomc04LwnSmeYvBHsJKlckfkFsoKNwtaOwPGyGF+DI0MM3CGsB11IBoK/yJTpwOCuuNA8vzjDvWvk+WpvJXl++cXYgfvL3mzi7nNd+DU+O1q8k93cvyHBVJ/p76DxwlE18skflBkwPHQslYS3mZaWYSJGEHQvkeQJikmmSSriwuWfFL6yJA/Q+a6166squda37rTZa4dr3JgeEXDFKNL49fRKMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Pq95BIKRcq1su1Yz7maewp+9LAmUbm2CBV+MdZkXz8=;
 b=jefYW+cHR5kBkGgmAkOJxWBhrWe0U+4dHIPNm//z6S5fDCLUU/Rar2cGSoYW16gqZyMW7PjEI7I8Ct3/anKY5J4te0WVqcpZiK0Z10RYlHhTpbCbvOLmq45vv2+lDaDWpvOTmuJFevH+/HxChyKrQgauV20aOcuHwUccIBMPrzSEeWOW9RSAYWM+ptpgNIlZ2Z+sZMZQy/WNaGjM09vGSL7NmGj5hAHUt915tAKia+nxI0Kz4VNEh9t+es9HbYCHC8beeooQR7wStkZ3MjTxMaBGQihTqYTSt8kvz9h/aNY3nAk4e/rHZHS/oLJ51AHejHtaBxgwY+UcrbQMl6JLtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Pq95BIKRcq1su1Yz7maewp+9LAmUbm2CBV+MdZkXz8=;
 b=sVwgh+EAM5Y9yVHwyvFvzSOodk+QUzMYmtdtZWkamSxQnEui5FIoV+9WAveIB3GuSYWr0+3ANYqot+b4zHFd1yhr+szXi50SreoCTtX9xXWqcF/qPZD3faOO8QMiXi8D/AIFVkf6xWwS1Xiuk2O+f6yn4/KopVw9HvIPHjx7guk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by AS8PR04MB8851.eurprd04.prod.outlook.com (2603:10a6:20b:42e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.23; Mon, 21 Mar
 2022 20:18:55 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::5416:5d1:cc34:ca9b]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::5416:5d1:cc34:ca9b%8]) with mapi id 15.20.5081.023; Mon, 21 Mar 2022
 20:18:55 +0000
From: Han Xu <han.xu@nxp.com>
To: sbabic@denx.de, sean@geanix.com, frieder.schrempf@kontron.de,
 festevam@gmail.com
Cc: ye.li@nxp.com, peng.fan@nxp.com, u-boot@lists.denx.de, han.xu@nxp.com,
 miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org, uboot-imx@nxp.com
Subject: [PATCH] mtd: gpmi: fix the gpmi bch setting unalignment issue
Date: Mon, 21 Mar 2022 15:18:34 -0500
Message-Id: <20220321201834.28546-1-han.xu@nxp.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: BYAPR11CA0048.namprd11.prod.outlook.com
 (2603:10b6:a03:80::25) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e2ae075-5287-4058-1da4-08da0b7805fd
X-MS-TrafficTypeDiagnostic: AS8PR04MB8851:EE_
X-Microsoft-Antispam-PRVS: <AS8PR04MB88516B7B5AEF2D34779C9B7697169@AS8PR04MB8851.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JikS2MbboHUCnPWjy8IC5YmCZcdBAbxM19Wb2JnzDAPp5y6pyctuY6TnsrQNxL1cdi2Tlrp3JYfuklXfzRH3qcNeoxAIFlzDfx0KF2KkxFwub5QnEh+s4PF52FKohF659KN++5XRLqld+GBnNKcbFqCerObwNMjbPvo1a72tsVE2lfNvtH+ojQmHi0GZpNfgYH1nBsjRVdL3goIEGEw65PTDiPVAgM/ybkBXeKPQfpZepOhZLHXH4Oedze0VOZnKfnfkcca4nVEnugTzfLk8CceDFlbAi1uzmyv0UJawH44XaThPYm/U1ttVJIybnQKZ+DL0h26Dhcumg2vU+0zNLaHe8b1fgJMnZjdZ7cBHkc6dJ+uFX/fW/bidsdf+W/lSeMowHKquq5dw1RPNewUsgk3/hFz6PFsLmb1ch7OdYLPd8hV28OnwzzHo9oZh1Yk2tssOa6wfGPvK3aN2l2ghJQFXaQPDh1s2jCbLgZhEtoeNDLf/N6Rkbs02jX+4hQpc/evLEmh+trcFjLXB4YB5PwPi4D/2vAX9zIr3HEcHhYjfkhfOxRYDy/5RpRhUJZQMRdnXq/3jmTvV1RicH1Caftq97A3GPba7sMTgqlmWajO/88SRXyZJZdVGOJpgr0jVcYR2Czh63b3DgMsIy7lpuZ2uGEGB+WQDzZmUbFvnZuPsyk7cs6YBlvoAmBejw7P30E9xI6oW4j6MQ3xYCLHGZ/ZVf98f3R9ErTYc6+3Lz8VtCwwz0ZQ83IXb7SHOF5X/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8774.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(8936002)(6666004)(6506007)(316002)(86362001)(83380400001)(44832011)(5660300002)(36756003)(66946007)(26005)(52116002)(1076003)(186003)(2616005)(6486002)(6512007)(2906002)(38100700002)(38350700002)(8676002)(66556008)(66476007)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KDh0bK449PMQjJO60AnRmEavKHZ/Gxd/tg7jEmDvV6Yi24ZTh+YfSHCCQA+j?=
 =?us-ascii?Q?Wwieq9D0d55EzgJbRjOtLoZLJqmHWeuUuxTDprpYbrzWzphTK0IytVOGuvIK?=
 =?us-ascii?Q?qwWlY9XhrHYzyv5iZRFajJ5AfODpMXVqQXixg6wKpr379kE28Cc5hftmw+I8?=
 =?us-ascii?Q?mlU+x+6N0FNTUI1VPlHCUcWD4J7WmF3WajiwG7RyFV31rwQvE68P+HBKxzlH?=
 =?us-ascii?Q?8WjM2bTXGQtAetb2UiDYEZnLNQLmMbxGFWtXd/24N6A6OfLkRaFxYCrEprsm?=
 =?us-ascii?Q?ZK7gVE4LoRaSb4mI549LUErrUsouFtkm2KJe0PxrR6e4W0NrK9tAp82Uaas3?=
 =?us-ascii?Q?5FzWeBU23mAy3Gyybc18pP21bvSxnDb/G0D0T9x3Nsa/7pG/ns6qadOkwPrW?=
 =?us-ascii?Q?1rXZvU9wn5gH/oVdrTsWIlUeA5WrBDFgfa86PTxcI9IyI6u/RrwASChTvDM8?=
 =?us-ascii?Q?1/5A/ggWlrQzHrebmah2X6250Y1e49YzrCVUIndsriVfkdHn7b2M2BU+j4Rb?=
 =?us-ascii?Q?FcnHs+36KgnofedF1O8bm4rqvUNtleejkgo2HosFAM97pXA9zj8Kee28hw+z?=
 =?us-ascii?Q?SEE/o/Az12ci+phHZLZmtrB+iFwL06MkvvoHwrVFWBgb3y5hzgmLs9keLxkX?=
 =?us-ascii?Q?zcny6vSgGzTMZQeOv7PdXK+T52bAg3kJSZjRjPJR3X8VR9qhxeX73xK/EkE7?=
 =?us-ascii?Q?95ZGpobglR2cIW07mS0BMCWxf0eIpYmoov0K1//TdzA+eWlDnYNA8sAi+rpe?=
 =?us-ascii?Q?rFiLw1YwtZgfYcUuCzhiOnLmjQR9XRwyyJBcXcuyyno1yNFE8FsZNYFNTSeo?=
 =?us-ascii?Q?uM0JiHL5oge7XsoQ3IMAQoro/a9uLn2KFSXwJfXvoqfBhyhQf3zwAHVWk3Bu?=
 =?us-ascii?Q?WWlTc46XsWMWFwszSe1hP5OG1RlNg4pgS6wUMBHA55Eyu4IcfaG9Bu1XOBL5?=
 =?us-ascii?Q?QNCnobQWAhjToedL9cEYnuaSl+jaq/dqpN5kRcpiCUabU5LtxvB+3ohvltB2?=
 =?us-ascii?Q?RXMc03zaJJDZCDWO8xhe/7/hETH0+wQpJSzrCd57hEQ2Mp0YNxeuoIEgOnSt?=
 =?us-ascii?Q?j5pmXapEYEQ2niUwD1GKsqdx4nEEz8iHobS1eNvCpyI57VlpNOkrw3ejlFdM?=
 =?us-ascii?Q?fY8rpEvA0K+bKnbljIB2KD+2ZHHkddXWgemICABbs5EDv62V8E+mKF2ESKC1?=
 =?us-ascii?Q?ZHAt2XyWAnd4kmuaEw6n1XtoJyUhc8428KUXEu/J76e8wDG8QjvwmluD8MQN?=
 =?us-ascii?Q?SR8j4ZfvmZdiXAe80rJA13jqeMd3k6wVJpPAabFJpRh9F0LvcsjvTwBE+rFL?=
 =?us-ascii?Q?hj2Z5/Q87hIIxAtxQlKwkkJpW0FV7SAafKNUlnF2bh1K7dleviqR4ogGNUDk?=
 =?us-ascii?Q?xANaDL/Krwd+jOMRAhhKkiisJxdWI+ll8a5aFK4/wtQY0IMlMEt/KldnETZU?=
 =?us-ascii?Q?oH6p9NsNUelmWaZBjSQiY38KY+SahjgN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e2ae075-5287-4058-1da4-08da0b7805fd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 20:18:55.2676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oO0aBGdiYhmEFyBK21SNewlN+M7uDunwSlwglydZ2ry7Il2mmPFennHkF2rB40tg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8851
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_131900_356208_58A36236 
X-CRM114-Status: GOOD (  17.68  )
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

The code change fixed the kernel gpmi bch setting not aligned with
u-boot settings issue. It still uses the legacy bch geometry as the
default option. If users need to choose the minimum ecc strength that
NAND chips required, it can be enabled by either adding DT flag
"fsl,use-minimum-ecc" or CONFIG_NAND_MXS_USE_MINIMUM_ECC in configs.

Fixes: 51cdf83eea mtd: gpmi: provide the option to use legacy bch geometry
Signed-off-by: Han Xu <han.xu@nxp.com>
---
 drivers/mtd/nand/raw/mxs_nand.c | 71 ++++++++++++++++++++++++++++-----
 1 file changed, 62 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxs_nand.c b/drivers/mtd/nand/raw/mxs_nand.c
index 748056a43e..ee5d7fde9c 100644
--- a/drivers/mtd/nand/raw/mxs_nand.c
+++ b/drivers/mtd/nand/raw/mxs_nand.c
@@ -195,6 +195,7 @@ static inline int mxs_nand_legacy_calc_ecc_layout(struct bch_geometry *geo,
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	struct mxs_nand_info *nand_info = nand_get_controller_data(chip);
 	unsigned int block_mark_bit_offset;
+	int corr, ds_corr;
 
 	/* The default for the length of Galois Field. */
 	geo->gf_len = 13;
@@ -225,6 +226,17 @@ static inline int mxs_nand_legacy_calc_ecc_layout(struct bch_geometry *geo,
 	geo->ecc_strength = min(round_down(geo->ecc_strength, 2),
 				nand_info->max_ecc_strength_supported);
 
+	/* check ecc strength, same as nand_ecc_is_strong_enough() did*/
+	if (chip->ecc_step_ds) {
+		corr = mtd->writesize * geo->ecc_strength /
+		       geo->ecc_chunkn_size;
+		ds_corr = mtd->writesize * chip->ecc_strength_ds /
+		       chip->ecc_step_ds;
+		if (corr < ds_corr ||
+		    geo->ecc_strength < chip->ecc_strength_ds)
+			return -EINVAL;
+	}
+
 	block_mark_bit_offset = mtd->writesize * 8 -
 		(geo->ecc_strength * geo->gf_len * (geo->ecc_chunk_count - 1)
 				+ MXS_NAND_METADATA_SIZE * 8);
@@ -1111,6 +1123,7 @@ static int mxs_nand_set_geometry(struct mtd_info *mtd, struct bch_geometry *geo)
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	struct nand_chip *nand = mtd_to_nand(mtd);
 	struct mxs_nand_info *nand_info = nand_get_controller_data(nand);
+	int err;
 
 	if (chip->ecc_strength_ds > nand_info->max_ecc_strength_supported) {
 		printf("unsupported NAND chip, minimum ecc required %d\n"
@@ -1118,19 +1131,57 @@ static int mxs_nand_set_geometry(struct mtd_info *mtd, struct bch_geometry *geo)
 		return -EINVAL;
 	}
 
-	if ((!(chip->ecc_strength_ds > 0 && chip->ecc_step_ds > 0) &&
-	     mtd->oobsize < 1024) || nand_info->legacy_bch_geometry) {
-		dev_warn(mtd->dev, "use legacy bch geometry\n");
-		return mxs_nand_legacy_calc_ecc_layout(geo, mtd);
+	/* use the legacy bch setting by default */
+	if ((!nand_info->use_minimum_ecc && mtd->oobsize < 1024) ||
+	    !(chip->ecc_strength_ds > 0 && chip->ecc_step_ds > 0)) {
+		dev_dbg(mtd->dev, "use legacy bch geometry\n");
+		err = mxs_nand_legacy_calc_ecc_layout(geo, mtd);
+		if (!err)
+			return 0;
 	}
 
-	if (mtd->oobsize > 1024 || chip->ecc_step_ds < mtd->oobsize)
-		return mxs_nand_calc_ecc_for_large_oob(geo, mtd);
+	/* for large oob nand */
+	if (mtd->oobsize > 1024) {
+		dev_dbg(mtd->dev, "use large oob bch geometry\n");
+		err = mxs_nand_calc_ecc_for_large_oob(geo, mtd);
+		if (!err)
+			return 0;
+	}
 
-	return mxs_nand_calc_ecc_layout_by_info(geo, mtd,
-				chip->ecc_strength_ds, chip->ecc_step_ds);
+	/* otherwise use the minimum ecc nand chips required */
+	dev_dbg(mtd->dev, "use minimum ecc bch geometry\n");
+	err = mxs_nand_calc_ecc_layout_by_info(geo, mtd, chip->ecc_strength_ds,
+					       chip->ecc_step_ds);
 
-	return 0;
+	if (err)
+		dev_err(mtd->dev, "none of the bch geometry setting works\n");
+
+	return err;
+}
+
+void mxs_nand_dump_geo(struct mtd_info *mtd)
+{
+	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct mxs_nand_info *nand_info = nand_get_controller_data(nand);
+	struct bch_geometry *geo = &nand_info->bch_geometry;
+
+	dev_dbg(mtd->dev, "BCH Geometry :\n"
+		"GF Length\t\t: %u\n"
+		"ECC Strength\t\t: %u\n"
+		"ECC for Meta\t\t: %u\n"
+		"ECC Chunk0 Size\t\t: %u\n"
+		"ECC Chunkn Size\t\t: %u\n"
+		"ECC Chunk Count\t\t: %u\n"
+		"Block Mark Byte Offset\t: %u\n"
+		"Block Mark Bit Offset\t: %u\n",
+		geo->gf_len,
+		geo->ecc_strength,
+		geo->ecc_for_meta,
+		geo->ecc_chunk0_size,
+		geo->ecc_chunkn_size,
+		geo->ecc_chunk_count,
+		geo->block_mark_byte_offset,
+		geo->block_mark_bit_offset);
 }
 
 /*
@@ -1159,6 +1210,8 @@ int mxs_nand_setup_ecc(struct mtd_info *mtd)
 	if (ret)
 		return ret;
 
+	mxs_nand_dump_geo(mtd);
+
 	/* Configure BCH and set NFC geometry */
 	mxs_reset_block(&bch_regs->hw_bch_ctrl_reg);
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
