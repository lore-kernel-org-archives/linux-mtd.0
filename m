Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A37C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Mar 2022 20:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0np/CTKMMHppVo0Ybta+hnpxDgNw2RA1QL4XTg0yjZQ=; b=XYu8/X8kgxWhIb
	6skeBlbxh8jgr/Rzd9BrM3x0avbFpdAktfgk3qa929D0hep8gT/h1HGRFN9D12QekxzSBkR6FyktN
	3s5PxcnVwtaHmhYYJkVKXDao671rzmkDc/tJf98rkJJhApriuUiluIGLK24R92OpeD9XDLqASwGTM
	UwnZyiuyv/XI5jcqNqLyc4V4Mt5BbrPBSWJefH6uD43ew9DmRqv18F1uM2yCTDmwuJgQ6kLgsYScR
	GFlEiAUoZ1feTvWYutvLJaWVXnFw5QQWSci6IX5mRJssJ2VRuVrMG6nkmZy+KAMWs+z/Pw1seZQDx
	d4vF26gxEhEzTQ61nh2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWOhY-0095Jx-9P; Mon, 21 Mar 2022 20:32:28 +0000
Received: from mail-am6eur05on20600.outbound.protection.outlook.com
 ([2a01:111:f400:7e1b::600]
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWOWH-0090gM-MK
 for linux-mtd@lists.infradead.org; Mon, 21 Mar 2022 20:20:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ek9tFRBF9h9R5YHojTKUJhkj2fdSoTuj5mgMSAksYZ+LKHk71EDPKd+v31HnQDyajC/p/psaPby6BJqsSv5peguu5KyJ1UsYpcNSQVA5XJ62M44U+8c6wZy667BjChlZ6DBSkurUg8d8zOFaiZlxv6ZSrSNEDAFy1vZyciR24ONEy7lkK/NJNNnIJaqZliojo6H1Xa2geyUGkVQoWxSgl5coLH+i9x59v9OKOBSWb2nABFxmHNZdRRDjX6ThmfN1dRf6zs2O2dbfn9St2veg/SNSX47vGemfmJq/5OCLm0jpeV5eIsAR8WzY+hrALKN6cWNgq5vEsxHl/9UJjZoq5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9D6pvrQuFUmtMKCzr7ZHl4b2Oz4HKBzPEVtSVslezs=;
 b=LFtz+zRHkhROjFJbm6Irks/qa+0aclMZvO77PhJlwz3UmQQbRgRLumvqVf1DYceS8Pu2yD2V97i1IoU+yhmOxByWkK1sIGg2uXFg0gN5CqUcdBt66w0DAlG/G+Lwq8LR9M3X8V3U2DDvHUvgwHfPlhRrLzF9qnfq5PYKCrh+UwQ2X1oPAOSuo+y7dvI/ZJnKmWFhDozjtnQo5VV8eGQHts0l0473LJUdOr3sJmimi7wdA2Oq701zbERMAU0SFX7LrwunUiMCHAGB3h+bCSKf+pXvjDYF7basU465oqMtjsUX7JHhfu5Q+TN5fZoSxp+2q0Hm+pn/NuhqeuXmsR6Q8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9D6pvrQuFUmtMKCzr7ZHl4b2Oz4HKBzPEVtSVslezs=;
 b=d6Zab0yGiuNkp5J3bTc84bmoRvJjB9UnEQ+Mfq/E+gAJmsV2hDAJmT7sG0vQ17I8l2ZdqlzJTPGNb5d1mt1EncEnCblCSJk3DTSkHMZwEI6OSZ+t5vQswcrJouXOms+B5U4bMV7T92FXdVGv873+RtR56qBhbCo6gp/Nuh4rAc8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by VI1PR04MB5197.eurprd04.prod.outlook.com (2603:10a6:803:5d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.23; Mon, 21 Mar
 2022 20:20:45 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::5416:5d1:cc34:ca9b]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::5416:5d1:cc34:ca9b%8]) with mapi id 15.20.5081.023; Mon, 21 Mar 2022
 20:20:45 +0000
From: Han Xu <han.xu@nxp.com>
To: sbabic@denx.de, sean@geanix.com, frieder.schrempf@kontron.de,
 festevam@gmail.com
Cc: ye.li@nxp.com, peng.fan@nxp.com, han.xu@nxp.com, miquel.raynal@bootlin.com,
 linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: raw: gpmi: fix bch geometry settings issue
