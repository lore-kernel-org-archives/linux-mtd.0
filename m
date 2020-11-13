Return-Path: <SRS0=uMxP=ET=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C7B8C4742C
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 13:51:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4853F20639
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 13:51:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pqX3z9Vv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4853F20639
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LuAeuV//YzYzqrsHQI++R1uYScuqpWEZASZRtONyBxA=; b=pqX3z9Vvj/OK2LSguBaRgYt6S
	JxGJ1S41v/W3/Nuha+S5ifANswD/lbpme7XcKzq8niuJP74HA61O84GhcIGIzRm5tziIu3ZJW3BO8
	JrDqnglsQwdtooEGLLD7RG79YgFc6RsLP7HK3y0FNRSYCdHpIlqT4zkV9ZFg0ZYISTa7EiUBz5hMG
	+pplog8Mm2UtFcmVFOPEUV5VbNNqtEMs2ilDgUTKztcXwIdXjgKP9FEYh35K1jnWaQmlv6KtBMDRV
	W6zo1zepP5ak9yal6ODV8XSinG+HXp9pdjtFx6s6HV5xH5xVhp6ezKiLMP/RcOvMBVEBCJd1sUI39
	C2yTHdIoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdZU3-0007qv-EC; Fri, 13 Nov 2020 13:51:23 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdYHo-00084L-T2
 for linux-mtd@lists.infradead.org; Fri, 13 Nov 2020 12:34:43 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 556AFC000C;
 Fri, 13 Nov 2020 12:34:39 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 18/19] mtd: rawnand: sharpsl: Move the ECC initialization to
 ->attach_chip()
Date: Fri, 13 Nov 2020 13:34:23 +0100
Message-Id: <20201113123424.32233-19-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201113123424.32233-1-miquel.raynal@bootlin.com>
References: <20201113123424.32233-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_073441_142987_0DC2D372 
X-CRM114-Status: GOOD (  16.25  )
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
 drivers/mtd/nand/raw/sharpsl.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/sharpsl.c b/drivers/mtd/nand/raw/sharpsl.c
index 6ceb961d2c9f..5612ee628425 100644
--- a/drivers/mtd/nand/raw/sharpsl.c
+++ b/drivers/mtd/nand/raw/sharpsl.c
@@ -19,6 +19,7 @@
 #include <linux/io.h>
 
 struct sharpsl_nand {
+	struct nand_controller	controller;
 	struct nand_chip	chip;
 
 	void __iomem		*io;
@@ -95,6 +96,25 @@ static int sharpsl_nand_calculate_ecc(struct nand_chip *chip,
 	return readb(sharpsl->io + ECCCNTR) != 0;
 }
 
+static int sharpsl_attach_chip(struct nand_chip *chip)
+{
+	if (chip->ecc.engine_type != NAND_ECC_ENGINE_TYPE_ON_HOST)
+		return 0;
+
+	chip->ecc.size = 256;
+	chip->ecc.bytes = 3;
+	chip->ecc.strength = 1;
+	chip->ecc.hwctl = sharpsl_nand_enable_hwecc;
+	chip->ecc.calculate = sharpsl_nand_calculate_ecc;
+	chip->ecc.correct = rawnand_sw_hamming_correct;
+
+	return 0;
+}
+
+static const struct nand_controller_ops sharpsl_ops = {
+	.attach_chip = sharpsl_attach_chip,
+};
+
 /*
  * Main initialization routine
  */
@@ -135,6 +155,10 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	/* Get pointer to private data */
 	this = (struct nand_chip *)(&sharpsl->chip);
 
+	nand_controller_init(&sharpsl->controller);
+	sharpsl->controller.ops = &sharpsl_ops;
+	this->controller = &sharpsl->controller;
+
 	/* Link the private data with the MTD structure */
 	mtd = nand_to_mtd(this);
 	mtd->dev.parent = &pdev->dev;
@@ -155,15 +179,7 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	this->legacy.dev_ready = sharpsl_nand_dev_ready;
 	/* 15 us command delay time */
 	this->legacy.chip_delay = 15;
-	/* set eccmode using hardware ECC */
-	this->ecc.engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
-	this->ecc.size = 256;
-	this->ecc.bytes = 3;
-	this->ecc.strength = 1;
 	this->badblock_pattern = data->badblock_pattern;
-	this->ecc.hwctl = sharpsl_nand_enable_hwecc;
-	this->ecc.calculate = sharpsl_nand_calculate_ecc;
-	this->ecc.correct = rawnand_sw_hamming_correct;
 
 	/* Scan to find existence of the device */
 	err = nand_scan(this, 1);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
