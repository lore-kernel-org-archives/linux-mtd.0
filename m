Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D8FC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Apr 2022 02:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e/YyRCeDlFeJgk4gLazkqQOOOfAk5notKjLdboVU34A=; b=rvKw89U7x8lhW7
	yRBoYdfkjMySTgibUhYSLPAAa3goWC1yQsH6cVGdfXezIj2/2jGo+EvkubkCiKEggeRupNPC1ooWp
	yJ+X1yTdF3EOOACil/P8BxC/I+4eoQypAnv8gcCCYf0PSY/lwj1L1iiVLR/o8BDohrcqObSE8f+w2
	zf4kZrl5AtIz+3yVHd8vdASh1r6wknOyywXksZWRcIiDWrIDWPiWUvIVAMbs4i+x85bLzvypRe6oQ
	VCqEMOURlJd1WAq5N9b8rXUTMtI1XHvvo0RinpxTIffjc1YcecL1z0RQ5JeHVnZVPDbgU2x7kfnzi
	FlgVge9QXbgE/1Dg2/bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ne6eb-00BLSh-5V; Tue, 12 Apr 2022 02:53:17 +0000
Received: from mail-am6eur05on20607.outbound.protection.outlook.com
 ([2a01:111:f400:7e1b::607]
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ne6eV-00BLRL-Uf
 for linux-mtd@lists.infradead.org; Tue, 12 Apr 2022 02:53:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B63Qm7B5f9zMKIOLLCJnQguu2paGH7ghBv08fud6BBNXNOTqyYQG32Ypw8+znrSTYcFZrW/UNElCbsslauR95/yBcHTUB4t78u/Ay1COsBQ9VOCl1RbuKMIBN4kPr5QuHvb6F/zXax48YfkgbPRYNQmHrxMJ+R5GhmEQXyMbhuLqnjjS1a2fF+kQhhA+MYkLJNgVWRxWSxZx7fafPEDRg2kKM8z90nziCbEt3l7vQ5fp+alnAhoys07mFWB7A54qSNZ4kAoZ1TnSp/CucpLcqHCyqOiyX8gSV099M9ReaGmFHfarFLvtEXsuTJjaYXJs4f3ZUGJIsgKPYb0ifstQdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DslrKGcn9zxlSU2fnen8v1GasJH1zDIgTD3Vicc06lw=;
 b=SdzS3Q2j3W8FjD8glNrO7Minx18opdLAAYSd0JMWPwa/OfHb7C/9WSav4IlieCSagDQPDnN+pwcJVfYsAZuzOvSusAgVjyF3PcyYc3m4MZKjs2sZhguSyqtb/5iiqKEXS3XfEp/CV6Yva8bCwpk6itFi9FjqYjnZjYB5RZqGJlzkcQUlQ+WSuSpEvJ/JvTdv0whEQqyAjkGmvzbobvvufaGl7Vj8eFqhCpwHr+do5l7h5/d4ZL1tpL4VVKFjVYxXn0d8tmPS7gMwijw/neysSaTQLpCRwXcLPFycWhoMPkHBh4Q9Tb02SQ2Z4XBqzPGYzDHrKqanuKIQfZryc9LbNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DslrKGcn9zxlSU2fnen8v1GasJH1zDIgTD3Vicc06lw=;
 b=eGFSdEGAPhFud3rQrYKseLtQI22uzQh76vhNOZCRvWUPMXWExTFkX60IhRPyg/ktDoNIo6nUll7qA5Yr8JIeJscF6B3qaNObATaq7M8k+0+c/nqdXbanlQEy35y/9jUtqjRk12fZC6EhlnxSuZmOwoLCLIYooN/A5Z5Dq8Txmx0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by VI1PR04MB3229.eurprd04.prod.outlook.com (2603:10a6:802:e::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.30; Tue, 12 Apr
 2022 02:53:06 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::644f:b22f:2f4:d69d]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::644f:b22f:2f4:d69d%3]) with mapi id 15.20.5144.030; Tue, 12 Apr 2022
 02:53:06 +0000
From: Han Xu <han.xu@nxp.com>
To: sean@geanix.com,
	frieder.schrempf@kontron.de,
	festevam@gmail.com
Cc: ye.li@nxp.com, peng.fan@nxp.com, han.xu@nxp.com, miquel.raynal@bootlin.com,
 linux-mtd@lists.infradead.org
Subject: [PATCH v4 1/5] mtd: rawnand: gpmi: Refactor bch geometry settings
 function
