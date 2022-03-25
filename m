Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD6F0C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Mar 2022 21:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l0yC48OZmvm0jqlljIcExgZ0YTT0YcwJVGe3CwNtUYE=; b=DH5pMXUamIZ3AV
	2/BwhgpL2S1oPAewfvBimiqyi1zC7Lxb8ihVM24WNUUn7p1F3kgWZIsBpo0y22zBJLjanCt4vd2ts
	iM5BzlNAcoaAMISSUYBu6gWh7q+4jZ+1FLBCuUcsGt+kzyG87DG+Nf8IEzAsiAvOxaOz2gvFcb6t1
	ZPaNx5Ia8VVTX6U+yp/G0ecGJTRLqwkp48svhCnCYqn5BhNy5aBwnw+3syfS5HdF9OYFWKeSvtNWo
	IeYnK1v8oKH2LeBF8tjYnSEIWJdUDYZw6r7PVkX5NcxjCKlcgj02NshJDVh/MVbsVvQirVClvoU7M
	ei1m0UTbEFYHjUPBrNvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXrGv-003Jqv-2E; Fri, 25 Mar 2022 21:15:01 +0000
Received: from mail-am6eur05on20614.outbound.protection.outlook.com
 ([2a01:111:f400:7e1b::614]
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXrGj-003JkO-8S
 for linux-mtd@lists.infradead.org; Fri, 25 Mar 2022 21:14:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WnPHOMK+nZbCkV3+/P10qJjzeQrjCl7guTECL2xecBnediaxLLm3Mhvouv0P8pcj2BLOKyPRnJN3ulkFrEnOz2n1zR7msHsX57LdLwNvk/OJ9lIx7B13PSg3a+rY1N/Ymk1emiLGTZM6j6zUML8RNqyodjQY1xcQhvOE8LtzjjfzasXrA3Fk/du+cdIew28ragixvdM2SjxirtCLupwsioVwmZ4cuY73l4ty1KJcRrzffHsK4JdyL+4hYrfs6ndZ3B6PM1HWQ7jojGTHTpzYeBRTk1HL+IQapLXfr3mi7T4CufR+uUatcsXMMtFCeM1fO71Xod4HJD3NMHvf8psZJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QnFf1bco7rKsEHapUdvHlnGn/KujKQiNTFQAAYpy0HY=;
 b=POaHLYPstuvtjT3JG0lI8LXtwTOxYEC+xPHqapFTVb3DIUVglnBbzog19M3YHIRZqbG1H5HjupVZeZOfL4tgo7iIx8ne0kokUpH7kSBveY4NhDqqq2J2jqJUqDDtt/yyfkYWLIpXMP8CGgYXDcIPYdVrtrDMTjCvV1QXwMsAt1+MjdsU+mz2v1A8wNef2ekV8U/D+WIQiIrQylzIvfmvEQaRqNNO5dxFnt9JzD3y0GNept2/LV1I9YIvhQbzqFt12nHMo/THpS2xk/OGtzfoEA2TyTmB+wtf3DIjmUN1pyiOT8qg/mY1yOQ98Yekf3AakSrOA7bzf6oClzKYw8Sjzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QnFf1bco7rKsEHapUdvHlnGn/KujKQiNTFQAAYpy0HY=;
 b=oKqMycNTPHJxGiz5qDmqjmQMn0lC5fSZVqbSyuKhlollQJVH2CAJ06vAUlqyAu+cAZcEt99pXboLrCBqg7HEpbm8bTL3j3emwPf7ndntnmWF8mwdlV4ofDqaQ1HtlKAC534g8kThONKICUxBeBpa19R/7HF3SVv4aSUTyT7Rl78=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by DB3PR0402MB3881.eurprd04.prod.outlook.com (2603:10a6:8:12::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Fri, 25 Mar
 2022 21:14:35 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::5416:5d1:cc34:ca9b]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::5416:5d1:cc34:ca9b%7]) with mapi id 15.20.5102.019; Fri, 25 Mar 2022
 21:14:35 +0000
From: Han Xu <han.xu@nxp.com>
To: sbabic@denx.de, sean@geanix.com, frieder.schrempf@kontron.de,
 festevam@gmail.com
Cc: ye.li@nxp.com, peng.fan@nxp.com, han.xu@nxp.com, miquel.raynal@bootlin.com,
 linux-mtd@lists.infradead.org
