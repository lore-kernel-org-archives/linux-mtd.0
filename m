Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63A8C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Mar 2022 21:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QFdVR8VukcxNFsz4/yMC844aSR91jvxhaxGOh+nQzOo=; b=hFJ9mG4muVQ332
	tU0wn8PZ4FvILh2J9H3S61lW/KEawDr82vmAkEaO4omOEdzD54bcmCGc/x5jKovjC0HF6IHyyIxlR
	cRhG+q7xScxIIK2FgZ49lO1BEvSdhZJ9YKOhZq9mAtJby1YloK4uYM0NLgd1Dsms2exVAO9OfOgea
	uE8N7ahj7wAWTL8xiNW+hcZuwkzUqatNkWtfTy171HaQgkUaJSTcg6FZMSZjP9k4VUdiQwqrFC5LC
	TWRuklO+B393mW517Vj2dr+TQTcPseKnLdjbGKwByxv05XFxvNx8xkHgliMqEowLjpOAch0x+ffIx
	jYRlS02HC5rI8m4pPUDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXrGl-003Jod-1Y; Fri, 25 Mar 2022 21:14:51 +0000
Received: from mail-am6eur05on20614.outbound.protection.outlook.com
 ([2a01:111:f400:7e1b::614]
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXrGg-003JkO-Jm
 for linux-mtd@lists.infradead.org; Fri, 25 Mar 2022 21:14:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gQm1xmR6HfMEHOahBDhwupcZ6BCJ3XbDit7fvgHwdeOpY/ZzEj5PWQ/QaG4m82bkhs5scs4eQItytpDKMoWOgMAR+HQhf9FOOK9hcnYNBKhCg6z+Jkz0qrA5hE/Zx24ieYYSQXwRAgezX1Ccf4QYHiHUwTUXywW3QrO8i0p7YkpYSG6bbUYN+5WKDXKWWU3d+hJdd5da+G7e37C338wgtaX2Duw/8ThywDsNA3Wf8hWSmwe7dWse6mKfincL5skV6EY+8T8yN0Mt0zftvYOXB8vbobx4Lh4lnOo87YXZw7AqQxnBmRGzEjrw2K3lZroyWr7bTIxx1t7EeUWhe0Ie7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LHVfWG4GIYnsryba7r4Bf5MIS+6ZN05eyPh54mq/0jk=;
 b=SCW57MHCXEQQyB/m0yTpRW1HGja4B+Tg1l7fTk9jvujxA0nVoV/acQto6dVzHK9131DVppo+2iD8VjbZroPWLYjZHlSNp8CUljIaMNvTu9ohHUhwau/9p0nakg2J9uaup0uxseGGbBqbzzpztHecBXAw3pgrUadyuDUwg9xgal9tezXYk0Fc46ubdNj/GFHKACqpabwIlm0qZVN/802DDyR86Yz9NAXL/CosPWrDN1PaGREiJmDYc4kkjY1ni5OEADTDrrOA/kE0XU3Qwoax6Z1yfMHVJidML+EeqnO9N9HkmXzpFy7jnCkVU5z//UrcurTlKEmjTCi9qt86LUEmMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LHVfWG4GIYnsryba7r4Bf5MIS+6ZN05eyPh54mq/0jk=;
 b=SDCNWUrRr423GXeEWhJXME1F7Xs8zwhRoJvj9MJl5VYkpWGKjhe3vAOJz8xp9QQdOyCm9pKtlJQM2T0DUCXJJZL56A+4dIxxVUQgvrCjTAw5ePoN3jVerrPl8vyr0ys/bbOByp75xqSyCeGCBz/g2RZ1aGoYLGzc/VXdeU39VfI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by DB3PR0402MB3881.eurprd04.prod.outlook.com (2603:10a6:8:12::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Fri, 25 Mar
 2022 21:14:33 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::5416:5d1:cc34:ca9b]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::5416:5d1:cc34:ca9b%7]) with mapi id 15.20.5102.019; Fri, 25 Mar 2022
 21:14:33 +0000
From: Han Xu <han.xu@nxp.com>
To: sbabic@denx.de, sean@geanix.com, frieder.schrempf@kontron.de,
 festevam@gmail.com
Cc: ye.li@nxp.com, peng.fan@nxp.com, han.xu@nxp.com, miquel.raynal@bootlin.com,
 linux-mtd@lists.infradead.org
Subject: [PATCH v2 1/2] mtd: rawnand: gpmi: Refactor bch geometry settings
 function
