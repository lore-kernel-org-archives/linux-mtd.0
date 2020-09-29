Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1146CC4727D
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 23:03:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A282920897
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 23:03:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fqpglkDX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A282920897
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eV1v/qYlj5+kP8MbyrsHujSQG1hPoBg9qLpM3DfIarU=; b=fqpglkDX40GWW7HQGg/uxBurC
	ieocOX8k1PnJlROyRbJFFtHHBxPVV0gInrDnB1PZ+cW94EmZGW8jY4A2ztxmKPQA7iabash/g4ARt
	31dLmtWuvh613x/3ED8XTmC0zfQyoEiMKV/NcWcAKdhr50R/8rBTAAEfkOjCSEwFYa+EKLo/MMLYq
	mFlz+3RpCamJe9q4qYiZSSRZ1oDdOElSVnQ0X3X12DuKs9YizKS97cT5VIEuTxLC2AoXqUoX86oLf
	kTUaQP9XAqr2hCYeHcDyv1590wqKwV1iq6PG0NpWSXOIq+q4TeY2cHS7GxwOjqFWq+KwI6qAeTW/w
	LFsfOGphw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNOeQ-0001up-DZ; Tue, 29 Sep 2020 23:03:14 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNOd0-0001G1-R6
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 23:01:49 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id EDED920000B;
 Tue, 29 Sep 2020 23:01:44 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 16/20] mtd: nand: ecc-hamming: Stop using raw NAND structures
Date: Wed, 30 Sep 2020 01:01:20 +0200
Message-Id: <20200929230124.31491-17-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200929230124.31491-1-miquel.raynal@bootlin.com>
References: <20200929230124.31491-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_190147_118023_C9B2783A 
X-CRM114-Status: GOOD (  20.25  )
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
Cc: Julien Su <juliensu@mxic.com.tw>, ycllin@mxic.com.tw,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This code is meant to be reused by the SPI-NAND core. Now that the
driver has been cleaned and reorganized, use a generic ECC engine
object to store the driver's data instead of accessing members of the
nand_chip structure. This means adding proper init/cleanup helpers.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/ecc-sw-hamming.c       | 17 ++++---
 drivers/mtd/nand/raw/nand_base.c        | 63 +++++++++++++++++++++++--
 include/linux/mtd/nand-ecc-sw-hamming.h | 20 ++++++++
 include/linux/mtd/rawnand.h             |  2 +
 4 files changed, 90 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/ecc-sw-hamming.c b/drivers/mtd/nand/ecc-sw-hamming.c
index 7ee0387ecb29..9cd70b4637c1 100644
--- a/drivers/mtd/nand/ecc-sw-hamming.c
+++ b/drivers/mtd/nand/ecc-sw-hamming.c
@@ -17,8 +17,6 @@
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/mtd/mtd.h>
-#include <linux/mtd/rawnand.h>
 #include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <asm/byteorder.h>
 
@@ -361,10 +359,11 @@ EXPORT_SYMBOL(ecc_sw_hamming_calculate);
 int nand_ecc_sw_hamming_calculate(struct nand_device *nand,
 				  const unsigned char *buf, unsigned char *code)
 {
-	struct nand_chip *chip = mtd_to_nand(nanddev_to_mtd(nand));
-	bool sm_order = chip->ecc.options & NAND_ECC_SOFT_HAMMING_SM_ORDER;
+	struct nand_ecc_sw_hamming_conf *engine_conf = nand->ecc.ctx.priv;
+	unsigned int step_size = nand->ecc.ctx.conf.step_size;
 
-	return ecc_sw_hamming_calculate(buf, chip->ecc.size, code, sm_order);
+	return ecc_sw_hamming_calculate(buf, step_size, code,
+					engine_conf->sm_order);
 }
 EXPORT_SYMBOL(nand_ecc_sw_hamming_calculate);
 
@@ -453,11 +452,11 @@ int nand_ecc_sw_hamming_correct(struct nand_device *nand, unsigned char *buf,
 				unsigned char *read_ecc,
 				unsigned char *calc_ecc)
 {
-	struct nand_chip *chip = mtd_to_nand(nanddev_to_mtd(nand));
-	bool sm_order = chip->ecc.options & NAND_ECC_SOFT_HAMMING_SM_ORDER;
+	struct nand_ecc_sw_hamming_conf *engine_conf = nand->ecc.ctx.priv;
+	unsigned int step_size = nand->ecc.ctx.conf.step_size;
 
-	return ecc_sw_hamming_correct(buf, read_ecc, calc_ecc, chip->ecc.size,
-				      sm_order);
+	return ecc_sw_hamming_correct(buf, read_ecc, calc_ecc, step_size,
+				      engine_conf->sm_order);
 }
 EXPORT_SYMBOL(nand_ecc_sw_hamming_correct);
 
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 07a5ceb8bf39..95dede09481b 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5144,6 +5144,46 @@ static void nand_scan_ident_cleanup(struct nand_chip *chip)
 	kfree(chip->parameters.onfi);
 }
 
