Return-Path: <SRS0=uMxP=ET=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29B13C388F7
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 12:36:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3C2F20797
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 12:36:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3ajfDHqZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3C2F20797
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tqoKsscW+4FOo7+O4RMPTjzixfbi5lJA9YOzn3eLUIE=; b=3ajfDHqZtMiOkgJfWWQOvLRPR
	BgmawbX7JnBsAoyQAAYKeiB3U8BpGgTpHxAE0oeI47x23oiLoSp8teH4y34dLUl5D2IOAewmoGTb+
	19ERLoCCOTrP4nHK38DI1gGG8O6yLTxXHkJMV+tsj57LAFGgUE0fkXZ6FSaUMGvF2+5zG06agc/a0
	NMjvW7Hs1jJ/pDG0cKjHMsReIWIwRtW6GwKs975dfbSOclG+EcLrOiF9IxwyeLQgPB/xKQE3wf8lt
	nLFu+ziAoo6ZjLd3+trcO9aM96WXMiJ396TQV0sPaATxEKmP2nDzk6Yid/imBsUHW3HyOBrDt7JMG
	KDo3/5cPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdYJ3-0000D4-Rh; Fri, 13 Nov 2020 12:35:57 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdYHn-00083f-A4
 for linux-mtd@lists.infradead.org; Fri, 13 Nov 2020 12:34:40 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id D4A27C000D;
 Fri, 13 Nov 2020 12:34:37 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 16/19] mtd: rawnand: plat_nand: Move the ECC initialization to
 ->attach_chip()
Date: Fri, 13 Nov 2020 13:34:21 +0100
Message-Id: <20201113123424.32233-17-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201113123424.32233-1-miquel.raynal@bootlin.com>
References: <20201113123424.32233-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_073439_543105_5040467D 
X-CRM114-Status: GOOD (  15.05  )
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
 drivers/mtd/nand/raw/plat_nand.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/plat_nand.c b/drivers/mtd/nand/raw/plat_nand.c
index b98c0d5c413f..93d9f1694dc1 100644
--- a/drivers/mtd/nand/raw/plat_nand.c
+++ b/drivers/mtd/nand/raw/plat_nand.c
@@ -14,10 +14,23 @@
 #include <linux/mtd/platnand.h>
 
 struct plat_nand_data {
+	struct nand_controller	controller;
 	struct nand_chip	chip;
 	void __iomem		*io_base;
 };
 
+static int plat_nand_attach_chip(struct nand_chip *chip)
+{
+	chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
+	chip->ecc.algo = NAND_ECC_ALGO_HAMMING;
+
+	return 0;
+}
+
+static const struct nand_controller_ops plat_nand_ops = {
+	.attach_chip = plat_nand_attach_chip,
+};
+
 /*
  * Probe for the NAND device.
  */
@@ -46,6 +59,10 @@ static int plat_nand_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENOMEM;
 
+	data->controller.ops = &plat_nand_ops;
+	nand_controller_init(&data->controller);
+	data->chip.controller = &data->controller;
+
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	data->io_base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(data->io_base))
@@ -66,9 +83,6 @@ static int plat_nand_probe(struct platform_device *pdev)
 	data->chip.options |= pdata->chip.options;
 	data->chip.bbt_options |= pdata->chip.bbt_options;
 
-	data->chip.ecc.engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
-	data->chip.ecc.algo = NAND_ECC_ALGO_HAMMING;
-
 	platform_set_drvdata(pdev, data);
 
 	/* Handle any platform specific setup */
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
