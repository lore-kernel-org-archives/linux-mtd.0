Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D142DC4727D
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 23:02:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 577532145D
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 23:02:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t1i0wqq7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 577532145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7pIkUrkUMzRD/GsAzF7oTDsZIUAdhST9kBRyY9wHVX0=; b=t1i0wqq7cTaqYy69qb9gFOjLk
	Bza6mahhgZgeJR1lrwQMUdUMUUDsuAJT9wdMYTlJ9eaogEsxOuSE38ra29uDoV9Bi/xsB//bPe+1g
	gIWtDgyUHaZ84jSev/gfw0CZ2SQ9CjtcAeNwFYRm4dWLMuk0jD8fpwfmwCZp5apq+MlIkKkRrzWwZ
	xiDp1d3fTQ4Jx27Qm/pXgzGjtTWi4I+uuqCqrHgMEl0C7WTVy7Yz4DLfClfEzchQLZurZ4O1vCN8l
	4LQDAiF05b7HE8AR6iEMLm1fvFJBGOoGnwpCmXUcAhGXwrP57VSgWuz72xl0G5LReb8jQFGOJqLOu
	mB4g6ny2g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNOdS-0001Ny-1p; Tue, 29 Sep 2020 23:02:14 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNOcs-0001DB-Sy
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 23:01:41 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 1F7E9200013;
 Tue, 29 Sep 2020 23:01:37 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 09/20] mtd: nand: ecc-bch: Create the software BCH engine
Date: Wed, 30 Sep 2020 01:01:13 +0200
Message-Id: <20200929230124.31491-10-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200929230124.31491-1-miquel.raynal@bootlin.com>
References: <20200929230124.31491-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_190139_170363_22C0A6E2 
X-CRM114-Status: GOOD (  29.21  )
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
NAND subsystem by instantiating a first ECC engine: the software
BCH one.

While at it, make a very tidy ecc_sw_bch_init() function and move all
the sanity checks and user input management in
nand_ecc_sw_bch_init_ctx(). This second helper will be called from the
raw RAND core.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/ecc-sw-bch.c       | 333 ++++++++++++++++++++++------
 drivers/mtd/nand/raw/nand_base.c    |  62 +-----
 include/linux/mtd/nand-ecc-sw-bch.h |  16 +-
 include/linux/mtd/nand.h            |   9 +
 4 files changed, 295 insertions(+), 125 deletions(-)

diff --git a/drivers/mtd/nand/ecc-sw-bch.c b/drivers/mtd/nand/ecc-sw-bch.c
index 16a54bd2ca31..76416b241f84 100644
--- a/drivers/mtd/nand/ecc-sw-bch.c
+++ b/drivers/mtd/nand/ecc-sw-bch.c
@@ -75,6 +75,19 @@ int nand_ecc_sw_bch_correct(struct nand_device *nand, unsigned char *buf,
 }
 EXPORT_SYMBOL(nand_ecc_sw_bch_correct);
 
+/**
+ * nand_ecc_sw_bch_cleanup - Cleanup software BCH ECC resources
+ * @nand: NAND device
+ */
+static void nand_ecc_sw_bch_cleanup(struct nand_device *nand)
+{
+	struct nand_ecc_sw_bch_conf *engine_conf = nand->ecc.ctx.priv;
+
+	bch_free(engine_conf->bch);
+	kfree(engine_conf->errloc);
+	kfree(engine_conf->eccmask);
+}
+
 /**
  * nand_ecc_sw_bch_init - Initialize software BCH ECC engine
  * @nand: NAND device
@@ -92,71 +105,36 @@ EXPORT_SYMBOL(nand_ecc_sw_bch_correct);
  * step_size = 512 (thus, m = 13 is the smallest integer such that 2^m - 1 > 512 * 8)
  * bytes = 7 (7 bytes are required to store m * t = 13 * 4 = 52 bits)
  */
