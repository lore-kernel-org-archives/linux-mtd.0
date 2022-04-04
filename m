Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6A8C433FE
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Apr 2022 20:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UBZmtOCW62Pvaw0K4mHtLa1gFte76PWj5+/zxPslLYM=; b=YR1he1RdIvZts8
	Bn1zBiOW6MMnN2RqeftTOE1Obhj3CtukrvdtkdtVHuYNrxt7ic1G+dKKM4z+xTSC43VqgAvkcBvKc
	4/pe2yYcxFtXoyEv2xQ4atU05rTWOjYIp/XMXrhEVLSgxjjfmtLSPCSSh8IhjW4uPm2bR5im15qO1
	GoZ1eOvyDng7hKj9fNERpbuafQAUHz1fAyzOXMfUPdsp/ZV8bELPlT7AEm5+P2XE+HZKEJPEyW8tu
	6YQ69+ksW/J2rEzpOgZxSI0DtgN4ogJv3M+Adahc2vSu1mzINWJhp+jMeU/HkUDHwXQXhRZRjacqz
	n2IHMpdR5vBPTlaNsbrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbT12-00GK5k-H7; Mon, 04 Apr 2022 20:09:32 +0000
Received: from mail-ve1eur02on061a.outbound.protection.outlook.com
 ([2a01:111:f400:fe06::61a]
 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbT0y-00GK4b-GI
 for linux-mtd@lists.infradead.org; Mon, 04 Apr 2022 20:09:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kSLh9zPdVzeZn48Z3ePTPzNFgj45IkJakuwMSD5e8tJRioZkkA2UW3XF5NbctnowjPFM3czv0OUkRPo14mFnTYUyolhZdO3AFy7AgmMPFZqoBIjNZ2bhvOs3vfPH5l628Rg6hEL9XtCuvUIWv9g9rNwKPl2Qh8GGmUWirGIQTQtBkYquhMYVz3iXvpSmRAbdO6mtAV43SAtVqxuOJZ4IBU1zts88mOEDm2vSGp7t9sLxOCkvr/KRfkQv4WRpUnTEGAfIdvLw57wT8hSSxRP73IQbNhu8JMjc8RU2pU4FVCtETCai7RjnBFw9k+OkOR9js/qht9GsEl6w2X5UrYk+Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pq+u5dVUi9zcj92NjMWqJy3qrCQOC+zIj+FFBvSVM0U=;
 b=hBp70n9FltsNHdKrNGlPBNO/We914HklMXWCt9yFuX4Rf2UOFFwFPJQeyJY/UjnoIPd6LehK38/uaGQH2IzPDF94ecY7fSp9rHl+bDb8zFFBt+ZjUcePZbDN2VxE8VWAgqMjXBJT1mQ8GsvjhghFqekJjAmhaM1LRSs759goS7PKzH4L8rMf66eUT4dfs0AQOnq6VtP6D1Y7Uiq7z5nCGHLyesWaKbNHC5YQh/WaQPZfjXOp8zpchDP+azD67dnaYtJpn+MnJtnfrAZ8cO1RQqqkeKp7whtQd+CdbFunZdKfaDlUJXFJKeyMoOVdVgkGLieAHvjrWPPkWhnPfHuiVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pq+u5dVUi9zcj92NjMWqJy3qrCQOC+zIj+FFBvSVM0U=;
 b=io2DtV+ffHIp9N85/bAbIIfi7wyS3Li6MHQmKddpXIeYsc6mMgerKlpHj3XLrukmlGDmhHNF88muVGx6Xz7xqjjZWqXvw4/GLQjTUO9Ega7pCK+1Re7sdmjHK14Um5g9H6MmO1XGO2WNF6kUKRtVT61XyZDlXo5+ZkW2ggd8u44=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by AM6PR04MB6552.eurprd04.prod.outlook.com (2603:10a6:20b:f3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 19:54:46 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::b048:39cb:7748:ed56]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::b048:39cb:7748:ed56%7]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 19:54:46 +0000
From: Han Xu <han.xu@nxp.com>
To: sean@geanix.com,
	frieder.schrempf@kontron.de,
	festevam@gmail.com
Cc: ye.li@nxp.com, peng.fan@nxp.com, han.xu@nxp.com, miquel.raynal@bootlin.com,
 linux-mtd@lists.infradead.org
