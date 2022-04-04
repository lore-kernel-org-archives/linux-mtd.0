Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEDDC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Apr 2022 20:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nLGf8SIN7TWEcuWWbX7MVxB5EYwXei6um6LqnDODarw=; b=mhpMjM/Hz8D+3p
	sFyf8M81dAVzAgsgp2RgTj1wFEfrw3mUSv2cliHd7er58SKtAjJJPi77LNpz5/jzB3cYeOI8nurw5
	h3wBHX1MkrnIeBmiI5p7EME/pL7jqjbcCIIK2fnZzZPE0XWssrNHLiEDz4OGJQzUV6NSL+3U3bnUf
	HSJfGkq7M12peaiBMNUXKlL2/vsuIyZgmDu6vlz8MwEudU+VRRNXUFxv0zWRyKJ9nYnAK2QZAIj8J
	QrBNfE/+JINYv+GT+SClItuOwmCDQqcDcK1p5Rg7zhjGrXUL9ASSksoTp3mPALer6QjRkpYLznbRU
	Gq4BtsH4NUbV6hScdkaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbT1B-00GK62-6c; Mon, 04 Apr 2022 20:09:41 +0000
Received: from mail-ve1eur02on061a.outbound.protection.outlook.com
 ([2a01:111:f400:fe06::61a]
 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbT10-00GK4b-Us
 for linux-mtd@lists.infradead.org; Mon, 04 Apr 2022 20:09:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1/YUm0S315/a+pOzsuDHemj2w5wksVJgPAvoJOyEM3clFR0j1f+NxI6FZxcp01wvtLyHnODWuhEINT+yv4vuiInWTCXfex4j7OIt5HPV7SrMfIzAhCkcg8PA0e3LQyjgv6S1oZCQnSsbmM1MI+J7Yn0/n0cfAQrk5fUtFiI4f1FSAhDp+Thg9UmTqzK073ik28avs+4dGc4xUwm9sgSIthtb//aHIaS/N+dR9nMmETEQCAxHGwpEocn8K6MLaFl9M9U+BYBOMh8yslz07FAnrHbXNC5luIO3e0tCN3m141kSYZARAjWIAEZnqzTRUF8BQ4ufjjkAm8S8Dz1yHGv9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtzfJIGAd6Obkvh5Uyl9qNd4kLXpxIbTPqodD8OrNbE=;
 b=FeaZODCsNuLE7pPksJrVByL7PZRCDVuk78LR3nrOoA20A4eevwN1USxORtwHYisQMfPsXQEaceTuFL79qfxgxicCsRo6n/NVpMAqp3ZQ1d2E9C7uL1b3FhJ5bRx/yaqdARWKPPdF/hx41CXeWxS5NH2t/gk3i8NISqJVqJMtREhctvbcTs/KBBgnXGAH41sVQsdei8aC8ZLo5aSZBjZPy6YtltaK94vE0faY5YoJn7Yq0F2gZPQwNyn7PycEFLDexHcEtdB5H+MFsx+m/414I7Bt2gACIYLx2+y4n7EUWXZLCZpXUGZ5CLbLfE2HpQmf4Rkl3417BAJta4YUZg9lTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtzfJIGAd6Obkvh5Uyl9qNd4kLXpxIbTPqodD8OrNbE=;
 b=oW9V5bY1+Bs13kb9ssPrjUDBhTSz7G93W26I+b/g5WzmmC70iGHLKosh4SvHv7u1kMW0oozBM7+0lTku2Ku83xjcud5t0bWfdc0iT5my7qsPqEY0ZJ8xZ8VwbYLE9oCUXP4rzbE8lQipv1u8KYZJW3Z4q0ezMG62u/bJ9syftzA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by AM6PR04MB6552.eurprd04.prod.outlook.com (2603:10a6:20b:f3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 19:54:48 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::b048:39cb:7748:ed56]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::b048:39cb:7748:ed56%7]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 19:54:48 +0000
From: Han Xu <han.xu@nxp.com>
To: sean@geanix.com,
	frieder.schrempf@kontron.de,
	festevam@gmail.com
Cc: ye.li@nxp.com, peng.fan@nxp.com, han.xu@nxp.com, miquel.raynal@bootlin.com,
 linux-mtd@lists.infradead.org
