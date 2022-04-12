Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61840C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Apr 2022 02:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9GYdQPrO+gkFA8FDgK5eAc0eMzSWrcO1n6w1JNQqK3s=; b=JMfHX6bkufWdjz
	fjUFL41nLi4NBLL1Buv/29d+fwFj4DokIlQ/PXMnmiNDy/9alcAEfqdisJDo9MDuaVAnCcadmTpOB
	ori1qHNCFC2FayErkT2UzGoSsc+rDxmGB13qcwTl7QjZ+Jgy7ZjP1Rs9A5ySpg1d7VGopYfvWcQlf
	S8KLJlVkdCfQALh2wINE/CxWlxb/O4qg1KT/9RI+l+S/klZ10OGS7Z8maDLw9r4NK/lQCDAw+9BdK
	SBTQYp/P7TQY0Ay2EE0hrn40e1V2DMD0dMeaUlCPf0YCJ8VYtmXS/xWur9XyzkkKZaz2TQFuklvHb
	B+YaLXKMKEq8vfBKAZRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ne6fB-00BLgs-N9; Tue, 12 Apr 2022 02:53:54 +0000
Received: from mail-he1eur02on061c.outbound.protection.outlook.com
 ([2a01:111:f400:fe05::61c]
 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ne6ef-00BLST-Sw
 for linux-mtd@lists.infradead.org; Tue, 12 Apr 2022 02:53:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cvh+tAbFdKnFGpQK9LLECkqeBfkhiQg/FKhLqE6y7PQW6KG1Ed1JV7b/5/SUDJ7Ef32gQMyMw6/HIMOQMBvHV8L1iRio24RY1Tgqi50T2inWv19sLRleS+WvF9x5HP8kHWq4kPQMnxjh3DMNKjOJjtkv0U3tvmlNYffmrd6BFQeGlL2iafi+UiwMJPw2qp+SlSYyrrpn//gJ2elPh8JuqhF9ct/9H+o/H64KlfoV05248yEXPotaUw90q4fxqUgjOOH4P1oOhq6n98Mie8m8CaBsvhJSFyRPezWN+Duk8kpQizrZ2ldLeEH++AGIzwH1meHVPyRXLkrzk0/sZ8Zn0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xE1PjYSTS99ZQ1wkNdaH326KXQSKrvFTj+tsti2r+Tg=;
 b=lwT3RMbGxu8CBD+j3BNraPi7IUY82dRckM4vrVSI+kkXYqcSL1eIXA4EgbsapWUjNYVmmbSA3JiHRL8bU4O0YJbFs3K+nzktIIgnPx/LZPd+CjHpgof26TG6y89H9fdLIpW/+RdgFvSA8U32qzs+1Z903a5ZD9/Jpe9C7CT37x0IC7su+Gm6XrPKJhmJQ0J29rqpdFVMs4mP5eukXQOQ2l89/7BirkKiz9nNo4ulc7kQYX6ajgDk44uF6Cw3JivxgYpYgEgpzdeGh/bLmVHcGah1DNw3V9qqvguqR/feUVa4bVuTumwGP5Tky/gufug3z7Q71ckTeUoFh0LbtcdT9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xE1PjYSTS99ZQ1wkNdaH326KXQSKrvFTj+tsti2r+Tg=;
 b=RfXoGUpjN3nzeDgl/wKSQEPhjWz7Na2L53T8zQK0OJ/QR1dUcR2QAS7DHq0V5uYiasAKxDp8mzyzAsccqjFzqJ8hPSx2WegQXy9ItC4WPL4yGeMYwQ9LOHL6zeyD2fKRz6IMyiTCbW2pZQp3H1NRV8EsJAqSOgqxGNKL9uC1VlI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by DBBPR04MB7867.eurprd04.prod.outlook.com (2603:10a6:10:1e5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.30; Tue, 12 Apr
 2022 02:53:16 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::644f:b22f:2f4:d69d]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::644f:b22f:2f4:d69d%3]) with mapi id 15.20.5144.030; Tue, 12 Apr 2022
 02:53:16 +0000
From: Han Xu <han.xu@nxp.com>
To: sean@geanix.com,
	frieder.schrempf@kontron.de,
	festevam@gmail.com
Cc: ye.li@nxp.com, peng.fan@nxp.com, han.xu@nxp.com, miquel.raynal@bootlin.com,
 linux-mtd@lists.infradead.org
