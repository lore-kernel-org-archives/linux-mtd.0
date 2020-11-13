Return-Path: <SRS0=uMxP=ET=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F558C56202
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 12:35:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 931202224B
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 12:35:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p3ZsxlOZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 931202224B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h1dMLP3WOiHrOAiBfuiIxLkHmE8Cna0k9d9RbeOY1/Q=; b=p3ZsxlOZZw+j7viR8qRL1VORL
	dUTonAoDnpKfqeer1JjJ6IJ74ZaOooyRvKy2Nw31aQY92XHmtoEulCkEooeTa93/+HqR6iQOZNdKX
	lvZnTbqv5Axq6UIGHFAxRrWlOzG/YHgEQv9YSPRd9ufRYaCyYhFwsK4vgmmk+cNkN/CsfKlUtfeiC
	rq1tqdGRC0bAQm8VceuFSRxswm6b2Fx4fO4DDCqj5QAWyxzbnDB1M9A+0uKMKa7Wr9xRKyYB8aCki
	Wonjc2SL7CAjqkPsLdmGp9DJK/5MjZAuU4SXucdxC1o+03RUtoKpLlSCNWmTnBz8y7z0Kw2qhCUJ3
	syRpEAN+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdYIG-0008Ck-Rj; Fri, 13 Nov 2020 12:35:08 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdYHh-00080I-Ay
 for linux-mtd@lists.infradead.org; Fri, 13 Nov 2020 12:34:34 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id DB9C0C0013;
 Fri, 13 Nov 2020 12:34:31 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 08/19] mtd: rawnand: fsmc: Move the ECC initialization to
 ->attach_chip()
Date: Fri, 13 Nov 2020 13:34:13 +0100
Message-Id: <20201113123424.32233-9-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201113123424.32233-1-miquel.raynal@bootlin.com>
References: <20201113123424.32233-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_073433_564237_6A63D35B 
X-CRM114-Status: GOOD (  14.85  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The probe function is only supposed to initialize the controller
hardware but not the ECC engine. Indeed, we don't know anything about
the NAND chip(s) at this stage. Let's move the logic initializing the
ECC engine, even pretty simple, to the ->attach_chip() hook which gets
called during nand_scan() routine, after the NAND chip discovery. As
the previously mentioned logic is supposed to parse the DT for us, it
is likely that the chip->ecc.* entries be overwritten. So let's avoid
this by moving these lines to ->attach_chip().

Fixes: d7157ff49a5b ("mtd: rawnand: Use the ECC framework user input parsing bits")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index d0855d4f5627..0101c0fab50a 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -879,6 +879,20 @@ static int fsmc_nand_attach_chip(struct nand_chip *nand)
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct fsmc_nand_data *host = nand_to_fsmc(nand);
 
+	if (nand->ecc.engine_type == NAND_ECC_ENGINE_TYPE_INVALID)
+		nand->ecc.engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
+
+	if (!nand->ecc.size)
+		nand->ecc.size = 512;
+
+	if (AMBA_REV_BITS(host->pid) >= 8) {
+		nand->ecc.read_page = fsmc_read_page_hwecc;
+		nand->ecc.calculate = fsmc_read_hwecc_ecc4;
+		nand->ecc.correct = fsmc_bch8_correct_data;
+		nand->ecc.bytes = 13;
+		nand->ecc.strength = 8;
+	}
+
 	if (AMBA_REV_BITS(host->pid) >= 8) {
 		switch (mtd->oobsize) {
 		case 16:
@@ -904,6 +918,7 @@ static int fsmc_nand_attach_chip(struct nand_chip *nand)
 		dev_info(host->dev, "Using 1-bit HW ECC scheme\n");
 		nand->ecc.calculate = fsmc_read_hwecc_ecc1;
 		nand->ecc.correct = rawnand_sw_hamming_correct;
+		nand->ecc.hwctl = fsmc_enable_hwecc;
 		nand->ecc.bytes = 3;
 		nand->ecc.strength = 1;
 		nand->ecc.options |= NAND_ECC_SOFT_HAMMING_SM_ORDER;
@@ -1054,13 +1069,6 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 
 	mtd->dev.parent = &pdev->dev;
 
-	/*
-	 * Setup default ECC mode. nand_dt_init() called from nand_scan_ident()
-	 * can overwrite this value if the DT provides a different value.
-	 */
-	nand->ecc.engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
-	nand->ecc.hwctl = fsmc_enable_hwecc;
-	nand->ecc.size = 512;
 	nand->badblockbits = 7;
 
 	if (host->mode == USE_DMA_ACCESS) {
@@ -1083,14 +1091,6 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		nand->options |= NAND_KEEP_TIMINGS;
 	}
 
-	if (AMBA_REV_BITS(host->pid) >= 8) {
-		nand->ecc.read_page = fsmc_read_page_hwecc;
-		nand->ecc.calculate = fsmc_read_hwecc_ecc4;
-		nand->ecc.correct = fsmc_bch8_correct_data;
-		nand->ecc.bytes = 13;
-		nand->ecc.strength = 8;
-	}
-
 	nand_controller_init(&host->base);
 	host->base.ops = &fsmc_nand_controller_ops;
 	nand->controller = &host->base;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