Subject: [PATCH v3 4/4] mtd: rawnand: gpmi: Add large oob bch setting support
Date: Mon,  4 Apr 2022 14:54:27 -0500
Message-Id: <20220404195427.8871-4-han.xu@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220404195427.8871-1-han.xu@nxp.com>
References: <20220404195427.8871-1-han.xu@nxp.com>
X-ClientProxiedBy: SN4PR0501CA0010.namprd05.prod.outlook.com
 (2603:10b6:803:40::23) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b09a6714-46ce-4460-c034-08da1674f918
X-MS-TrafficTypeDiagnostic: AM6PR04MB6552:EE_
X-Microsoft-Antispam-PRVS: <AM6PR04MB6552F28E3AD91578AA43E25E97E59@AM6PR04MB6552.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YecNvyp9sDywUHshxT02eVku5vsS2+7COqeYxXRrMgw57NJS1RQc29hDBGLtD8eaF516QRnp9RRS1pWshNiaZs4s4iW23phhRbmCkMWARgvG+IDJrhn5VFaRxxE2F14hk9iY+boTjSwHBEtAwWCn/DA3FtLsnlUuXRi4M2CM77bd+1gPpYq0Bh7HOQweyiwmqGA7Uyvklf7wfmWokShLzB9pMrwVVg9/63firSjfBYoMcgaPArEfFtsh+nLGO0oNFKg+5LSRe5CH7Ecqn3abvyUFOsDCo+K0uBLyrb5tpbDq5TBdYenm14dIHbSqF0bnhWqnQ8cvxzUQhTm+9MlDdoQFgcAXV9FHoQXu0KBf5yGYyDn4rOIRzyM3tAeJniEKhgD/OAabRlm3QZ1SZZ1CpX+bZelpqsPkYwWuVA7d+bEsBHpMk6F3S6/xiCuolT50JUxWQf2WtZPb4mqMApAfjR0PBAwkASvUZvsykCmNJUXCoJNcTLQsdfobQrtV0u1R3r/Jr7aF6lGlxrgx/Wu4drLSQbUkAzFA02HW2lkzOOLkkS4TimSmXK0cW15bEOxgQum52cpXBy6NWi/H9BSpV8P/6cBOMRMPkHKmi1F7YaYOhF+CWw0rawzDn9HcR5edzAZ93yI/BwkRNM5IaUXcQ9ZK+jSOHocjDJbHWvFqtmC+ji6Gk8KDr8I5koEiqeA8KJqyIm+y6jKQqK++MFni+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8774.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(8676002)(66946007)(66556008)(316002)(66476007)(83380400001)(36756003)(1076003)(26005)(186003)(2616005)(38350700002)(52116002)(6512007)(2906002)(86362001)(6666004)(38100700002)(6506007)(5660300002)(6486002)(44832011)(508600001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nuStsyDW/mB2B7vUr+c+N37t2pxwjPSyC9949dKYPOlQZG33OYUhiJ6dAjPN?=
 =?us-ascii?Q?RXqmEHxWLunQ8g8CVbV9qKumthoVGRpbKrMT8kg10JwkYsi1C7oMm5SjMuR3?=
 =?us-ascii?Q?3uqtc5TREo8uigtpNdEP5QWtv1pXjQDnjtf9m81tAr94V71HNC2jhYEfLKWj?=
 =?us-ascii?Q?wVloSfO+1hQPBk4TstsKlttl8jZwRK1MBVFqqcddQSmHy8hdGSud9/SWDDBU?=
 =?us-ascii?Q?PhGS6HMJZ/5oaNPxukFCwe3bg+13qBADcJyGBRyOs/2oKwdP8wkAHqPyHP/y?=
 =?us-ascii?Q?JVCz8erj37DM2aKZt15wvfT++VhKrjVyO/llwQ9fN88uShySWnfiOraZBP+h?=
 =?us-ascii?Q?kVRFVsDZLFX5gEKl6mu9lPiDeHUus+aXZNnQ1R1aE2gbSIo6TNHK36om0JfF?=
 =?us-ascii?Q?JoaT2OymVJFYPI2F99eKM737bi0bhMhyCIuw/1gWEWHOv7J88W9gGdtK8J6X?=
 =?us-ascii?Q?KLhlTZ7qw3A1JTf9z0Qas8MQWhPGjrWPhljKF4ILca+x4ZevlrG1LDxxvHMI?=
 =?us-ascii?Q?7zz1hLMFAlx7ovmK6V8bw82oX1tXxd2AZfT+k6BCwMgSdeZn/tvPwqThoTtJ?=
 =?us-ascii?Q?x/6s3nCpANvgWtdvUtxHA6IDoxpuN676Q+L5/eAGwVPl+7cmwRt3VJ3mDRkM?=
 =?us-ascii?Q?YwOEyijqI1qYx1EK7c+oj4X8CiBJ1UWzY2xd0BJSoO9wdCKSzorACq/uY5uY?=
 =?us-ascii?Q?/2+bK+zkzq1iDHP+Lu0FS/tiqDLvxm2hwYIGUL4Y/GEAbPLaXit5TiK61OUD?=
 =?us-ascii?Q?zzKw82seaVdSxyK9lLcihaOkSJFYArYs/KhqQdNJJIs220i136H1yNSeR3IW?=
 =?us-ascii?Q?yzUyb31SPDGgDGVLlG0qnzhlSBrUtnCAjY5Rarf5mxq+9ncUu2AThQf1fZ6y?=
 =?us-ascii?Q?ABh9H9vKtDsIf1OWxlGWgk2W6QEnnFP36u0D1ImuLffDXLZTfL3rf3UNHoK1?=
 =?us-ascii?Q?3bnMXtsXAk8BTaHfngUxJEcLbQcX6yeib9qoawc+/mZ6dhgHTI4Afc3OeU6G?=
 =?us-ascii?Q?5eXyviVycVqbitOQVo01C926VOrBQYZSN8DKYTx9nkKsJlDWo//nfFMCqNxg?=
 =?us-ascii?Q?Sqszcq5feq3Phj+vqw/ioJu9//ftBfCKMLgf1pp6oDCGcr03Ha+XVpdOP9+m?=
 =?us-ascii?Q?GRmwPy5EhpMQlxJ030EOKMHYEP/JN60vfzXLJ0hl3+W0UQgbqz+mP1EkETZj?=
 =?us-ascii?Q?2jMJ+zg13joPlPzLoH7vQ3MHYbqp32OqLsm17v4Uc9c+Qo9/wffEP6skurya?=
 =?us-ascii?Q?U/YK6Z9CubcUiSHkmUCpoOoHVRLN/02f+ffjgyHY4PwgFFeupDlYVxtDEpmr?=
 =?us-ascii?Q?D+lHkhVQONNoGf6NaHt41Z+8XUx5jaVm4KRzSAt9xq3zQOAR7Km1xRr9JCMQ?=
 =?us-ascii?Q?X9lNICdBY5AS4LS5swS9av8uAoxnxoKq0r6WglpIZxiMtAvHQscmqWz5PD09?=
 =?us-ascii?Q?799Nq43vjxRTcsw6WXd72e7MlPN+mnAMkoFHt9vQyVvY5ecjNnoba5DDPvdn?=
 =?us-ascii?Q?ibOd+Zn3aathPM2C1QQrNGkls4vk5Wo4lk+15UiZSv/3cUpQ8DBJ4By3HE3B?=
 =?us-ascii?Q?byBldllL7lqRxFg5TwZKRfleHVauwxap8SSN4NmLZF+xIEcH4McDoykQpw9h?=
 =?us-ascii?Q?UH38ODZMclti/kwm+3aA5ODUgLcrZEqpZKFF6KqOvsOTnSqIy5AKbnOh0kNs?=
 =?us-ascii?Q?5Vzcro2wDCzg9fXRhcPerJ+w95muDlmMch2CfTRBw6+XJnwbJtttQnw1vueq?=
 =?us-ascii?Q?L2p4S8+dyQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b09a6714-46ce-4460-c034-08da1674f918
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 19:54:48.0168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BhVpBsox6mFQEAlmm26iseGDEt6dtidZSZ3GTVhhcKFkdiBn8OiFT7PRaT/bVy6u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6552
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_130931_013596_0D9CAA7C 
X-CRM114-Status: GOOD (  26.54  )
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
new way to do it. The general idea is,

1.Try all ECC strength from the maximum ecc that controller can support
  to minimum value required by NAND chip, any ECC strength makes the
  BBM locate in data chunk can be eligible.

2.If none of them works, using separate ECC for meta, which will add
  one extra ecc with the same ECC strength as other data chunks. This
  extra ECC can guarantee BBM located in data chunk, also we need to
  check if oob can afford it.

Signed-off-by: Han Xu <han.xu@nxp.com>

---
 Changes since v2:
 - calculate the ecc strength from max controller can support to minimum
   that NAND chips required.
 - split the variable rename to a single patch

 Changes since v1:
 - split the large oob part to a single patch
---
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 199 ++++++++++++++++++++-
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h |   3 +
 2 files changed, 197 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index cdbf0e05087f..bad261e1afd6 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -273,6 +273,39 @@ static bool gpmi_check_ecc(struct gpmi_nand_data *this)
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
+	if (geo->ecc0_chunk_size != geo->eccn_chunk_size) {
+		dev_err(this->dev,
+			"The size of ecc0_chunk must equal to eccn_chunk\n");
+		return false;
+	}
+
+	i = (mtd->writesize * 8 - geo->metadata_size * 8) /
+		(geo->gf_len * geo->ecc_strength +
+			geo->eccn_chunk_size * 8);
+
+	j = (mtd->writesize * 8 - geo->metadata_size * 8) -
+		(geo->gf_len * geo->ecc_strength +
+			geo->eccn_chunk_size * 8) * i;
+
+	if (j < geo->eccn_chunk_size * 8) {
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
@@ -422,6 +455,134 @@ static inline int get_ecc_strength(struct gpmi_nand_data *this)
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
+	geo->ecc0_chunk_size = 1024;
+	geo->eccn_chunk_size = 1024;
+	geo->ecc_chunk_count = mtd->writesize / geo->eccn_chunk_size;
+	max_ecc = min(get_ecc_strength(this),
+		      this->devdata->bch_max_ecc_strength);
+
+	/*
+	 * search a supported ecc strength that makes bbm
+	 * located in data chunk
+	 */
+	geo->ecc_strength = max_ecc;
+	while (!(geo->ecc_strength < requirements->strength)) {
+		if (bbm_in_data_chunk(this, &bbm_chunk))
+			goto geo_setting;
+		geo->ecc_strength -= 2;
+	}
+
+	/* if none of them works, keep using the minimum ecc */
+	/* nand required but changing ecc page layout  */
+	geo->ecc_strength = requirements->strength;
+	/* add extra ecc for meta data */
+	geo->ecc0_chunk_size = 0;
+	geo->ecc_chunk_count = (mtd->writesize / geo->eccn_chunk_size) + 1;
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
+		     geo->eccn_chunk_size * 8) + 1;
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
+	i = (mtd->writesize / geo->eccn_chunk_size) - bbm_chunk + 1;
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
+		"ECC0 Chunk Size in Bytes: %u\n"
+		"ECCn Chunk Size in Bytes: %u\n"
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
+		geo->ecc0_chunk_size,
+		geo->eccn_chunk_size,
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
@@ -557,6 +718,14 @@ static int common_nfc_set_geometry(struct gpmi_nand_data *this)
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
@@ -1440,24 +1609,44 @@ static int gpmi_ecc_read_subpage(struct nand_chip *chip, uint32_t offs,
 		}
 	}
 
