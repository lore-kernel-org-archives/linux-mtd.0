Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4255BC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Apr 2022 02:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HN5OipsK/LWH1k6jYCJLAJHouf4VyLPiq+/BB/yXgFY=; b=XPA3sllGezPXnJ
	/1X3QBsUOL6T4tOjWmXXiHuyMvrgSyM8snN6eZdQqDy7TmFytn98kwqiL8dlfagCMPZMnstnXJSeI
	e8tJ7DawUux+He09iMIivcgwMuHDwQe54SQP5R4hhKn2IZgYWav1oZ+CSlmwcLSi72CluzLiFVAZa
	q+vA5GsfVocOLDwsJHcEtWF7RiKZFkWNB4ttI2+rJAOLQEK0rUygrPnrY/Xwy1JoN3scOxvUUhbRs
	ehgie0sB+TTy1EnU8GUFEu7CUjdYNCe3+4nRhawC92o0UU+FaoPTXdYEHD7vG72f+WCa4OCcT8Cnm
	YsikyGQ5YlU7aHPUPmAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ne6es-00BLX5-Gf; Tue, 12 Apr 2022 02:53:34 +0000
Received: from mail-he1eur02on061c.outbound.protection.outlook.com
 ([2a01:111:f400:fe05::61c]
 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ne6ed-00BLST-51
 for linux-mtd@lists.infradead.org; Tue, 12 Apr 2022 02:53:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GhgLAaSM9V+wk+3vlM6FS76tE8glIMZ6gEWQsl3H0zrzUM0orX8nsAwfr7bvE3Ap0sLZAZx6c1BtaeROQGoQPQrhoUsrU20Tq0KOljVC0pFl3OtuoZSQCU8Pr4ZZn9pYLd7ItBKyGgNVtMR9YwxIo+kQEdCle6gbNS1bgjGJvbmxO+0/Vsl/BeDauiFDSlpiq1EZU+XK+VeeAzXDOmEy+ZeZvQDWIOkAJ4IlJotU2K4xXuhqEN1y9UftACPIcmTmF4kPYQZot5PhuD8PTE/Etxv0nA5w/iEch5wi122bFZBYWeFUQNQ3Q4M5lKFjo4Mp6SHZ4Zqgf6AtNsRXD2FJZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kfgyTVBUT02Nl4l0wOEOvPovuVJwU569+90cn98KsM=;
 b=ZtAVzQ4X6CnVjv7WmIZ4CfE/xR9L5zLkcz9K3k1kCarGFAH3szGtCk11r/Omp1scHSU1iAVbADQOv7cctB4147zzhg4FmzkZVMVfN1TojNMshI4s6d0kiLgNAPZ0nsEB6bvRKHy72A9ltAoS835zNB1Dcu6/xnA3jNoKzjE6l6lS3SwrUbsV+GRIKG4vupvMitoEr9T7K14YjSQVXtHGhbfKUCTXBhPiKs+JxVguh6ssIG9eC7PFNesFc47IYKJlVA0HwHgiex5+cUQiJUobm9claMZ1e+Ji3+rvEpIAIVy1BVah6vgs9dTlXDQmKglG/RfLPOd4evQ30/iKBB4MUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kfgyTVBUT02Nl4l0wOEOvPovuVJwU569+90cn98KsM=;
 b=lepJLnoEkQ/MoYikdyafYfoIjYcZqCRbcrcy/xW+9hndB3zcnpK/6IvL7I21Jn5ChPSGAY6zQIv/ycqP7njKCkGMSWFZdSNsALReM26ekaV3OPegQLa0VBAxINo59X6ftp31LcHdV5f/zfsG5NHyhGvdaJSxoXF2RHbvnWVZmng=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by DBBPR04MB7867.eurprd04.prod.outlook.com (2603:10a6:10:1e5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.30; Tue, 12 Apr
 2022 02:53:14 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::644f:b22f:2f4:d69d]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::644f:b22f:2f4:d69d%3]) with mapi id 15.20.5144.030; Tue, 12 Apr 2022
 02:53:14 +0000
From: Han Xu <han.xu@nxp.com>
To: sean@geanix.com,
	frieder.schrempf@kontron.de,
	festevam@gmail.com
