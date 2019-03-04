Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8323C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 20:19:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3511206B6
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 20:19:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KPoATC2a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rtpZG+6v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3511206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=60Z14GlWQ03U1GLwDddHMfTmNQgjrr67+CesgLQaEc8=; b=KPoATC2aqjVNLT
	mBG5U/8RozsBZeqLUwfNlBrBkG/UqQPuFv4xsKP0+vom2sflaJrRONxe1OnnbTRRzMzOot5vyO1n/
	numID/rsookvvVmGVNRMXk7bY+/Exn1jXSQyCYtUOcH3hgiG5W+4LEK86kqOtMFOBEcgLZdnj0uqo
	00F4rmGvYGBUk0YJvZ+fEsrt+EFswJL9czPlbsurEl1lHMGYSVIPsYRKQCrY+z4wngQR6zvL8udZ2
	HrQ4c+lu2TbQjfwOt2VgMvVIaU3uWU8gfqJFbro9ONF8uecf+6jVm21zUv7rw4aPVpYDAXFxGpz7V
	DqWZ90ZrsxrzoX0dEnnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0u45-0003r1-DT; Mon, 04 Mar 2019 20:19:57 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0u1W-0000Mx-5J; Mon, 04 Mar 2019 20:17:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4ohWktYtThNyMc5aetY90f9ZBzJ9q6yQw8exSefiFC8=; b=rtpZG+6v+xa4ASMrN3zVaRGQYI
 HKAKhgdiqECFnAh+b8ir2vSS5ZWUNRQAIuEqK1mjOyDu7sQDGY3A24YLFt0bjeGltSo9/SdClCzfg
 IGTlFCqxEb7a8xoKux0COqJ4xm/UvS38NtRKfL8wn7OnkwrwP6LcIE/H8jtQGcbuVaJyO9PJM7Chr
 oLognU7rv6ZymthdHtStV2nvh/P5dgrZguOvRUd+JYAJrwwmD3LXqnLIJATpw/IDcNFEb13Ts7iqc
 nJV5j8ORgBKwHvkM+b7cWk0BXuxu+kbkJrzEBVYSMMMNF5BP+bdWsKXp63tQvuKTe9cHeqIbBhRPi
 6UesyZaw==;
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0u1T-00007H-HS; Mon, 04 Mar 2019 20:17:16 +0000
Received: from localhost.localdomain (26.43.136.77.rev.sfr.net [77.136.43.26])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 36A2B240007;
 Mon,  4 Mar 2019 20:16:48 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 12/15] mtd: rawnand: Get rid of chip->bits_per_cell
Date: Mon,  4 Mar 2019 21:15:19 +0100
Message-Id: <20190304201522.11323-13-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190304201522.11323-1-miquel.raynal@bootlin.com>
References: <20190304201522.11323-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_151715_819691_71C768F1 
X-CRM114-Status: GOOD (  14.10  )
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

Now that we inherit from nand_device, we can use
nand_device->memorg.bits_per_cell instead of having our own field at
the nand_chip level.

Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/mtd/nand/raw/nand_base.c   | 4 ----
 drivers/mtd/nand/raw/nand_hynix.c  | 2 +-
 drivers/mtd/nand/raw/nand_jedec.c  | 1 -
 drivers/mtd/nand/raw/nand_micron.c | 2 +-
 drivers/mtd/nand/raw/nand_onfi.c   | 1 -
 include/linux/mtd/rawnand.h        | 6 ++----
 6 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 700b99a77789..91fd508cf406 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -4502,7 +4502,6 @@ void nand_decode_ext_id(struct nand_chip *chip)
 
 	/* The 3rd id byte holds MLC / multichip data */
 	memorg->bits_per_cell = nand_get_bits_per_cell(id_data[2]);
-	chip->bits_per_cell = nand_get_bits_per_cell(id_data[2]);
 	/* The 4th id byte is the important one */
 	extid = id_data[3];
 
@@ -4546,7 +4545,6 @@ static void nand_decode_id(struct nand_chip *chip, struct nand_flash_dev *type)
 
 	/* All legacy ID NAND are small-page, SLC */
 	memorg->bits_per_cell = 1;
-	chip->bits_per_cell = 1;
 }
 
 /*
@@ -4589,7 +4587,6 @@ static bool find_full_id_nand(struct nand_chip *chip,
 		mtd->oobsize = memorg->oobsize;
 
 		memorg->bits_per_cell = nand_get_bits_per_cell(id_data[2]);
-		chip->bits_per_cell = nand_get_bits_per_cell(id_data[2]);
 		chip->chipsize = (uint64_t)type->chipsize << 20;
 		memorg->eraseblocks_per_lun =
 			DIV_ROUND_DOWN_ULL((u64)type->chipsize << 20,
@@ -4629,7 +4626,6 @@ static void nand_manufacturer_detect(struct nand_chip *chip)
 
 		/* The 3rd id byte holds MLC / multichip data */
 		memorg->bits_per_cell = nand_get_bits_per_cell(chip->id.data[2]);
