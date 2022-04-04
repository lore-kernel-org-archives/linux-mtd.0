Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF823C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Apr 2022 20:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gcjr3j9n/MQUjNc0Vs7gdxx8vIJfX2bRA/o+WRjX6dQ=; b=xlIvDN+88H6jJs
	3EiGprYtb3DKb0UBMEEXYUbgg2e1eCgQkTtSnAp0DLDRFcj1XgT1QyhvyK7Z66d5CoVacWmvDwnc+
	3Vn7ul7948tBeYEyVswvRXGI+/8Ql8KMu1BzSfniVtnDN5n5wYUIYtLZ1uBbwJy0Pa+X8MdwLNKcS
	ffQSoPgYBc1pGsyetqUXL98jAc6NZIi/02gb7z1vj1I9iZi+0fM/wXovU7Lwa7oodeG66iLoWzK0M
	mM1h+Q6zOa4aFPwirH22TsIYYpXhnraOqBP7B/JCV4HvHeFZqAaebdHMGguDP/D4KCO3YVelL4+AA
	QldtJdNryO93lteGiKwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbT1m-00GKBJ-2B; Mon, 04 Apr 2022 20:10:18 +0000
Received: from mail-vi1eur05on2061f.outbound.protection.outlook.com
 ([2a01:111:f400:7d00::61f]
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbT1i-00GKAA-OA
 for linux-mtd@lists.infradead.org; Mon, 04 Apr 2022 20:10:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UiymYYbKWA5kI1Xu8TZ2WZdOGdSaNUGyBBz3+qcSosVMbjumjbYmf+rAqY/sj6h/ftHCXjsBMiNuiSFueF+OMP+2fPCquI4EW9Ob5JB+yn5TN7XyCO9vF2/EWE1hGXn7t+++9VWgwKaCnqgmtGk2J4XHhq78LKRdfgiTyTu9/+1TJ6UCtuNggsD1AxkqwMrZkpqThzIdJwKQ6paW3CvyC4jf9fqY+isw4QmiWwKIqdtyHbnlSRXV5i5fD4LEi28K6XeW8ZPOtX8ZgpzKRJvtxz60UwWIbbjRWOll6idL0ZdQSD39zJAzcI8BKdOdnGuiVIQlqPpWZVpT2Q8xqqQq9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqdEMlt5lsSw1hyIJp+16Lfm1PrSDbuE9kqGrKUvBps=;
 b=P+/LZgPUPo3oZTa4+Oqt0ED0EBaZSsX6yy+irYHDRBfp1V+0vNPpQF1j1GUC8pld2jTNxykFupfgS2Kf/zk/7jD6adBM4V8GBJp6j6LTGbfu/3A7HyW1pvJh1EENfAMIODLKYy6RA8a+U+6oak8Qw8i61N8GZzSeu1itO5kkzUQCpgzb5LaJYP/4+ZvJqKUzo76NaE0qJrfaLkr3NFXt4+MWMjZntQvU5CeHr3EFO66oOFNnbvjzIeYufSq3CN2iYw23qEZm9imtjsumEQV/Ew49SFFNHT4ZSeFIg1aIGa4afJMumbDwu5HqJeLpMfikPkuMIxTL/Sq4hlWUQVeneQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqdEMlt5lsSw1hyIJp+16Lfm1PrSDbuE9kqGrKUvBps=;
 b=p3V7nA8Lv3Eb3IVs3WWCrwE0xj2liY8Hq2ur9R7mXMGnDgddnui71T5GkwLvlQBnfGLBNODzKSGBjjRDe/76YuimHWskmy7QWgNqz87XG2BxJBx+ASKi5G3nrTtLxJia+Uveqi1bKxNVwDIEyYtEmSjkzNzPuzrzkIp1WKNtY1A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by DB8PR04MB7164.eurprd04.prod.outlook.com (2603:10a6:10:129::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 19:54:42 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::b048:39cb:7748:ed56]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::b048:39cb:7748:ed56%7]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 19:54:42 +0000
From: Han Xu <han.xu@nxp.com>
To: sean@geanix.com,
	frieder.schrempf@kontron.de,
	festevam@gmail.com
Cc: ye.li@nxp.com, peng.fan@nxp.com, han.xu@nxp.com, miquel.raynal@bootlin.com,
 linux-mtd@lists.infradead.org
Subject: [PATCH v3 1/4] mtd: rawnand: gpmi: Refactor bch geometry settings
 function
Date: Mon,  4 Apr 2022 14:54:24 -0500
Message-Id: <20220404195427.8871-1-han.xu@nxp.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: SN4PR0501CA0010.namprd05.prod.outlook.com
 (2603:10b6:803:40::23) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd8eea88-3f45-4091-622d-08da1674f568
