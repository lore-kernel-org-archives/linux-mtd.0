Return-Path: <SRS0=HEdT=Q4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51DC3C00319
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 13:14:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2336D2084F
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 13:14:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="swa6Tx9E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2336D2084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qwr/4qU3Ouj7ZgMm0P6d4epPfNzDy2r2Uxnm6Tqsh64=; b=swa6Tx9EPI67Ko
	BKf2MBd4Os9gWtPskkE0lWYGZtEN1dlq9Ji3sXWWgJTv37TzoSTZ3z/VWYqLrw/U5mQztYLqYHl4a
	+biHqR+INWvS3PcmuPs9s46KTPd0PL4DQ8939b7RtaH8/4fuKfrCRmHm/3iN1aMPhpSX0s0KB8oRO
	39E6fg0wqCezqqxi3BjImpXKFMxmZc1aPQLK/44geRaM70J8wFNJHrNc9P9iEYE13QkZO6pSy6/bW
	u4LrrHp5EFuu/wMvP1DbwXmfOq3VhuBMoAG54WMIqjEp5jMgEG63K4BFAHLKY17ShzzrlyFpKVQtS
	XE4XQ7T6ySdTejUaOSdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwoBf-0006Cm-Tr; Thu, 21 Feb 2019 13:14:51 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwnvy-0002zJ-EU; Thu, 21 Feb 2019 12:58:51 +0000
X-Originating-IP: 90.88.23.190
Received: from localhost.localdomain
 (aaubervilliers-681-1-81-190.w90-88.abo.wanadoo.fr [90.88.23.190])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id D8FF2C000A;
 Thu, 21 Feb 2019 12:58:33 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [RFC PATCH 19/27] mtd: nand: ecc: Create the software Hamming engine
 instance
Date: Thu, 21 Feb 2019 13:57:58 +0100
Message-Id: <20190221125806.28875-7-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190221125806.28875-1-miquel.raynal@bootlin.com>
References: <20190221125806.28875-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_045839_078414_0E4090BE 
X-CRM114-Status: GOOD (  21.52  )
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
 Schrempf Frieder <frieder.schrempf@kontron.de>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Let's continue introducing the generic ECC engine abstraction in the
NAND subsystem by instantiating a second ECC engine: the software
Hamming one.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/ecc/sw-hamming-engine.c   | 201 +++++++++++++++++++++
 drivers/mtd/nand/raw/nand_base.c           |  28 ++-
 include/linux/mtd/nand-sw-hamming-engine.h |  15 ++
 3 files changed, 227 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/nand/ecc/sw-hamming-engine.c b/drivers/mtd/nand/ecc/sw-hamming-engine.c
index 3918daf5547b..58c81c812709 100644
--- a/drivers/mtd/nand/ecc/sw-hamming-engine.c
+++ b/drivers/mtd/nand/ecc/sw-hamming-engine.c
@@ -465,6 +465,207 @@ int ecc_sw_hamming_correct(struct nand_device *nand, unsigned char *buf,
 }
 EXPORT_SYMBOL(ecc_sw_hamming_correct);
 