Subject: [PATCH v2 2/2] mtd: rawnand: gpmi: Add large oob bch setting support
Date: Fri, 25 Mar 2022 16:14:11 -0500
Message-Id: <20220325211411.30714-2-han.xu@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220325211411.30714-1-han.xu@nxp.com>
References: <20220325211411.30714-1-han.xu@nxp.com>
X-ClientProxiedBy: BYAPR01CA0057.prod.exchangelabs.com (2603:10b6:a03:94::34)
 To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2fb61e3-294c-49b6-8e9c-08da0ea476c4
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3881:EE_
X-Microsoft-Antispam-PRVS: <DB3PR0402MB38816FA89C7242298F8DCB5D971A9@DB3PR0402MB3881.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7YdLAq7lP3GrE2NXfnw1yj8fGGrIMgW+US4DrByN3dITJmWlB7WCOiWerY5jBKA4tEXte7k53/HEUfrLjm8MQVyYQ0hT5ofxtR4O5NxQMdlfmUNO7hB6C/aIX8c6wTl8FQNMyTcXaFvlvCDr2rbHaUPM9DQ85OggYb9umbZ5+LBZxEf5fKms9yIBdIgg8+1PqG1ADJdXqWRryvheHS1LEiJ73P2sqTeNkmPMIQvYvZcujgwyFboZ6F9L+h0vDt3TmzARvu1yMm5ICdq8hUfzb5uy2HmiCcw6R2hi8fk6wgFe/H5cjpLbh/5HKLEWLcjMdcm+CP69r2U/s29LkATuWWGBOx3ifRPw2+T8iPyiCAcAI2K6bqtQ6NJ8LFV5TLfRXWA2AjHa1fVUnk9vBt4HMUbDVxdAQrFne7GA9KvxJjglF/1A2r3BDEizMdz74yDDO1IW/9MEcBFekuSMVNuTyXrrL8rIJtI1ZRTpSbawxa6CwU2nMtxPrF06EzjPUoxXURMzGGT4ym4VpA+J4xgi0sDcmnZFuTQHK4XwQsVBuuSGAACRWtZ3DAviil4aCNelKPmRZ7Vyg/r4d4FVaWXjGgazDYheovVmHzxGzM55Tqlxwv2BJni53AuYziIbJYc+X6ZLtqpcqEFdsNFtkq7Y4QnIlS6doFTijxWOLHvBLV38uIqFMD/54BcCxd4DiiyFDB6VY+jE7aQ7QLgqTzdFVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8774.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(30864003)(316002)(36756003)(83380400001)(186003)(44832011)(8676002)(66476007)(2616005)(4326008)(66556008)(66946007)(5660300002)(38100700002)(1076003)(6486002)(8936002)(6512007)(38350700002)(52116002)(2906002)(6506007)(26005)(86362001)(508600001)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Mp3UKm7So1wmQW4QGIdlthzLdmsWVXj2zrlnaCaldsBTOVg5kCeYBM1L3t9r?=
 =?us-ascii?Q?hx9fL2zWi9qB+rbBfKY35d0O0x1DJF1QQkAYiSlXb7V5HcgtIBJHXBBu8JeS?=
 =?us-ascii?Q?MF/isgikFLlQyOlCTxZiaGCY6DJA3zBys3v7r+yhHiseKCxDNYQvjq25dwKA?=
 =?us-ascii?Q?31/IP2Mtu1xYDSIYKSoyzMvMcOMzBMjj0equoi4wSdgPBY9wc2hdF3nRQer1?=
 =?us-ascii?Q?uc5GJ3wvB00/iwBx2+gBTjxQU5dM9SEDeGNIKYF1y9b0PMs9IXAXHqLbpbsb?=
 =?us-ascii?Q?NbXKmeZlbviDk+aE0JXGZobnQAjLyvkITuUyd3z3gTkh52+ySKZs755ZmK6o?=
 =?us-ascii?Q?c9Yjq7ST8YvMWYJomZ7fuoSqSQF8Vy9luvU6iLtLjMz6+kxYel/WR+xBjF/G?=
 =?us-ascii?Q?273KA2nG5wFVuVmRHim9jhvzvP/IVaXToqI0uGT4D8v1XP8r3hl0lT9ZY7OR?=
 =?us-ascii?Q?mbQbfbYNhwI/IDR6SFsx2rKLDIlM/SE2eXWQB82oHkwNwlAJWKqIGF460ndj?=
 =?us-ascii?Q?P17bc+XQ9W4CL85IdyLyxPd2Vnbgt3SDV/dOn7YMlwWpOAUddPRNH6RT6rTG?=
 =?us-ascii?Q?IgCuMPp1hHR27mFaDcsnTaiH63xHBFLjYZ6TDfS9A/aNWZ7ohjQ9s1TTxCd/?=
 =?us-ascii?Q?C+Fba+Oxs4wU21R8kVu2V7qQbJqa5fwVSkOae5j5DoSjFhQotTZkq7TfKTmg?=
 =?us-ascii?Q?SG70kPEEgGqd3GtEo3ff+rC4be2ipBH1mn4MPapnyGFVsK9MUWBqUSPYwCCi?=
 =?us-ascii?Q?B/gDUD0kY3ntmDrbSXLEawD80jGCxx/bxuwN3f1OswkFNesZ5geHE0JaaTNb?=
 =?us-ascii?Q?BgDjR38Lr37fPGQI0Kr1ar1gsR+yIfAZFTNRgQ611M58hw3e9hBHC5HZL45R?=
 =?us-ascii?Q?tYvaJt1N3P2B9q1JCnNsSC2A8xfGHAYF/lfLq9yDSuTopaJgNN38pF88PO1I?=
 =?us-ascii?Q?Ka3UI8x3JK5dBwce+XgFkYF5nm4UtL+uKPm7S1UlYrL+8d0i7i1Hqilp/c78?=
 =?us-ascii?Q?LdsMHHka6PxhWSn1HxbgKNkDgPX5Ffvn8D603GmvQTdkqacNNKnfku6eGlrn?=
 =?us-ascii?Q?3TvnCoDzKfgQClgShpcHlvJvG7mglTfe3NozTRS9Rp1kdNCEU4WI21o4yD2R?=
 =?us-ascii?Q?y+xemDBtYu9gCGPlhLpKVuZqsZrWDrExK8tD0oUuSn8p0LMBpjT2J25LyF7c?=
 =?us-ascii?Q?o70hRW5xVQk/WRt0vUz2D7SnGnOuQfAmiIOuTK8maoL6KBnZfD/OacY0Lw+3?=
 =?us-ascii?Q?h3PKf0EsQG0A44lIupv3G1dM8KBd3ahskQp51SXIszsvXm8i6Ig/JcQDu1qm?=
 =?us-ascii?Q?F/eH3MfTjYiklOwU3PILg/Osk0N777xQxwsgRGNfKkFqY3AeC0opF4SS7+1l?=
 =?us-ascii?Q?2L10mX4h0a8x7n4740a5XoeqGaJaUdIcQ5bAUQUqnv/uo3vz5stLkMS/4yIZ?=
 =?us-ascii?Q?EYFxXIrhKVXkjrCD1z38RKUdZdlr3TeOA26ptu0xCfQqt44GLQV0cV3bU5Fy?=
 =?us-ascii?Q?ijfTdvJkKYXyuVY2/+nn6YUOMvlj/j4rANbRQcIWgAF6yQlwZmZbXmRIJHZb?=
 =?us-ascii?Q?KM076g5ovD8Z96NyJONyMB71oLHNwl+Kx7r12MHLFFesA897CucBf7GaUr98?=
 =?us-ascii?Q?j1+FKzu7hRS2RhG9xZryP2swW1d4vbvUoxT6vOcWYG3cruldH9HiK0LDy/lK?=
 =?us-ascii?Q?Dz5w/7L3Gjth6UG/oH0hXZBns2ZjleDwBJC7n9wh96xUJQp1l/NddQ2WDAw7?=
 =?us-ascii?Q?oCk1yKbByQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2fb61e3-294c-49b6-8e9c-08da0ea476c4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 21:14:35.8877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eGAHNxYSI1S+4xeh9TCX0JaJq7E0gkgfj+hnsA/9xg5GVivCZqA79HndNqfpyCXm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3881
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_141449_339547_D46B911D 
X-CRM114-Status: GOOD (  24.19  )
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