X-MS-TrafficTypeDiagnostic: DB8PR04MB7164:EE_
X-Microsoft-Antispam-PRVS: <DB8PR04MB71646E1AEF32AA372C2BB57E97E59@DB8PR04MB7164.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sf/eO+pX0ehPFA90KykTDImk0tWEuaaA6TnHFzs9fbe7vjbW56xp4e2Gr+Ab9z+6SRk2GDzAf5K9FN8uZmS6+St1m8bATIxaOimjbZBMk4PxxXp0SLQM51GJkt6Kp1FnfX/T/Ig/eVIq9k9371wEA/Ni4Gy54/acM/es978VmtRPexa1XGreC8cjDEb+Wju3xCvz7p2e/de0jgOlOWA0BGCYHk/poE9t+dr7DdCPgeP7RcXGHJu1W8B9aN5dx5POdG2G4fjHw2m9kDAM1Yv6ofuj7PJ4ArE3wjj4cqDOEv4vwPxP7O0FWONOLlbyki6Igo0SEIWbHxcUj/4SFjdhZykHsCOqPYDrx0tTBkR1z867kWoeu8coptFSacBOioQbDVZbiY3BKIVOGFU+9lKvhzmGElrtiXDEUVttYb59JTqIVcXCMzqVQEHxyxJVCIjCh/LYKuN7C01gIr2FfLFdTXz2DvC2oofcR4SP/xtbc4IDEHrZT1yqAapzhn7BSm/vSVGLaUPGyxvfWqIomrnO0GQ3c7AXwiJEZYZFfM6AhWYG2qA+CaCI+xlQgNNSfT9l+0MsSnLlOzW+hxiKJCAYD+/6c8E55YB9AsYaPTibRm+jqAcfPErf0CiUtAxCPpSbL/vhaSzz6ZG4TJ2NaOM2I4eKuI1BmW3rakuAxMSy2xAhyQEXVBsPxwYAOnoqruPpt2UMuAypSFEZ37K89fZ6NQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8774.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(8676002)(38100700002)(66476007)(66556008)(508600001)(66946007)(1076003)(8936002)(38350700002)(6512007)(52116002)(5660300002)(2616005)(6506007)(36756003)(316002)(2906002)(6666004)(44832011)(186003)(26005)(83380400001)(6486002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CPWfTaORuZKYtLmutcjR+MTQVQMVPkiN6K5WCkw765Ydk4qA4uRSbhfMcssq?=
 =?us-ascii?Q?gamQjlc/1r4O2ZM+Lfkn2pReiAZbnbduUcGzIxsXvt8LGie3qVJ69dVb5kDE?=
 =?us-ascii?Q?T6lOQ0qwDGNLZxZ3JJq4RIoXc+OeSLbe0/C7Moy33Flpt9xbp1f+rstSOv81?=
 =?us-ascii?Q?sv5BNs83q71i2i1XjwXdjZ4zQ/PydG3c2QSUS6BiO4gy3ICUlM8EtqdCqMMU?=
 =?us-ascii?Q?7W0jZ/GzGHy7Tmqx/pvKmtg1Yhk4fHsqlojazyr/FMSBOCFRZ967zz2sghRk?=
 =?us-ascii?Q?ABHvbgbafgCR2R4HNUYxxrRbJ9n0ppT6sMZj7rYDxeWtjsWesT9WCkMbdXTt?=
 =?us-ascii?Q?mudEvfaB/+D4ZLcSlufofb2s7EeZuBH9IpJKdJXDY5EPRFp4KK817cb6mjC8?=
 =?us-ascii?Q?l/g7pAF63lCeNYCzlaPLPrU1xgoLqEIWTIJ2/ZvWENctjk4olQtHPjPxc8w5?=
 =?us-ascii?Q?C0rZHQkYjhixiaW5Lx0Qp7Rf2WAOH+mu1nt+DNixzwUW/hYn3Xo1QlnD8P/e?=
 =?us-ascii?Q?HOcwja/BNqFZREifiEMqoFHiP37timT6ph9lJXtvR1xTZ2pyRK8W4mT/BfUe?=
 =?us-ascii?Q?A7L9fBsz72j+JV0w16rP5VC9KE7mHA2F3Rkcwn7ZZr8pYAkdcRzfjQBPqfAu?=
 =?us-ascii?Q?NQRgEZouJKcIa22QxVePbZfqHKQrpHbzW/l/JHo1LLQarognQMghx84jEF/w?=
 =?us-ascii?Q?hwR93oJCuTo6GsXkTDQq832tHbB/Nr10h4ZgN5986D5zv2R49uC59Ouv5mwJ?=
 =?us-ascii?Q?d7S1B7DVCNr7r0IDnlJH1tYgSXXiHNLIharfjH44rkhnA5q6BWKXOL1sQcKM?=
 =?us-ascii?Q?gy/J8od8V+EbJmsFX02glP9F5gHRR5xlPR5EcVwb5K//n4nI2qZtLvjDmZHP?=
 =?us-ascii?Q?E4fcCqf796xrThxkTYfND3vZBPN9tbMM4DiYuO1Ia/8AfO5oJf1Upm36AjqA?=
 =?us-ascii?Q?Pa4NTZ7L62lB8/mgTkzxpnpPpu6wk/qqRXTwrVask81fCJ6OQuzNEVwRDuh2?=
 =?us-ascii?Q?rah7Ycf8wR2SFl/fksmiwkG+TdG7/UV2cxTKskiurmJt73TEhRTGhCiI9OVY?=
 =?us-ascii?Q?uWVOuH1vlHaMKSRbKSAKVHxbiYe+xRtIt8tPeec584XO7YvzgTZ8dPDVSjjA?=
 =?us-ascii?Q?hkZ76Ax0+zo+wcYDy7TTQyzyau2GI+D0AJfgAcQN8VL/FSTIndHmAdhl6i8U?=
 =?us-ascii?Q?SrdhBCeTa5wSIiMCHbtajouuBzFqkNSBHZyaR1tTesU8fGHZKJunQudbY0dZ?=
 =?us-ascii?Q?P9ZciVI7aed6C6uxAZV7mngcDalrlgtXDXc3Dh4aKb+W+GxQTN7Kg/krhA6/?=
 =?us-ascii?Q?RaIyffYi7dvEfeVLWESa1rb2xRP4Y+ZwvVZ4uX3p+5yV58oqHi9ebFjTU2Y3?=
 =?us-ascii?Q?o/lHP+1z4svjwcs4D0yCi8fIw9uDnCGYadGBdgiIXvHcpROqCeT6Ct6pe3GT?=
 =?us-ascii?Q?Oi0v4gZUIkQeOqiUOh2n3xyJpNeMUIrP3zS/vkrWDNaak2DLO1ULCidBchTG?=
 =?us-ascii?Q?37rDmCrVLvPQoFrj+EIpwC8Swo/TwWRqF7yXERUMlfFUR3PnpG+E8i1hBnG/?=
 =?us-ascii?Q?Hk4dZF+JpbZT9eJRwustbaUWpDhqRhriWXDGS8OswfBlcKUgD2fJIfvnT/1A?=
 =?us-ascii?Q?fNuwB1HFJh2s1/FOMU5Fu6IMnIS/YR2Fme8zK8ONpuz+RcWXTQ4ijj0Zqimf?=
 =?us-ascii?Q?VvgmbMtU7DbPABsDJNv0TEbUxdRIrt7QR0IUhRFewuCsRPjLI05UzJgSBUqX?=
 =?us-ascii?Q?veIirDHrdg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd8eea88-3f45-4091-622d-08da1674f568
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 19:54:41.8590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4jYEkIrQbmZqG5MqHgURXR6bAXvFuLh9ktwJMBqZ1meJ/4fYoJaja8hYx+3kyAmw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_131014_826899_5EB557C9 
X-CRM114-Status: GOOD (  19.09  )
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

The code change refactor the bch geometry setting function, which still
use the legacy bch setting as default option, while user may choose to
use chips required minimum ecc strength by DT flag "fsl,use-minimum-ecc".

The driver uses legacy bch geometry settings by default, if the NAND
chips oob size is less than 1KB. The legacy_set_geometry() sets the data
chunk size(step_size) larger than oob size to make sure BBM locates in
data chunk, then set the maximum ecc strength oob can hold. It always use
unbalanced ECC layout, which ecc0 will cover both meta and data0 chunk.

For all other cases,set the bch geometry by chip required strength and
step size, which uses the minimum ecc strength chip required. It can be
explicitly enabled by DT flag "fsl,use-minimum-ecc", but need to be
en/disabled in both u-boot and kernel at the same time.

Signed-off-by: Han Xu <han.xu@nxp.com>
Tested-by: Sean Nyekjaer <sean@geanix.com>

---
Changes since v2
 - split the ecc check to a single patch

Changes since v1
 - split the patch to two parts
 - change the commit log
 - add test tag
---
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 32 ++++++++++++++--------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index d96899fa90b7..4144d5937103 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -514,24 +514,32 @@ static int legacy_set_geometry(struct gpmi_nand_data *this)
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
-
-	if ((of_property_read_bool(this->dev->of_node, "fsl,use-minimum-ecc"))
-				|| legacy_set_geometry(this)) {
-		if (!(requirements->strength > 0 && requirements->step_size > 0))
-			return -EINVAL;
+	use_minimun_ecc = of_property_read_bool(this->dev->of_node,
+						"fsl,use-minimum-ecc");
 
-		return set_geometry_by_ecc_info(this,
-						requirements->strength,
-						requirements->step_size);
+	/* use legacy bch geometry settings by default*/
+	if ((!use_minimun_ecc && mtd->oobsize < 1024) ||
+	    !(requirements->strength > 0 && requirements->step_size > 0)) {
+		dev_dbg(this->dev, "use legacy bch geometry\n");
+		err = legacy_set_geometry(this);
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
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