Date: Mon, 21 Mar 2022 15:20:28 -0500
Message-Id: <20220321202028.29017-1-han.xu@nxp.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: BYAPR11CA0099.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::40) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 070e1084-5ad2-41e4-0126-08da0b78479a
X-MS-TrafficTypeDiagnostic: VI1PR04MB5197:EE_
X-Microsoft-Antispam-PRVS: <VI1PR04MB5197CD8B96DCA6DD86A8532797169@VI1PR04MB5197.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J2TR/DrYxMO4b461lZNEXY2FZ7GGjHrlKCXlM09Y3C26JoEDmeoa82198uYGV+6Cx4J57ww6PJ+J6hAQbBJnHn7sJtsAHVbQ6PPE6EI4QbJDw02Y0uVAI1GaapXp3FOewjFB8sw5oBolkWbEehWm61d8ntm9yuDZ+mVwfAkCe2937jFiuIem2s4lYOn9iWIQZOT5NnjEDD0PT5NA/t2EQLw+qM0BU21pLFxgw9vODPoB0BeV5Nbybh1MIfE8fDLitSRYsn5nL5lFfPwY0+QqcrFjgXR76hruUzqmLweob5lbgSP0fAyEHxf1s3oJoXjM7+ei0Yf6cLmSUQSip0IHe17yd1TFdxg3tn3CAVayuXGe5jOcNegwIGKkKuJx07ipkbNT9iNPplxNvOZVqlkIDli9TDmvHFg3Leu839HYCMob3hKh+5gTsGEU1Sfvok1H2bHio8PNNlLVTVb10do94EY1RqaQKSly79Q6HVGMTO8kjNKdY3+QYZZD3XbkfLZ7JDgEQwAWwslhNFVdKMSPad7SkROVvoXyAnadLcumRLJM0lTOPcMUKWZEfp7zTH70m/WKg/5mYm0SnlC/llPNvcvDMo0wjAyp8URnyCgLi6OahNdRnRaGzp8LOq5SPWNXwBYx1eszn+vRskKXil++LUJmhA7x6JClElIgAt9Vta+7tqw0VH5ua/wNPdpLiFvStyxfKSF+VluRHff12SbBaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8774.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38350700002)(38100700002)(86362001)(2906002)(508600001)(66946007)(6486002)(83380400001)(8676002)(66476007)(66556008)(4326008)(1076003)(5660300002)(316002)(2616005)(8936002)(30864003)(26005)(186003)(44832011)(52116002)(36756003)(6666004)(6506007)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1KF5NvkCrx9iypdsmstXmUT8vI0aDddt+VsNPN+T8/QG+LyR9SW/dJ2ZeDLF?=
 =?us-ascii?Q?PN4XQaMKJ7XPalGcs5tUx5WjpaKcJVwao0YaVbW9cf3l1fnK03Lhh877MDx3?=
 =?us-ascii?Q?evM0fzjS43GaP/rQ81k0H1tXfoJ2rGwVw7pVIQhIZS7b37/cPuZWuE1WQugf?=
 =?us-ascii?Q?+KhSe2KyAM/zpL9GEZYz9JESg9l/HOOtQV2aU8YhTTNzovjFGnbI+nZJw87a?=
 =?us-ascii?Q?FhutQDshKsY+z7xlUKXKg/0KAUjMVIK+e6i6/rGnKg9znCcCfOme46kTtpSe?=
 =?us-ascii?Q?H+J6b1Ga/G6tVFwFIPRHD9rgImIKxApOrYawv4ZPmvmQfqPQFqEj+fRuNkKo?=
 =?us-ascii?Q?cF7NraPAmOnN/rFkN2NH9E+tH34lqsCHlINwEvf9fB7kKRJwOQXkWMMhV2Sx?=
 =?us-ascii?Q?4lEh1joUUz92HzR4k5OHR8OJ92yaOWCtPzA4Sa4lWPbs3n9E+wEOLGiY+Wfy?=
 =?us-ascii?Q?TG9LC18xI0Qq9C4l1zJOq/Jtleogl5Ihc27CWFLg9Hmb/i2n+tllHQmIPD99?=
 =?us-ascii?Q?5IlltZJvGOul/lgTofadk4Hu9sA43FswV6jhUJ7EJW8XmsLfW1pOEMyoaXY+?=
 =?us-ascii?Q?iY35Rl3bTs2KZ1WayPymaR5dcasaA3fc/ZtCpLuhFvYPKW+iDPEH7V0VA3f2?=
 =?us-ascii?Q?zi9ClkiA4g3QOIAwsgXhD5ZUjK4SJwonVP2ZnfpgNEdpEaVthS0ap0wVN8tM?=
 =?us-ascii?Q?HJHqLPEHhs5983g+z4fz7jwKV24anRf8DQ7e8RpYWJBN4OVV3Wca3byJSYwC?=
 =?us-ascii?Q?aLojNb12Lpwa8ADDPwmwlTeQDV4FJ4bKPNEpsw6yu38tnPIl01Fte7gVCgsB?=
 =?us-ascii?Q?1i/oGzFdPwFUxapZaDG4FgteS4PybNecL3SrCfGGcvHLVSvKLc4DKRUs39m5?=
 =?us-ascii?Q?7F+j2R5WzfgXsMOYwgv5sYMyCEZdu8+MBYRl+Qqm+LJzoNfTq37/Pb03G+XP?=
 =?us-ascii?Q?hRWkJy4p7LRiSrQcCadkRKPIExc/BWl1a9NtMUELpJ2fY8Qe11kUVd0LV4gp?=
 =?us-ascii?Q?DMIWxXF+ATx0Q7HqPj2aJIGo9FUe2OqtFHBDoc7wYae44JHDWaZlR9x2aFSn?=
 =?us-ascii?Q?47x87Zl8EvRZm8UhGl+el9ydhBl4GOVVAVAm1I5ijaRw70P1fBjUOvD2Yxcc?=
 =?us-ascii?Q?T0j+odqpFCyfAzsUR7esFQUyXZUYyAtJd0tFU/QxrVxNKw9VS1YgwcR+oI6l?=
 =?us-ascii?Q?rp6750Lvep26U3dJN9PCuwAMLTl0hp09LQgVoZQVyFhWxL4AGDoprBZA6MXa?=
 =?us-ascii?Q?Ve6CKARJsrTON2t9ScH2EJ/d5Hn+3ymm15L9q+dG6TzWqTyU7pt6sAk9Z1b6?=
 =?us-ascii?Q?pe2rrMwOGeQIfIzHEc/zAqdL4GOUzRcfw7JiDAn83/5ZkfiiNT/aKY4Qer/5?=
 =?us-ascii?Q?YI5pXGZCbdffp/g/5C1zP7tMwI4Uucyl1hgC01kzQ3Io8izdZyuB5A/s3QGq?=
 =?us-ascii?Q?DeP+P0tAFmqdX6ucPynoNpTWdvZDrqvl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 070e1084-5ad2-41e4-0126-08da0b78479a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 20:20:45.3789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wSOApbossaOxsVFxKcjhV0hfjegH/5qjqiLZ/rZYI7gu/Rx5aGYUxeoHKawr3MjY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5197
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_132049_939151_00FD5356 
X-CRM114-Status: GOOD (  25.64  )
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

