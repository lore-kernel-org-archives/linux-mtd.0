Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6682C4727C
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 23:04:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38ED920897
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 23:04:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yc9nT4Dw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38ED920897
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/f1E10FFrQw4lnyDHEs3phKHg4JiBNa2U70QRpZiQMc=; b=Yc9nT4Dw0sMlGWqvKpAtxHrTp
	yXkzyhVhYtLp0qz1QjrHRpgjO/eJrPyccM+zYnmkJvVNU9nUXr5GqH6v75ul8NyjKj1uz5vZYiWWl
	Q/rXgjn/7VXZkdVB2N5FxPmxBOuxY/NDx22+A0G6hF6OMb4CL+lmcLtUD2SK/St3pOsxfYYtXtGVH
	5XNgwLRncaDKMhcTELvVy3npMOr76ARIduOvJbAXa4KIFaOGi8YapFlGxq7qcWegZBDph3K/c+p2c
	oW7dJAGcSBKsjJuUDu7NWFE1CiGwnK9lK5TWeyBejFGC7qQU0GdkPTJrmqg9unh+blsxNvyLf+bgj
	mpz+McjCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNOfL-0002Ry-I7; Tue, 29 Sep 2020 23:04:11 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNOd3-0001HA-KZ
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 23:01:55 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id D4A43200018;
 Tue, 29 Sep 2020 23:01:47 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 19/20] mtd: nand: ecc-hamming: Create the software Hamming
 engine
Date: Wed, 30 Sep 2020 01:01:23 +0200
Message-Id: <20200929230124.31491-20-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200929230124.31491-1-miquel.raynal@bootlin.com>
References: <20200929230124.31491-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_190149_918393_059B9903 
X-CRM114-Status: GOOD (  27.20  )
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

Let's continue introducing the generic ECC engine abstraction in the
NAND subsystem by instantiating a second ECC engine: software
Hamming.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/ecc-sw-hamming.c       | 191 ++++++++++++++++++++++++
 drivers/mtd/nand/raw/nand_base.c        |  26 ++--
 include/linux/mtd/nand-ecc-sw-hamming.h |  16 +-
 include/linux/mtd/nand.h                |   9 ++
 4 files changed, 221 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/nand/ecc-sw-hamming.c b/drivers/mtd/nand/ecc-sw-hamming.c
index 9cd70b4637c1..334e619b35c9 100644
--- a/drivers/mtd/nand/ecc-sw-hamming.c
+++ b/drivers/mtd/nand/ecc-sw-hamming.c
@@ -17,7 +17,9 @@
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mtd/nand.h>
 #include <linux/mtd/nand-ecc-sw-hamming.h>
