Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B901FCA101F
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 12:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CzDzxu663FKA9H0atu3cl5gN6FRD7NMsd26RE3ZNIQY=; b=pEYjjewWK7Fh8K
	mgkjyFLsMeIRE6BRTp/S4zv4JM1G1HmWX0PNDyyIgxYT5bct3Tx50erAU82JzzV/AnDpigmrCrsnK
	IlixZBSudAIQxvupSiwAP0rXON/eZxtqSXNz7IwyGvcxlfw7+u1wahNP/wgAhDhR0GXgWrs5k5HrB
	3WjB4ddhll7lCMC2CgxmIHZEWBABHji3sqaw47wobWEFwjKhGHJpqoMz9tRMZy/Co/LBp+mQkQGMW
	DNaO90Xm0vCNYF0jZhVfLrkI3QQkgO6IQJG3HYiMnnouhDU+f4sgK19R/pbUyYShuUgYIFjcdxkQT
	WtSSA0MN/3U26ym+YAaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwK4S-0000000EA3k-0hmF;
	Wed, 10 Sep 2025 12:37:08 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwK4P-0000000EA0q-1pWM
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 12:37:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 54189C6B3A3;
	Wed, 10 Sep 2025 12:36:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 15E8A606D6;
	Wed, 10 Sep 2025 12:37:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3610A102F29AB;
	Wed, 10 Sep 2025 14:36:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757507821; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=tjD701dxLwv1c8qI3QsblCAeRdQb1AI1+rK/AOwZ4hE=;
	b=LP+S6Bv4cX8ILeEYPGk1nOYk47EfgpiZE4BLdkuT3PG62mpvn7FNv2U7W4WRtmBluc28q7
	RsMsjrI0tnOvK8kF/2IREW8AlrbipD/8yc0EdzDoa98a5zIPCIwTtXaBtxrPyDKYDAONbx
	RsCqUEHK1cXFcPs7wMWqRo3AVAIbxWPhrVDG/g1F3ezIE1aJ7CN/znKUzOQrJWJVhcy78J
	YYyz0r6iT9YRJ9wyhgq7nSjCV+qaV9G8WUDr6PYpKRFV5VbCLUcnf0jV30LEU8ejg4greJ
	1wR7Hh8hb0BnpwyOw7gi2Vh/oOvke7UzXWebQbVX1w+6Nmg02ZiBfvVeq/MCmQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] mtd: nand: ecc-mxic: Lower log level during init
Date: Wed, 10 Sep 2025 14:36:45 +0200
Message-ID: <20250910123645.541569-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_053705_674309_06340330 
X-CRM114-Status: UNSURE (   7.38  )
X-CRM114-Notice: Please train this message.
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

A working init shall be silent rather than exposing the configuration
with kernel messages at the error level.

Thwart myself from the past and use the debug level for these.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/ecc-mxic.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/ecc-mxic.c b/drivers/mtd/nand/ecc-mxic.c
index 1bf9a5a64b87..60cdcb4175ef 100644
--- a/drivers/mtd/nand/ecc-mxic.c
+++ b/drivers/mtd/nand/ecc-mxic.c
@@ -322,14 +322,14 @@ static int mxic_ecc_init_ctx(struct nand_device *nand, struct device *dev)
 	sg_init_table(ctx->sg, 2);
 
 	/* Configuration dump and sanity checks */
-	dev_err(dev, "DPE version number: %d\n",
+	dev_dbg(dev, "DPE version number: %d\n",
 		readl(mxic->regs + DP_VER) >> DP_VER_OFFSET);
-	dev_err(dev, "Chunk size: %d\n", readl(mxic->regs + CHUNK_SIZE));
-	dev_err(dev, "Main size: %d\n", readl(mxic->regs + MAIN_SIZE));
-	dev_err(dev, "Spare size: %d\n", SPARE_SZ(spare_reg));
-	dev_err(dev, "Rsv size: %ld\n", RSV_SZ(spare_reg));
-	dev_err(dev, "Parity size: %d\n", ctx->parity_sz);
-	dev_err(dev, "Meta size: %d\n", ctx->meta_sz);
+	dev_dbg(dev, "Chunk size: %d\n", readl(mxic->regs + CHUNK_SIZE));
+	dev_dbg(dev, "Main size: %d\n", readl(mxic->regs + MAIN_SIZE));
+	dev_dbg(dev, "Spare size: %d\n", SPARE_SZ(spare_reg));
+	dev_dbg(dev, "Rsv size: %ld\n", RSV_SZ(spare_reg));
+	dev_dbg(dev, "Parity size: %d\n", ctx->parity_sz);
+	dev_dbg(dev, "Meta size: %d\n", ctx->meta_sz);
 
 	if ((ctx->meta_sz + ctx->parity_sz + RSV_SZ(spare_reg)) !=
 	    SPARE_SZ(spare_reg)) {
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