The code change fixed the kernel gpmi driver bch geometry settings not
aligned with u-boot settings issue. For the backward compatibility, it
still keeps the legacy bch setting as default. Users may choose to use
chips required minimum ecc strength by DT flag "fsl,use-minimum-ecc".
It also proposes a new way to set bch geometry for large oob NAND.

- For the legacy bch geometry settings
The driver uses legacy bch geometry settings by default, if the NAND
chips oob size is less than 1KB. The legacy_set_geometry() sets the data
chunk size(step_size) larger than oob size to make sure BBM locates in
data chunk, then set the maximum ecc stength oob can hold. It always use
unbalanced ECC layout, which ecc0 will cover both meta and data0 chunk.

- For the large oob bch geometry settings
This type of setting will be used for NAND chips that oob size is
larger than 1KB, the general idea is,

    1.Try all ECC strength from the minimum value required by NAND chip
      to the maximum one that works, any ECC makes the BBM locate in
      data chunk can be eligible.

    2.If none of them works, using separate ECC for meta, which will add
      one extra ecc with the same ECC strength as other data chunks.
      This extra ECC can guarantee BBM located in data chunk, also we
      need to check if oob can afford it.

- For all other cases
set the bch geometry by chip required strength and step size, which uses
the minimum ecc strength chip required. It can be explicitly enabled by
DT flag "fsl,use-minimum-ecc", but need to be en/disabled in both u-boot
and kernel at the same time.

Signed-off-by: Han Xu <han.xu@nxp.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 298 ++++++++++++++++++---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h |  12 +-
 2 files changed, 267 insertions(+), 43 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index d96899fa90b7..578878c44da9 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -218,7 +218,8 @@ static void gpmi_dump_info(struct gpmi_nand_data *this)
 		"ECC Strength           : %u\n"
 		"Page Size in Bytes     : %u\n"
 		"Metadata Size in Bytes : %u\n"
