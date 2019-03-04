Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD3CC43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 22:33:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3454820823
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 22:33:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kTAKtOGb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3454820823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZZXX3F+32aGIBwpGteC4R1As1GL9m1K/+Kvx6WwyW/o=; b=kTAKtOGbWBQZh0
	uauNV38vxLnIwscBHlQj2XSGhJ4f6iMgbuWWDIXPxFUC2cu51WkcyK6Y/gmHAJ/QJqAc8T/xVTWlX
	+wh6obgnMd0q5pOLM8Jr/mRAKCUV8FydDDlLPLxRXv1a6Qx5Ydw2g9X5VMWF331b26BgD8PU/i7D/
	lJbjyiabDzC0Ww3D5narZiVYgvl1GpWQg9O0aksU8+4ibBs9waH70gPWQ1fDyU5xeSYYtnnTYkWIL
	926pH3sbGUC3rz/R2KpWXgkMf1DZe6C+HH9qBlsin6b27hj1FTMsj5cuSIoeLkMzgY7+7pp9HnBCr
	ARqeDJIu1bgTPy+b61Rg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0w9K-0002hv-SE; Mon, 04 Mar 2019 22:33:30 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0w7l-0000c5-Bz; Mon, 04 Mar 2019 22:32:19 +0000
X-Originating-IP: 90.5.42.199
Received: from localhost.localdomain
 (atoulouse-657-1-1088-199.w90-5.abo.wanadoo.fr [90.5.42.199])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 9CE2624000E;
 Mon,  4 Mar 2019 22:31:46 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 35/36] mtd: spinand: Use the external ECC engine logic
Date: Mon,  4 Mar 2019 23:28:40 +0100
Message-Id: <20190304222841.13899-36-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190304222841.13899-1-miquel.raynal@bootlin.com>
References: <20190304222841.13899-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_143154_082557_ADB74980 
X-CRM114-Status: GOOD (  21.85  )
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
 Paul Cercueil <paul@crapouillou.net>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
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
 drivers/mtd/nand/spi/Kconfig |   1 +
 drivers/mtd/nand/spi/core.c  | 110 ++++++++++++++++++-----------------
 2 files changed, 57 insertions(+), 54 deletions(-)

diff --git a/drivers/mtd/nand/spi/Kconfig b/drivers/mtd/nand/spi/Kconfig
index 7c37d2929b68..3e8433fbe54f 100644
--- a/drivers/mtd/nand/spi/Kconfig
+++ b/drivers/mtd/nand/spi/Kconfig
@@ -1,6 +1,7 @@
 menuconfig MTD_SPI_NAND
 	tristate "SPI NAND device Support"
 	select MTD_NAND_CORE
+	select MTD_NAND_ECC
 	depends on SPI_MASTER
 	select SPI_MEM
 	help
diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 7ff957c2e9f0..3ffd50530c19 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -329,6 +329,14 @@ static struct nand_ecc_engine spinand_ondie_ecc_engine = {
 	.ops = &spinand_ondie_ecc_engine_ops,
 };
 