Cc: ye.li@nxp.com, peng.fan@nxp.com, han.xu@nxp.com, miquel.raynal@bootlin.com,
 linux-mtd@lists.infradead.org
Subject: [PATCH v4 4/5] mtd: rawnand: gpmi: Rename the variable ecc_chunk_size
Date: Mon, 11 Apr 2022 21:52:45 -0500
Message-Id: <20220412025246.24269-5-han.xu@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220412025246.24269-1-han.xu@nxp.com>
References: <20220412025246.24269-1-han.xu@nxp.com>
X-ClientProxiedBy: BYAPR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::29) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5b82579-0843-4e78-426b-08da1c2f9667
X-MS-TrafficTypeDiagnostic: DBBPR04MB7867:EE_
X-Microsoft-Antispam-PRVS: <DBBPR04MB7867F7E663374D855A6C3F8097ED9@DBBPR04MB7867.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xErrbYgfqqOwwuitx8ARzv7BFdfU4wwQjEA5OJiMigEsdYb8mnu9JFytAoJjhuTUBMoUkxDWD2TjRSg57vSErFTILoRmCF5QQD822TToGxLndyCW4a1cK9eO3N2/UitMbRs/Q841cwekoZvEQF8iMxp/uwPK54a0ksO3yX0iW14G46Pvecfi5VVT2n5K3F80QhzUWUYPeHeEZMSPA0FMo8SM986MsvlbmqcNFYCu/beXf4paNIsuoVzvwFfJTokZRI1pzTMbgZ6LKIppOu606ir9xE79k4znC4H9+1JpvrBSLtLHau+FdeEogLFGQu0oes4/0HgJGwhyP9U0KhTWkNTGGRJ9HamZXg3ZtZNcZocPN0PgygsDQrt37VMFwAxQE6qQ2k16520CEARMB0vuzHTHjeLkzsYYTrfGbyl3IwTYlD/nEkBZdIpTkbS/SixirXPUzD1VmCPBsiqC4cR5SRqrSjKZkC1xaqzFksqxh8A9YFwqXyuzeKAJ5FexszChTTiaiaJ+deBLSTOUF1+BSPvcXyBf5gtGu2cqTDcs2BqxZX/vnqm0D3mMdSe+hlTaBQeFkVc/cF2ixQkeFOyq8YBce4znQZZfbmJ/QU68zzsSpB0xNTdKR61B2hhiSEXf0w/HDUy4O0IfdAeLEdsp189GdGqEGO8LXmdY5Eq3u/nk9sjGwZEnRBxx/7a3ocS/NtR5tn8b7+3lbXRF9SxA1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8774.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(6486002)(508600001)(2906002)(6512007)(1076003)(2616005)(26005)(186003)(6666004)(83380400001)(8676002)(4326008)(6506007)(38350700002)(38100700002)(52116002)(36756003)(66556008)(66946007)(66476007)(8936002)(5660300002)(316002)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zvRC+3XJSiNMnS/0W2M+6r/W4ceui4hk6CVq6AzafpPp9AAiDCr73CaDBwc9?=
 =?us-ascii?Q?77qmbcYlkS4B/lfdhpKXHrcfDHGxTV3Y8adSf0xwqYlPxx4fRvbm7grpMzGs?=
 =?us-ascii?Q?Gexq10pRcHAOvoVnx+elwPNyo7xCi1uZEKyVGLMUN7PLV/3RYdt6Lgfxnpzd?=
 =?us-ascii?Q?L2rGuGc9yaen2NClzheziEswPcQkoPALlg8LXESBPfjfy1TE+sNBXgrGmcYs?=
 =?us-ascii?Q?Lv/wXEMCq2pRWLSdMD1bVwWad7zypjMwUfSAmDenRJJHxTkvLKl61NPghBd8?=
 =?us-ascii?Q?DNn53A2ARgOOGZEq37Km4Eozhma1MtC5jopLozPsEMacqfaTxa/qieCeo0WH?=
 =?us-ascii?Q?F43B5m2NiZBWQ+eQR2gFVrvm08rzLU1iKVGeBxtAUndY5TbofBdp/wDKJvKz?=
 =?us-ascii?Q?RcN20fqOLxFxtb1WPwdBhGp8SxhIuTkiHYuoRgjzyUx3iA0U1BUAZgWB5USO?=
 =?us-ascii?Q?B/HhgRg79uKdUMN5VoZvwt5B+IRvsRpQSz+E9dH/9cAYbkWGToijOiaESsY4?=
 =?us-ascii?Q?AuTu29ru8L8a0DJSAOq+XasCl6+GFD9SRD0HST89mhJNzQ981BFGHr9pvLo6?=
 =?us-ascii?Q?A4ANTvO7R5XoLsoyy3OJjF8c7tsaqWWYbCb2qTEuKMNXRR3EsJxLOgbiytQ2?=
 =?us-ascii?Q?AhZyvyVgkT0NGc+U4p+8BZueZPemhzMABPxEr102KllPNYq1cG5RgyauBItE?=
 =?us-ascii?Q?fWRBGbpWOcjwczHT4yj2KjOAhTs5Rrt1dVJFc3cbWv0lPNhXpnDKycrroTF0?=
 =?us-ascii?Q?daK7PlX1TNZvHEvY6x5xw6RVM+Awv8zE3TdRnaQrxkdUczQaW9wetPHD0SBW?=
 =?us-ascii?Q?WrZk9KzNPLT3Wx6e3iRtanjVzQpxKbzAZQQuMuRPHUTDrO5bCRdMm6U7nTRI?=
 =?us-ascii?Q?VbReck33T6VxwYVt/XQ3lRV4k6f2aFVsNpLEGkfstqiDq/YwKkYadlEAxIN/?=
 =?us-ascii?Q?vwBSy3eI2SQKkAE69ZlnuC5Iv85tFdpt/74sPAnEsCSXYYgfvymDESBD2vos?=
 =?us-ascii?Q?OKN8zTg2beVUS4IWcCXSQIxx16FOs52jazSvGBt4w7jnPLgAuBw7EBInJPvF?=
 =?us-ascii?Q?xREdq7OgaN8J+BhCrC8iI3NKZ0g9wbtdujlJ+zpOWTISA0HL6xb+AvlR39aZ?=
 =?us-ascii?Q?1YgK4SVLBXbATFJYiaMnFaXn9LM0NqgiN/w/lrS9ZGKjypsUcqCHExfwJ4P1?=
 =?us-ascii?Q?o62J2j2Oqp5M+ZqUiCC18nHa1fSDZRiLnFjGkaQ7SssG9EJPrT3Tixo/kgWh?=
 =?us-ascii?Q?CzZ2387xje6ktHSZ6bbYRB5MeIGH3fXjUzNrYq829fqu3Ng/u8nN2yJSrXgf?=
 =?us-ascii?Q?Q1DyIpJ91ACOBLaojHfckg9tvogO6ifanHxE10v/eX6oyCvom5Y5Vjmq5vxU?=
 =?us-ascii?Q?C3CR190Y/gP+7BZdvwG06mvLhB1SRHf/t/V8OXCxwDYEGGt+RjcTYixJjtm7?=
 =?us-ascii?Q?4eUTg81YMQc2b4WlCspfyzb4iKwlzgSTKFnGTuPHp0Cm22kugnZrvRlrqmhn?=
 =?us-ascii?Q?HbiBmLMm8ZsTFom7bSYJo2cmtDkmPCCpluuq40PnBKIcFAl2S6D8h732PmRf?=
 =?us-ascii?Q?zRtwGmlonrNXYel107aAj/vKnRsXGKnbI2+NViL9z3gnS5RQHZYKD03sBldM?=
 =?us-ascii?Q?e4NKBg4ZdMp0XoT8ZIF7gwy2kzwZohZ+8LFPWR28ze/0wmriD7Hroby/MbRA?=
 =?us-ascii?Q?wxbNphB60dwwqGrAFe5IeF/VJJU0UD0kv3vhwMky8wDnM0fyg8iT1vb/MF7o?=
 =?us-ascii?Q?JNntNcUq/w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b82579-0843-4e78-426b-08da1c2f9667
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 02:53:14.1548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0kpzrXyKs4qGr7mmjxB5QwwsMSLZMMlFbUK64Kp16EW3IWPf8WmW2/JIsyyN3eDM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_195319_670727_8F20EEF9 
X-CRM114-Status: GOOD (  20.92  )
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