Subject: [PATCH v3 3/4] mtd: rawnand: gpmi: Rename the variable ecc_chunk_size
Date: Mon,  4 Apr 2022 14:54:26 -0500
Message-Id: <20220404195427.8871-3-han.xu@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220404195427.8871-1-han.xu@nxp.com>
References: <20220404195427.8871-1-han.xu@nxp.com>
X-ClientProxiedBy: SN4PR0501CA0010.namprd05.prod.outlook.com
 (2603:10b6:803:40::23) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c568839e-d4ec-497e-9831-08da1674f7ee
X-MS-TrafficTypeDiagnostic: AM6PR04MB6552:EE_
X-Microsoft-Antispam-PRVS: <AM6PR04MB65527D26C17EEFBD42EB59FB97E59@AM6PR04MB6552.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n30CGJ/CHowWmlg297bMB9HL5r48pCvBzNsdH0wzOA8kaiiEnAZ11k24AMIv9ajuaK/RmQoBu4eUzy3YSJbqkunq+hG0+CHFqfEF0gyuPnmljkdlL7L6t26x7FyHMMDy8GsuVBlCwWTc0JYbdAwjcG9qJL/hr8eK6lFCsuPjhFoJlChc1HzRbxfFv6Yc9bAbxnueFtyx7DGBKdffCSa+k7lkw8kBPdqj7jVKaV/9oBIul0wgllqJhoAD2U2mXUJpwse4VBqU3uD6IJxWoXR0mscCU//Cm1VT0ZbNNQx1OABg8rWYHKgRuzHmtwbUqZaJknOpXUL3kYJKpTExab0n5V6SFyC7T1mrZU95CAMV2MKzomNG4ozHYzNM4bfNnbkWJ69YamFbVOEZa9VqjUBBOELfWihw+WIbm/Au4YDd0HfOa6hcC2LI0hsSUwW9EKV/agakJ2gSTIHoY+EtqCf6eHK3KseeU12NQ+SjexxwbXaur16X336N7A6dEmPSFyax3ig+MmaVsZcdzwHedtzsai6W07TRtsqih4Ce16wSLlyunrFquDouAAu9mwfNmNCKD2Nn0T5rIOrHAAIzydJIIS14KhN/13p+QJ++/MTNMvq8TivCO9hqIcv9XdxFwo/NoLpBrp7mmhDB/fNPAqBX9im7AOP5mWiiJFuISN3wjnaz15D8qdVQ2xmcqquUyL4iRmbaa1SSmXbJiNNFb06etg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8774.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(8676002)(66946007)(66556008)(316002)(66476007)(83380400001)(36756003)(1076003)(26005)(186003)(2616005)(38350700002)(52116002)(6512007)(2906002)(86362001)(6666004)(38100700002)(6506007)(5660300002)(6486002)(44832011)(508600001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HswJr2JkWXxqsbfRyTBCECPHUVGClBnfeuIdvn77zUkeZRl3HXDpJ6Edp4be?=
 =?us-ascii?Q?CH79G1B1olXEFGd2W4+raVt3lhrXUcgix2Z9HqS0txcvhO16u5rdFxU5VymI?=
 =?us-ascii?Q?RtKSWqnJnPP4Z9NllZhilO9fm/VYxhMijOHVxNKMBHVKGRb6NPqZDWKFJLll?=
 =?us-ascii?Q?whoEyqP5TtIjASxorcYQxrhzi1Zkj6oeh5HnBxRDVeChd9jmA6mmoQ1uWD88?=
 =?us-ascii?Q?pbCPz0tfWQg4mkerq87QYRVdY0HNuA9w8wXxKx7bGivjJ9eiG+ipoP41HvqP?=
 =?us-ascii?Q?XqLiX9FP1JzqxmkHFTqy+45JOsqhb1EmgamnWotLINXnW+fjXn5NfOTxfdES?=
 =?us-ascii?Q?EmaO9bz7JsDtsBUhW7V17Ip/ijItV6AMt/o5xFiY4eYNDziOCsNZCYTnYHIE?=
 =?us-ascii?Q?tpoEzanqyoxweDh/pLJDNR0/CD6z3dMUEfOAgGZyL0CzOD30Pu7NggWXCEgy?=
 =?us-ascii?Q?Zd8otH21OUU6fdy1aZJOBxF3qXFvNrHz1AsCla+Nvrdrm8KydSI4kDCZ7FEE?=
 =?us-ascii?Q?ylxF+/FL06/IME6J2tYJTlcI3xgl9nlUWntUtgOvAW4DMXK+JrMLlsQ0aV/2?=
 =?us-ascii?Q?7s1ISyMiJ/2Z2SXSH+JvWzADqTUpZRpkH/5ziZX8+gzwHXORfLiuA2vOMb3U?=
 =?us-ascii?Q?d5Rgrl/VFxgzjQa/SCS1pl4cx8tGCLkPvrAurYyPCvT2SyTsPTQP/TZBTelr?=
 =?us-ascii?Q?rbiGJmk0o8rPKm8GChUsXsrXEjCPj3ACbNAdQijykIgZWN+evJX5wfRXThG5?=
 =?us-ascii?Q?Q2d3O1MHhk4A67vkxoqYOX0ClKU1sFSyQ+rcAzwk6YIqYPdkw9bubnCTo502?=
 =?us-ascii?Q?X36cTh6FaW1MOvHy6PhG0UrFQ1RBo1yhXUYUWD0zKp+zohaU+WolTnmWwYoz?=
 =?us-ascii?Q?1bvdkkUBD0XsaFGHp1mDuQNFXQGYnp+xrTZe2++Zma9+6XcNpJ0qZ0MbNGOr?=
 =?us-ascii?Q?17INnOly64aWA0iWC6xNzfpuZkIL68g0qcnHtRCWeUVOQb2IHGhqeQeQl0Hy?=
 =?us-ascii?Q?4BZbhclgHljLysz4wwF5VP26zioT8JJi1ZgEQC4Han0KR4L3qhpLnBVSMHL3?=
 =?us-ascii?Q?G0i7VD4nWdrKboFOtf09X8qX3UdADtetdR85aWo+YVKsVr/XFgIuua08G2k1?=
 =?us-ascii?Q?gxhammEAW1ibdQQWApnrDylrn0ezSwePyG3a0jFY7M0kSfnur1lzDDr1YTKy?=
 =?us-ascii?Q?QCjHkmgocHBRQi+UyOFw+CdKNn4mx1qCAtzpA02aQcL/enHzLzOdSYtuimPV?=
 =?us-ascii?Q?2z53CTE6XtPArsUN4guptHG2AcY/mtt0SBsm4oMdovXN+9d46XYoMyHI1Zng?=
 =?us-ascii?Q?9CTLs8ee1m8VLtEZB8F3mGPu2CPbs8j6A4IUDTor+wtJH4qnVFF+xDHSbgG4?=
 =?us-ascii?Q?h9fo2zeoX4cDA6/sgN/WXtHG+uFEZQmIgOoxMxOTyut4UsnnKyOU3SE/7DBV?=
 =?us-ascii?Q?zE/uK1FvXVQ7lLYNmf160usxVFbJ7Knhh+EfaZ8wE9f1vQQIzI9iCyNACj+A?=
 =?us-ascii?Q?XmYAC4wvpY1LdPdkSoJGJkI9KzezU3Pal31LJPaFWar2+pCQCSqpKKG4V+xZ?=
 =?us-ascii?Q?XhoBlxmBQ+NRn8KnFed5KMLG6vv5NDNSfhTubfM1VIHkyGNNvKQPXUaiMXIJ?=
 =?us-ascii?Q?laSrMVs5eyf+m2FirAwMWW2dQsFwExkHu9UUO44+/WvjWsL/PzmSi7ljNGmU?=
 =?us-ascii?Q?E7Ga4n4OGtXpnPXKxJQLjZyYtLL0dY4maXAKR5a2cIC8761bYoSv7SI45IvX?=
 =?us-ascii?Q?JJXn+2GxXw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c568839e-d4ec-497e-9831-08da1674f7ee
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 19:54:46.0472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8iC6BqLi9DE9gRuOlJiBUitiYzZfYfcssehUhm1KWIoMA/23G9WmMXhD8S09bzm3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6552
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_130928_764366_51224842 
X-CRM114-Status: GOOD (  19.79  )
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
cases.