Date: Mon, 11 Apr 2022 21:52:42 -0500
Message-Id: <20220412025246.24269-2-han.xu@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220412025246.24269-1-han.xu@nxp.com>
References: <20220412025246.24269-1-han.xu@nxp.com>
X-ClientProxiedBy: BYAPR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::29) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce91f19e-6238-4e81-0f26-08da1c2f9204
X-MS-TrafficTypeDiagnostic: VI1PR04MB3229:EE_
X-Microsoft-Antispam-PRVS: <VI1PR04MB322958BCE446C840DA02D00897ED9@VI1PR04MB3229.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mHj3TWOdQspsnHfchEqDIrJYUYQkeeQNIJfqFcD4qmyPGW7Q6YKpkL+/bjfbznP3snjWo2NB/Qp/9/o2sR9sEASu0qRSxx7cWy46PM1+g47upembr36fI53/iov3qESEOvNlhpjm/+0SXR8+XUoB2G1qxrDbr8y6bN39Fmqnsj8/bojBCzgESDhFzeyRW3S4Qb8HwX5xBSsWsZYnkCm33W6Z1dFJVPOiHKFG4S5GGtgFNWxMGrB3jj8LllkjTFt3OFhwfwvDGNKAwc6Tx6qxraWvHBrKQwYjH4dcbC3YrDk8PtJgYMJ95IfPusx4xNzfPQA77Lpra5MINneYhaciwgF8sJ7DjYUzvz3WYBx36SzjaE7jFU/5saKHQuQa6ITla7LnDf8ETmxoaAvT/4nv6pczpioxCvkUEhA8S0bC8wgY6As0n0UdeeEfDfJ4+J6aNzXS1TTXk+76uoFJi2UeSfNFTDDdYo+/fS2afIQifuAaVna2wzmT/41c9aJBPo2TMLIaIBlUqLTINyKgvnrL6E1M5p1t1AaBA5JmrkYDOG9eHHIdybmf7Kr/77dSwGUcPumG5sbmVZyYanfcE1425jZpL3ImFWR9dlVuYe/5HAp5R7iI1lrfl+NY9w760CF9iFeVIFymhMl/ktoDGs1WCAO+5NpEcZc8n2kOb9bIeQjvxZoj51Hx+oaQbQvj6ksc/Qs0gDBHFHMvZ8tyboxrgg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8774.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(186003)(6666004)(2906002)(5660300002)(6512007)(44832011)(316002)(2616005)(66476007)(66946007)(6506007)(66556008)(8676002)(6486002)(8936002)(1076003)(4326008)(38100700002)(38350700002)(36756003)(52116002)(83380400001)(508600001)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GwWEwqEZgT7pv6fhJKe5R8YmOTar0j5Jb5agVoD27kF98dlgLEXallHZNVOq?=
 =?us-ascii?Q?hOUEvtDv9wW3csQBKRO3gc2ntQ7J08mjGoLIKi+ymEWjDHDqTyosSQ955M0L?=
 =?us-ascii?Q?mkwOh+WjVKqVNEaAGSqm5w6N8C9ka7oiWWabOJ88arKyBwoPLx70h/M9dpZb?=
 =?us-ascii?Q?xlwQ0SqqAyyndRF+WD8xg6jPqTHqdPo+qegvCKAJgYt0X86Uk+MEy8bQ+vuJ?=
 =?us-ascii?Q?Hla/jh4w6pLAJNLsuLzEv4C8c4Lbzwh09Kv0eSjI1naG91yCmKQ9TNsORfgX?=
 =?us-ascii?Q?8qGNjdXZOc8mmiqWRvDvjMQ66H2iC47T7SsJ8Vjgibh+i6Sld64o6+YfM5qo?=
 =?us-ascii?Q?rrqHXmPUS4y+83hj9mo65GR75NBvD9uEFtpdunEiHXlgAAbUtUfQJRMhU5aK?=
 =?us-ascii?Q?LVvySi1sxNcb6vLO9UtvlI4UpDScM9v4/12KAqzWry7DeChYordVNxF2CN2s?=
 =?us-ascii?Q?EGje4oxN0A1NTttxe7zZuLUCPV79/c/swdDF1wQPsFUmvzbX4rsdiiUgINZD?=
 =?us-ascii?Q?MNtd0ZtZUQWe2cytRTLl7CYJzLSxdzWOb9nY5Cx0O96iOl/iR0/VBQU+lTNH?=
 =?us-ascii?Q?UpFFQBcrnR99PQfpDaLmB8zc5M24ca9JEo3sqCpMFQmc3fwffryOjafIiS4j?=
 =?us-ascii?Q?pK0ybs0WN/IYEgtgdxKlHRUcv+MC6L6zXpttcep1bWIYLuFv2HjoIYyfwVmJ?=
 =?us-ascii?Q?ffB6sSZVbG01a4hpg56eqrVEDKBEjJYfqYL0KFTgK0yeO1H5R+b3rFnNKNY3?=
 =?us-ascii?Q?WGvcw9JeO+QdsyMgOvAT7Kj7JOvkFQQkzATU08fcQL1csP8vaoLQLGO1pER2?=
 =?us-ascii?Q?YiFGZvSv9pEQcW+asjAuGeUuNJuDyxpAnD0RLLKLLhocmaFwahgihOxoFDny?=
 =?us-ascii?Q?TLLWZPVSq/arR749i8ZxjyZLOxq9ce2fZbBliZoPZ2mb9SU0WxAKtz23+lDv?=
 =?us-ascii?Q?OVMP8MeiFhqDaiLItZFb+65Cc8WlHddD9K+PHK+nUrG+Q/qlwJ6WoPui4Qzh?=
 =?us-ascii?Q?9tqtXifcVLoYqygDu8Z4lnuu3O9Ciqi8RXO5K/eT/UI6LbCbVZ7M/pWNLEZd?=
 =?us-ascii?Q?qDG42PRfm+mM+UTj7cfN2HwYDYWQU45FCFdlXB4lY2pVy1cXIh0TGrvHaqnb?=
 =?us-ascii?Q?M4FPajcTn4e2dXfG9jhRuje5hlZjbaEdFScohqh72EoeBQAHAjeCaR7JW/tM?=
 =?us-ascii?Q?YXdpxV8HMb4/zE730z6jQtgqv3D3hU80oPp0bpuv5V+mlb+HsF40dBQbjCtO?=
 =?us-ascii?Q?o3UAm7zkc268zI/fWbMXbWKqNOn4BheaALY2HF6yYwNuiEvjB4Gn+fWjuyfv?=
 =?us-ascii?Q?gon6htzuvQziViTsx386NdvBYXxl/GG/gHd9kfnzcU+9NPobz/XzGp2gl4+R?=
 =?us-ascii?Q?mh7rix9kFQC3CelBs+ENWik9JvWFQC40FNh24ZJOvtSQt7AIuiQWeJnqjUjm?=
 =?us-ascii?Q?iJJdNhoN7wmjYetZFm9Bvppux7o6dROKR+4alPfmiXmf77wbK7jZMTQnUJRH?=
 =?us-ascii?Q?SPVGrYwFCmhPcntuyrdXp9VLBaup7Gc93i5YbKZ5+o5kaQk/7bH8tgulQZxe?=
 =?us-ascii?Q?2r2KEcxvbRvjqGWrypSkrSJXTvIjaTnqdefGzlHMgFTw0AgMNDkWcM9cHz/8?=
 =?us-ascii?Q?7S/sbX6xj6yibBrxIP0LinlOf1UTYAlu4vWTlEG2q5Srk/xzC58G+44oGK4m?=
 =?us-ascii?Q?SFeOYJqoR7EcKy3RMjPdMMyFE+yDBx0TjMBAXd8g4WlPE48Cu5ya+WEe0bnp?=
 =?us-ascii?Q?VPL+XYrwaw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce91f19e-6238-4e81-0f26-08da1c2f9204
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 02:53:06.7158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GH3Ow6/1rGvfmW6YQYtoUfa3aUphYiFcMe8na9OTo5dAqUEMTJGXXB0w9jhCRAOa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3229
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_195312_008097_F595593D 
X-CRM114-Status: GOOD (  21.89  )
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