-int nand_ecc_sw_bch_init(struct nand_device *nand)
+static int nand_ecc_sw_bch_init(struct nand_device *nand)
 {
-	struct mtd_info *mtd = nanddev_to_mtd(nand);
-	unsigned int m, t, eccsteps, i;
 	struct nand_ecc_sw_bch_conf *engine_conf = nand->ecc.ctx.priv;
-	unsigned char *erased_page;
 	unsigned int eccsize = nand->ecc.ctx.conf.step_size;
 	unsigned int eccbytes = engine_conf->code_size;
-	unsigned int eccstrength = nand->ecc.ctx.conf.strength;
+	unsigned int m, t, i;
+	unsigned char *erased_page;
+	int ret;
 
-	if (!eccbytes && eccstrength) {
-		eccbytes = DIV_ROUND_UP(eccstrength * fls(8 * eccsize), 8);
-		engine_conf->code_size = eccbytes;
-	}
-
-	if (!eccsize || !eccbytes) {
-		pr_warn("ecc parameters not supplied\n");
-		return -EINVAL;
-	}
-
-	m = fls(1+8*eccsize);
-	t = (eccbytes*8)/m;
+	m = fls(1 + (8 * eccsize));
+	t = (eccbytes * 8) / m;
 
 	engine_conf->bch = bch_init(m, t, 0, false);
 	if (!engine_conf->bch)
 		return -EINVAL;
 
-	/* verify that eccbytes has the expected value */
-	if (engine_conf->bch->ecc_bytes != eccbytes) {
-		pr_warn("invalid eccbytes %u, should be %u\n",
-			eccbytes, engine_conf->bch->ecc_bytes);
-		goto fail;
-	}
-
-	eccsteps = mtd->writesize/eccsize;
-
-	/* Check that we have an oob layout description. */
-	if (!mtd->ooblayout) {
-		pr_warn("missing oob scheme");
-		goto fail;
-	}
-
-	/* sanity checks */
-	if (8*(eccsize+eccbytes) >= (1 << m)) {
-		pr_warn("eccsize %u is too large\n", eccsize);
-		goto fail;
-	}
-
-	if (mtd_ooblayout_count_eccbytes(mtd) != (eccsteps*eccbytes)) {
-		pr_warn("invalid ecc layout\n");
-		goto fail;
-	}
-
 	engine_conf->eccmask = kzalloc(eccbytes, GFP_KERNEL);
 	engine_conf->errloc = kmalloc_array(t, sizeof(*engine_conf->errloc),
 					    GFP_KERNEL);
-	if (!engine_conf->eccmask || !engine_conf->errloc)
-		goto fail;
+	if (!engine_conf->eccmask || !engine_conf->errloc) {
+		ret = -ENOMEM;
+		goto cleanup;
+	}
 
-	/*
-	 * compute and store the inverted ecc of an erased ecc block
-	 */
+	/* Compute and store the inverted ECC of an erased step */
 	erased_page = kmalloc(eccsize, GFP_KERNEL);
-	if (!erased_page)
-		goto fail;
+	if (!erased_page) {
+		ret = -ENOMEM;
+		goto cleanup;
+	}
 
 	memset(erased_page, 0xff, eccsize);
 	bch_encode(engine_conf->bch, erased_page, eccsize,
@@ -166,33 +144,260 @@ int nand_ecc_sw_bch_init(struct nand_device *nand)
 	for (i = 0; i < eccbytes; i++)
 		engine_conf->eccmask[i] ^= 0xff;
 
-	if (!eccstrength)
-		nand->ecc.ctx.conf.strength = (eccbytes * 8) / fls(8 * eccsize);
+	/* Verify that the number of code bytes has the expected value */
+	if (engine_conf->bch->ecc_bytes != eccbytes) {
+		pr_err("Invalid number of ECC bytes: %u, expected: %u\n",
+		       eccbytes, engine_conf->bch->ecc_bytes);
+		ret = -EINVAL;
+		goto cleanup;
+	}
+
+	/* Sanity checks */
+	if (8 * (eccsize + eccbytes) >= (1 << m)) {
+		pr_err("ECC step size is too large (%u)\n", eccsize);
+		ret = -EINVAL;
+		goto cleanup;
+	}
+
+	return 0;
+
+cleanup:
+	nand_ecc_sw_bch_cleanup(nand);
+
+	return ret;
+}
+
+int nand_ecc_sw_bch_init_ctx(struct nand_device *nand)
+{
+	struct nand_ecc_props *conf = &nand->ecc.ctx.conf;
+	struct mtd_info *mtd = nanddev_to_mtd(nand);
+	struct nand_ecc_sw_bch_conf *engine_conf;
+	unsigned int code_size = 0, nsteps;
+	int ret;
+
+	/* Only large page NAND chips may use BCH */
+	if (mtd->oobsize < 64) {
+		pr_err("BCH cannot be used with small page NAND chips\n");
+		return -EINVAL;
+	}
+
+	if (!mtd->ooblayout)
+		mtd_set_ooblayout(mtd, nand_get_large_page_ooblayout());
+
+	conf->engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
+	conf->algo = NAND_ECC_ALGO_BCH;
+	conf->step_size = nand->ecc.user_conf.step_size;
+	conf->strength = nand->ecc.user_conf.strength;
+
+	/*
+	 * Board driver should supply ECC size and ECC strength
+	 * values to select how many bits are correctable.
+	 * Otherwise, default to 512 bytes for large page devices and 256 for
+	 * small page devices.
+	 */
+	if (!conf->step_size) {
+		if (mtd->oobsize >= 64)
+			conf->step_size = 512;
+		else
+			conf->step_size = 256;
+
+		conf->strength = 4;
+	}
+
+	nsteps = mtd->writesize / conf->step_size;
+
+	/* Maximize */
+	if (nand->ecc.user_conf.flags & NAND_ECC_MAXIMIZE_STRENGTH) {
+		conf->step_size = 1024;
+		nsteps = mtd->writesize / conf->step_size;
+		/* Reserve 2 bytes for the BBM */
+		code_size = (mtd->oobsize - 2) / nsteps;
+		conf->strength = code_size * 8 / fls(8 * conf->step_size);
+	}
+
+	if (!code_size)
+		code_size = DIV_ROUND_UP(conf->strength *
+					 fls(8 * conf->step_size), 8);
+
+	if (!conf->strength)
+		conf->strength = (code_size * 8) / fls(8 * conf->step_size);
+
+	if (!code_size && !conf->strength) {
+		pr_err("Missing ECC parameters\n");
+		return -EINVAL;
+	}
+
+	engine_conf = kzalloc(sizeof(*engine_conf), GFP_KERNEL);
+	if (!engine_conf)
+		return -ENOMEM;
+
+	ret = nand_ecc_init_req_tweaking(&engine_conf->req_ctx, nand);
+	if (ret)
+		goto free_engine_conf;
+
+	engine_conf->code_size = code_size;
+	engine_conf->nsteps = nsteps;
+	engine_conf->calc_buf = kzalloc(sizeof(mtd->oobsize), GFP_KERNEL);
+	engine_conf->code_buf = kzalloc(sizeof(mtd->oobsize), GFP_KERNEL);
+	if (!engine_conf->calc_buf || !engine_conf->code_buf) {
+		ret = -ENOMEM;
+		goto free_bufs;
+	}
+
+	nand->ecc.ctx.priv = engine_conf;
+	nand->ecc.ctx.total = nsteps * code_size;
+
+	ret = nand_ecc_sw_bch_init(nand);
+	if (ret)
+		goto free_bufs;
+
+	/* Verify the layout validity */
+	if (mtd_ooblayout_count_eccbytes(mtd) !=
+	    engine_conf->nsteps * engine_conf->code_size) {
+		pr_err("Invalid ECC layout\n");
+		ret = -EINVAL;
+		goto cleanup_bch_ctx;
+	}
 
 	return 0;
 
-fail:
+cleanup_bch_ctx:
 	nand_ecc_sw_bch_cleanup(nand);
+free_bufs:
+	nand_ecc_cleanup_req_tweaking(&engine_conf->req_ctx);
+	kfree(engine_conf->calc_buf);
+	kfree(engine_conf->code_buf);
+free_engine_conf:
+	kfree(engine_conf);
 
-	return -EINVAL;
+	return ret;
 }
-EXPORT_SYMBOL(nand_ecc_sw_bch_init);
+EXPORT_SYMBOL(nand_ecc_sw_bch_init_ctx);
 
-/**
- * nand_ecc_sw_bch_cleanup - Cleanup software BCH ECC resources
- * @nand: NAND device
- */
-void nand_ecc_sw_bch_cleanup(struct nand_device *nand)
+void nand_ecc_sw_bch_cleanup_ctx(struct nand_device *nand)
 {
 	struct nand_ecc_sw_bch_conf *engine_conf = nand->ecc.ctx.priv;
 
 	if (engine_conf) {
-		bch_free(engine_conf->bch);
-		kfree(engine_conf->errloc);
-		kfree(engine_conf->eccmask);
+		nand_ecc_sw_bch_cleanup(nand);
+		nand_ecc_cleanup_req_tweaking(&engine_conf->req_ctx);
+		kfree(engine_conf->calc_buf);
+		kfree(engine_conf->code_buf);
+		kfree(engine_conf);
 	}
 }
-EXPORT_SYMBOL(nand_ecc_sw_bch_cleanup);
+EXPORT_SYMBOL(nand_ecc_sw_bch_cleanup_ctx);
+
+static int nand_ecc_sw_bch_prepare_io_req(struct nand_device *nand,
+					  struct nand_page_io_req *req)
+{
+	struct nand_ecc_sw_bch_conf *engine_conf = nand->ecc.ctx.priv;
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
+		nand_ecc_sw_bch_calculate(nand, data, &ecccalc[i]);
+
+	return mtd_ooblayout_set_eccbytes(mtd, ecccalc, (void *)req->oobbuf.out,
+					  0, total);
+}
+
+static int nand_ecc_sw_bch_finish_io_req(struct nand_device *nand,
+					 struct nand_page_io_req *req)
+{
+	struct nand_ecc_sw_bch_conf *engine_conf = nand->ecc.ctx.priv;
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
+		nand_ecc_sw_bch_calculate(nand, data, &ecccalc[i]);
+
+	/* Finish a page read: compare and correct */
+	for (eccsteps = engine_conf->nsteps, i = 0, data = req->databuf.in;
+	     eccsteps;
+	     eccsteps--, i += eccbytes, data += eccsize) {
+		int stat =  nand_ecc_sw_bch_correct(nand, data,
+						    &ecccode[i],
+						    &ecccalc[i]);
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
+static struct nand_ecc_engine_ops nand_ecc_sw_bch_engine_ops = {
+	.init_ctx = nand_ecc_sw_bch_init_ctx,
+	.cleanup_ctx = nand_ecc_sw_bch_cleanup_ctx,
+	.prepare_io_req = nand_ecc_sw_bch_prepare_io_req,
+	.finish_io_req = nand_ecc_sw_bch_finish_io_req,
+};
+
+static struct nand_ecc_engine nand_ecc_sw_bch_engine = {
+	.ops = &nand_ecc_sw_bch_engine_ops,
+};
+
+struct nand_ecc_engine *nand_ecc_sw_bch_get_engine(void)
+{
+	return &nand_ecc_sw_bch_engine;
+}
+EXPORT_SYMBOL(nand_ecc_sw_bch_get_engine);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Ivan Djelic <ivan.djelic@parrot.com>");
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 6317bb656fbf..f68802bf555a 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5155,17 +5155,11 @@ int rawnand_sw_bch_init(struct nand_chip *chip)
 	base->ecc.user_conf.step_size = chip->ecc.size;
 	base->ecc.user_conf.strength = chip->ecc.strength;
 
-	engine_conf = kzalloc(sizeof(*engine_conf), GFP_KERNEL);
-	if (!engine_conf)
-		return -ENOMEM;
-
-	engine_conf->code_size = chip->ecc.bytes;
-
-	base->ecc.ctx.priv = engine_conf;
-
-	ret = nand_ecc_sw_bch_init(base);
+	ret = nand_ecc_sw_bch_init_ctx(base);
 	if (ret)
-		kfree(base->ecc.ctx.priv);
+		return ret;
+
+	engine_conf = base->ecc.ctx.priv;
 
 	chip->ecc.size = base->ecc.ctx.conf.step_size;
 	chip->ecc.strength = base->ecc.ctx.conf.strength;
@@ -5173,7 +5167,7 @@ int rawnand_sw_bch_init(struct nand_chip *chip)
 	chip->ecc.steps = engine_conf->nsteps;
 	chip->ecc.bytes = engine_conf->code_size;
 
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL(rawnand_sw_bch_init);
 
@@ -5199,9 +5193,7 @@ void rawnand_sw_bch_cleanup(struct nand_chip *chip)
 {
 	struct nand_device *base = &chip->base;
 
-	nand_ecc_sw_bch_cleanup(base);
-
-	kfree(base->ecc.ctx.priv);
+	nand_ecc_sw_bch_cleanup_ctx(base);
 }
 EXPORT_SYMBOL(rawnand_sw_bch_cleanup);
 
@@ -5313,51 +5305,15 @@ static int nand_set_ecc_soft_ops(struct nand_chip *chip)
 		ecc->read_oob = nand_read_oob_std;
 		ecc->write_oob = nand_write_oob_std;
 
-		/*
-		* Board driver should supply ecc.size and ecc.strength
-		* values to select how many bits are correctable.
-		* Otherwise, default to 4 bits for large page devices.
-		*/
-		if (!ecc->size && (mtd->oobsize >= 64)) {
-			ecc->size = 512;
-			ecc->strength = 4;
-		}
-
-		/*
-		 * if no ecc placement scheme was provided pickup the default
-		 * large page one.
-		 */
-		if (!mtd->ooblayout) {
-			/* handle large page devices only */
-			if (mtd->oobsize < 64) {
-				WARN(1, "OOB layout is required when using software BCH on small pages\n");
-				return -EINVAL;
-			}
-
-			mtd_set_ooblayout(mtd, nand_get_large_page_ooblayout());
-
-		}
-
 		/*
 		 * We can only maximize ECC config when the default layout is
 		 * used, otherwise we don't know how many bytes can really be
 		 * used.
 		 */
-		if (mtd->ooblayout == nand_get_large_page_ooblayout() &&
-		    nanddev->ecc.user_conf.flags & NAND_ECC_MAXIMIZE_STRENGTH) {
-			int steps, bytes;
+		if (nanddev->ecc.user_conf.flags & NAND_ECC_MAXIMIZE_STRENGTH &&
+		    mtd->ooblayout != nand_get_large_page_ooblayout())
+			nanddev->ecc.user_conf.flags &= ~NAND_ECC_MAXIMIZE_STRENGTH;
 
-			/* Always prefer 1k blocks over 512bytes ones */
-			ecc->size = 1024;
-			steps = mtd->writesize / ecc->size;
-
-			/* Reserve 2 bytes for the BBM */
-			bytes = (mtd->oobsize - 2) / steps;
-			ecc->strength = bytes * 8 / fls(8 * ecc->size);
-		}
-
-		/* See the software BCH ECC initialization for details */
-		ecc->bytes = 0;
 		ret = rawnand_sw_bch_init(chip);
 		if (ret) {
 			WARN(1, "BCH ECC initialization failed!\n");
diff --git a/include/linux/mtd/nand-ecc-sw-bch.h b/include/linux/mtd/nand-ecc-sw-bch.h
index ce005528e55f..22c92073b3dd 100644
--- a/include/linux/mtd/nand-ecc-sw-bch.h
+++ b/include/linux/mtd/nand-ecc-sw-bch.h
@@ -13,8 +13,8 @@
 
 /**
  * struct nand_ecc_sw_bch_conf - private software BCH ECC engine structure
- * @reqooblen: Save the actual user OOB length requested before overwriting it
- * @spare_oobbuf: Spare OOB buffer if none is provided
+ * @req_ctx: Save request context and tweak the original request to fit the
+ *           engine needs
  * @code_size: Number of bytes needed to store a code (one code per step)
  * @nsteps: Number of steps
  * @calc_buf: Buffer to use when calculating ECC bytes
@@ -24,8 +24,7 @@
  * @eccmask: XOR ecc mask, allows erased pages to be decoded as valid
  */
 struct nand_ecc_sw_bch_conf {
-	unsigned int reqooblen;
-	void *spare_oobbuf;
+	struct nand_ecc_req_tweak_ctx req_ctx;
 	unsigned int code_size;
 	unsigned int nsteps;
 	u8 *calc_buf;
@@ -41,8 +40,9 @@ int nand_ecc_sw_bch_calculate(struct nand_device *nand,
 			      const unsigned char *buf, unsigned char *code);
 int nand_ecc_sw_bch_correct(struct nand_device *nand, unsigned char *buf,
 			    unsigned char *read_ecc, unsigned char *calc_ecc);
-int nand_ecc_sw_bch_init(struct nand_device *nand);
-void nand_ecc_sw_bch_cleanup(struct nand_device *nand);
+int nand_ecc_sw_bch_init_ctx(struct nand_device *nand);
+void nand_ecc_sw_bch_cleanup_ctx(struct nand_device *nand);
+struct nand_ecc_engine *nand_ecc_sw_bch_get_engine(void);
 
 #else /* !CONFIG_MTD_NAND_ECC_SW_BCH */
 
@@ -61,12 +61,12 @@ static inline int nand_ecc_sw_bch_correct(struct nand_device *nand,
 	return -ENOTSUPP;
 }
 
-static inline int nand_ecc_sw_bch_init(struct nand_device *nand)
+static inline int nand_ecc_sw_bch_init_ctx(struct nand_device *nand)
 {
 	return -ENOTSUPP;
 }
 
-static inline void nand_ecc_sw_bch_cleanup(struct nand_device *nand) {}
+static inline void nand_ecc_sw_bch_cleanup_ctx(struct nand_device *nand) {}
 
 #endif /* CONFIG_MTD_NAND_ECC_SW_BCH */
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 36e4fe08d0ea..df8548187713 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -278,6 +278,15 @@ int nand_ecc_finish_io_req(struct nand_device *nand,
 			   struct nand_page_io_req *req);
 bool nand_ecc_is_strong_enough(struct nand_device *nand);
 
+#if IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_BCH)
+struct nand_ecc_engine *nand_ecc_sw_bch_get_engine(void);
+#else
+static inline struct nand_ecc_engine *nand_ecc_sw_bch_get_engine(void)
+{
+	return NULL;
+}
+#endif /* CONFIG_MTD_NAND_ECC_SW_BCH */
+
 /**
  * struct nand_ecc_req_tweak_ctx - Help for automatically tweaking requests
  * @orig_req: Pointer to the original IO request
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