Date: Fri, 25 Mar 2022 16:14:10 -0500
Message-Id: <20220325211411.30714-1-han.xu@nxp.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: BYAPR01CA0057.prod.exchangelabs.com (2603:10b6:a03:94::34)
 To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bc62685-d67e-4388-6a56-08da0ea47542
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3881:EE_
X-Microsoft-Antispam-PRVS: <DB3PR0402MB388154E95E996AF8013510E2971A9@DB3PR0402MB3881.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OX+ltEK2zuqkPAsTlj4+XstUjL9pUvxJWgM5PiVY4aI8L3SvBOPPVPNZngSM38xzujCo7QheYExmw3+K4VyCSWncLrlEyCpDoYSl5TNMr2bJsVZYVH8/76rGMuvR72pB/TA46TvZm1xwrf0GKFBMs7PWnkgOjOk565EfyPHb0nyjrAoxfTkW/CgAGUIkfyRXRc4H88978OHMu0iYKteY0ddESZDXZOrXOp9XXUEa8l1TMjfNwbRVk1EZIXtsO5RVBuSYF9xmiBwDKnacm4FYRAPzIlud1PU8XMaTpPyz0gmvddL9IFb9YQ5bRursY7cbogkBxrh/F/MdKrqRlAf+4aAZyiCczI30D0RIeAkUKsBfo1PwhMcEsCIsWVCDvM42r0X0fwGSRJjlYATqlt3pRvudc6wxU+eASGe2QbmwGEBQZCOPmbpTpM/UYKZsnpt+z1AqDDmtgazjDYOr6zT7TxnJJjWdqsAcHtwkVk7I/xXXWR+m2i19yFiLombSS/h7BoYKegWudlNjNHoG5Cv3KoyUrSQ7yznc3YEuyLwwqzKlaoqCTmtpdy9sYHl+R4dS05ASpL4FAk0zfO6N8LeCp7RqGiClSVG9YdUFgvz4ho21QQwfJRS3ezhjpNbzGkR6mh5P6HVHO8RLgcQfcxAAPe2axXeSfc9wLAc8fKySozlZJ9eFQo4I4iIjswNOurL8sW+mthj9qWVq9N1ekSVXZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8774.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(36756003)(83380400001)(186003)(44832011)(8676002)(66476007)(2616005)(4326008)(66556008)(66946007)(5660300002)(38100700002)(1076003)(6486002)(8936002)(6512007)(38350700002)(52116002)(2906002)(6506007)(26005)(86362001)(508600001)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SvAagNvFukpmmcz+MJh/gZNA5uSmguUxwkkHpoBdurPXTMl767zx631Vh6Ja?=
 =?us-ascii?Q?CrYIAynjDIKsIt1d4DkPugeS/6xqT6vjoijr1sr53p/u2TnAqR4ge1xm8L+u?=
 =?us-ascii?Q?6aOQxxhnAfET5ppBoQydWXNelBl1hIpCLrIVRfd+jDzBerl31j1Gev6SEVDD?=
 =?us-ascii?Q?2UAle9cbKukI2hiidAhEJGWsa76SJCJNi2HcCKMoKslXrSBGRBJCR6RVuEAU?=
 =?us-ascii?Q?OFnsvGl1wcTd1tueyTcsl21iUjaGo6yNnMJ71Ih+teESjw75wEe+qdT4fJHc?=
 =?us-ascii?Q?j+KMEDIBZthSHQPp+SV5hhg21teeCKflYQQFq5w8/kEAZJUum2vtccuky4bV?=
 =?us-ascii?Q?HYlj9WHd6F7t6RSufhDIcoxi6RH0B+Yk6IFo0mAwsyYheGD+rOdJSlV7ounB?=
 =?us-ascii?Q?pmIdy7O35wEOg3rfSPGjQ2tkgWnipsBAWfZm4bbSaNL55UavKe6SRuQ9Wuqq?=
 =?us-ascii?Q?p6hGhT2iPQMJsZqEtTHCvoDIHYUUdPuvWmNbE0JctJ9PZe4vdZJmnDavo1+Y?=
 =?us-ascii?Q?FHPhZDXR6rVJKs0+lQ+UepFejFYpRLwVtQ7HMV9xhbuUGu9xtTmxqWbwZcEe?=
 =?us-ascii?Q?kKLQVWTbnwQRvBpC/SGgi3MY2plWIYghoOZCfzSoe7nWiH9GAKMXeLJgdtYv?=
 =?us-ascii?Q?+8tM7PVAifk1a0a4sTMmQINVSAPAlL9kTT5Kg3R2JDocUrlDUoARTErpl7EV?=
 =?us-ascii?Q?6xG0hoiU076pTDvxe6q1SnM8eXGfRdWdLspVi/zmk3gpzBA/nZMvCTKARuPZ?=
 =?us-ascii?Q?EI/HK7hV4ioOyEv7wfjX/4tcnkT9aWF4PMuFd4aZY3yrCKIZL8c8Jso8bxmo?=
 =?us-ascii?Q?dyjT+786IDIP9Bq9QccgKBm4OQeaJUEB/o1e1Yfk9L6TYa2eDG+KT8a02zr2?=
 =?us-ascii?Q?ynIAxNhst6P+Qzi0YtBdUh8A9sO6ZFU/SvgCJ8wZ+ocOtdLeY8HzplrgPFfl?=
 =?us-ascii?Q?LRciQLQ9nIiwHv5GN7wFgCqjPh3JIX/n4jcQS9rVf0IUPJiojdrJ24Yjp9W1?=
 =?us-ascii?Q?WnBDqR2ehSIJ6mf6UvNDSG/YVr4lEu/atoGROOYzPh8nvDNvLYcEfEJqIA9Z?=
 =?us-ascii?Q?VHJgGXS4kqCCFpEwUESxy7v/WUjsrYIKNtGbzKc0v5V8o9JmL7PBz4/uAbff?=
 =?us-ascii?Q?3nUfpIFE8yMv89o7sV512kEHRA50SGSlmo4UY0sdG9OTdfAJ64FJTFb2HtfE?=
 =?us-ascii?Q?xuKeTJ0WLL+knmLRmdJNAwyKspYKXo1HBLR02Z6/+3C/d5WMd+ig853sYGd7?=
 =?us-ascii?Q?Iqn35ll22DvfXLDrLHJ9Utp+hzttmbPHtMXYjYAyBxOcG32oxYp7oWAXh0j0?=
 =?us-ascii?Q?wgTGWjGGMpSkI31W6KHdvMGfZ49uOcTc8mW0/FFpdCBSyG6UbsNhient9PZ+?=
 =?us-ascii?Q?vvwLVE8ozqDQydXtxu8MwHMOCeqeW63ohD99dDAHfrpnQET6y9GLcgfN8KHj?=
 =?us-ascii?Q?i9KrzxuA59Aku2oKcyZxLaI5Rv8nAWmHknu6lCLyfP3RePVvQNSA0RVCieFY?=
 =?us-ascii?Q?anXRX/ynQY8OksHGQ1UVErUmx3Z7cz8rB/+vGNmrz9ATXO+VqT1t9cadEyXf?=
 =?us-ascii?Q?UtsKebpErW6dMlwCUFrsldGiqymkJW8p/O9hX6S5QjhneDb2ozOg7f+Bo+Iw?=
 =?us-ascii?Q?mU8FoyQZPHWbFzvw92WwFX5TXrp5roDeo0nJJPvfC3NlOBSnbcnvL9WRw/HZ?=
 =?us-ascii?Q?hm+IOAz/QxzhxCTnxm9co2QoeYuTTFyUotzfw1czDG35e8QKjcjcJyDnsfqF?=
 =?us-ascii?Q?tOlHPK+kOg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bc62685-d67e-4388-6a56-08da0ea47542
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 21:14:33.3402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iLny6RwOsYl4S3Jz9uJtfV4WU4vvmTMl3lqngSXsAr0OhCxZHXie1dvjwUH+4T4a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3881
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_141446_731142_F7A1C8EB 
X-CRM114-Status: GOOD (  20.99  )
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
It also improve the gpmi_check_ecc function to check if the selected ecc
strength is strong enough.

