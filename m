Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443A6CA5FE5
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Oct 2026 20:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iU1cFR0N2d1PcLg9/hLDJhI7PIxNvGDI/VtYYBvdaiQ=; b=m81Yi3QtHv7eY8
	Ig6xeui0hewqV3gK24aF35av/+4yahtVoCdQMIrKiwHZPwQcKVxD/rFg0ZkmNkr5I5/SsMuBFlSfM
	wdZWGK7XKZdwD97+qRhrRJWoVxnCN/8O/j7JiftGlRzWgaeGVAJIdPXqe8sQnbAntV8FZDYb5K8Px
	y1NsFz7uVi51OYIV6zJD01dN5YVXeQuGlTt9WsdE67bENmXNIQvmusjm4SLe4YfbJ0cHuJDy25Ojb
	CYGV3dG/fuBx4sTmtwHX7lW56t1Hn+4ep5vbm6xg6gqvRRGhZDgh+zxUE4VCAjXd5FBmMdWPMp0tp
	ZkmVE/B5Uet6l0xgilIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCjgD-0000000CT54-2HuL;
	Fri, 02 Oct 2026 20:16:29 +0000
Received: from mail-francecentralazon11013030.outbound.protection.outlook.com ([40.107.162.30] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCjgB-0000000CT4X-0fBg
	for linux-mtd@lists.infradead.org;
	Fri, 02 Oct 2026 20:16:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=imHE+RZV9s+PonouTNPWowqrLzyixAFoBasPmur3FDl5GmjoQI9eJAPiUXyHBPEOo9cWt4yjkXXxTxRGU11m5DoBKc27vbFUksY7R7bw4efD3nPpgk1jVTXpr85FdzL+UluVFYcB1DAvOvA5PaRutsLJu4DhHp9pZFxTX9z8r6b/JQdJw2ZnjurUCq3PAhJkJ0ktQg6pY5vK1CqSjuh3UGmb0h+8WUWSVe+LljRt6VC1gwXj/0u0e6UbmVNm2m0/0JcO4e+/pODnmL1BwlVbNxwe0o4wvRZd/zCi07J4NQ7jgkTDZWEG1kf5NL4GTUxZOGoKtJF10gRNk5IeCs4pog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aPCwM296zFcvhs+5odVmGVtZMleIM10FdLXW0oHVsco=;
 b=nIAZmlZBiRFibtiozdBwiXe5bcsLiO+KcGJsF4NiBoW7XhxLWKmnvJgNUgC/3qIAxvH9T7lzxRSBf3YGm4lF+hVlHf6qDCgiQqYl1i5vpt3E/aTwJjQvCnPazKPTLtmNZdPhtPqecKrgsEJLNiU97Q9i01196gPyBIHWjXK2WrkG2iudG4Ip9uLwy83Z38qry2d9az4ie7ozh77j6ZOW7NTmbOKY2BB0PhQvLp9YPrJ+1Bi/ar+OeYKT48eE7jUh4QgMfaZEBp1dvOzCqwCe1TuGcrbf3GB19aXcLjI6eVxDa8nWsNuRNW4QBsq//sSfdKwbPYLeBCfNOI5M94slUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aPCwM296zFcvhs+5odVmGVtZMleIM10FdLXW0oHVsco=;
 b=nTm7GF4d8kL4AgJbJVCLrq3Jp7LDiUmjm3sKaiRG33cs5UJ52NkShzMwwVzz897dDpVebYG4hqUPBiuyGgLsl5lwjLiPFDSkRkGmWtntKJgMAftcFtFpocClJMx0eKxgwGQ0GDwyIjMnW7Z70gBISBuBKlEUa9o1QI9tiTBKN+/ihShKz7pyEZhn+Al6wbl7uCNc1qqM2tTKTAHR96CcDynXXY7kqDGtG2u2siwAHZfWCRGyc9nxEA1c7z3CyPHW/RzBeMuyji2+suNpsLnOmZsKAMKTMljU+mvGSeKGjrv9yiA2mYzhfWgvzLlPENGnG1IIbPxUu/cFKkZLt1mzew==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by DU0PR04MB9322.eurprd04.prod.outlook.com (2603:10a6:10:355::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 20:16:21 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%4]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 20:16:21 +0000
From: Frank.Li@oss.nxp.com
To: Kyungmin Park <kyungmin.park@samsung.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Frank Li <Frank.Li@nxp.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	linux-mtd@lists.infradead.org (open list:ONENAND FLASH DRIVER),
	linux-kernel@vger.kernel.org (open list)
Cc: vkoul@kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 1/1] mtd: nand: use dmaengine_submit() instead of ->tx_submit()
Date: Fri,  2 Oct 2026 16:16:07 -0400
Message-ID: <20261002201614.245240-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: PH7P220CA0133.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|DU0PR04MB9322:EE_
X-MS-Office365-Filtering-Correlation-Id: 327420da-5488-44d8-2e1c-08df20c205ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|19092799006|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: xl0WzzsVqaw+e7OuIGhWv8uRGLUEIfM6zvBWw9+vkzZX/JOW58uLukFlsq3hl4W/TqVMOdyeoJ9e+ESe44V065CDzlYZPSTarp7D07XAqgG9zXannvvQP45Ml9zT1HkPBG0rhcwhxUenSGFtHXU1Les1Ni0HXJTg3/TJRJMRTeGas7xuWvrNrm6/0qQSoc4r3oV62CwaL79GjxJkVFjXzUK9JxMT7a+vE3smVOehPYO1bsbuX/Y6hptXK3xR1yvh2bvQPTO7hI0Muq+xSGGVjLJcApL5Gkf7djIBgSse4i+avdRJ34J465efjPXq6j7Xv8zqQxmU+wXoet/VMl6n8oogigwE3CJ5bvaEwD8+haLeHS/VjOxrZWYxkbCbv6TknMwv4951IV8bvVzSy0AcVqwlyypCW6EgNN4qnJeXlwoPvw2MLPFn8nRlWWGHR0qWKh1FNEZb2hH+qMar6vhAENxhAD8Pt+i8vK6k/KX0atsSaBEqag4v353kyCFGJqMRByAKQ61AO2yDsHdFKIP+nxcGpFeV4YGhQXBa06bz/cEiQ5/lE2/m1zDW4UfIBC8N1B30aibEwpjjei20XTsHaDLFsusUQCqeBM2Bti+W8VmPbyeLAt0HkPan+C2I8wjl7IFOd2/aI0mdyLIdlxA8nWhtiBYg8l9rTtS0PiS00Mo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(19092799006)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fIR9fjWdy9cOx5ibXltazI6u85kAXS9CkNmnswWJQMruyHi8HVw5nRS7Yi6f?=
 =?us-ascii?Q?+SUIz4oQWN9duHaZR+hY72Uu8yUPSKe5ACQZWKwi4vvFn7pFiqhmSE4rnSg7?=
 =?us-ascii?Q?v/BmnXwb9ew19KTfA/TD2WzlmXNg0vYuQYJwwVC0zIGG6oLKmue6x1C1g+or?=
 =?us-ascii?Q?TAwIcJ2Gpm4leymKIWCRhyYnJPsueAo6FHLa9UCTUO5azO3fY1pyZFMbV9JY?=
 =?us-ascii?Q?OOYGO3hcV0W7c7q5G7EjtsKs/+gK8H7LokSbhR1qwSAQEeixuyK6iGJizUYd?=
 =?us-ascii?Q?iby1ntyE9bcHPSt448ClqAdsgDScNNqsXfWnD8erkbg1Pqt+yxX9pZpAlDtt?=
 =?us-ascii?Q?hsXGNUp3QMm9M2POUxQKobHpL1RvgP2H0jZcBkn5mhdOb+wwdMZDFnC+KRdQ?=
 =?us-ascii?Q?ooXFtI6cH8TKK7Rh0OuMs/Dc9LSzJ4Yg9gEOzTfgOH4RhkGj7UWuIN5F+7b3?=
 =?us-ascii?Q?lm23pkeVUtE1IH4DzO61QLMGCTrva4qzCUPhnnuW7s9USPkpRLdVXBZKUNXG?=
 =?us-ascii?Q?G6jLDRDd5bF9c+sJGFp+C6tSZetuBOB4Fmi8aTRlmXfwfFobhP6lxZE9UmL2?=
 =?us-ascii?Q?Gk9OTmIievTFrZju4X6uttYhBBPqpu/mcjFQDM2g2oDbFA73OYc19cphetPB?=
 =?us-ascii?Q?Hvxg4J0BhUQBMUtcdTVAYMvefZXW+2emBU3tdRrS/XlXthJfOmVn04+pHxbL?=
 =?us-ascii?Q?pxKml9pkWLIB6g7Kuo2yYSIUIoGI2ImjuobBFxkV5NcOO5v7sxd63M5x3VTL?=
 =?us-ascii?Q?sSKYquoEtI+VsU6tf+yHBbsKknXiebIiPcOJP/Kf/va/Q+LpdGVYeHgqj3n4?=
 =?us-ascii?Q?DIsT0hLu7/CsaVSPTyqZaDHU9MX5DG05HOb11daEiL6bm2MuS1ZyL0P+8wdY?=
 =?us-ascii?Q?8CUqGwYdi5u66hcFvlFLM5ehpV1up/47ANGZiKiEkIrFFJTLnqlj1RFw6dAo?=
 =?us-ascii?Q?52NIak67MYh4h+PKvYE6viGh0A7qtmN0oMTDxEQu7NoKRMu47da/xD/VWeMl?=
 =?us-ascii?Q?ZTgjx/Y/do4vmDJey1lqdIibytcGRLmNrc3vcd3t4wC6cSCUY/AFBE1J/7oN?=
 =?us-ascii?Q?eHbVJuMaSTcRnSiv4k9aUMUb5hTdPmherfuy9TRRcr+4HTLuihytf8LHdPjr?=
 =?us-ascii?Q?LqXk6+70niq51VRZMqi7vmdlRLCXmwhx401pCO4LTOxngFAOWMmTmruhVR57?=
 =?us-ascii?Q?FiipTMegDN12edqyu1jESXXSKERhcUfTIO6GXgZYfoU0o1xsgXSGKt/1lLRy?=
 =?us-ascii?Q?9HpB85aYRUi2bf/Vc6v/qZQIAEU7E9roqQgSrNCdbLYAkTySh57XewnF6o5y?=
 =?us-ascii?Q?O8k8jDZ588keM0Xq9AjYqhr/mz+/iJ9dLqoRbDTOkFcCVgxfoJx5tgSVUTVe?=
 =?us-ascii?Q?QyaW2bmW+EVz0KVOoviC/cbvmgCMdzoIsrwdo6n0z5p8MX3emGsHuThriSPU?=
 =?us-ascii?Q?PxfuAN6eIfU/mCIyBLuPy/0il1hWZgNQffa6nRueuPgCUD3YIbGrIv1WXOcr?=
 =?us-ascii?Q?/1DtvejGYAya1yKpYkuwSyDc5ctaitXMDfY3uQqvy0zzlob2nADf4yMT2AaM?=
 =?us-ascii?Q?tzi73F0KxXVHoI+cpALULC5IRpcA/ZSOz63a2CUhHFhVQiORafNMIg0PPwAX?=
 =?us-ascii?Q?BPv1kJp9IqDlSjwcwzvQgSfXn5am3mr+8kg55ni/R1JPcAhqJbm1/9T+CIsR?=
 =?us-ascii?Q?T6i7rtera+O1eOXtP6nS6x2UviPRleTQ7hBWLtrKuUCD17S4RLCoW9I6PZZy?=
 =?us-ascii?Q?/VNwtxJ1FsLDgqSepkKTcq+6AS/FrxcBIpQC2TaditbtVtHRIeqP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 327420da-5488-44d8-2e1c-08df20c205ee
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 20:16:21.4534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BxLzZPBw0Rd0q0YHbuKrmcSw90LnD81VG4L9ESo+2fCR1fezODM/w0njmJYUB5330qFlBH768Hf8x11RJSiz27l1h+fAqePXw0fOf6mex8iSuoV8E03S43hqqLSEgkvp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9322
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_131627_205742_350C5956 
X-CRM114-Status: GOOD (  11.07  )
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

