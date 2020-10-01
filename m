Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EFBBC4727C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 10:21:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 529B120848
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 10:21:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0VmR3h9W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 529B120848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BR5uNtwTpP1nvTv5QcXL2XJ4X0XArocn3bU6pgW88iU=; b=0VmR3h9WiNqgiTfFR0fRO1lfG
	lZLzUjBUhRJEMiK+EoaX7XPBasVDQEP3z7oyQnPa5wvgmVjv7EsVteY19I34e8KPH61IrZo2Ko2lm
	xxa092NUbNkvU8YDT6Zyb8QMzfWa0BxpnkKthcsomnbK+iGvpeOak8pNgf64ksGRR4XVNX5TFk6C3
	kfW7aTloN6diAs27peM+OOGQE1jRmUwBGh+dSuXg4rkucM7aRZIg1/9k7LGJlBJdhwzF0q6yHAAVr
	85HrW1w5Cb8MJCLA4/o9AXMkgu1WUrjruR7t+yvd00Wum+xX6SLvw2VbZizdJB2Nf7EXAoxLxkCGF
	Tb9Qeadvg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNvhP-0002hD-7J; Thu, 01 Oct 2020 10:20:31 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNvhH-0002ea-4C
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 10:20:26 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id DE784240006;
 Thu,  1 Oct 2020 10:20:20 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/6] mtd: spinand: Use the external ECC engine logic
Date: Thu,  1 Oct 2020 12:20:11 +0200
Message-Id: <20201001102014.20100-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201001102014.20100-1-miquel.raynal@bootlin.com>
References: <20201001102014.20100-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_062023_364073_692AD1DB 
X-CRM114-Status: GOOD (  23.15  )
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

Now that all the logic is available in the NAND core, let's use it
from the SPI-NAND core. Right now there is no functional change as the
default ECC engine for SPI-NANDs is set to 'on-die', but user can now
use software correction if they want to by just setting the right
properties in the DT.

Also note that the OOB layout handling is removed from the SPI-NAND
core as each ECC engine is supposed to handle it by it's own; users
should not be aware of that.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/Kconfig |  1 +
 drivers/mtd/nand/spi/core.c  | 97 ++++++++++++++++++++----------------
 2 files changed, 54 insertions(+), 44 deletions(-)

diff --git a/drivers/mtd/nand/spi/Kconfig b/drivers/mtd/nand/spi/Kconfig
index da89b250df7c..3d7649a2dd72 100644
--- a/drivers/mtd/nand/spi/Kconfig
+++ b/drivers/mtd/nand/spi/Kconfig
@@ -2,6 +2,7 @@
 menuconfig MTD_SPI_NAND
 	tristate "SPI NAND device Support"
 	select MTD_NAND_CORE
+	select MTD_NAND_ECC
 	depends on SPI_MASTER
 	select SPI_MEM
 	help
diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index f58cea52c781..8a4d20e30edb 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -313,6 +313,15 @@ static struct nand_ecc_engine spinand_ondie_ecc_engine = {
 	.ops = &spinand_ondie_ecc_engine_ops,
 };
 
+static void spinand_ondie_ecc_save_status(struct nand_device *nand, u8 status)
+{
+	struct spinand_ondie_ecc_conf *engine_conf = nand->ecc.ctx.priv;
+
+	if (nand->ecc.ctx.conf.engine_type == NAND_ECC_ENGINE_TYPE_ON_DIE &&
+	    engine_conf)
+		engine_conf->status = status;
+}
+
 static int spinand_write_enable_op(struct spinand_device *spinand)
 {
 	struct spi_mem_op op = SPINAND_WR_EN_DIS_OP(true);
@@ -334,7 +343,6 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 				      const struct nand_page_io_req *req)
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
-	struct mtd_info *mtd = nanddev_to_mtd(nand);
 	struct spi_mem_dirmap_desc *rdesc;
 	unsigned int nbytes = 0;
 	void *buf = NULL;
@@ -374,17 +382,6 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 		memcpy(req->databuf.in, spinand->databuf + req->dataoffs,
 		       req->datalen);
 