-		"ECC Chunk Size in Bytes: %u\n"
+		"ECC Chunk0 Size in Bytes: %u\n"
+		"ECC Chunkn Size in Bytes: %u\n"
 		"ECC Chunk Count        : %u\n"
 		"Payload Size in Bytes  : %u\n"
 		"Auxiliary Size in Bytes: %u\n"
@@ -229,7 +230,8 @@ static void gpmi_dump_info(struct gpmi_nand_data *this)
 		geo->ecc_strength,
 		geo->page_size,
 		geo->metadata_size,
-		geo->ecc_chunk_size,
+		geo->ecc_chunk0_size,
+		geo->ecc_chunkn_size,
 		geo->ecc_chunk_count,
 		geo->payload_size,
 		geo->auxiliary_size,
@@ -238,9 +240,14 @@ static void gpmi_dump_info(struct gpmi_nand_data *this)
 		geo->block_mark_bit_offset);
 }
 
-static inline bool gpmi_check_ecc(struct gpmi_nand_data *this)
+static bool gpmi_check_ecc(struct gpmi_nand_data *this)
 {
+	struct nand_chip *chip = &this->nand;
+	struct mtd_info *mtd = nand_to_mtd(&this->nand);
 	struct bch_geometry *geo = &this->bch_geometry;
+	const struct nand_ecc_props *requirements =
+		nanddev_get_ecc_requirements(&chip->base);
+	int corr, ds_corr;
 
 	/* Do the sanity check. */
 	if (GPMI_IS_MXS(this)) {
@@ -248,7 +255,53 @@ static inline bool gpmi_check_ecc(struct gpmi_nand_data *this)
 		if (geo->gf_len == 14)
 			return false;
 	}
-	return geo->ecc_strength <= this->devdata->bch_max_ecc_strength;
+
+	if (geo->ecc_strength > this->devdata->bch_max_ecc_strength)
+		return false;
+
+	/* check ecc strength, same as nand_ecc_is_strong_enough() did */
+	if (requirements->step_size) {
+		corr = mtd->writesize * geo->ecc_strength /
+		       geo->ecc_chunkn_size;
+		ds_corr = mtd->writesize * requirements->strength /
+			  requirements->step_size;
+		if (corr < ds_corr ||
+		    geo->ecc_strength < requirements->strength)
+			return false;
+	}
+
+	return true;
+}
+
+static bool bbm_in_data_chunk(struct gpmi_nand_data *this,
+			unsigned int *chunk_num)
+{
+	struct bch_geometry *geo = &this->bch_geometry;
+	struct nand_chip *chip = &this->nand;
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	unsigned int i, j;
+
+	if (geo->ecc_chunk0_size != geo->ecc_chunkn_size) {
+		dev_err(this->dev, "The size of chunk0 must equal to chunkn\n");
+		return false;
+	}
+
+	i = (mtd->writesize * 8 - geo->metadata_size * 8) /
+		(geo->gf_len * geo->ecc_strength +
+			geo->ecc_chunkn_size * 8);
+
+	j = (mtd->writesize * 8 - geo->metadata_size * 8) -
+		(geo->gf_len * geo->ecc_strength +
+			geo->ecc_chunkn_size * 8) * i;
+
+	if (j < geo->ecc_chunkn_size * 8) {
+		*chunk_num = i+1;
+		dev_dbg(this->dev, "Set ecc to %d and bbm in chunk %d\n",
+				geo->ecc_strength, *chunk_num);
+		return true;
+	}
+
+	return false;
 }
 
 /*
@@ -280,13 +333,14 @@ static int set_geometry_by_ecc_info(struct gpmi_nand_data *this,
 			nanddev_get_ecc_requirements(&chip->base)->step_size);
 		return -EINVAL;
 	}
-	geo->ecc_chunk_size = ecc_step;
+	geo->ecc_chunk0_size = ecc_step;
+	geo->ecc_chunkn_size = ecc_step;
 	geo->ecc_strength = round_up(ecc_strength, 2);
 	if (!gpmi_check_ecc(this))
 		return -EINVAL;
 
 	/* Keep the C >= O */
