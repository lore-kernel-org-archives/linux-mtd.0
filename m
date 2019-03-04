Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C08BC43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 20:18:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3952C206B6
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 20:18:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EjN/c5Ia";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Jy2NNdRZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3952C206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ShoeLOEP/xNZgt9YzLKSJm0jrW24sUzTbNTH7D/Vrww=; b=EjN/c5IazqWHaM
	I/jcnvIUcxOcfQwvdJ5sg1EjgYFP7BobzFadumuVxe3+mPZ83qoj96UoX3frtXhIsIVutCG9yAmuO
	l2fjQsFjuOzmtDteAFt1f4XgMXsItRtNumxQmncJkWi9A7kEL2MNCUX8NEsJ0Twz+ypYQOBAU115V
	I8yTqg35Zhmt9MltcsM5EDGl5hym56qLEuqLfW87fJE9hhdw+f7v1K5ecVZ+zw71OtPHBKHVqxVuh
	pmpzwq7E0JNpLsI+3lxdcQt4cHbcsrKnaz7y9mBuopj8BHt/+v+Dzg3FIKVkCvxtYQ2gYrY3wt0Ze
	D1ks+Bu/e3DqMszW6DvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0u2q-0002CA-Oz; Mon, 04 Mar 2019 20:18:40 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0u18-0008Mp-OF; Mon, 04 Mar 2019 20:16:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RIMMN+wHIkXJynA5yw8q7ecODfUtkJ2MmUKCA/HS1sc=; b=Jy2NNdRZvdMTEoGp6hQUplsy+G
 LG53YxD12Q6YxjiSFRRJ1XBxsat7mZdWzRSEpTZQQtlF61+7Kbs9gV5tCSPRtXWzYvmxdE9PL1gwQ
 U7nz5d2eYEys9GWyl/GrnYp5E+mfy9iJciYjv3mK6Ok+RHvfOHLidco5K8GEz70mZUvdnktxPb8ey
 0acQga1DYoPBxhZ1a3H861+cMCuC2J2x61I3g9oHvaRMeJv//qz3/V33JJcuCr+10IJH4FbrffL1d
 kXkQLkXzCOvXspW0XZJXaMWVe1Q4ozPU3xD+t0E8JhCezf7W4g5mjb5+qMlzOyILAfRkLixMPpoBw
 +ShJrGDA==;
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0u15-00005v-Oj; Mon, 04 Mar 2019 20:16:52 +0000
Received: from localhost.localdomain (26.43.136.77.rev.sfr.net [77.136.43.26])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 7C014240008;
 Mon,  4 Mar 2019 20:16:22 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 08/15] mtd: rawnand: Initialize the nand_device object
Date: Mon,  4 Mar 2019 21:15:15 +0100
Message-Id: <20190304201522.11323-9-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190304201522.11323-1-miquel.raynal@bootlin.com>
References: <20190304201522.11323-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_151652_043179_6B9C4C78 
X-CRM114-Status: GOOD (  19.80  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh R <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Julien Su <juliensu@mxic.com.tw>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <bbrezillon@kernel.org>

In order to use some of the nanddev_xxx() helpers, we need to
initialize the nand_device object embedded in nand_chip using
nanddev_init(). This requires implementing nand_ops.

We also drop useless mtd->xxx initialization when they're already taken
case of by nanddev_init().

Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/mtd/nand/raw/Kconfig     |  1 +
 drivers/mtd/nand/raw/nand_base.c | 65 ++++++++++++++++++++++++++++----
 2 files changed, 59 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 1a55d3e3d4c5..8c38f2c116a2 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -14,6 +14,7 @@ menuconfig MTD_NAND
 	tristate "Raw/Parallel NAND Device Support"
 	depends on MTD
 	select MTD_NAND_ECC
+	select MTD_NAND_CORE
 	help
 	  This enables support for accessing all type of raw/parallel
 	  NAND flash devices. For further information see
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 5aba1cf38a4b..fea3f8b96558 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5523,6 +5523,50 @@ static bool nand_ecc_strength_good(struct nand_chip *chip)
 	return corr >= ds_corr && ecc->strength >= chip->ecc_strength_ds;
 }
 