+#include <linux/slab.h>
 #include <asm/byteorder.h>
 
 /*
@@ -460,6 +462,195 @@ int nand_ecc_sw_hamming_correct(struct nand_device *nand, unsigned char *buf,
 }
 EXPORT_SYMBOL(nand_ecc_sw_hamming_correct);
 
+int nand_ecc_sw_hamming_init_ctx(struct nand_device *nand)
+{
+	struct nand_ecc_props *conf = &nand->ecc.ctx.conf;
+	struct nand_ecc_sw_hamming_conf *engine_conf;
+	struct mtd_info *mtd = nanddev_to_mtd(nand);
+	int ret;
+
+	if (!mtd->ooblayout) {
+		switch (mtd->oobsize) {
+		case 8:
+		case 16:
+			mtd_set_ooblayout(mtd, nand_get_small_page_ooblayout());
+			break;
+		case 64:
+		case 128:
+			mtd_set_ooblayout(mtd,
+					  nand_get_large_page_hamming_ooblayout());
+			break;
+		default:
+			return -ENOTSUPP;
+		}
+	}
+
+	conf->engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
+	conf->algo = NAND_ECC_ALGO_HAMMING;
+	conf->step_size = nand->ecc.user_conf.step_size;
+	conf->strength = 1;
+
+	/* Use the strongest configuration by default */
+	if (conf->step_size != 256 && conf->step_size != 512)
+		conf->step_size = 256;
+
+	engine_conf = kzalloc(sizeof(*engine_conf), GFP_KERNEL);
+	if (!engine_conf)
+		return -ENOMEM;
+
+	ret = nand_ecc_init_req_tweaking(&engine_conf->req_ctx, nand);
+	if (ret)
+		goto free_engine_conf;
+
+	engine_conf->code_size = 3;
+	engine_conf->nsteps = mtd->writesize / conf->step_size;
+	engine_conf->calc_buf = kzalloc(sizeof(mtd->oobsize), GFP_KERNEL);
+	engine_conf->code_buf = kzalloc(sizeof(mtd->oobsize), GFP_KERNEL);
+	if (!engine_conf->calc_buf || !engine_conf->code_buf) {
+		ret = -ENOMEM;
+		goto free_bufs;
+	}
+
+	nand->ecc.ctx.priv = engine_conf;
+	nand->ecc.ctx.total = engine_conf->nsteps * engine_conf->code_size;
+
+	return 0;
+
+free_bufs:
+	nand_ecc_cleanup_req_tweaking(&engine_conf->req_ctx);
+	kfree(engine_conf->calc_buf);
+	kfree(engine_conf->code_buf);
+free_engine_conf:
+	kfree(engine_conf);
+
+	return ret;
+}
+EXPORT_SYMBOL(nand_ecc_sw_hamming_init_ctx);
+
+void nand_ecc_sw_hamming_cleanup_ctx(struct nand_device *nand)
+{
+	struct nand_ecc_sw_hamming_conf *engine_conf = nand->ecc.ctx.priv;
+
+	if (engine_conf) {
+		nand_ecc_cleanup_req_tweaking(&engine_conf->req_ctx);
+		kfree(engine_conf->calc_buf);
+		kfree(engine_conf->code_buf);
+		kfree(engine_conf);
+	}
+}
+EXPORT_SYMBOL(nand_ecc_sw_hamming_cleanup_ctx);
+
+static int nand_ecc_sw_hamming_prepare_io_req(struct nand_device *nand,
+					      struct nand_page_io_req *req)
+{
+	struct nand_ecc_sw_hamming_conf *engine_conf = nand->ecc.ctx.priv;
+	struct mtd_info *mtd = nanddev_to_mtd(nand);
+	int eccsize = nand->ecc.ctx.conf.step_size;
+	int eccbytes = engine_conf->code_size;
+	int eccsteps = engine_conf->nsteps;
+	int total = nand->ecc.ctx.total;
+	u8 *ecccalc = engine_conf->calc_buf;
+	const u8 *data = req->databuf.out;
+	int i;
+
+	/* Nothing to do for a raw operation */
+	if (req->mode == MTD_OPS_RAW)
+		return 0;
+
+	/* This engine does not provide BBM/free OOB bytes protection */
+	if (!req->datalen)
+		return 0;
+
+	nand_ecc_tweak_req(&engine_conf->req_ctx, req);
+
+	/* No more preparation for page read */
+	if (req->type == NAND_PAGE_READ)
+		return 0;
+
+	/* Preparation for page write: derive the ECC bytes and place them */
+	for (i = 0; eccsteps; eccsteps--, i += eccbytes, data += eccsize)
+		nand_ecc_sw_hamming_calculate(nand, data, &ecccalc[i]);
+
+	return mtd_ooblayout_set_eccbytes(mtd, ecccalc, (void *)req->oobbuf.out,
+					  0, total);
+}
+
+static int nand_ecc_sw_hamming_finish_io_req(struct nand_device *nand,
+					     struct nand_page_io_req *req)
+{
+	struct nand_ecc_sw_hamming_conf *engine_conf = nand->ecc.ctx.priv;
+	struct mtd_info *mtd = nanddev_to_mtd(nand);
+	int eccsize = nand->ecc.ctx.conf.step_size;
+	int total = nand->ecc.ctx.total;
+	int eccbytes = engine_conf->code_size;
+	int eccsteps = engine_conf->nsteps;
+	u8 *ecccalc = engine_conf->calc_buf;
+	u8 *ecccode = engine_conf->code_buf;
+	unsigned int max_bitflips = 0;
+	u8 *data = req->databuf.in;
+	int i, ret;
+
+	/* Nothing to do for a raw operation */
+	if (req->mode == MTD_OPS_RAW)
+		return 0;
+
+	/* This engine does not provide BBM/free OOB bytes protection */
+	if (!req->datalen)
+		return 0;
+
+	/* No more preparation for page write */
+	if (req->type == NAND_PAGE_WRITE) {
+		nand_ecc_restore_req(&engine_conf->req_ctx, req);
+		return 0;
+	}
+
+	/* Finish a page read: retrieve the (raw) ECC bytes*/
+	ret = mtd_ooblayout_get_eccbytes(mtd, ecccode, req->oobbuf.in, 0,
+					 total);
+	if (ret)
+		return ret;
+
+	/* Calculate the ECC bytes */
+	for (i = 0; eccsteps; eccsteps--, i += eccbytes, data += eccsize)
+		nand_ecc_sw_hamming_calculate(nand, data, &ecccalc[i]);
+
+	/* Finish a page read: compare and correct */
+	for (eccsteps = engine_conf->nsteps, i = 0, data = req->databuf.in;
+	     eccsteps;
+	     eccsteps--, i += eccbytes, data += eccsize) {
+		int stat =  nand_ecc_sw_hamming_correct(nand, data,
+							&ecccode[i],
+							&ecccalc[i]);
+		if (stat < 0) {
+			mtd->ecc_stats.failed++;
+		} else {
+			mtd->ecc_stats.corrected += stat;
+			max_bitflips = max_t(unsigned int, max_bitflips, stat);
+		}
+	}
+
+	nand_ecc_restore_req(&engine_conf->req_ctx, req);
+
+	return max_bitflips;
+}
+
+static struct nand_ecc_engine_ops nand_ecc_sw_hamming_engine_ops = {
+	.init_ctx = nand_ecc_sw_hamming_init_ctx,
+	.cleanup_ctx = nand_ecc_sw_hamming_cleanup_ctx,
+	.prepare_io_req = nand_ecc_sw_hamming_prepare_io_req,
+	.finish_io_req = nand_ecc_sw_hamming_finish_io_req,
+};
+
+static struct nand_ecc_engine nand_ecc_sw_hamming_engine = {
+	.ops = &nand_ecc_sw_hamming_engine_ops,
+};
+
+struct nand_ecc_engine *nand_ecc_sw_hamming_get_engine(void)
+{
+	return &nand_ecc_sw_hamming_engine;
+}
+EXPORT_SYMBOL(nand_ecc_sw_hamming_get_engine);
+
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Frans Meulenbroeks <fransmeulenbroeks@gmail.com>");
 MODULE_DESCRIPTION("NAND software Hamming ECC support");
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 95dede09481b..9a29d207c56b 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5146,34 +5146,24 @@ static void nand_scan_ident_cleanup(struct nand_chip *chip)
 
 int rawnand_sw_hamming_init(struct nand_chip *chip)
 {
-	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct nand_ecc_sw_hamming_conf *engine_conf;
 	struct nand_device *base = &chip->base;
+	int ret;
 
 	base->ecc.user_conf.engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
 	base->ecc.user_conf.algo = NAND_ECC_ALGO_HAMMING;
 	base->ecc.user_conf.strength = chip->ecc.strength;
 	base->ecc.user_conf.step_size = chip->ecc.size;
 
-	if (base->ecc.user_conf.strength != 1 ||
-	    (base->ecc.user_conf.step_size != 256 &&
-	     base->ecc.user_conf.step_size != 512)) {
-		pr_err("%s: unsupported strength or step size\n", __func__);
-		return -EINVAL;
-	}
+	ret = nand_ecc_sw_hamming_init_ctx(base);
+	if (ret)
+		return ret;
 
-	engine_conf = kzalloc(sizeof(*engine_conf), GFP_KERNEL);
-	if (!engine_conf)
-		return -ENOMEM;
-
-	engine_conf->code_size = 3;
-	engine_conf->nsteps = mtd->writesize / base->ecc.user_conf.step_size;
+	engine_conf = base->ecc.ctx.priv;
 
 	if (chip->ecc.options & NAND_ECC_SOFT_HAMMING_SM_ORDER)
 		engine_conf->sm_order = true;
 
-	base->ecc.ctx.priv = engine_conf;
-
 	chip->ecc.size = base->ecc.ctx.conf.step_size;
 	chip->ecc.strength = base->ecc.ctx.conf.strength;
 	chip->ecc.total = base->ecc.ctx.total;
@@ -5209,7 +5199,7 @@ void rawnand_sw_hamming_cleanup(struct nand_chip *chip)
 {
 	struct nand_device *base = &chip->base;
 
-	kfree(base->ecc.ctx.priv);
+	nand_ecc_sw_hamming_cleanup_ctx(base);
 }
 EXPORT_SYMBOL(rawnand_sw_hamming_cleanup);
 
@@ -5738,7 +5728,9 @@ static int nand_scan_tail(struct nand_chip *chip)
 	 */
 	if (!mtd->ooblayout &&
 	    !(ecc->engine_type == NAND_ECC_ENGINE_TYPE_SOFT &&
-	      ecc->algo == NAND_ECC_ALGO_BCH)) {
+	      ecc->algo == NAND_ECC_ALGO_BCH) &&
+	    !(ecc->engine_type == NAND_ECC_ENGINE_TYPE_SOFT &&
+	      ecc->algo == NAND_ECC_ALGO_HAMMING)) {
 		switch (mtd->oobsize) {
 		case 8:
 		case 16:
diff --git a/include/linux/mtd/nand-ecc-sw-hamming.h b/include/linux/mtd/nand-ecc-sw-hamming.h
index 5a39e96c3546..9f9073d86ff3 100644
--- a/include/linux/mtd/nand-ecc-sw-hamming.h
+++ b/include/linux/mtd/nand-ecc-sw-hamming.h
@@ -14,8 +14,8 @@
 
 /**
  * struct nand_ecc_sw_hamming_conf - private software Hamming ECC engine structure
- * @reqooblen: Save the actual user OOB length requested before overwriting it
- * @spare_oobbuf: Spare OOB buffer if none is provided
+ * @req_ctx: Save request context and tweak the original request to fit the
+ *           engine needs
  * @code_size: Number of bytes needed to store a code (one code per step)
  * @nsteps: Number of steps
  * @calc_buf: Buffer to use when calculating ECC bytes
@@ -23,8 +23,7 @@
  * @sm_order: Smart Media special ordering
  */
 struct nand_ecc_sw_hamming_conf {
-	unsigned int reqooblen;
-	void *spare_oobbuf;
+	struct nand_ecc_req_tweak_ctx req_ctx;
 	unsigned int code_size;
 	unsigned int nsteps;
 	u8 *calc_buf;
@@ -34,6 +33,8 @@ struct nand_ecc_sw_hamming_conf {
 
 #if IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_HAMMING)
 
+int nand_ecc_sw_hamming_init_ctx(struct nand_device *nand);
+void nand_ecc_sw_hamming_cleanup_ctx(struct nand_device *nand);
 int ecc_sw_hamming_calculate(const unsigned char *buf, unsigned int step_size,
 			     unsigned char *code, bool sm_order);
 int nand_ecc_sw_hamming_calculate(struct nand_device *nand,
@@ -48,6 +49,13 @@ int nand_ecc_sw_hamming_correct(struct nand_device *nand, unsigned char *buf,
 
 #else /* !CONFIG_MTD_NAND_ECC_SW_HAMMING */
 
+static inline int nand_ecc_sw_hamming_init_ctx(struct nand_device *nand)
+{
+	return -ENOTSUPP;
+}
+
+static inline void nand_ecc_sw_hamming_cleanup_ctx(struct nand_device *nand) {}
+
 static inline int ecc_sw_hamming_calculate(const unsigned char *buf,
 					   unsigned int step_size,
 					   unsigned char *code, bool sm_order)
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index df8548187713..3616fa27eaa1 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -278,6 +278,15 @@ int nand_ecc_finish_io_req(struct nand_device *nand,
 			   struct nand_page_io_req *req);
 bool nand_ecc_is_strong_enough(struct nand_device *nand);
 
+#if IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_HAMMING)
+struct nand_ecc_engine *nand_ecc_sw_hamming_get_engine(void);
+#else
+static inline struct nand_ecc_engine *nand_ecc_sw_hamming_get_engine(void)
+{
+	return NULL;
+}
+#endif /* CONFIG_MTD_NAND_ECC_SW_HAMMING */
+
 #if IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_BCH)
 struct nand_ecc_engine *nand_ecc_sw_bch_get_engine(void);
 #else
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