The driver uses legacy bch geometry settings by default, if the NAND
chips oob size is less than 1KB. The legacy_set_geometry() sets the data
chunk size(step_size) larger than oob size to make sure BBM locates in
data chunk, then set the maximum ecc stength oob can hold. It always use
unbalanced ECC layout, which ecc0 will cover both meta and data0 chunk.

For all other cases,set the bch geometry by chip required strength and
step size, which uses the minimum ecc strength chip required. It can be
explicitly enabled by DT flag "fsl,use-minimum-ecc", but need to be
en/disabled in both u-boot and kernel at the same time.

Signed-off-by: Han Xu <han.xu@nxp.com>
Tested-by: Sean Nyekjaer <sean@geanix.com>

---
Changes in v2
 - split the patch to two parts
 - change the commit log
 - add test tag
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 56 ++++++++++++++++------
 1 file changed, 42 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index d96899fa90b7..9a37f8cc663e 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -238,9 +238,14 @@ static void gpmi_dump_info(struct gpmi_nand_data *this)
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
@@ -248,7 +253,22 @@ static inline bool gpmi_check_ecc(struct gpmi_nand_data *this)
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
+		       geo->ecc_chunk_size;
+		ds_corr = mtd->writesize * requirements->strength /
+			  requirements->step_size;
+		if (corr < ds_corr ||
+		    geo->ecc_strength < requirements->strength)
+			return false;
+	}
+
+	return true;
 }
 
 /*
@@ -514,24 +534,32 @@ static int legacy_set_geometry(struct gpmi_nand_data *this)
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