-	if (geo->ecc_chunk_size < mtd->oobsize) {
+	if (geo->ecc_chunkn_size < mtd->oobsize) {
 		dev_err(this->dev,
 			"unsupported nand chip. ecc size: %d, oob size : %d\n",
 			ecc_step, mtd->oobsize);
@@ -296,7 +350,7 @@ static int set_geometry_by_ecc_info(struct gpmi_nand_data *this,
 	/* The default value, see comment in the legacy_set_geometry(). */
 	geo->metadata_size = 10;
 
-	geo->ecc_chunk_count = mtd->writesize / geo->ecc_chunk_size;
+	geo->ecc_chunk_count = mtd->writesize / geo->ecc_chunkn_size;
 
 	/*
 	 * Now, the NAND chip with 2K page(data chunk is 512byte) shows below:
@@ -399,6 +453,132 @@ static inline int get_ecc_strength(struct gpmi_nand_data *this)
 	return round_down(ecc_strength, 2);
 }
 
+static int set_geometry_for_large_oob(struct gpmi_nand_data *this)
+{
+	struct bch_geometry *geo = &this->bch_geometry;
+	struct nand_chip *chip = &this->nand;
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	const struct nand_ecc_props *requirements =
+		nanddev_get_ecc_requirements(&chip->base);
+	unsigned int block_mark_bit_offset;
+	unsigned int max_ecc;
+	unsigned int bbm_chunk;
+	unsigned int i;
+
+	/* sanity check for the minimum ecc nand required */
+	if (!(requirements->strength > 0 &&
+	      requirements->step_size > 0))
+		return -EINVAL;
+	geo->ecc_strength = requirements->strength;
+
+	/* check if platform can support this nand */
+	if (!gpmi_check_ecc(this)) {
+		dev_err(this->dev,
+			"unsupported NAND chip, minimum ecc required %d\n",
+			geo->ecc_strength);
+		return -EINVAL;
+	}
+
+	/* calculate the maximum ecc platform can support*/
+	geo->metadata_size = 10;
+	geo->gf_len = 14;
+	geo->ecc_chunk0_size = 1024;
+	geo->ecc_chunkn_size = 1024;
+	geo->ecc_chunk_count = mtd->writesize / geo->ecc_chunkn_size;
+	max_ecc = min(get_ecc_strength(this),
+		      this->devdata->bch_max_ecc_strength);
+
+	/* search a supported ecc strength that makes bbm */
+	/* located in data chunk  */
+	geo->ecc_strength = requirements->strength;
+	while (!(geo->ecc_strength > max_ecc)) {
+		if (bbm_in_data_chunk(this, &bbm_chunk))
+			goto geo_setting;
+		geo->ecc_strength += 2;
+	}
+
+	/* if none of them works, keep using the minimum ecc */
+	/* nand required but changing ecc page layout  */
+	geo->ecc_strength = requirements->strength;
+	/* add extra ecc for meta data */
+	geo->ecc_chunk0_size = 0;
+	geo->ecc_chunk_count = (mtd->writesize / geo->ecc_chunkn_size) + 1;
+	geo->ecc_for_meta = 1;
+	/* check if oob can afford this extra ecc chunk */
+	if (mtd->oobsize * 8 < geo->metadata_size * 8 +
+	    geo->gf_len * geo->ecc_strength * geo->ecc_chunk_count) {
+		dev_err(this->dev, "unsupported NAND chip with new layout\n");
+		return -EINVAL;
+	}
+
+	/* calculate in which chunk bbm located */
+	bbm_chunk = (mtd->writesize * 8 - geo->metadata_size * 8 -
+		     geo->gf_len * geo->ecc_strength) /
+		     (geo->gf_len * geo->ecc_strength +
+		     geo->ecc_chunkn_size * 8) + 1;
+
+geo_setting:
+
+	geo->page_size = mtd->writesize + geo->metadata_size +
+		(geo->gf_len * geo->ecc_strength * geo->ecc_chunk_count) / 8;
+	geo->payload_size = mtd->writesize;
+
+	/*
+	 * The auxiliary buffer contains the metadata and the ECC status. The
+	 * metadata is padded to the nearest 32-bit boundary. The ECC status
+	 * contains one byte for every ECC chunk, and is also padded to the
+	 * nearest 32-bit boundary.
+	 */
+	geo->auxiliary_status_offset = ALIGN(geo->metadata_size, 4);
+	geo->auxiliary_size = ALIGN(geo->metadata_size, 4)
+				    + ALIGN(geo->ecc_chunk_count, 4);
+
+	if (!this->swap_block_mark)
+		return 0;
+
+	/* calculate the number of ecc chunk behind the bbm */
+	i = (mtd->writesize / geo->ecc_chunkn_size) - bbm_chunk + 1;
+
+	block_mark_bit_offset = mtd->writesize * 8 -
+		(geo->ecc_strength * geo->gf_len * (geo->ecc_chunk_count - i)
+		+ geo->metadata_size * 8);
+
+	geo->block_mark_byte_offset = block_mark_bit_offset / 8;
+	geo->block_mark_bit_offset  = block_mark_bit_offset % 8;
+
+	dev_dbg(this->dev, "BCH Geometry :\n"
+		"GF length              : %u\n"
+		"ECC Strength           : %u\n"
+		"Page Size in Bytes     : %u\n"
+		"Metadata Size in Bytes : %u\n"
+		"ECC Chunk0 Size in Bytes: %u\n"
+		"ECC Chunkn Size in Bytes: %u\n"
+		"ECC Chunk Count        : %u\n"
+		"Payload Size in Bytes  : %u\n"
+		"Auxiliary Size in Bytes: %u\n"
+		"Auxiliary Status Offset: %u\n"
+		"Block Mark Byte Offset : %u\n"
+		"Block Mark Bit Offset  : %u\n"
+		"Block Mark in chunk	: %u\n"
+		"Ecc for Meta data	: %u\n",
+		geo->gf_len,
+		geo->ecc_strength,
+		geo->page_size,
+		geo->metadata_size,
+		geo->ecc_chunk0_size,
+		geo->ecc_chunkn_size,
+		geo->ecc_chunk_count,
+		geo->payload_size,
+		geo->auxiliary_size,
+		geo->auxiliary_status_offset,
+		geo->block_mark_byte_offset,
+		geo->block_mark_bit_offset,
+		bbm_chunk,
+		geo->ecc_for_meta);
+
+	return 0;
+}
+
 static int legacy_set_geometry(struct gpmi_nand_data *this)
 {
 	struct bch_geometry *geo = &this->bch_geometry;
@@ -418,13 +598,15 @@ static int legacy_set_geometry(struct gpmi_nand_data *this)
 	geo->gf_len = 13;
 
 	/* The default for chunk size. */
-	geo->ecc_chunk_size = 512;
-	while (geo->ecc_chunk_size < mtd->oobsize) {
-		geo->ecc_chunk_size *= 2; /* keep C >= O */
+	geo->ecc_chunk0_size = 512;
+	geo->ecc_chunkn_size = 512;
+	while (geo->ecc_chunkn_size < mtd->oobsize) {
+		geo->ecc_chunk0_size *= 2; /* keep C >= O */
+		geo->ecc_chunkn_size *= 2; /* keep C >= O */
 		geo->gf_len = 14;
 	}
 
-	geo->ecc_chunk_count = mtd->writesize / geo->ecc_chunk_size;
+	geo->ecc_chunk_count = mtd->writesize / geo->ecc_chunkn_size;
 
 	/* We use the same ECC strength for all chunks. */
 	geo->ecc_strength = get_ecc_strength(this);
@@ -514,24 +696,40 @@ static int legacy_set_geometry(struct gpmi_nand_data *this)
 static int common_nfc_set_geometry(struct gpmi_nand_data *this)
 {
 	struct nand_chip *chip = &this->nand;
+	struct mtd_info *mtd = nand_to_mtd(&this->nand);
 	const struct nand_ecc_props *requirements =
 		nanddev_get_ecc_requirements(&chip->base);
+	bool use_minimun_ecc;
+	int err;
 
-	if (chip->ecc.strength > 0 && chip->ecc.size > 0)
-		return set_geometry_by_ecc_info(this, chip->ecc.strength,
-						chip->ecc.size);
+	use_minimun_ecc = of_property_read_bool(this->dev->of_node,
+						"fsl,use-minimum-ecc");
 
-	if ((of_property_read_bool(this->dev->of_node, "fsl,use-minimum-ecc"))
-				|| legacy_set_geometry(this)) {
-		if (!(requirements->strength > 0 && requirements->step_size > 0))
-			return -EINVAL;
+	/* use legacy bch geometry settings by default*/
+	if ((!use_minimun_ecc && mtd->oobsize < 1024) ||
+	    !(requirements->strength > 0 && requirements->step_size > 0)) {
+		dev_dbg(this->dev, "use legacy bch geometry\n");
+		err = legacy_set_geometry(this);
+		if (!err)
+			return 0;
+	}
 
-		return set_geometry_by_ecc_info(this,
-						requirements->strength,
-						requirements->step_size);
+	/* for large oob nand */
+	if (mtd->oobsize > 1024) {
+		dev_dbg(this->dev, "use large oob bch geometry\n");
+		err = set_geometry_for_large_oob(this);
+		if (!err)
+			return 0;
 	}
 
-	return 0;
+	/* otherwise use the minimum ecc nand chip required */
+	dev_dbg(this->dev, "use minimum ecc bch geometry\n");
+	err = set_geometry_by_ecc_info(this, requirements->strength,
+					requirements->step_size);
+	if (err)
+		dev_err(this->dev, "none of the bch geometry setting works\n");
+
+	return err;
 }
 
 /* Configures the geometry for BCH.  */
@@ -843,7 +1041,7 @@ static int gpmi_raw_len_to_len(struct gpmi_nand_data *this, int raw_len)
 	 * we are passed in exec_op. Calculate the data length from it.
 	 */
 	if (this->bch)
-		return ALIGN_DOWN(raw_len, this->bch_geometry.ecc_chunk_size);
+		return ALIGN_DOWN(raw_len, this->bch_geometry.ecc_chunkn_size);
 	else
 		return raw_len;
 }
@@ -1235,7 +1433,7 @@ static int gpmi_count_bitflips(struct nand_chip *chip, void *buf, int first,
 
 			/* Read ECC bytes into our internal raw_buffer */
 			offset = nfc_geo->metadata_size * 8;
-			offset += ((8 * nfc_geo->ecc_chunk_size) + eccbits) * (i + 1);
+			offset += ((8 * nfc_geo->ecc_chunkn_size) + eccbits) * (i + 1);
 			offset -= eccbits;
 			bitoffset = offset % 8;
 			eccbytes = DIV_ROUND_UP(offset + eccbits, 8);
@@ -1272,16 +1470,16 @@ static int gpmi_count_bitflips(struct nand_chip *chip, void *buf, int first,
 			if (i == 0) {
 				/* The first block includes metadata */
 				flips = nand_check_erased_ecc_chunk(
-						buf + i * nfc_geo->ecc_chunk_size,
-						nfc_geo->ecc_chunk_size,
+						buf + i * nfc_geo->ecc_chunkn_size,
+						nfc_geo->ecc_chunkn_size,
 						eccbuf, eccbytes,
 						this->auxiliary_virt,
 						nfc_geo->metadata_size,
 						nfc_geo->ecc_strength);
 			} else {
 				flips = nand_check_erased_ecc_chunk(
-						buf + i * nfc_geo->ecc_chunk_size,
-						nfc_geo->ecc_chunk_size,
+						buf + i * nfc_geo->ecc_chunkn_size,
+						nfc_geo->ecc_chunkn_size,
 						eccbuf, eccbytes,
 						NULL, 0,
 						nfc_geo->ecc_strength);
@@ -1310,20 +1508,21 @@ static void gpmi_bch_layout_std(struct gpmi_nand_data *this)
 	struct bch_geometry *geo = &this->bch_geometry;
 	unsigned int ecc_strength = geo->ecc_strength >> 1;
 	unsigned int gf_len = geo->gf_len;
-	unsigned int block_size = geo->ecc_chunk_size;
+	unsigned int block0_size = geo->ecc_chunk0_size;
+	unsigned int blockn_size = geo->ecc_chunkn_size;
 
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
@@ -1406,9 +1605,22 @@ static int gpmi_ecc_read_subpage(struct nand_chip *chip, uint32_t offs,
 		}
 	}
 
+	/*
+	 * if there is an ECC dedicate for meta:
+	 * - need to add an extra ECC size when calculating col and page_size,
+	 *   if the meta size is NOT zero.
+	 * - chunk0 size need to set to the same size as other chunks,
+	 *   if the meta size is zero.
+	 */
+
 	meta = geo->metadata_size;
 	if (first) {
-		col = meta + (size + ecc_parity_size) * first;
+		if (geo->ecc_for_meta)
+			col = meta + ecc_parity_size
+				+ (size + ecc_parity_size) * first;
+		else
+			col = meta + (size + ecc_parity_size) * first;
+
 		meta = 0;
 		buf = buf + first * size;
 	}
@@ -1416,19 +1628,27 @@ static int gpmi_ecc_read_subpage(struct nand_chip *chip, uint32_t offs,
 	ecc_parity_size = geo->gf_len * geo->ecc_strength / 8;
 
 	n = last - first + 1;
-	page_size = meta + (size + ecc_parity_size) * n;
+
+	if (geo->ecc_for_meta && meta)
+		page_size = meta + ecc_parity_size
+			+ (size + ecc_parity_size) * n;
+	else
+		page_size = meta + (size + ecc_parity_size) * n;
+
 	ecc_strength = geo->ecc_strength >> 1;
 
-	this->bch_flashlayout0 = BF_BCH_FLASH0LAYOUT0_NBLOCKS(n - 1) |
+	this->bch_flashlayout0 = BF_BCH_FLASH0LAYOUT0_NBLOCKS(
+		(geo->ecc_for_meta ? n : n - 1)) |
 		BF_BCH_FLASH0LAYOUT0_META_SIZE(meta) |
 		BF_BCH_FLASH0LAYOUT0_ECC0(ecc_strength, this) |
 		BF_BCH_FLASH0LAYOUT0_GF(geo->gf_len, this) |
-		BF_BCH_FLASH0LAYOUT0_DATA0_SIZE(geo->ecc_chunk_size, this);
+		BF_BCH_FLASH0LAYOUT0_DATA0_SIZE((geo->ecc_for_meta ?
+		0 : geo->ecc_chunk0_size), this);
 
 	this->bch_flashlayout1 = BF_BCH_FLASH0LAYOUT1_PAGE_SIZE(page_size) |
 		BF_BCH_FLASH0LAYOUT1_ECCN(ecc_strength, this) |
 		BF_BCH_FLASH0LAYOUT1_GF(geo->gf_len, this) |
-		BF_BCH_FLASH0LAYOUT1_DATAN_SIZE(geo->ecc_chunk_size, this);
+		BF_BCH_FLASH0LAYOUT1_DATAN_SIZE(geo->ecc_chunkn_size, this);
 
 	this->bch = true;
 
@@ -1597,7 +1817,7 @@ static int gpmi_ecc_read_page_raw(struct nand_chip *chip, uint8_t *buf,
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 	struct bch_geometry *nfc_geo = &this->bch_geometry;
-	int eccsize = nfc_geo->ecc_chunk_size;
+	int eccsize = nfc_geo->ecc_chunkn_size;
 	int eccbits = nfc_geo->ecc_strength * nfc_geo->gf_len;
 	u8 *tmp_buf = this->raw_buffer;
 	size_t src_bit_off;
@@ -1682,7 +1902,7 @@ static int gpmi_ecc_write_page_raw(struct nand_chip *chip, const uint8_t *buf,
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 	struct bch_geometry *nfc_geo = &this->bch_geometry;
-	int eccsize = nfc_geo->ecc_chunk_size;
+	int eccsize = nfc_geo->ecc_chunkn_size;
 	int eccbits = nfc_geo->ecc_strength * nfc_geo->gf_len;
 	u8 *tmp_buf = this->raw_buffer;
 	uint8_t *oob = chip->oob_poi;
@@ -2056,7 +2276,7 @@ static int gpmi_init_last(struct gpmi_nand_data *this)
 	ecc->read_oob_raw = gpmi_ecc_read_oob_raw;
 	ecc->write_oob_raw = gpmi_ecc_write_oob_raw;
 	ecc->engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
-	ecc->size	= bch_geo->ecc_chunk_size;
+	ecc->size	= bch_geo->ecc_chunkn_size;
 	ecc->strength	= bch_geo->ecc_strength;
 	mtd_set_ooblayout(mtd, &gpmi_ooblayout_ops);
 
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
index 5e1c3ddae5f8..9ade40d0f586 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
@@ -30,9 +30,9 @@ struct resources {
  * @page_size:                The size, in bytes, of a physical page, including
  *                            both data and OOB.
  * @metadata_size:            The size, in bytes, of the metadata.
- * @ecc_chunk_size:           The size, in bytes, of a single ECC chunk. Note
- *                            the first chunk in the page includes both data and
- *                            metadata, so it's a bit larger than this value.
+ * @ecc_chunk0_size:          The size, in bytes, of a first ECC chunk.
+ * @ecc_chunkn_size:          The size, in bytes, of a single ECC chunk after
+ *                            the first chunk in the page.
  * @ecc_chunk_count:          The number of ECC chunks in the page,
  * @payload_size:             The size, in bytes, of the payload buffer.
  * @auxiliary_size:           The size, in bytes, of the auxiliary buffer.
@@ -42,19 +42,23 @@ struct resources {
  *                            which the underlying physical block mark appears.
  * @block_mark_bit_offset:    The bit offset into the ECC-based page view at
  *                            which the underlying physical block mark appears.
+ * @ecc_for_meta:             The flag to indicate if there is a dedicate ecc
+ *                            for meta.
  */
 struct bch_geometry {
 	unsigned int  gf_len;
 	unsigned int  ecc_strength;
 	unsigned int  page_size;
 	unsigned int  metadata_size;
-	unsigned int  ecc_chunk_size;
+	unsigned int  ecc_chunk0_size;
+	unsigned int  ecc_chunkn_size;
 	unsigned int  ecc_chunk_count;
 	unsigned int  payload_size;
 	unsigned int  auxiliary_size;
 	unsigned int  auxiliary_status_offset;
 	unsigned int  block_mark_byte_offset;
 	unsigned int  block_mark_bit_offset;
+	unsigned int  ecc_for_meta; /* ECC for meta data */
 };
 
 /**
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