+	/*
+	 * if there is an ECC dedicate for meta:
+	 * - need to add an extra ECC size when calculating col and page_size,
+	 *   if the meta size is NOT zero.
+	 * - ecc0_chunk size need to set to the same size as other chunks,
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
 
 	ecc_parity_size = geo->gf_len * geo->ecc_strength / 8;
-
 	n = last - first + 1;
-	page_size = meta + (size + ecc_parity_size) * n;
+
+	if (geo->ecc_for_meta && meta)
+		page_size = meta + ecc_parity_size
+			    + (size + ecc_parity_size) * n;
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
-		BF_BCH_FLASH0LAYOUT0_DATA0_SIZE(geo->eccn_chunk_size, this);
+		BF_BCH_FLASH0LAYOUT0_DATA0_SIZE((geo->ecc_for_meta ?
+		0 : geo->ecc0_chunk_size), this);
 
 	this->bch_flashlayout1 = BF_BCH_FLASH0LAYOUT1_PAGE_SIZE(page_size) |
 		BF_BCH_FLASH0LAYOUT1_ECCN(ecc_strength, this) |
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
index 5b217feb0ec1..c3ff56ac62a7 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
@@ -42,6 +42,8 @@ struct resources {
  *                            which the underlying physical block mark appears.
  * @block_mark_bit_offset:    The bit offset into the ECC-based page view at
  *                            which the underlying physical block mark appears.
+ * @ecc_for_meta:             The flag to indicate if there is a dedicate ecc
+ *                            for meta.
  */
 struct bch_geometry {
 	unsigned int  gf_len;
@@ -56,6 +58,7 @@ struct bch_geometry {
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