The code change proposes a new way to set bch geometry for large oob
NAND (oobsize > 1KB). In this case, previous implementation can NOT
guarantee the bad block mark always locates in data chunk, so we need a
new way to do it, the general idea is,

1.Try all ECC strength from the minimum value required by NAND chip to
  the maximum one that controller can provide, any ECC strength makes
  the BBM locate in data chunk can be eligible.

2.If none of them works, using separate ECC for meta, which will add
  one extra ecc with the same ECC strength as other data chunks.  This
  extra ECC can guarantee BBM located in data chunk, also we need to
  check if oob can afford it.

Signed-off-by: Han Xu <han.xu@nxp.com>

---
Changes in v2:
 - split the large oob part to a single patch
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 247 ++++++++++++++++++---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h |  12 +-
 2 files changed, 228 insertions(+), 31 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 9a37f8cc663e..0b2193bc7e08 100644
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
@@ -260,7 +262,7 @@ static bool gpmi_check_ecc(struct gpmi_nand_data *this)
 	/* check ecc strength, same as nand_ecc_is_strong_enough() did */
 	if (requirements->step_size) {
 		corr = mtd->writesize * geo->ecc_strength /
-		       geo->ecc_chunk_size;
+		       geo->ecc_chunkn_size;
 		ds_corr = mtd->writesize * requirements->strength /
 			  requirements->step_size;
 		if (corr < ds_corr ||
@@ -271,6 +273,38 @@ static bool gpmi_check_ecc(struct gpmi_nand_data *this)
 	return true;
 }
 
+/* check if bbm locates in data chunk rather than ecc chunk */
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
+}
+
 /*
  * If we can get the ECC information from the nand chip, we do not
  * need to calculate them ourselves.
@@ -300,13 +334,14 @@ static int set_geometry_by_ecc_info(struct gpmi_nand_data *this,
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
@@ -316,7 +351,7 @@ static int set_geometry_by_ecc_info(struct gpmi_nand_data *this,
 	/* The default value, see comment in the legacy_set_geometry(). */
 	geo->metadata_size = 10;
 