From: Frank Li <Frank.Li@nxp.com>

Replace direct dma_async_tx_descriptor->tx_submit() calls with the
proper dmaengine_submit() API wrapper.

Assisted-by: LLM
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/mtd/nand/onenand/onenand_omap2.c     | 4 ++--
 drivers/mtd/nand/raw/fsmc_nand.c             | 2 +-
 drivers/mtd/nand/raw/intel-nand-controller.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/onenand/onenand_omap2.c b/drivers/mtd/nand/onenand/onenand_omap2.c
index 0793251ada3b3..644498187d8fa 100644
--- a/drivers/mtd/nand/onenand/onenand_omap2.c
+++ b/drivers/mtd/nand/onenand/onenand_omap2.c
@@ -340,9 +340,9 @@ static inline int omap2_onenand_dma_transfer(struct omap2_onenand *c,
 	tx->callback = omap2_onenand_dma_complete_func;
 	tx->callback_param = &c->dma_done;
 
-	cookie = tx->tx_submit(tx);
+	cookie = dmaengine_submit(tx);
 	if (dma_submit_error(cookie)) {
-		dev_err(&c->pdev->dev, "Failed to do DMA tx_submit\n");
+		dev_err(&c->pdev->dev, "Failed to do dmaengine_submit\n");
 		return -EIO;
 	}
 
diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 08ef4425559c3..837c23c63aeb2 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -524,7 +524,7 @@ static int dma_xfer(struct fsmc_nand_data *host, void *buffer, int len,
 
 	tx->callback = dma_complete;
 	tx->callback_param = host;
-	cookie = tx->tx_submit(tx);
+	cookie = dmaengine_submit(tx);
 
 	ret = dma_submit_error(cookie);
 	if (ret) {
diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index 0a4f5ff111334..94d2161bf5a1a 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -324,7 +324,7 @@ static int ebu_dma_start(struct ebu_nand_controller *ebu_host, u32 dir,
 
 	tx->callback = callback;
 	tx->callback_param = ebu_host;
-	cookie = tx->tx_submit(tx);
+	cookie = dmaengine_submit(tx);
 
 	ret = dma_submit_error(cookie);
 	if (ret) {
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