+int rawnand_sw_hamming_init(struct nand_chip *chip)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct nand_ecc_sw_hamming_conf *engine_conf;
+	struct nand_device *base = &chip->base;
+
+	base->ecc.user_conf.engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
+	base->ecc.user_conf.algo = NAND_ECC_ALGO_HAMMING;
+	base->ecc.user_conf.strength = chip->ecc.strength;
+	base->ecc.user_conf.step_size = chip->ecc.size;
+
+	if (base->ecc.user_conf.strength != 1 ||
+	    (base->ecc.user_conf.step_size != 256 &&
+	     base->ecc.user_conf.step_size != 512)) {
+		pr_err("%s: unsupported strength or step size\n", __func__);
+		return -EINVAL;
+	}
+
+	engine_conf = kzalloc(sizeof(*engine_conf), GFP_KERNEL);
+	if (!engine_conf)
+		return -ENOMEM;
+
+	engine_conf->code_size = 3;
+	engine_conf->nsteps = mtd->writesize / base->ecc.user_conf.step_size;
+
+	if (chip->ecc.options & NAND_ECC_SOFT_HAMMING_SM_ORDER)
+		engine_conf->sm_order = true;
+
+	base->ecc.ctx.priv = engine_conf;
+
+	chip->ecc.size = base->ecc.ctx.conf.step_size;
+	chip->ecc.strength = base->ecc.ctx.conf.strength;
+	chip->ecc.total = base->ecc.ctx.total;
+	chip->ecc.steps = engine_conf->nsteps;
+	chip->ecc.bytes = engine_conf->code_size;
+
+	return 0;
+}
+EXPORT_SYMBOL(rawnand_sw_hamming_init);
+
 int rawnand_sw_hamming_calculate(struct nand_chip *chip,
 				 const unsigned char *buf,
 				 unsigned char *code)
@@ -5165,6 +5205,14 @@ int rawnand_sw_hamming_correct(struct nand_chip *chip,
 }
 EXPORT_SYMBOL(rawnand_sw_hamming_correct);
 
+void rawnand_sw_hamming_cleanup(struct nand_chip *chip)
+{
+	struct nand_device *base = &chip->base;
+
+	kfree(base->ecc.ctx.priv);
+}
+EXPORT_SYMBOL(rawnand_sw_hamming_cleanup);
+
 int rawnand_sw_bch_init(struct nand_chip *chip)
 {
 	struct nand_device *base = &chip->base;
@@ -5308,6 +5356,12 @@ static int nand_set_ecc_soft_ops(struct nand_chip *chip)
 		if (IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC))
 			ecc->options |= NAND_ECC_SOFT_HAMMING_SM_ORDER;
 
+		ret = rawnand_sw_hamming_init(chip);
+		if (ret) {
+			WARN(1, "Hamming ECC initialization failed!\n");
+			return ret;
+		}
+
 		return 0;
 	case NAND_ECC_ALGO_BCH:
 		if (!IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_BCH)) {
@@ -6001,9 +6055,12 @@ EXPORT_SYMBOL(nand_scan_with_ids);
  */
 void nand_cleanup(struct nand_chip *chip)
 {
-	if (chip->ecc.engine_type == NAND_ECC_ENGINE_TYPE_SOFT &&
-	    chip->ecc.algo == NAND_ECC_ALGO_BCH)
-		rawnand_sw_bch_cleanup(chip);
+	if (chip->ecc.engine_type == NAND_ECC_ENGINE_TYPE_SOFT) {
+		if (chip->ecc.algo == NAND_ECC_ALGO_HAMMING)
+			rawnand_sw_hamming_cleanup(chip);
+		else if (chip->ecc.algo == NAND_ECC_ALGO_BCH)
+			rawnand_sw_bch_cleanup(chip);
+	}
 
 	nanddev_cleanup(&chip->base);
 
diff --git a/include/linux/mtd/nand-ecc-sw-hamming.h b/include/linux/mtd/nand-ecc-sw-hamming.h
index 84a123bf45f3..9d4b4d623741 100644
--- a/include/linux/mtd/nand-ecc-sw-hamming.h
+++ b/include/linux/mtd/nand-ecc-sw-hamming.h
@@ -12,6 +12,26 @@
 
 #include <linux/mtd/nand.h>
 
+/**
+ * struct nand_ecc_sw_hamming_conf - private software Hamming ECC engine structure
+ * @reqooblen: Save the actual user OOB length requested before overwriting it
+ * @spare_oobbuf: Spare OOB buffer if none is provided
+ * @code_size: Number of bytes needed to store a code (one code per step)
+ * @nsteps: Number of steps
+ * @calc_buf: Buffer to use when calculating ECC bytes
+ * @code_buf: Buffer to use when reading (raw) ECC bytes from the chip
+ * @sm_order: Smart Media special ordering
+ */
+struct nand_ecc_sw_hamming_conf {
+	unsigned int reqooblen;
+	void *spare_oobbuf;
+	unsigned int code_size;
+	unsigned int nsteps;
+	u8 *calc_buf;
+	u8 *code_buf;
+	unsigned int sm_order;
+};
+
 int ecc_sw_hamming_calculate(const unsigned char *buf, unsigned int step_size,
 			     unsigned char *code, bool sm_order);
 int nand_ecc_sw_hamming_calculate(struct nand_device *nand,
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 685d24557e95..0a90a8792d18 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1301,6 +1301,7 @@ static inline int nand_opcode_8bits(unsigned int command)
 	return 0;
 }
 
+int rawnand_sw_hamming_init(struct nand_chip *chip);
 int rawnand_sw_hamming_calculate(struct nand_chip *chip,
 				 const unsigned char *buf,
 				 unsigned char *code);
@@ -1308,6 +1309,7 @@ int rawnand_sw_hamming_correct(struct nand_chip *chip,
 			       unsigned char *buf,
 			       unsigned char *read_ecc,
 			       unsigned char *calc_ecc);
+void rawnand_sw_hamming_cleanup(struct nand_chip *chip);
 int rawnand_sw_bch_init(struct nand_chip *chip);
 int rawnand_sw_bch_correct(struct nand_chip *chip, unsigned char *buf,
 			   unsigned char *read_ecc, unsigned char *calc_ecc);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