+int ecc_sw_hamming_init_ctx(struct nand_device *nand)
+{
+	struct nand_ecc_conf *conf = &nand->ecc.ctx.conf;
+	struct mtd_info *mtd = nanddev_to_mtd(nand);
+	struct ecc_sw_hamming_conf *engine_conf;
+
+	if (!mtd->ooblayout) {
+		switch (mtd->oobsize) {
+		case 8:
+		case 16:
+			mtd_set_ooblayout(mtd, &nand_ooblayout_sp_ops);
+			break;
+		case 64:
+		case 128:
+			mtd_set_ooblayout(mtd, &nand_ooblayout_lp_hamming_ops);
+			break;
+		default:
+			return -ENOTSUPP;
+		}
+	}
+
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
+	engine_conf->code_size = 3;
+	engine_conf->nsteps = mtd->writesize / conf->step_size;
+	engine_conf->calc_buf = kzalloc(sizeof(mtd->oobsize), GFP_KERNEL);
+	engine_conf->code_buf = kzalloc(sizeof(mtd->oobsize), GFP_KERNEL);
+	if (!engine_conf->calc_buf || !engine_conf->code_buf) {
+		kfree(engine_conf);
+		return -ENOMEM;
+	}
+
+	nand->ecc.ctx.priv = engine_conf;
+
+	return 0;
+}
+
+void ecc_sw_hamming_cleanup_ctx(struct nand_device *nand)
+{
+	struct ecc_sw_hamming_conf *engine_conf = nand->ecc.ctx.priv;
+
+	if (engine_conf) {
+		kfree(engine_conf->calc_buf);
+		kfree(engine_conf->code_buf);
+	}
+
+	kfree(engine_conf);
+}
+
+static int ecc_sw_hamming_prepare_io_req(struct nand_device *nand,
+					 struct nand_page_io_req *req,
+					 void *oobbuf)
+{
+	struct ecc_sw_hamming_conf *engine_conf = nand->ecc.ctx.priv;
+	struct mtd_info *mtd = nanddev_to_mtd(nand);
+	int eccsize = nand->ecc.ctx.conf.step_size;
+	int eccbytes = engine_conf->code_size;
+	int eccsteps = engine_conf->nsteps;
+	int total = nand->ecc.ctx.conf.total;
+	u8 *ecccalc = engine_conf->calc_buf;
+	const u8 *data = req->databuf.out;
+	int i, ret;
+
+	/* Ensure the OOB buffer is empty before using it */
+	if (req->oobbuf.in)
+		memset(req->oobbuf.in, 0xff, nanddev_per_page_oobsize(nand));
+
+	if (req->mode == MTD_OPS_RAW)
+		return 0;
+
+	/* This engine does not provide BBM/free OOB bytes protection */
+	if (!req->datalen)
+		return 0;
+
+	/*
+	 * Ensure OOB area is fully read/written otherwise the software
+	 * correction cannot not apply.
+	 */
+	engine_conf->reqooblen = req->ooblen;
+	req->ooblen = nanddev_per_page_oobsize(nand);
+
+	/* No preparation for page read */
+	if (req->type == NAND_PAGE_READ)
+		return 0;
+
+	/* Preparation for page write: derive the ECC bytes and place them */
+	for (i = 0; eccsteps; eccsteps--, i += eccbytes, data += eccsize)
+		ecc_sw_hamming_calculate(nand, data, &ecccalc[i]);
+
+	ret = mtd_ooblayout_set_eccbytes(mtd, ecccalc, oobbuf, 0, total);
+
+	/* Also place user data OOB bytes in the free area, if any */
+	if (engine_conf->reqooblen) {
+		if (req->mode == MTD_OPS_AUTO_OOB)
+			mtd_ooblayout_set_databytes(mtd, req->oobbuf.out,
+						    oobbuf,
+						    req->ooboffs,
+						    req->ooblen);
+		else
+			memcpy(oobbuf + req->ooboffs, req->oobbuf.out,
+			       req->ooblen);
+	}
+
+	return ret;
+}
+
+static int ecc_sw_hamming_finish_io_req(struct nand_device *nand,
+					struct nand_page_io_req *req,
+					void *oobbuf)
+{
+	struct ecc_sw_hamming_conf *engine_conf = nand->ecc.ctx.priv;
+	struct mtd_info *mtd = nanddev_to_mtd(nand);
+	int eccsize = nand->ecc.ctx.conf.step_size;
+	int total = nand->ecc.ctx.conf.total;
+	int eccbytes = engine_conf->code_size;
+	int eccsteps = engine_conf->nsteps;
+	u8 *ecccalc = engine_conf->calc_buf;
+	u8 *ecccode = engine_conf->code_buf;
+	unsigned int max_bitflips = 0;
+	u8 *data = req->databuf.in;
+	int i, ret;
+
+	if (req->mode == MTD_OPS_RAW)
+		return 0;
+
+	/* This engine does not provide BBM/free OOB bytes protection */
+	if (!req->datalen)
+		return 0;
+
+	/* Don't mess up with the upper layer: restore the request OOB length */
+	req->ooblen = engine_conf->reqooblen;
+
+	/* Nothing more to do for page write */
+	if (req->type == NAND_PAGE_WRITE)
+		return 0;
+
+	/* Finish a page read: retrieve the (raw) ECC bytes*/
+	ret = mtd_ooblayout_get_eccbytes(mtd, ecccode, oobbuf, 0, total);
+	if (ret)
+		return ret;
+
+	/* Calculate the ECC bytes */
+	for (i = 0; eccsteps; eccsteps--, i += eccbytes, data += eccsize)
+		ecc_sw_hamming_calculate(nand, data, &ecccalc[i]);
+
+	eccsteps = engine_conf->nsteps;
+
+	/* Finish a page read: compare and correct */
+	for (eccsteps = engine_conf->nsteps, i = 0, data = req->databuf.in;
+	     eccsteps;
+	     eccsteps--, i += eccbytes, data += eccsize) {
+		int stat =  ecc_sw_hamming_correct(nand, data,
+					       &ecccode[i],
+					       &ecccalc[i]);
+		if (stat < 0) {
+			mtd->ecc_stats.failed++;
+		} else {
+			mtd->ecc_stats.corrected += stat;
+			max_bitflips = max_t(unsigned int, max_bitflips, stat);
+		}
+	}
+
+	/* Format the OOB buffer that will be returned to the user */
+	if (req->ooblen) {
+		if (req->mode == MTD_OPS_AUTO_OOB)
+			mtd_ooblayout_get_databytes(mtd, oobbuf,
+						    req->oobbuf.in,
+						    req->ooboffs, req->ooblen);
+		else
+			memcpy(req->oobbuf.in, oobbuf + req->ooboffs,
+			       req->ooblen);
+	}
+
+	return max_bitflips;
+}
+
+static struct nand_ecc_engine_ops sw_hamming_engine_ops = {
+	.init_ctx = ecc_sw_hamming_init_ctx,
+	.cleanup_ctx = ecc_sw_hamming_cleanup_ctx,
+	.prepare_io_req = ecc_sw_hamming_prepare_io_req,
+	.finish_io_req = ecc_sw_hamming_finish_io_req,
+};
+
+static struct nand_ecc_engine sw_hamming_engine = {
+	.ops = &sw_hamming_engine_ops,
+};
+
+struct nand_ecc_engine *ecc_sw_hamming_get_engine(void)
+{
+	return &sw_hamming_engine;
+}
+
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Frans Meulenbroeks <fransmeulenbroeks@gmail.com>");
 MODULE_DESCRIPTION("NAND software Hamming ECC support");
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index bfefa6009b04..1ed90fd512d7 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -4845,34 +4845,27 @@ static void nand_scan_ident_cleanup(struct nand_chip *chip)
 
 int rawnand_sw_hamming_init(struct nand_chip *chip)
 {
-	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct ecc_sw_hamming_conf *engine_conf;
 	struct nand_device *base = &chip->base;
+	int ret;
 
 	base->ecc.user_conf.mode = NAND_ECC_SOFT;
 	base->ecc.user_conf.algo = NAND_ECC_HAMMING;
 	base->ecc.user_conf.strength = chip->ecc.strength;
 	base->ecc.user_conf.step_size = chip->ecc.size;
 
-	if (base->ecc.user_conf.strength != 1 ||
-	    (base->ecc.user_conf.step_size != 256 &&
-	     base->ecc.user_conf.step_size != 512)) {
-		pr_err("%s: unsupported strength or step size\n", __func__);
-		return -EINVAL;
-	}
+	ret = ecc_sw_hamming_init_ctx(base);
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
+	chip->ecc.size = base->ecc.ctx.conf.step_size;
+	chip->ecc.strength = base->ecc.ctx.conf.strength;
+	chip->ecc.total = base->ecc.ctx.conf.total;
 	chip->ecc.steps = engine_conf->nsteps;
 	chip->ecc.bytes = engine_conf->code_size;
 
@@ -4905,7 +4898,7 @@ void rawnand_sw_hamming_cleanup(struct nand_chip *chip)
 {
 	struct nand_device *base = &chip->base;
 
-	kfree(base->ecc.ctx.priv);
+	ecc_sw_hamming_cleanup_ctx(base);
 }
 EXPORT_SYMBOL(rawnand_sw_hamming_cleanup);
 
@@ -5369,7 +5362,8 @@ static int nand_scan_tail(struct nand_chip *chip)
 	 * If no default placement scheme is given, select an appropriate one.
 	 */
 	if (!mtd->ooblayout &&
-	    !(ecc->mode == NAND_ECC_SOFT && ecc->algo == NAND_ECC_BCH)) {
+	    !(ecc->mode == NAND_ECC_SOFT && ecc->algo == NAND_ECC_BCH) &&
+	    !(ecc->mode == NAND_ECC_SOFT && ecc->algo == NAND_ECC_HAMMING)) {
 		switch (mtd->oobsize) {
 		case 8:
 		case 16:
diff --git a/include/linux/mtd/nand-sw-hamming-engine.h b/include/linux/mtd/nand-sw-hamming-engine.h
index 378ba46f7e1d..8df36d189482 100644
--- a/include/linux/mtd/nand-sw-hamming-engine.h
+++ b/include/linux/mtd/nand-sw-hamming-engine.h
@@ -32,6 +32,8 @@ struct ecc_sw_hamming_conf {
 
 #if IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_HAMMING)
 
+int ecc_sw_hamming_init_ctx(struct nand_device *nand);
+void ecc_sw_hamming_cleanup_ctx(struct nand_device *nand);
 int __ecc_sw_hamming_calculate(const unsigned char *buf,
 			       unsigned int step_size,
 			       unsigned char *code, bool sm_order);
@@ -43,9 +45,17 @@ int __ecc_sw_hamming_correct(unsigned char *buf, unsigned char *read_ecc,
 			     bool sm_order);
 int ecc_sw_hamming_correct(struct nand_device *nand, unsigned char *buf,
 			   unsigned char *read_ecc, unsigned char *calc_ecc);
+struct nand_ecc_engine *ecc_sw_hamming_get_engine(void);
 
 #else /* !CONFIG_MTD_NAND_ECC_SW_HAMMING */
 
+static inline int ecc_sw_hamming_init_ctx(struct nand_device *nand)
+{
+	return -ENOTSUPP;
+}
+
+static inline void ecc_sw_hamming_cleanup_ctx(struct nand_device *nand) {}
+
 static inline int __ecc_sw_hamming_calculate(const unsigned char *buf,
 					     unsigned int step_size,
 					     unsigned char *code,
@@ -78,6 +88,11 @@ static inline int ecc_sw_hamming_correct(struct nand_device *nand,
 	return -ENOTSUPP;
 }
 
+static inline struct nand_ecc_engine *ecc_sw_hamming_get_engine(void)
+{
+	return NULL;
+}
+
 #endif /* CONFIG_MTD_NAND_ECC_SW_HAMMING */
 
 #endif /* __MTD_NAND_ECC_SW_HAMMING_H__ */
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