-	if (req->ooblen) {
-		if (req->mode == MTD_OPS_AUTO_OOB)
-			mtd_ooblayout_get_databytes(mtd, req->oobbuf.in,
-						    spinand->oobbuf,
-						    req->ooboffs,
-						    req->ooblen);
-		else
-			memcpy(req->oobbuf.in, spinand->oobbuf + req->ooboffs,
-			       req->ooblen);
-	}
-
 	return 0;
 }
 
@@ -392,7 +389,7 @@ static int spinand_write_to_cache_op(struct spinand_device *spinand,
 				     const struct nand_page_io_req *req)
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
-	struct mtd_info *mtd = nanddev_to_mtd(nand);
+	struct mtd_info *mtd = spinand_to_mtd(spinand);
 	struct spi_mem_dirmap_desc *wdesc;
 	unsigned int nbytes, column = 0;
 	void *buf = spinand->databuf;
@@ -404,9 +401,12 @@ static int spinand_write_to_cache_op(struct spinand_device *spinand,
 	 * must fill the page cache entirely even if we only want to program
 	 * the data portion of the page, otherwise we might corrupt the BBM or
 	 * user data previously programmed in OOB area.
+	 *
+	 * Only reset the data buffer manually, the OOB buffer is prepared by
+	 * ECC engines ->prepare_io_req() callback.
 	 */
 	nbytes = nanddev_page_size(nand) + nanddev_per_page_oobsize(nand);
-	memset(spinand->databuf, 0xff, nbytes);
+	memset(spinand->databuf, 0xff, nanddev_page_size(nand));
 
 	if (req->datalen)
 		memcpy(spinand->databuf + req->dataoffs, req->databuf.out,
@@ -523,12 +523,16 @@ static int spinand_lock_block(struct spinand_device *spinand, u8 lock)
 }
 
 static int spinand_read_page(struct spinand_device *spinand,
-			     const struct nand_page_io_req *req,
-			     bool ecc_enabled)
+			     const struct nand_page_io_req *req)
 {
+	struct nand_device *nand = spinand_to_nand(spinand);
 	u8 status;
 	int ret;
 
+	ret = nand_ecc_prepare_io_req(nand, (struct nand_page_io_req *)req);
+	if (ret)
+		return ret;
+
 	ret = spinand_load_page_op(spinand, req);
 	if (ret)
 		return ret;
@@ -537,22 +541,26 @@ static int spinand_read_page(struct spinand_device *spinand,
 	if (ret < 0)
 		return ret;
 
+	spinand_ondie_ecc_save_status(nand, status);
+
 	ret = spinand_read_from_cache_op(spinand, req);
 	if (ret)
 		return ret;
 
-	if (!ecc_enabled)
-		return 0;
-
-	return spinand_check_ecc_status(spinand, status);
+	return nand_ecc_finish_io_req(nand, (struct nand_page_io_req *)req);
 }
 
 static int spinand_write_page(struct spinand_device *spinand,
 			      const struct nand_page_io_req *req)
 {
+	struct nand_device *nand = spinand_to_nand(spinand);
 	u8 status;
 	int ret;
 
+	ret = nand_ecc_prepare_io_req(nand, (struct nand_page_io_req *)req);
+	if (ret)
+		return ret;
+
 	ret = spinand_write_enable_op(spinand);
 	if (ret)
 		return ret;
@@ -567,9 +575,9 @@ static int spinand_write_page(struct spinand_device *spinand,
 
 	ret = spinand_wait(spinand, &status);
 	if (!ret && (status & STATUS_PROG_FAILED))
-		ret = -EIO;
+		return -EIO;
 
-	return ret;
+	return nand_ecc_finish_io_req(nand, (struct nand_page_io_req *)req);
 }
 
 static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
@@ -579,25 +587,24 @@ static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
 	struct nand_device *nand = mtd_to_nanddev(mtd);
 	unsigned int max_bitflips = 0;
 	struct nand_io_iter iter;
-	bool enable_ecc = false;
+	bool disable_ecc = false;
 	bool ecc_failed = false;
 	int ret = 0;
 
-	if (ops->mode != MTD_OPS_RAW && spinand->eccinfo.ooblayout)
-		enable_ecc = true;
+	if (ops->mode == MTD_OPS_RAW || !spinand->eccinfo.ooblayout)
+		disable_ecc = true;
 
 	mutex_lock(&spinand->lock);
 
 	nanddev_io_for_each_page(nand, NAND_PAGE_READ, from, ops, &iter) {
+		if (disable_ecc)
+			iter.req.mode = MTD_OPS_RAW;
+
 		ret = spinand_select_target(spinand, iter.req.pos.target);
 		if (ret)
 			break;
 
-		ret = spinand_ecc_enable(spinand, enable_ecc);
-		if (ret)
-			break;
-
-		ret = spinand_read_page(spinand, &iter.req, enable_ecc);
+		ret = spinand_read_page(spinand, &iter.req);
 		if (ret < 0 && ret != -EBADMSG)
 			break;
 
@@ -628,20 +635,19 @@ static int spinand_mtd_write(struct mtd_info *mtd, loff_t to,
 	struct spinand_device *spinand = mtd_to_spinand(mtd);
 	struct nand_device *nand = mtd_to_nanddev(mtd);
 	struct nand_io_iter iter;
-	bool enable_ecc = false;
+	bool disable_ecc = false;
 	int ret = 0;
 
-	if (ops->mode != MTD_OPS_RAW && mtd->ooblayout)
-		enable_ecc = true;
+	if (ops->mode == MTD_OPS_RAW || !mtd->ooblayout)
+		disable_ecc = true;
 
 	mutex_lock(&spinand->lock);
 
 	nanddev_io_for_each_page(nand, NAND_PAGE_WRITE, to, ops, &iter) {
-		ret = spinand_select_target(spinand, iter.req.pos.target);
-		if (ret)
-			break;
+		if (disable_ecc)
+			iter.req.mode = MTD_OPS_RAW;
 
-		ret = spinand_ecc_enable(spinand, enable_ecc);
+		ret = spinand_select_target(spinand, iter.req.pos.target);
 		if (ret)
 			break;
 
@@ -671,7 +677,7 @@ static bool spinand_isbad(struct nand_device *nand, const struct nand_pos *pos)
 	};
 
 	spinand_select_target(spinand, pos->target);
-	spinand_read_page(spinand, &req, false);
+	spinand_read_page(spinand, &req);
 	if (marker[0] != 0xff || marker[1] != 0xff)
 		return true;
 
@@ -1137,6 +1143,11 @@ static int spinand_init(struct spinand_device *spinand)
 	nand->ecc.defaults.engine_type = NAND_ECC_ENGINE_TYPE_ON_DIE;
 	nand->ecc.ondie_engine = &spinand_ondie_ecc_engine;
 
+	spinand_ecc_enable(spinand, false);
+	ret = nanddev_ecc_engine_init(nand);
+	if (ret)
+		goto err_cleanup_nanddev;
+
 	/*
 	 * Right now, we don't support ECC, so let the whole oob
 	 * area available for the user.
@@ -1149,14 +1160,9 @@ static int spinand_init(struct spinand_device *spinand)
 	mtd->_erase = spinand_mtd_erase;
 	mtd->_max_bad_blocks = nanddev_mtd_max_bad_blocks;
 
-	if (spinand->eccinfo.ooblayout)
-		mtd_set_ooblayout(mtd, spinand->eccinfo.ooblayout);
-	else
-		mtd_set_ooblayout(mtd, &spinand_noecc_ooblayout);
-
 	ret = mtd_ooblayout_count_freebytes(mtd);
 	if (ret < 0)
-		goto err_cleanup_nanddev;
+		goto err_cleanup_ecc_engine;
 
 	mtd->oobavail = ret;
 
@@ -1166,6 +1172,9 @@ static int spinand_init(struct spinand_device *spinand)
 
 	return 0;
 
+err_cleanup_ecc_engine:
+	nanddev_ecc_engine_cleanup(nand);
+
 err_cleanup_nanddev:
 	nanddev_cleanup(nand);
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
