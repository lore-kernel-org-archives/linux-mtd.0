Return-Path: <SRS0=uMxP=ET=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22DD1C4742C
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 12:36:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9E892076B
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 12:36:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q1NPQTLx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9E892076B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IKBNmLzkWQoIGaU/idADiewkeMBgVOtRHnm6Qowrfnw=; b=Q1NPQTLx6qLtfJF5BR+GMnYnV
	UuLjl3M24ayC9krx08JcGvSsR+w+a3/Azq9MgrOfMmgUnWsJYF6B4OI0FfUdpvPGXzKvYgXFKX7+a
	+N3sbMPHprvD5Zfflv3CUmJDXaj1IERfCgZhkckw0l3cdoKn0WemuI0R7ABh+tvrcYOmgVBf59roO
	qybX/83LzKTSaYFZF8GQWgSu6CM2k2dbWySS+wF9RkxlJMVd2kJmQi5BxER8hZ5jhRojP/FDY59ZE
	xw/KeARftke1h7HJIPDlTLhgfxsAv25zvKskpZE/tE3U6GBlPZa7i5EQ8pMwpCGICp9XOMWZtGa3r
	9ytXHo0Qg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdYIS-0008Hd-16; Fri, 13 Nov 2020 12:35:20 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdYHj-00081g-P9
 for linux-mtd@lists.infradead.org; Fri, 13 Nov 2020 12:34:36 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 54CC0C0015;
 Fri, 13 Nov 2020 12:34:34 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 11/19] mtd: rawnand: mpc5121: Move the ECC initialization to
 ->attach_chip()
Date: Fri, 13 Nov 2020 13:34:16 +0100
Message-Id: <20201113123424.32233-12-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201113123424.32233-1-miquel.raynal@bootlin.com>
References: <20201113123424.32233-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_073435_967120_44064257 
X-CRM114-Status: GOOD (  14.96  )
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
 drivers/mtd/nand/raw/mpc5121_nfc.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/mpc5121_nfc.c b/drivers/mtd/nand/raw/mpc5121_nfc.c
index dfd0d3ed5ed0..fb4c0b11689f 100644
--- a/drivers/mtd/nand/raw/mpc5121_nfc.c
+++ b/drivers/mtd/nand/raw/mpc5121_nfc.c
@@ -104,6 +104,7 @@
 #define NFC_TIMEOUT		(HZ / 10)	/* 1/10 s */
 
 struct mpc5121_nfc_prv {
+	struct nand_controller	controller;
 	struct nand_chip	chip;
 	int			irq;
 	void __iomem		*regs;
@@ -602,6 +603,18 @@ static void mpc5121_nfc_free(struct device *dev, struct mtd_info *mtd)
 		iounmap(prv->csreg);
 }
 
+static int mpc5121_nfc_attach_chip(struct nand_chip *chip)
+{
+	chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
+	chip->ecc.algo = NAND_ECC_ALGO_HAMMING;
+
+	return 0;
+}
+
+static const struct nand_controller_ops mpc5121_nfc_ops = {
+	.attach_chip = mpc5121_nfc_attach_chip,
+};
+
 static int mpc5121_nfc_probe(struct platform_device *op)
 {
 	struct device_node *dn = op->dev.of_node;
@@ -634,6 +647,10 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 	chip = &prv->chip;
 	mtd = nand_to_mtd(chip);
 
+	nand_controller_init(&prv->controller);
+	prv->controller.ops = &mpc5121_nfc_ops;
+	chip->controller = &prv->controller;
+
 	mtd->dev.parent = dev;
 	nand_set_controller_data(chip, prv);
 	nand_set_flash_node(chip, dn);
@@ -688,8 +705,6 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 	chip->legacy.set_features = nand_get_set_features_notsupp;
 	chip->legacy.get_features = nand_get_set_features_notsupp;
 	chip->bbt_options = NAND_BBT_USE_FLASH;
-	chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
-	chip->ecc.algo = NAND_ECC_ALGO_HAMMING;
 
 	/* Support external chip-select logic on ADS5121 board */
 	if (of_machine_is_compatible("fsl,mpc5121ads")) {
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
