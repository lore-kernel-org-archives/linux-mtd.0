Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C49C54722
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2024 16:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lCxj2RrQ1qGeedYfT6O2oewMjgPhOj9jh3bV5o2Qiks=; b=naWxL0uUWcx6sb
	pSezkBU1F/twxKiCSAdhxv/gMJCa+leKDjmk8FBDemazuJLGYtiIL2pUOH3nvec/y4P3fAoAsYWkh
	Fk+IC1F88OUOfoow835UYxQ1dqiJ9VTckZPGiUBrQShoSdTLN+mC25fBcLcwFRVyzwuSAoPpYyBJk
	W3BgjJHDSzKv7cBVwETNzrIaBr3eui1Sg1bptmngROchwDz5pdpluiXYBELLqryyrvScLdweAIs0L
	O4vD51B9c+Zapb+D7PAelDkV+5Hmu1CCre3wXVjNDO1spx9UM/i+9Nj8ULQhsNK79C1k3Ri6znScc
	/jYBED8AhNq8mYiatNzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgo9X-00000009kN1-0gFw;
	Wed, 21 Aug 2024 16:25:43 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgo9O-00000009kGF-3D0X
	for linux-mtd@lists.infradead.org;
	Wed, 21 Aug 2024 16:25:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B7C381BF20A;
	Wed, 21 Aug 2024 16:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724257533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BuDYDZMVHEZ4IMsq/MKVdh8bqetRqtfXEI7MMniZyRo=;
	b=CcDXY+LCWxwdfA5/o7BzbVv+vS9u4JER6fSWvtyyNi8RBhJbbQk8NwgV3tX5oLgWAML1Jg
	EklkERqdZ/RATKTg0YQRGPYfNBWG9r2inwlA2BBCMvpaM5lf1EXUrGmvwZdWy9inwqnuQ1
	WfQXIdnQUZFlILMOKGrUosc2OGg4UAMcwBRBx1rCbEDn6cvZ6NeaG3QHn0M13PEQeneN+L
	PiG0XD8OTe4ZzU4VDY2iOqgMpZ44AYSkVE8emdRkj0JxN4gTzLmjB1qI6zfhwZPYFSlxjL
	Rfs5q69/BGe1FsIgnlran83cUbeamJTUqLBl8lVcwTfKgekMeGpYGqdnAWqo9w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 4/9] mtd: spi-nand: Add continuous read support
Date: Wed, 21 Aug 2024 18:25:23 +0200
Message-ID: <20240821162528.218292-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240821162528.218292-1-miquel.raynal@bootlin.com>
References: <20240821162528.218292-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_092535_437267_2EFA2CD8 
X-CRM114-Status: GOOD (  38.77  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

A regular page read consist in:
- Asking one page of content from the NAND array to be loaded in the
  chip's SRAM,
- Waiting for the operation to be done,
- Retrieving the data (I/O phase) from the chip's SRAM.

When reading several sequential pages, the above operation is repeated
over and over. There is however a way to optimize these accesses, by
enabling continuous reads. The feature requires the NAND chip to have a
second internal SRAM area plus a bit of additional internal logic to
trigger another internal transfer between the NAND array and the second
SRAM area while the I/O phase is ongoing. Once the first I/O phase is
done, the host can continue reading more data, continuously, as the chip
will automatically switch to the second SRAM content (which has already
been loaded) and in turns trigger the next load into the first SRAM area
again.

From an instruction perspective, the command op-codes are different, but
the same cycles are required. The only difference is that after a
continuous read (which is stopped by a CS deassert), the host must
observe a delay of tRST. However, because there is no guarantee in Linux
regarding the actual state of the CS pin after a transfer (in order to
speed-up the next transfer if targeting the same device), it was
necessary to manually end the continuous read with a configuration
register write operation.

Continuous reads have two main drawbacks:
* They only work on full pages (column address ignored)
* Only the main data area is pulled, out-of-band bytes are not
  accessible. Said otherwise, the feature can only be useful with on-die
  ECC engines.

Performance wise, measures have been performed on a Zynq platform using
Macronix SPI-NAND controller with a Macronix chip (based on the
flash_speed tool modified for testing sequential reads):
- 1-1-1 mode: performances improved from +3% (2-pages) up to +10% after
              a dozen pages.
- 1-1-4 mode: performances improved from +15% (2-pages) up to +40% after
              a dozen pages.

This series is based on a previous work from Macronix engineer Jaime
Liao.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c | 175 ++++++++++++++++++++++++++++++++++--
 include/linux/mtd/spinand.h |  10 +++
 2 files changed, 177 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 9042a092687c..964c9035fdc8 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -200,6 +200,12 @@ static int spinand_ecc_enable(struct spinand_device *spinand,
 			       enable ? CFG_ECC_ENABLE : 0);
 }
 