There is only one variable ecc_chunk_size in bch_geometry data
structure but two different field in BCH registers. The data0_size in
BCH_FLASH0LAYOUT0 and datan_size in BCH_FLASH0LAYOUT1 should have
dedicate variable since they might set to different values in some
cases. For instance, if need dedicate ecc for meta area, the data0_size
should be 0 rather than datan_size, but for all other cases, data0_size
still equals to datan_size and it won't bring any function change.

Signed-off-by: Han Xu <han.xu@nxp.com>

---
Changes since v3:
 - change the commit log that new variables only affect ecc for meta
   case

Changes since v2:
 - split the variable rename to a single patch
---
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 52 ++++++++++++----------
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h |  9 ++--
 2 files changed, 34 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 0f82edc97e9d..1ac0dc8cae22 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -218,7 +218,8 @@ static void gpmi_dump_info(struct gpmi_nand_data *this)
 		"ECC Strength           : %u\n"
 		"Page Size in Bytes     : %u\n"
 		"Metadata Size in Bytes : %u\n"
-		"ECC Chunk Size in Bytes: %u\n"
+		"ECC0 Chunk Size in Bytes: %u\n"
+		"ECCn Chunk Size in Bytes: %u\n"
 		"ECC Chunk Count        : %u\n"
 		"Payload Size in Bytes  : %u\n"
 		"Auxiliary Size in Bytes: %u\n"