-		chip->bits_per_cell = nand_get_bits_per_cell(chip->id.data[2]);
 		chip->manufacturer.desc->ops->detect(chip);
 	} else {
 		nand_decode_ext_id(chip);
diff --git a/drivers/mtd/nand/raw/nand_hynix.c b/drivers/mtd/nand/raw/nand_hynix.c
index 94ea8c593589..272b934dffb7 100644
--- a/drivers/mtd/nand/raw/nand_hynix.c
+++ b/drivers/mtd/nand/raw/nand_hynix.c
@@ -592,7 +592,7 @@ static void hynix_nand_extract_scrambling_requirements(struct nand_chip *chip,
 	u8 nand_tech;
 
 	/* We need scrambling on all TLC NANDs*/
-	if (chip->bits_per_cell > 2)
+	if (nanddev_bits_per_cell(&chip->base) > 2)
 		chip->options |= NAND_NEED_SCRAMBLING;
 
 	/* And on MLC NANDs with sub-3xnm process */
diff --git a/drivers/mtd/nand/raw/nand_jedec.c b/drivers/mtd/nand/raw/nand_jedec.c
index 61e33ee7ee19..030f178c7a97 100644
--- a/drivers/mtd/nand/raw/nand_jedec.c
+++ b/drivers/mtd/nand/raw/nand_jedec.c
@@ -104,7 +104,6 @@ int nand_jedec_detect(struct nand_chip *chip)
 	chip->chipsize = memorg->eraseblocks_per_lun;
 	chip->chipsize *= (uint64_t)mtd->erasesize * p->lun_count;
 	memorg->bits_per_cell = p->bits_per_cell;
-	chip->bits_per_cell = p->bits_per_cell;
 
 	if (le16_to_cpu(p->features) & JEDEC_FEATURE_16_BIT_BUS)
 		chip->options |= NAND_BUSWIDTH_16;
diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
index b85e1c13b79e..98ce6575aa64 100644
--- a/drivers/mtd/nand/raw/nand_micron.c
+++ b/drivers/mtd/nand/raw/nand_micron.c
@@ -385,7 +385,7 @@ static int micron_supports_on_die_ecc(struct nand_chip *chip)
 	if (!chip->parameters.onfi)
 		return MICRON_ON_DIE_UNSUPPORTED;
 
-	if (chip->bits_per_cell != 1)
+	if (nanddev_bits_per_cell(&chip->base) != 1)
 		return MICRON_ON_DIE_UNSUPPORTED;
 
 	/*
diff --git a/drivers/mtd/nand/raw/nand_onfi.c b/drivers/mtd/nand/raw/nand_onfi.c
index 3ca9c8923a30..a6b9fc9a335b 100644
--- a/drivers/mtd/nand/raw/nand_onfi.c
+++ b/drivers/mtd/nand/raw/nand_onfi.c
@@ -249,7 +249,6 @@ int nand_onfi_detect(struct nand_chip *chip)
 	chip->chipsize = memorg->eraseblocks_per_lun;
 	chip->chipsize *= (uint64_t)mtd->erasesize * p->lun_count;
 	memorg->bits_per_cell = p->bits_per_cell;
-	chip->bits_per_cell = p->bits_per_cell;
 
 	if (le16_to_cpu(p->features) & ONFI_FEATURE_16_BIT_BUS)
 		chip->options |= NAND_BUSWIDTH_16;
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index d748e09de480..24ecd9a4f952 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1004,7 +1004,6 @@ struct nand_legacy {
  * @badblockbits:	[INTERN] minimum number of set bits in a good block's
  *			bad block marker position; i.e., BBM == 11110111b is
  *			not bad when badblockbits == 7
- * @bits_per_cell:	[INTERN] number of bits per cell. i.e., 1 means SLC.
  * @ecc_strength_ds:	[INTERN] ECC correctability from the datasheet.
  *			Minimum amount of bit errors per @ecc_step_ds guaranteed
  *			to be correctable. If unknown, set to zero.
@@ -1073,7 +1072,6 @@ struct nand_chip {
 	} pagecache;
 
 	int subpagesize;
-	uint8_t bits_per_cell;
 	uint16_t ecc_strength_ds;
 	uint16_t ecc_step_ds;
 	int onfi_timing_mode_default;
@@ -1244,9 +1242,9 @@ int nand_create_bbt(struct nand_chip *chip);
  */
 static inline bool nand_is_slc(struct nand_chip *chip)
 {
-	WARN(chip->bits_per_cell == 0,
+	WARN(nanddev_bits_per_cell(&chip->base) == 0,
 	     "chip->bits_per_cell is used uninitialized\n");
-	return chip->bits_per_cell == 1;
+	return nanddev_bits_per_cell(&chip->base) == 1;
 }
 
 /**
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