+static int spinand_cont_read_enable(struct spinand_device *spinand,
+				    bool enable)
+{
+	return spinand->set_cont_read(spinand, enable);
+}
+
 static int spinand_check_ecc_status(struct spinand_device *spinand, u8 status)
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
@@ -311,10 +317,22 @@ static int spinand_ondie_ecc_finish_io_req(struct nand_device *nand,
 
 	/* Finish a page read: check the status, report errors/bitflips */
 	ret = spinand_check_ecc_status(spinand, engine_conf->status);
-	if (ret == -EBADMSG)
+	if (ret == -EBADMSG) {
 		mtd->ecc_stats.failed++;
-	else if (ret > 0)
-		mtd->ecc_stats.corrected += ret;
+	} else if (ret > 0) {
+		unsigned int pages;
+
+		/*
+		 * Continuous reads don't allow us to get the detail,
+		 * so we may exagerate the actual number of corrected bitflips.
+		 */
+		if (!req->continuous)
+			pages = 1;
+		else
+			pages = req->datalen / nanddev_page_size(nand);
+
+		mtd->ecc_stats.corrected += ret * pages;
+	}
 
 	return ret;
 }
@@ -369,7 +387,11 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 
 	if (req->datalen) {
 		buf = spinand->databuf;
-		nbytes = nanddev_page_size(nand);
+		if (!req->continuous)
+			nbytes = nanddev_page_size(nand);
+		else
+			nbytes = round_up(req->dataoffs + req->datalen,
+					  nanddev_page_size(nand));
 		column = 0;
 	}
 
@@ -397,6 +419,13 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 		nbytes -= ret;
 		column += ret;
 		buf += ret;
+
+		/*
+		 * Dirmap accesses are allowed to toggle the CS.
+		 * Toggling the CS during a continuous read is forbidden.
+		 */
+		if (nbytes && req->continuous)
+			return -EIO;
 	}
 
 	if (req->datalen)
@@ -672,6 +701,123 @@ static int spinand_mtd_regular_page_read(struct mtd_info *mtd, loff_t from,
 	return ret;
 }
 