+static void spinand_ondie_ecc_save_status(struct nand_device *nand, u8 status)
+{
+	struct spinand_ondie_ecc_conf *engine_conf = nand->ecc.ctx.priv;
+
+	if (nand->ecc.ctx.conf.provider == NAND_ECC_ON_DIE && engine_conf)
+		engine_conf->status = status;
+}
+
 static int spinand_write_enable_op(struct spinand_device *spinand)
 {
 	struct spi_mem_op op = SPINAND_WR_EN_DIS_OP(true);
@@ -351,7 +359,6 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 {
 	struct spi_mem_op op = *spinand->op_templates.read_cache;
 	struct nand_device *nand = spinand_to_nand(spinand);
-	struct mtd_info *mtd = nanddev_to_mtd(nand);
 	struct nand_page_io_req adjreq = *req;
 	unsigned int nbytes = 0;
 	void *buf = NULL;
@@ -405,17 +412,6 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
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
 
@@ -424,16 +420,18 @@ static int spinand_write_to_cache_op(struct spinand_device *spinand,
 {
 	struct spi_mem_op op = *spinand->op_templates.write_cache;
 	struct nand_device *nand = spinand_to_nand(spinand);
-	struct mtd_info *mtd = nanddev_to_mtd(nand);
 	struct nand_page_io_req adjreq = *req;
 	unsigned int nbytes = 0;
 	void *buf = NULL;
 	u16 column = 0;
 	int ret;
 
+	/*
+	 * Only reset the data buffer, the OOB buffer is prepared by ECC engines
+	 *->prepare/finish_io_req() callbacks.
+	 */
 	memset(spinand->databuf, 0xff,
-	       nanddev_page_size(nand) +
-	       nanddev_per_page_oobsize(nand));
+	       nanddev_page_size(nand));
 
 	if (req->datalen) {
 		memcpy(spinand->databuf + req->dataoffs, req->databuf.out,
@@ -446,15 +444,6 @@ static int spinand_write_to_cache_op(struct spinand_device *spinand,
 	}
 
 	if (req->ooblen) {
-		if (req->mode == MTD_OPS_AUTO_OOB)
-			mtd_ooblayout_set_databytes(mtd, req->oobbuf.out,
-						    spinand->oobbuf,
-						    req->ooboffs,
-						    req->ooblen);
-		else
-			memcpy(spinand->oobbuf + req->ooboffs, req->oobbuf.out,
-			       req->ooblen);
-
 		adjreq.ooblen = nanddev_per_page_oobsize(nand);
 		adjreq.ooboffs = 0;
 		nbytes += nanddev_per_page_oobsize(nand);
@@ -586,12 +575,17 @@ static int spinand_lock_block(struct spinand_device *spinand, u8 lock)
 }
 
 static int spinand_read_page(struct spinand_device *spinand,
-			     const struct nand_page_io_req *req,
-			     bool ecc_enabled)
+			     const struct nand_page_io_req *req)
 {
+	struct nand_device *nand = spinand_to_nand(spinand);
 	u8 status;
 	int ret;
 
+	ret = nand_ecc_prepare_io_req(nand, (struct nand_page_io_req *)req,
+				      spinand->oobbuf);
+	if (ret)
+		return ret;
+
 	ret = spinand_load_page_op(spinand, req);
 	if (ret)
 		return ret;
@@ -600,22 +594,28 @@ static int spinand_read_page(struct spinand_device *spinand,
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
+	return nand_ecc_finish_io_req(nand, (struct nand_page_io_req *)req,
+				      spinand->oobbuf);
 }
 
 static int spinand_write_page(struct spinand_device *spinand,
 			      const struct nand_page_io_req *req)
 {
+	struct nand_device *nand = spinand_to_nand(spinand);
 	u8 status;
 	int ret;
 
+	ret = nand_ecc_prepare_io_req(nand, (struct nand_page_io_req *)req,
+				      spinand->oobbuf);
+	if (ret)
+		return ret;
+
 	ret = spinand_write_enable_op(spinand);
 	if (ret)
 		return ret;
@@ -630,9 +630,10 @@ static int spinand_write_page(struct spinand_device *spinand,
 
 	ret = spinand_wait(spinand, &status);
 	if (!ret && (status & STATUS_PROG_FAILED))
-		ret = -EIO;
+		return -EIO;
 
-	return ret;
+	return nand_ecc_finish_io_req(nand, (struct nand_page_io_req *)req,
+				      spinand->oobbuf);
 }
 
 static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
@@ -642,25 +643,24 @@ static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
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
 
@@ -691,20 +691,19 @@ static int spinand_mtd_write(struct mtd_info *mtd, loff_t to,
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
 
@@ -734,7 +733,7 @@ static bool spinand_isbad(struct nand_device *nand, const struct nand_pos *pos)
 
 	memset(spinand->oobbuf, 0, 2);
 	spinand_select_target(spinand, pos->target);
-	spinand_read_page(spinand, &req, false);
+	spinand_read_page(spinand, &req);
 	if (spinand->oobbuf[0] != 0xff || spinand->oobbuf[1] != 0xff)
 		printk("would be bad, but fuck it\n");
 //		return true;
@@ -1103,6 +1102,11 @@ static int spinand_init(struct spinand_device *spinand)
 	nand->ecc.defaults.provider = NAND_ECC_ON_DIE;
 	nand->ecc.ondie_engine = &spinand_ondie_ecc_engine;
 
+	spinand_ecc_enable(spinand, false);
+	ret = nanddev_ecc_engine_init(nand);
+	if (ret)
+		goto err_cleanup_nanddev;
+
 	/*
 	 * Right now, we don't support ECC, so let the whole oob
 	 * area available for the user.
@@ -1115,19 +1119,17 @@ static int spinand_init(struct spinand_device *spinand)
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
 
 	return 0;
 
+err_cleanup_ecc_engine:
+	nanddev_ecc_engine_cleanup(nand);
+
 err_cleanup_nanddev:
 	nanddev_cleanup(nand);
 
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