@@ -229,7 +230,8 @@ static void gpmi_dump_info(struct gpmi_nand_data *this)
 		geo->ecc_strength,
 		geo->page_size,
 		geo->metadata_size,
-		geo->ecc_chunk_size,
+		geo->ecc0_chunk_size,
+		geo->eccn_chunk_size,
 		geo->ecc_chunk_count,
 		geo->payload_size,
 		geo->auxiliary_size,
@@ -293,13 +295,14 @@ static int set_geometry_by_ecc_info(struct gpmi_nand_data *this,
 			nanddev_get_ecc_requirements(&chip->base)->step_size);
 		return -EINVAL;
 	}
-	geo->ecc_chunk_size = ecc_step;
+	geo->ecc0_chunk_size = ecc_step;
+	geo->eccn_chunk_size = ecc_step;
 	geo->ecc_strength = round_up(ecc_strength, 2);
 	if (!gpmi_check_ecc(this))
 		return -EINVAL;
 
 	/* Keep the C >= O */
-	if (geo->ecc_chunk_size < mtd->oobsize) {
+	if (geo->eccn_chunk_size < mtd->oobsize) {
 		dev_err(this->dev,
 			"unsupported nand chip. ecc size: %d, oob size : %d\n",
 			ecc_step, mtd->oobsize);
@@ -309,7 +312,7 @@ static int set_geometry_by_ecc_info(struct gpmi_nand_data *this,
 	/* The default value, see comment in the legacy_set_geometry(). */
 	geo->metadata_size = 10;
 
-	geo->ecc_chunk_count = mtd->writesize / geo->ecc_chunk_size;
+	geo->ecc_chunk_count = mtd->writesize / geo->eccn_chunk_size;
 
 	/*
 	 * Now, the NAND chip with 2K page(data chunk is 512byte) shows below:
@@ -431,13 +434,15 @@ static int legacy_set_geometry(struct gpmi_nand_data *this)
 	geo->gf_len = 13;
 
 	/* The default for chunk size. */
-	geo->ecc_chunk_size = 512;
-	while (geo->ecc_chunk_size < mtd->oobsize) {
-		geo->ecc_chunk_size *= 2; /* keep C >= O */
+	geo->ecc0_chunk_size = 512;
+	geo->eccn_chunk_size = 512;
+	while (geo->eccn_chunk_size < mtd->oobsize) {
+		geo->ecc0_chunk_size *= 2; /* keep C >= O */
+		geo->eccn_chunk_size *= 2; /* keep C >= O */
 		geo->gf_len = 14;
 	}
 
-	geo->ecc_chunk_count = mtd->writesize / geo->ecc_chunk_size;
+	geo->ecc_chunk_count = mtd->writesize / geo->eccn_chunk_size;
 
 	/* We use the same ECC strength for all chunks. */
 	geo->ecc_strength = get_ecc_strength(this);
@@ -864,7 +869,7 @@ static int gpmi_raw_len_to_len(struct gpmi_nand_data *this, int raw_len)
 	 * we are passed in exec_op. Calculate the data length from it.
 	 */
 	if (this->bch)
-		return ALIGN_DOWN(raw_len, this->bch_geometry.ecc_chunk_size);
+		return ALIGN_DOWN(raw_len, this->bch_geometry.eccn_chunk_size);
 	else
 		return raw_len;
 }
@@ -1256,7 +1261,7 @@ static int gpmi_count_bitflips(struct nand_chip *chip, void *buf, int first,
 
 			/* Read ECC bytes into our internal raw_buffer */
 			offset = nfc_geo->metadata_size * 8;
-			offset += ((8 * nfc_geo->ecc_chunk_size) + eccbits) * (i + 1);
+			offset += ((8 * nfc_geo->eccn_chunk_size) + eccbits) * (i + 1);
 			offset -= eccbits;
 			bitoffset = offset % 8;
 			eccbytes = DIV_ROUND_UP(offset + eccbits, 8);
@@ -1293,16 +1298,16 @@ static int gpmi_count_bitflips(struct nand_chip *chip, void *buf, int first,
 			if (i == 0) {
 				/* The first block includes metadata */
 				flips = nand_check_erased_ecc_chunk(
-						buf + i * nfc_geo->ecc_chunk_size,
-						nfc_geo->ecc_chunk_size,
+						buf + i * nfc_geo->eccn_chunk_size,
+						nfc_geo->eccn_chunk_size,
 						eccbuf, eccbytes,
 						this->auxiliary_virt,
 						nfc_geo->metadata_size,
 						nfc_geo->ecc_strength);
 			} else {
 				flips = nand_check_erased_ecc_chunk(
-						buf + i * nfc_geo->ecc_chunk_size,
-						nfc_geo->ecc_chunk_size,
+						buf + i * nfc_geo->eccn_chunk_size,
+						nfc_geo->eccn_chunk_size,
 						eccbuf, eccbytes,
 						NULL, 0,
 						nfc_geo->ecc_strength);
@@ -1331,20 +1336,21 @@ static void gpmi_bch_layout_std(struct gpmi_nand_data *this)
 	struct bch_geometry *geo = &this->bch_geometry;
 	unsigned int ecc_strength = geo->ecc_strength >> 1;
 	unsigned int gf_len = geo->gf_len;
-	unsigned int block_size = geo->ecc_chunk_size;
+	unsigned int block0_size = geo->ecc0_chunk_size;
+	unsigned int blockn_size = geo->eccn_chunk_size;
 
 	this->bch_flashlayout0 =
 		BF_BCH_FLASH0LAYOUT0_NBLOCKS(geo->ecc_chunk_count - 1) |
 		BF_BCH_FLASH0LAYOUT0_META_SIZE(geo->metadata_size) |
 		BF_BCH_FLASH0LAYOUT0_ECC0(ecc_strength, this) |
 		BF_BCH_FLASH0LAYOUT0_GF(gf_len, this) |
-		BF_BCH_FLASH0LAYOUT0_DATA0_SIZE(block_size, this);
+		BF_BCH_FLASH0LAYOUT0_DATA0_SIZE(block0_size, this);
 
 	this->bch_flashlayout1 =
 		BF_BCH_FLASH0LAYOUT1_PAGE_SIZE(geo->page_size) |
 		BF_BCH_FLASH0LAYOUT1_ECCN(ecc_strength, this) |
 		BF_BCH_FLASH0LAYOUT1_GF(gf_len, this) |
-		BF_BCH_FLASH0LAYOUT1_DATAN_SIZE(block_size, this);
+		BF_BCH_FLASH0LAYOUT1_DATAN_SIZE(blockn_size, this);
 }
 
 static int gpmi_ecc_read_page(struct nand_chip *chip, uint8_t *buf,
@@ -1444,12 +1450,12 @@ static int gpmi_ecc_read_subpage(struct nand_chip *chip, uint32_t offs,
 		BF_BCH_FLASH0LAYOUT0_META_SIZE(meta) |
 		BF_BCH_FLASH0LAYOUT0_ECC0(ecc_strength, this) |
 		BF_BCH_FLASH0LAYOUT0_GF(geo->gf_len, this) |
-		BF_BCH_FLASH0LAYOUT0_DATA0_SIZE(geo->ecc_chunk_size, this);
+		BF_BCH_FLASH0LAYOUT0_DATA0_SIZE(geo->eccn_chunk_size, this);
 
 	this->bch_flashlayout1 = BF_BCH_FLASH0LAYOUT1_PAGE_SIZE(page_size) |
 		BF_BCH_FLASH0LAYOUT1_ECCN(ecc_strength, this) |
 		BF_BCH_FLASH0LAYOUT1_GF(geo->gf_len, this) |
-		BF_BCH_FLASH0LAYOUT1_DATAN_SIZE(geo->ecc_chunk_size, this);
+		BF_BCH_FLASH0LAYOUT1_DATAN_SIZE(geo->eccn_chunk_size, this);
 
 	this->bch = true;
 
@@ -1618,7 +1624,7 @@ static int gpmi_ecc_read_page_raw(struct nand_chip *chip, uint8_t *buf,
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 	struct bch_geometry *nfc_geo = &this->bch_geometry;
-	int eccsize = nfc_geo->ecc_chunk_size;
+	int eccsize = nfc_geo->eccn_chunk_size;
 	int eccbits = nfc_geo->ecc_strength * nfc_geo->gf_len;
 	u8 *tmp_buf = this->raw_buffer;
 	size_t src_bit_off;
@@ -1703,7 +1709,7 @@ static int gpmi_ecc_write_page_raw(struct nand_chip *chip, const uint8_t *buf,
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 	struct bch_geometry *nfc_geo = &this->bch_geometry;
-	int eccsize = nfc_geo->ecc_chunk_size;
+	int eccsize = nfc_geo->eccn_chunk_size;
 	int eccbits = nfc_geo->ecc_strength * nfc_geo->gf_len;
 	u8 *tmp_buf = this->raw_buffer;
 	uint8_t *oob = chip->oob_poi;
@@ -2077,7 +2083,7 @@ static int gpmi_init_last(struct gpmi_nand_data *this)
 	ecc->read_oob_raw = gpmi_ecc_read_oob_raw;
 	ecc->write_oob_raw = gpmi_ecc_write_oob_raw;
 	ecc->engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
-	ecc->size	= bch_geo->ecc_chunk_size;
+	ecc->size	= bch_geo->eccn_chunk_size;
 	ecc->strength	= bch_geo->ecc_strength;
 	mtd_set_ooblayout(mtd, &gpmi_ooblayout_ops);
 
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
index 5e1c3ddae5f8..5b217feb0ec1 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
@@ -30,9 +30,9 @@ struct resources {
  * @page_size:                The size, in bytes, of a physical page, including
  *                            both data and OOB.
  * @metadata_size:            The size, in bytes, of the metadata.
- * @ecc_chunk_size:           The size, in bytes, of a single ECC chunk. Note
- *                            the first chunk in the page includes both data and
- *                            metadata, so it's a bit larger than this value.
+ * @ecc0_chunk_size:          The size, in bytes, of a first ECC chunk.
+ * @eccn_chunk_size:          The size, in bytes, of a single ECC chunk after
+ *                            the first chunk in the page.
  * @ecc_chunk_count:          The number of ECC chunks in the page,
  * @payload_size:             The size, in bytes, of the payload buffer.
  * @auxiliary_size:           The size, in bytes, of the auxiliary buffer.
@@ -48,7 +48,8 @@ struct bch_geometry {
 	unsigned int  ecc_strength;
 	unsigned int  page_size;
 	unsigned int  metadata_size;
-	unsigned int  ecc_chunk_size;
+	unsigned int  ecc0_chunk_size;
+	unsigned int  eccn_chunk_size;
 	unsigned int  ecc_chunk_count;
 	unsigned int  payload_size;
 	unsigned int  auxiliary_size;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