+static int spinand_mtd_continuous_page_read(struct mtd_info *mtd, loff_t from,
+					    struct mtd_oob_ops *ops,
+					    unsigned int *max_bitflips)
+{
+	struct spinand_device *spinand = mtd_to_spinand(mtd);
+	struct nand_device *nand = mtd_to_nanddev(mtd);
+	struct nand_io_iter iter;
+	u8 status;
+	int ret;
+
+	ret = spinand_cont_read_enable(spinand, true);
+	if (ret)
+		return ret;
+
+	/*
+	 * The cache is divided into two halves. While one half of the cache has
+	 * the requested data, the other half is loaded with the next chunk of data.
+	 * Therefore, the host can read out the data continuously from page to page.
+	 * Each data read must be a multiple of 4-bytes and full pages should be read;
+	 * otherwise, the data output might get out of sequence from one read command
+	 * to another.
+	 */
+	nanddev_io_for_each_block(nand, NAND_PAGE_READ, from, ops, &iter) {
+		ret = spinand_select_target(spinand, iter.req.pos.target);
+		if (ret)
+			goto end_cont_read;
+
+		ret = nand_ecc_prepare_io_req(nand, &iter.req);
+		if (ret)
+			goto end_cont_read;
+
+		ret = spinand_load_page_op(spinand, &iter.req);
+		if (ret)
+			goto end_cont_read;
+
+		ret = spinand_wait(spinand, SPINAND_READ_INITIAL_DELAY_US,
+				   SPINAND_READ_POLL_DELAY_US, NULL);
+		if (ret < 0)
+			goto end_cont_read;
+
+		ret = spinand_read_from_cache_op(spinand, &iter.req);
+		if (ret)
+			goto end_cont_read;
+
+		ops->retlen += iter.req.datalen;
+
+		ret = spinand_read_status(spinand, &status);
+		if (ret)
+			goto end_cont_read;
+
+		spinand_ondie_ecc_save_status(nand, status);
+
+		ret = nand_ecc_finish_io_req(nand, &iter.req);
+		if (ret < 0)
+			goto end_cont_read;
+
+		*max_bitflips = max_t(unsigned int, *max_bitflips, ret);
+		ret = 0;
+	}
+
+end_cont_read:
+	/*
+	 * Once all the data has been read out, the host can either pull CS#
+	 * high and wait for tRST or manually clear the bit in the configuration
+	 * register to terminate the continuous read operation. We have no
+	 * guarantee the SPI controller drivers will effectively deassert the CS
+	 * when we expect them to, so take the register based approach.
+	 */
+	spinand_cont_read_enable(spinand, false);
+
+	return ret;
+}
+
+static DEFINE_STATIC_KEY_FALSE(cont_read_supported);
+
+static void spinand_cont_read_init(struct spinand_device *spinand)
+{
+	struct nand_device *nand = spinand_to_nand(spinand);
+	enum nand_ecc_engine_type engine_type = nand->ecc.ctx.conf.engine_type;
+
+	/* OOBs cannot be retrieved so external/on-host ECC engine won't work */
+	if (spinand->set_cont_read &&
+	    (engine_type == NAND_ECC_ENGINE_TYPE_ON_DIE ||
+	     engine_type == NAND_ECC_ENGINE_TYPE_NONE)) {
+		static_branch_enable(&cont_read_supported);
+	}
+}
+
+static bool spinand_use_cont_read(struct mtd_info *mtd, loff_t from,
+				  struct mtd_oob_ops *ops)
+{
+	struct nand_device *nand = mtd_to_nanddev(mtd);
+	struct nand_pos start_pos, end_pos;
+
+	/* OOBs won't be retrieved */
+	if (ops->ooblen || ops->oobbuf)
+		return false;
+
+	nanddev_offs_to_pos(nand, from, &start_pos);
+	nanddev_offs_to_pos(nand, from + ops->len - 1, &end_pos);
+
+	/*
+	 * Continuous reads never cross LUN boundaries. Some devices don't
+	 * support crossing planes boundaries. Some devices don't even support
+	 * crossing blocks boundaries. The common case being to read through UBI,
+	 * we will very rarely read two consequent blocks or more, so it is safer
+	 * and easier (can be improved) to only enable continuous reads when
+	 * reading within the same erase block.
+	 */
+	if (start_pos.target != end_pos.target ||
+	    start_pos.plane != end_pos.plane ||
+	    start_pos.eraseblock != end_pos.eraseblock)
+		return false;
+
+	return start_pos.page < end_pos.page;
+}
+
 static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
 			    struct mtd_oob_ops *ops)
 {
@@ -684,7 +830,11 @@ static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
 
 	old_stats = mtd->ecc_stats;
 
-	ret = spinand_mtd_regular_page_read(mtd, from, ops, &max_bitflips);
+	if (static_branch_unlikely(&cont_read_supported) &&
+	    spinand_use_cont_read(mtd, from, ops))
+		ret = spinand_mtd_continuous_page_read(mtd, from, ops, &max_bitflips);
+	else
+		ret = spinand_mtd_regular_page_read(mtd, from, ops, &max_bitflips);
 
 	if (ops->stats) {
 		ops->stats->uncorrectable_errors +=
@@ -874,6 +1024,9 @@ static int spinand_create_dirmap(struct spinand_device *spinand,
 	};
 	struct spi_mem_dirmap_desc *desc;
 
+	if (static_branch_unlikely(&cont_read_supported))
+		info.length = nanddev_eraseblock_size(nand);
+
 	/* The plane number is passed in MSB just above the column address */
 	info.offset = plane << fls(nand->memorg.pagesize);
 
@@ -1107,6 +1260,7 @@ int spinand_match_and_init(struct spinand_device *spinand,
 		spinand->flags = table[i].flags;
 		spinand->id.len = 1 + table[i].devid.len;
 		spinand->select_target = table[i].select_target;
+		spinand->set_cont_read = table[i].set_cont_read;
 
 		op = spinand_select_op_variant(spinand,
 					       info->op_variants.read_cache);
@@ -1248,9 +1402,8 @@ static int spinand_init(struct spinand_device *spinand)
 	 * may use this buffer for DMA access.
 	 * Memory allocated by devm_ does not guarantee DMA-safe alignment.
 	 */
-	spinand->databuf = kzalloc(nanddev_page_size(nand) +
-			       nanddev_per_page_oobsize(nand),
-			       GFP_KERNEL);
+	spinand->databuf = kzalloc(nanddev_eraseblock_size(nand),
+				   GFP_KERNEL);
 	if (!spinand->databuf) {
 		ret = -ENOMEM;
 		goto err_free_bufs;
@@ -1279,6 +1432,12 @@ static int spinand_init(struct spinand_device *spinand)
 	if (ret)
 		goto err_cleanup_nanddev;
 
+	/*
+	 * Continuous read can only be enabled with an on-die ECC engine, so the
+	 * ECC initialization must have happened previously.
+	 */
+	spinand_cont_read_init(spinand);
+
 	mtd->_read_oob = spinand_mtd_read;
 	mtd->_write_oob = spinand_mtd_write;
 	mtd->_block_isbad = spinand_mtd_block_isbad;
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 5c19ead60499..8a335a3ad073 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -336,6 +336,7 @@ struct spinand_ondie_ecc_conf {
  * @op_variants.update_cache: variants of the update-cache operation
  * @select_target: function used to select a target/die. Required only for
  *		   multi-die chips
+ * @set_cont_read: enable/disable continuous cached reads
  *
  * Each SPI NAND manufacturer driver should have a spinand_info table
  * describing all the chips supported by the driver.
@@ -354,6 +355,8 @@ struct spinand_info {
 	} op_variants;
 	int (*select_target)(struct spinand_device *spinand,
 			     unsigned int target);
+	int (*set_cont_read)(struct spinand_device *spinand,
+			     bool enable);
 };
 
 #define SPINAND_ID(__method, ...)					\
@@ -379,6 +382,9 @@ struct spinand_info {
 #define SPINAND_SELECT_TARGET(__func)					\
 	.select_target = __func,
 
+#define SPINAND_CONT_READ(__set_cont_read)				\
+	.set_cont_read = __set_cont_read,
+
 #define SPINAND_INFO(__model, __id, __memorg, __eccreq, __op_variants,	\
 		     __flags, ...)					\
 	{								\
@@ -422,6 +428,7 @@ struct spinand_dirmap {
  *		passed in spi_mem_op be DMA-able, so we can't based the bufs on
  *		the stack
  * @manufacturer: SPI NAND manufacturer information
+ * @set_cont_read: Enable/disable the continuous read feature
  * @priv: manufacturer private data
  */
 struct spinand_device {
@@ -451,6 +458,9 @@ struct spinand_device {
 	u8 *scratchbuf;
 	const struct spinand_manufacturer *manufacturer;
 	void *priv;
+
+	int (*set_cont_read)(struct spinand_device *spinand,
+			     bool enable);
 };
 
 /**
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