Subject: [PATCH v4 5/5] mtd: rawnand: gpmi: Add large oob bch setting support
Date: Mon, 11 Apr 2022 21:52:46 -0500
Message-Id: <20220412025246.24269-6-han.xu@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220412025246.24269-1-han.xu@nxp.com>
References: <20220412025246.24269-1-han.xu@nxp.com>
X-ClientProxiedBy: BYAPR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::29) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3bc993b2-2c56-4f27-cc21-08da1c2f97e9
X-MS-TrafficTypeDiagnostic: DBBPR04MB7867:EE_
X-Microsoft-Antispam-PRVS: <DBBPR04MB7867E66DA7324320C2660F7897ED9@DBBPR04MB7867.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DXWHRttLAxyn1MM+mMFZ7x71AVfnPMIGBNRd3wgtPHA3gQX+nroRIqeQm5Y6Y7Ig9Fa+DD7ecIUOInU5iuFRUlGn+srMzi6AdPtAU+QfUff0R0avnKBItvKp0TmMxnOYIQ+0CybCqbxBM+1mbOvU5PmiXM1IcaiAvi5Yr2mZSjMVi6+9muYFqluCajJQD/WUdsM2z389TSqoPWqyqQJbsCc5kMGjpOcLTnT5ILlVbd3lBbDUSeA20ii/8teqVDh47KJDdapi2Is7BaccnVQtzvpkOwBYNt7a5KQ51tsEWjmccRoVRHU05MBO/zJtPj5DxnxUYvuwmWW0lbEaYaZ0koS2bzQQAa7n38w0SKF+W/hzSB6tAPmPtlJcmIVsZ8v3H70MwYlwyGS8h4L3bLBeHNPf76DV4zD3oMkOqoFu8CAgGkyFDLXBC/2TUgI52Sdx+Pc4ZAUZ1BBZK2wp1U6qYsUFNGaxPWPOgj8EdpvoG9fVccAAmCmnjT/kPK3eZCuo3Z16hFLN4oFeUl/zdMU3CKJY6vQjWZjmbIw5p8eJ9UJ+kkQIap4S+mRNnZPc1mTR0OhCF15CtSeXhHUck3fYQvDi7rOb1riU9Z1P5vABa0h0+UVHAnoaMhe3X6xy+mffP0Xa3VoFsQD7LbgAD9W+1/2xNnekMS/CtNFDOzDVbpoILBNSdnV/wMZz8ycbT62CTRuUn8krF5BoOlGhcc3roQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8774.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52116002)(36756003)(6506007)(38350700002)(38100700002)(66946007)(66476007)(66556008)(8676002)(83380400001)(4326008)(44832011)(8936002)(5660300002)(316002)(508600001)(6486002)(2906002)(86362001)(26005)(186003)(6666004)(2616005)(6512007)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zfPd3xd/BABl4mkOG1xV+1MmN7pLg4uwLMY1LTQOjIy41ywMvdRlVt4Vt00V?=
 =?us-ascii?Q?enZ981u8MTnkDQ6gNtfGSHr99Uqql/A+1xrLsLziE+06BPLiH4sWldEPjKg2?=
 =?us-ascii?Q?JZxLeldNemgrNFr2Uo4oQs1izzZb0RIU0xmnjqnsCpSmxERiwLjJC3ok/eR9?=
 =?us-ascii?Q?dCa2yAi9LBx6/JAXGQM6EFoUQMukaAgv3wHVZY8bEQBkIhOkddzqh9egjbRd?=
 =?us-ascii?Q?0oyK/QOruvXALk1P5PI7KojpbaYzloUbuRtl7Bcl2wLo4mNGLmVEaLUXLAzA?=
 =?us-ascii?Q?ey9C/1M4oQwfSmteitzR6zJC/6XETaQinX3TjEuJv5/aArQ/2UAcCK4/67wi?=
 =?us-ascii?Q?dkea54Jui3D2VIlnZ82115NihPKtOgmjj20MINPWXyesonzpBsgPEg7++V+D?=
 =?us-ascii?Q?qM9h8rBAv/xBpPju8t6SVzeO641I/e8H+NlVvV6Tw5S1q8DTkh3YmgZlAD7l?=
 =?us-ascii?Q?pG9VM+wadBD+JjgLYm7tTJuR9XdLBlKGKHf5LanceD2MB3l0QE9UudTcrV78?=
 =?us-ascii?Q?Kmr0JgS+sBLONGy7lVFTSodvVjv/RPGBbsVIj6+vH4MeNvWM+CBAX6JeTSKq?=
 =?us-ascii?Q?AX/fY05Z8szoW4Zus0y0Oe44To7pJ741ruqAMa3wF1J0WJBGhB0aIo0gsyN4?=
 =?us-ascii?Q?enzIcz3g2GEMJz79r40DskB6DpTD6wWv/tPWdDlZqTqDlkxREURt63zJdNOa?=
 =?us-ascii?Q?gBKC9S/4lalo5rz1NHZNRmbJBPLubmO+IK0DEPSsE56JmXWSbv8ffuQq8eqX?=
 =?us-ascii?Q?xL4vPDSKMRSfKK80pXKVwjEbtwlPs9LrnNu0S6YXkIoDFlYSzQpg4s2HuE7J?=
 =?us-ascii?Q?+xwg7dh2m+f7mg0cXGsP7Fz3MLqN5t4gbyMSAy8QcVRZn+qod8lXvWg6wtLH?=
 =?us-ascii?Q?4yPEdqaQo7nFYckbv1VP2Z+pNiHIkTGimmvbIl5mNglk+Co2gwlSE946P5Yk?=
 =?us-ascii?Q?PRzJfyNDnxcmmv7Z4fIzI7fbMxbwE5PuRiG0+OZbWYQ4eRmYRlQxEiGieB2p?=
 =?us-ascii?Q?0+H7LZ9uxvpkfWn0JKHQ0X8Kp6j71MHWAQyGtJCXND0LkJs1CzKIH6cKWhCk?=
 =?us-ascii?Q?m7XPUYigW4zWPxPnKjUYwwvwpa4tKFPnjfCsIULnzSh12T6VaKiXM/q4FAIP?=
 =?us-ascii?Q?hFqAfdSzF675U1HObrx+VrkfbpbcUmY7lS1geLlEYigIO9PstX21ucmg9KMM?=
 =?us-ascii?Q?j6Cgvylvkeam5Cm+NRm4+zMLn1uGa4S0lFAASIhGwfxK9VzqNRItUB8/wLrD?=
 =?us-ascii?Q?FOWnfRRUEoK/b6+fT8x+XNPSZKRt+6t8dVPBb87QHv8+1y/uAqLcEWCS2xvp?=
 =?us-ascii?Q?15fi57UBiBXNcD9W9nJRp6B3tduJ4bvAL4Z+0SycU47yI65BH1OWkSHYJJLU?=
 =?us-ascii?Q?8xL8/Dk93y/XrVrO0nXhxQTe/GJ/fPTqjkfCyRRNPN8nMsXcPiMbnjk7gNBI?=
 =?us-ascii?Q?Xtk2StBoNWO8iJkG2RjHCCFnhuWC4jSeQdLxNMK7GM5YQy039ihwVsSULZII?=
 =?us-ascii?Q?RFlc6VqDZ9/oSQSq5Mha2RPhhGZVmhQTOpGxT9/o6UXIOnKfUqhJ+qXGkU4S?=
 =?us-ascii?Q?E2s5SuYRBhgPatksMLEQUHmKTDTv6zf8lRDlnerm9cMiAYDqP03wEL9ZXwok?=
 =?us-ascii?Q?UErBCfylSF3M+RSguhERUtT0Q+rCFBwm9KB6PkfteHwlSiG8lGNjS3tDfKJn?=
 =?us-ascii?Q?q8izP6pLpIw1SAyW1fejJHLnmoQJoShAdbYN8yTX2+RaU5M83nPEgGW7r/q7?=
 =?us-ascii?Q?4+8kXDqFSQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bc993b2-2c56-4f27-cc21-08da1c2f97e9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 02:53:16.7036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XknfSz1GAw6sgVgbd4XHEUCYAWerXHG5NnXraQ09phcStZXLkTIhfEyvTgavkB23
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_195321_992918_12EF7F30 
X-CRM114-Status: GOOD (  26.76  )
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
index 1ac0dc8cae22..0b68d05846e1 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -266,6 +266,39 @@ static bool gpmi_check_ecc(struct gpmi_nand_data *this)
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
@@ -415,6 +448,134 @@ static inline int get_ecc_strength(struct gpmi_nand_data *this)
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
@@ -550,6 +711,14 @@ static int common_nfc_set_geometry(struct gpmi_nand_data *this)
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
@@ -1433,24 +1602,44 @@ static int gpmi_ecc_read_subpage(struct nand_chip *chip, uint32_t offs,
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