Signed-off-by: Han Xu <han.xu@nxp.com>

---
Changes since v2:
 - split the variable rename to a single patch
---
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 54 ++++++++++++----------
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h |  9 ++--
 2 files changed, 35 insertions(+), 28 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 9a37f8cc663e..cdbf0e05087f 100644
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
@@ -260,7 +262,7 @@ static bool gpmi_check_ecc(struct gpmi_nand_data *this)
 	/* check ecc strength, same as nand_ecc_is_strong_enough() did */
 	if (requirements->step_size) {
 		corr = mtd->writesize * geo->ecc_strength /
-		       geo->ecc_chunk_size;
+		       geo->eccn_chunk_size;
 		ds_corr = mtd->writesize * requirements->strength /
 			  requirements->step_size;
 		if (corr < ds_corr ||
@@ -300,13 +302,14 @@ static int set_geometry_by_ecc_info(struct gpmi_nand_data *this,
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
@@ -316,7 +319,7 @@ static int set_geometry_by_ecc_info(struct gpmi_nand_data *this,
 	/* The default value, see comment in the legacy_set_geometry(). */
 	geo->metadata_size = 10;
 
-	geo->ecc_chunk_count = mtd->writesize / geo->ecc_chunk_size;
+	geo->ecc_chunk_count = mtd->writesize / geo->eccn_chunk_size;
 
 	/*
 	 * Now, the NAND chip with 2K page(data chunk is 512byte) shows below:
@@ -438,13 +441,15 @@ static int legacy_set_geometry(struct gpmi_nand_data *this)
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
@@ -871,7 +876,7 @@ static int gpmi_raw_len_to_len(struct gpmi_nand_data *this, int raw_len)
 	 * we are passed in exec_op. Calculate the data length from it.
 	 */
 	if (this->bch)
-		return ALIGN_DOWN(raw_len, this->bch_geometry.ecc_chunk_size);
+		return ALIGN_DOWN(raw_len, this->bch_geometry.eccn_chunk_size);
 	else
 		return raw_len;
 }
@@ -1263,7 +1268,7 @@ static int gpmi_count_bitflips(struct nand_chip *chip, void *buf, int first,
 
 			/* Read ECC bytes into our internal raw_buffer */
 			offset = nfc_geo->metadata_size * 8;
-			offset += ((8 * nfc_geo->ecc_chunk_size) + eccbits) * (i + 1);
+			offset += ((8 * nfc_geo->eccn_chunk_size) + eccbits) * (i + 1);
 			offset -= eccbits;
 			bitoffset = offset % 8;
 			eccbytes = DIV_ROUND_UP(offset + eccbits, 8);
@@ -1300,16 +1305,16 @@ static int gpmi_count_bitflips(struct nand_chip *chip, void *buf, int first,
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
@@ -1338,20 +1343,21 @@ static void gpmi_bch_layout_std(struct gpmi_nand_data *this)
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
@@ -1451,12 +1457,12 @@ static int gpmi_ecc_read_subpage(struct nand_chip *chip, uint32_t offs,
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
 
@@ -1625,7 +1631,7 @@ static int gpmi_ecc_read_page_raw(struct nand_chip *chip, uint8_t *buf,
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 	struct bch_geometry *nfc_geo = &this->bch_geometry;
-	int eccsize = nfc_geo->ecc_chunk_size;
+	int eccsize = nfc_geo->eccn_chunk_size;
 	int eccbits = nfc_geo->ecc_strength * nfc_geo->gf_len;
 	u8 *tmp_buf = this->raw_buffer;
 	size_t src_bit_off;
@@ -1710,7 +1716,7 @@ static int gpmi_ecc_write_page_raw(struct nand_chip *chip, const uint8_t *buf,
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 	struct bch_geometry *nfc_geo = &this->bch_geometry;
-	int eccsize = nfc_geo->ecc_chunk_size;
+	int eccsize = nfc_geo->eccn_chunk_size;
 	int eccbits = nfc_geo->ecc_strength * nfc_geo->gf_len;
 	u8 *tmp_buf = this->raw_buffer;
 	uint8_t *oob = chip->oob_poi;
@@ -2084,7 +2090,7 @@ static int gpmi_init_last(struct gpmi_nand_data *this)
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