-	geo->ecc_chunk_count = mtd->writesize / geo->ecc_chunk_size;
+	geo->ecc_chunk_count = mtd->writesize / geo->ecc_chunkn_size;
 
 	/*
 	 * Now, the NAND chip with 2K page(data chunk is 512byte) shows below:
@@ -419,6 +454,132 @@ static inline int get_ecc_strength(struct gpmi_nand_data *this)
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
@@ -438,13 +599,15 @@ static int legacy_set_geometry(struct gpmi_nand_data *this)
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
@@ -552,6 +715,14 @@ static int common_nfc_set_geometry(struct gpmi_nand_data *this)
 			return 0;
 	}
 
+	/* for large oob nand */
+	if (mtd->oobsize > 1024) {
+		dev_dbg(this->dev, "use large oob bch geometry\n");
+		err = set_geometry_for_large_oob(this);
+		if (!err)
+			return 0;
+	}
+
 	/* otherwise use the minimum ecc nand chip required */
 	dev_dbg(this->dev, "use minimum ecc bch geometry\n");
 	err = set_geometry_by_ecc_info(this, requirements->strength,
@@ -871,7 +1042,7 @@ static int gpmi_raw_len_to_len(struct gpmi_nand_data *this, int raw_len)
 	 * we are passed in exec_op. Calculate the data length from it.
 	 */
 	if (this->bch)
-		return ALIGN_DOWN(raw_len, this->bch_geometry.ecc_chunk_size);
+		return ALIGN_DOWN(raw_len, this->bch_geometry.ecc_chunkn_size);
 	else
 		return raw_len;
 }
@@ -1263,7 +1434,7 @@ static int gpmi_count_bitflips(struct nand_chip *chip, void *buf, int first,
 
 			/* Read ECC bytes into our internal raw_buffer */
 			offset = nfc_geo->metadata_size * 8;
-			offset += ((8 * nfc_geo->ecc_chunk_size) + eccbits) * (i + 1);
+			offset += ((8 * nfc_geo->ecc_chunkn_size) + eccbits) * (i + 1);
 			offset -= eccbits;
 			bitoffset = offset % 8;
 			eccbytes = DIV_ROUND_UP(offset + eccbits, 8);
@@ -1300,16 +1471,16 @@ static int gpmi_count_bitflips(struct nand_chip *chip, void *buf, int first,
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
@@ -1338,20 +1509,21 @@ static void gpmi_bch_layout_std(struct gpmi_nand_data *this)
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
@@ -1434,9 +1606,22 @@ static int gpmi_ecc_read_subpage(struct nand_chip *chip, uint32_t offs,
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
@@ -1444,19 +1629,27 @@ static int gpmi_ecc_read_subpage(struct nand_chip *chip, uint32_t offs,
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
 
@@ -1625,7 +1818,7 @@ static int gpmi_ecc_read_page_raw(struct nand_chip *chip, uint8_t *buf,
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 	struct bch_geometry *nfc_geo = &this->bch_geometry;
-	int eccsize = nfc_geo->ecc_chunk_size;
+	int eccsize = nfc_geo->ecc_chunkn_size;
 	int eccbits = nfc_geo->ecc_strength * nfc_geo->gf_len;
 	u8 *tmp_buf = this->raw_buffer;
 	size_t src_bit_off;
@@ -1710,7 +1903,7 @@ static int gpmi_ecc_write_page_raw(struct nand_chip *chip, const uint8_t *buf,
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 	struct bch_geometry *nfc_geo = &this->bch_geometry;
-	int eccsize = nfc_geo->ecc_chunk_size;
+	int eccsize = nfc_geo->ecc_chunkn_size;
 	int eccbits = nfc_geo->ecc_strength * nfc_geo->gf_len;
 	u8 *tmp_buf = this->raw_buffer;
 	uint8_t *oob = chip->oob_poi;
@@ -2084,7 +2277,7 @@ static int gpmi_init_last(struct gpmi_nand_data *this)
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