+static int rawnand_erase(struct nand_device *nand, const struct nand_pos *pos)
+{
+	struct nand_chip *chip = container_of(nand, struct nand_chip,
+					      base);
+	unsigned int eb = nanddev_pos_to_row(nand, pos);
+	int ret;
+
+	eb >>= nand->rowconv.eraseblock_addr_shift;
+
+	nand_select_target(chip, pos->target);
+	ret = nand_erase_op(chip, eb);
+	nand_deselect_target(chip);
+
+	return ret;
+}
+
+static int rawnand_markbad(struct nand_device *nand,
+			   const struct nand_pos *pos)
+{
+	struct nand_chip *chip = container_of(nand, struct nand_chip,
+					      base);
+
+	return nand_markbad_bbm(chip, nanddev_pos_to_offs(nand, pos));
+}
+
+static bool rawnand_isbad(struct nand_device *nand, const struct nand_pos *pos)
+{
+	struct nand_chip *chip = container_of(nand, struct nand_chip,
+					      base);
+	int ret;
+
+	nand_select_target(chip, pos->target);
+	ret = nand_isbad_bbm(chip, nanddev_pos_to_offs(nand, pos));
+	nand_deselect_target(chip);
+
+	return ret;
+}
+
+static const struct nand_ops rawnand_ops = {
+	.erase = rawnand_erase,
+	.markbad = rawnand_markbad,
+	.isbad = rawnand_isbad,
+};
+
 /**
  * nand_scan_tail - Scan for the NAND device
  * @chip: NAND chip object
@@ -5791,10 +5835,15 @@ static int nand_scan_tail(struct nand_chip *chip)
 		break;
 	}
 
+	ret = nanddev_init(&chip->base, &rawnand_ops, mtd->owner);
+	if (ret)
+		goto err_nand_manuf_cleanup;
+
+	/* Adjust the MTD_CAP_ flags when NAND_ROM is set. */
+	if (chip->options & NAND_ROM)
+		mtd->flags = MTD_CAP_ROM;
+
 	/* Fill in remaining MTD driver data */
-	mtd->type = nand_is_slc(chip) ? MTD_NANDFLASH : MTD_MLCNANDFLASH;
-	mtd->flags = (chip->options & NAND_ROM) ? MTD_CAP_ROM :
-						MTD_CAP_NANDFLASH;
 	mtd->_erase = nand_erase;
 	mtd->_point = NULL;
 	mtd->_unpoint = NULL;
@@ -5811,7 +5860,6 @@ static int nand_scan_tail(struct nand_chip *chip)
 	mtd->_block_isbad = nand_block_isbad;
 	mtd->_block_markbad = nand_block_markbad;
 	mtd->_max_bad_blocks = nand_max_bad_blocks;
-	mtd->writebufsize = mtd->writesize;
 
 	/*
 	 * Initialize bitflip_threshold to its default prior scan_bbt() call.
@@ -5824,13 +5872,13 @@ static int nand_scan_tail(struct nand_chip *chip)
 	/* Initialize the ->data_interface field. */
 	ret = nand_init_data_interface(chip);
 	if (ret)
-		goto err_nand_manuf_cleanup;
+		goto err_nanddev_cleanup;
 
 	/* Enter fastest possible mode on all dies. */
 	for (i = 0; i < chip->numchips; i++) {
 		ret = nand_setup_data_interface(chip, i);
 		if (ret)
-			goto err_nand_manuf_cleanup;
+			goto err_nanddev_cleanup;
 	}
 
 	/* Check, if we should skip the bad block table scan */
@@ -5840,11 +5888,14 @@ static int nand_scan_tail(struct nand_chip *chip)
 	/* Build bad block table */
 	ret = nand_create_bbt(chip);
 	if (ret)
-		goto err_nand_manuf_cleanup;
+		goto err_nanddev_cleanup;
 
 	return 0;
 
 
+err_nanddev_cleanup:
+	nanddev_cleanup(&chip->base);
+
 err_nand_manuf_cleanup:
 	nand_manufacturer_cleanup(chip);
 
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