The code change refactor the bch geometry setting function, which
doesn't change the default behavior, while user may choose to use chips
required minimum ecc strength by DT flag "fsl,use-minimum-ecc".

The default way to set bch geometry need to set the data chunk
size(step_size) larger than oob size to make sure BBM locates in data
chunk, then set the maximum ecc strength oob can hold. It always use
unbalanced ECC layout, which ecc0 will cover both meta and data0 chunk.
But the default bch setting is deprecated for large oobsize NAND
(oobsize >1KB), so in the patch set, there is a split commit that
introduces a new way to set bch geometry for large oob size NAND.

For all other cases,set the bch geometry by chip required strength and
step size, which uses the minimum ecc strength chip required. It can be
explicitly enabled by DT flag "fsl,use-minimum-ecc", but need to be
en/disabled in both u-boot and kernel at the same time.

Signed-off-by: Han Xu <han.xu@nxp.com>
Tested-by: Sean Nyekjaer <sean@geanix.com>

---
Changes since v3:
 - don't use the term legacy in commit log
 - mention the split commit for large oob NAND

Changes since v2:
 - split the ecc check to a single patch

Changes since v1:
 - split the patch to two parts
 - change the commit log
 - add test tag
---
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 32 ++++++++++++++--------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 44b14c9dc9a7..66ebd569858d 100644
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
