Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A45A1D26D7B
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 17:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HshV7l7Iy2yeiIfDMksG7qY/RVemX7Myf3bd93/qWs8=; b=A3ydSIpDTVWXR5
	99k1o379Ux6mTaK6vAzD+HtC95fM84MsnhNu3XnSamCU8GoXy90ibh11MF1Kf20uT0CIVdx1C5jyL
	GNy1Dife1R9f3Lr2yCrTWMvMzOMn+g3sQlT4taYmDbGdscODDHjgN57Qz+mYNzbZFHCbuds6bXEmT
	4IbAPgAsDLoW1lAxRdKAyaY2fMilNGA8fbnq7oSEYzwYOoVXR2kQhRvYcCsZnEOKW8mtebug3eF/Y
	LUMXcfarJiXlwPhCpRTO+HOPNbcruvpgGQa7LYUJ8HMERVJ5PuqA8AOUbSH7eWfrSAA7E/Xrg9dNk
	gaOXa843bmmfJZMwLqpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGEV-00000002o4o-2vHo;
	Fri, 09 Jan 2026 17:25:07 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGEQ-00000002o2D-3x5Q
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 17:25:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 994A31A2753;
	Fri,  9 Jan 2026 17:18:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 69A19606C6;
	Fri,  9 Jan 2026 17:18:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A7D36103C89AD;
	Fri,  9 Jan 2026 18:18:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767979132; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=neklhWF9Sg2eyfEOKn2xQ0FrpcEjSrtWyZMej8TTw7I=;
	b=h6Hxf9RFggVUKiGmkEU9Oa0WuchAe/mhHHO/U92LClWZAv+vHE4jxtxpRqJVvLPXVdKIvV
	esUvh1Je7PAYAHFthIMBD8xssvCH3twWgjIu4E7JkiVNilGRjXEu5E4XBRXpjQ2HPjKOWS
	TSPx24VaurL/qFJOUekxvv3kc15KMt1E/6YFvnPPF4JaZ8kbO/7mAuq7DGNhKtyvCOei58
	vVnwANeix7HoQZfbEHUFLHqd7xcwWtLJTj+R81mgKiM3IG2aSErK/tx4yEfnV2uGpmIWEO
	Ndf2yUvluYpyLps0cd5XgKc5hCZdEMBuz3RfA5/2w2dYuelGOC7dYdoF/8lfMQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 09 Jan 2026 18:18:24 +0100
Subject: [PATCH v2 26/27] mtd: spinand: Add octal DTR support
MIME-Version: 1.0
Message-Id: <20260109-winbond-v6-17-rc1-oddr-v2-26-1fff6a2ddb80@bootlin.com>
References: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
In-Reply-To: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_092503_258918_F224F8DD 
X-CRM114-Status: GOOD (  28.29  )
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

Create a new bus interface named ODTR for "octal DTR", which matches the
following pattern: 8D-8D-8D.

Add octal DTR support for all the existing core operations. Add a second
set of templates for this bus interface.

Give the possibility for drivers to register their read, write and
update cache variants as well as their vendor specific operations.

Check the SPI controller driver supports all the octal DTR commands that
we might need before switching to the ODTR bus interface.

Make the switch by calling ->configure_chip() with the ODTR
parameter. Fallback in case this step fails.

If someone ever attempts to suspend a chip in octal DTR mode, there are
changes that it will loose its configuration at resume. Prevent any
problem by explicitly switching back to SSDR while suspending. Note:
there is a limitation in the current approach, page I/Os are not
available as the dirmaps will be created for the ODTR bus interface if
that option is supported and not switched back to SSDR during
suspend. Switching them is possible but would be costly and would not
bring anything as right after resuming we will switch again to ODTR. In
case this capability is used for debug, developpers should mind to
destroy and recreate suitable direct mappings.

Finally, as a side effect, we increase the buffer for reading IDs to
6. No device at this point returns 6 bytes, but we support 5 bytes IDs,
which means in octal DTR mode we have no other choice than reading an
even number of bytes, hence 6.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c | 140 +++++++++++++++++++++++++++++++++++++++++++-
 include/linux/mtd/spinand.h |  79 ++++++++++++++++++++++++-
 2 files changed, 216 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 1ac1d0181a91..e1336859c600 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -57,6 +57,9 @@ spinand_fill_set_feature_op(struct spinand_device *spinand, u64 reg, const void
 {
 	struct spi_mem_op op = spinand->op_templates->set_feature;
 
+	if (op.cmd.dtr && op.cmd.buswidth == 8)
+		reg |= reg << 8;
+
 	op.addr.val = reg;
 	op.data.buf.out = valptr;
 
@@ -68,6 +71,9 @@ spinand_fill_get_feature_op(struct spinand_device *spinand, u64 reg, void *valpt
 {
 	struct spi_mem_op op = spinand->op_templates->get_feature;
 
+	if (op.cmd.dtr && op.cmd.buswidth == 8)
+		reg |= reg << 8;
+
 	op.addr.val = reg;
 	op.data.buf.in = valptr;
 
@@ -1392,6 +1398,11 @@ static void spinand_manufacturer_cleanup(struct spinand_device *spinand)
 		return spinand->manufacturer->ops->cleanup(spinand);
 }
 
+static bool spinand_op_is_odtr(const struct spi_mem_op *op)
+{
+	return op->cmd.dtr && op->cmd.buswidth == 8;
+}
+
 static void spinand_init_ssdr_templates(struct spinand_device *spinand)
 {
 	struct spinand_mem_ops *tmpl = &spinand->ssdr_op_templates;
@@ -1424,6 +1435,10 @@ static int spinand_support_vendor_ops(struct spinand_device *spinand,
 	for (i = 0; i < info->vendor_ops->nops; i++) {
 		const struct spi_mem_op *op = &info->vendor_ops->ops[i];
 
+		if ((iface == SSDR && spinand_op_is_odtr(op)) ||
+		    (iface == ODTR && !spinand_op_is_odtr(op)))
+			continue;
+
 		if (!spi_mem_supports_op(spinand->spimem, op))
 			return -EOPNOTSUPP;
 	}
@@ -1431,6 +1446,49 @@ static int spinand_support_vendor_ops(struct spinand_device *spinand,
 	return 0;
 }
 
+static int spinand_init_odtr_instruction_set(struct spinand_device *spinand)
+{
+	struct spinand_mem_ops *tmpl = &spinand->odtr_op_templates;
+
+	tmpl->reset = (struct spi_mem_op)SPINAND_RESET_8D_0_0_OP;
+	if (!spi_mem_supports_op(spinand->spimem, &tmpl->reset))
+		return -EOPNOTSUPP;
+
+	tmpl->readid = (struct spi_mem_op)SPINAND_READID_8D_8D_8D_OP(0, 0, NULL, 0);
+	if (!spi_mem_supports_op(spinand->spimem, &tmpl->readid))
+		return -EOPNOTSUPP;
+
+	tmpl->wr_en = (struct spi_mem_op)SPINAND_WR_EN_8D_0_0_OP;
+	if (!spi_mem_supports_op(spinand->spimem, &tmpl->wr_en))
+		return -EOPNOTSUPP;
+
+	tmpl->wr_dis = (struct spi_mem_op)SPINAND_WR_DIS_8D_0_0_OP;
+	if (!spi_mem_supports_op(spinand->spimem, &tmpl->wr_dis))
+		return -EOPNOTSUPP;
+
+	tmpl->set_feature = (struct spi_mem_op)SPINAND_SET_FEATURE_8D_8D_8D_OP(0, NULL);
+	if (!spi_mem_supports_op(spinand->spimem, &tmpl->set_feature))
+		return -EOPNOTSUPP;
+
+	tmpl->get_feature = (struct spi_mem_op)SPINAND_GET_FEATURE_8D_8D_8D_OP(0, NULL);
+	if (!spi_mem_supports_op(spinand->spimem, &tmpl->get_feature))
+		return -EOPNOTSUPP;
+
+	tmpl->blk_erase = (struct spi_mem_op)SPINAND_BLK_ERASE_8D_8D_0_OP(0);
+	if (!spi_mem_supports_op(spinand->spimem, &tmpl->blk_erase))
+		return -EOPNOTSUPP;
+
+	tmpl->page_read = (struct spi_mem_op)SPINAND_PAGE_READ_8D_8D_0_OP(0);
+	if (!spi_mem_supports_op(spinand->spimem, &tmpl->page_read))
+		return -EOPNOTSUPP;
+
+	tmpl->prog_exec = (struct spi_mem_op)SPINAND_PROG_EXEC_8D_8D_0_OP(0);
+	if (!spi_mem_supports_op(spinand->spimem, &tmpl->prog_exec))
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 static const struct spi_mem_op *
 spinand_select_op_variant(struct spinand_device *spinand, enum spinand_bus_interface iface,
 			  const struct spinand_op_variants *variants)
@@ -1446,6 +1504,10 @@ spinand_select_op_variant(struct spinand_device *spinand, enum spinand_bus_inter
 		unsigned int nbytes;
 		int ret;
 
+		if ((iface == SSDR && spinand_op_is_odtr(&op)) ||
+		    (iface == ODTR && !spinand_op_is_odtr(&op)))
+			continue;
+
 		nbytes = nanddev_per_page_oobsize(nand) +
 			 nanddev_page_size(nand);
 
@@ -1525,6 +1587,8 @@ int spinand_match_and_init(struct spinand_device *spinand,
 		spinand->read_retries = table[i].read_retries;
 		spinand->set_read_retry = table[i].set_read_retry;
 
+		/* I/O variants selection with single-spi SDR commands */
+
 		op = spinand_select_op_variant(spinand, SSDR,
 					       info->op_variants.read_cache);
 		if (!op)
@@ -1550,6 +1614,28 @@ int spinand_match_and_init(struct spinand_device *spinand,
 		if (ret)
 			return ret;
 
+		/* I/O variants selection with octo-spi DDR commands (optional) */
+
+		ret = spinand_init_odtr_instruction_set(spinand);
+		if (ret)
+			return 0;
+
+		ret = spinand_support_vendor_ops(spinand, info, ODTR);
+		if (ret)
+			return 0;
+
+		op = spinand_select_op_variant(spinand, ODTR,
+					       info->op_variants.read_cache);
+		spinand->odtr_op_templates.read_cache = op;
+
+		op = spinand_select_op_variant(spinand, ODTR,
+					       info->op_variants.write_cache);
+		spinand->odtr_op_templates.write_cache = op;
+
+		op = spinand_select_op_variant(spinand, ODTR,
+					       info->op_variants.update_cache);
+		spinand->odtr_op_templates.update_cache = op;
+
 		return 0;
 	}
 
@@ -1591,9 +1677,34 @@ static int spinand_detect(struct spinand_device *spinand)
 
 static int spinand_configure_chip(struct spinand_device *spinand)
 {
-	bool quad_enable = false;
+	bool odtr = false, quad_enable = false;
 	int ret;
 
+	if (spinand->odtr_op_templates.read_cache &&
+	    spinand->odtr_op_templates.write_cache &&
+	    spinand->odtr_op_templates.update_cache)
+		odtr = true;
+
+	if (odtr) {
+		if (!spinand->configure_chip)
+			goto try_ssdr;
+
+		/* ODTR bus interface configuration happens here */
+		ret = spinand->configure_chip(spinand, ODTR);
+		if (ret) {
+			spinand->odtr_op_templates.read_cache = NULL;
+			spinand->odtr_op_templates.write_cache = NULL;
+			spinand->odtr_op_templates.update_cache = NULL;
+			goto try_ssdr;
+		}
+
+		spinand->op_templates = &spinand->odtr_op_templates;
+		spinand->bus_iface = ODTR;
+
+		return 0;
+	}
+
+try_ssdr:
 	if (spinand->flags & SPINAND_HAS_QE_BIT) {
 		if (spinand->ssdr_op_templates.read_cache->data.buswidth == 4 ||
 		    spinand->ssdr_op_templates.write_cache->data.buswidth == 4 ||
@@ -1675,6 +1786,32 @@ static void spinand_mtd_resume(struct mtd_info *mtd)
 	spinand_ecc_enable(spinand, false);
 }
 
+static int spinand_mtd_suspend(struct mtd_info *mtd)
+{
+	struct spinand_device *spinand = mtd_to_spinand(mtd);
+	int ret;
+
+	/*
+	 * Return to SSDR interface in the suspend path to make sure the
+	 * reset operation is correctly processed upon resume.
+	 *
+	 * Note: Once back in SSDR mode, every operation but the page helpers
+	 * (dirmap based I/O accessors) will work. Page accesses would require
+	 * destroying and recreating the dirmaps twice to work, which would be
+	 * impacting for no reason, as this is just a transitional state.
+	 */
+	if (spinand->bus_iface == ODTR) {
+		ret = spinand->configure_chip(spinand, SSDR);
+		if (ret)
+			return ret;
+
+		spinand->op_templates = &spinand->ssdr_op_templates;
+		spinand->bus_iface = SSDR;
+	}
+
+	return 0;
+}
+
 static int spinand_init(struct spinand_device *spinand)
 {
 	struct device *dev = &spinand->spimem->spi->dev;
@@ -1744,6 +1881,7 @@ static int spinand_init(struct spinand_device *spinand)
 	mtd->_block_isreserved = spinand_mtd_block_isreserved;
 	mtd->_erase = spinand_mtd_erase;
 	mtd->_max_bad_blocks = nanddev_mtd_max_bad_blocks;
+	mtd->_suspend = spinand_mtd_suspend;
 	mtd->_resume = spinand_mtd_resume;
 
 	if (spinand_user_otp_size(spinand) || spinand_fact_otp_size(spinand)) {
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index b7eb3eceb138..fc5111fc778f 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -238,6 +238,77 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_DATA_OUT(len, buf, 8))
 
+/**
+ * Octal DDR SPI NAND flash operations
+ */
+
+#define SPINAND_RESET_8D_0_0_OP						\
+	SPI_MEM_OP(SPI_MEM_DTR_OP_RPT_CMD(0xff, 8),			\
+		   SPI_MEM_OP_NO_ADDR,					\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_NO_DATA)
+
+#define SPINAND_READID_8D_8D_8D_OP(naddr, ndummy, buf, len)		\
+	SPI_MEM_OP(SPI_MEM_DTR_OP_RPT_CMD(0x9f, 8),			\
+		   SPI_MEM_DTR_OP_ADDR(naddr, 0, 8),			\
+		   SPI_MEM_DTR_OP_DUMMY(ndummy, 8),			\
+		   SPI_MEM_DTR_OP_DATA_IN(len, buf, 8))
+
+#define SPINAND_WR_EN_8D_0_0_OP						\
+	SPI_MEM_OP(SPI_MEM_DTR_OP_RPT_CMD(0x06, 8),			\
+		   SPI_MEM_OP_NO_ADDR,					\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_NO_DATA)
+
+#define SPINAND_WR_DIS_8D_0_0_OP					\
+	SPI_MEM_OP(SPI_MEM_DTR_OP_RPT_CMD(0x04, 8),			\
+		   SPI_MEM_OP_NO_ADDR,					\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_NO_DATA)
+
+#define SPINAND_SET_FEATURE_8D_8D_8D_OP(reg, valptr)			\
+	SPI_MEM_OP(SPI_MEM_DTR_OP_RPT_CMD(0x1f, 8),			\
+		   SPI_MEM_DTR_OP_RPT_ADDR(reg, 8),			\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_DTR_OP_DATA_OUT(2, valptr, 8))
+
+#define SPINAND_GET_FEATURE_8D_8D_8D_OP(reg, valptr)			\
+	SPI_MEM_OP(SPI_MEM_DTR_OP_RPT_CMD(0x0f, 8),			\
+		   SPI_MEM_DTR_OP_RPT_ADDR(reg, 8),			\
+		   SPI_MEM_DTR_OP_DUMMY(14, 8),				\
+		   SPI_MEM_DTR_OP_DATA_IN(2, valptr, 8))
+
+#define SPINAND_BLK_ERASE_8D_8D_0_OP(addr)				\
+	SPI_MEM_OP(SPI_MEM_DTR_OP_RPT_CMD(0xd8, 8),			\
+		   SPI_MEM_DTR_OP_ADDR(2, addr, 8),			\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_NO_DATA)
+
+#define SPINAND_PAGE_READ_8D_8D_0_OP(addr)				\
+	SPI_MEM_OP(SPI_MEM_DTR_OP_RPT_CMD(0x13, 8),			\
+		   SPI_MEM_DTR_OP_ADDR(2, addr, 8),			\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_NO_DATA)
+
+#define SPINAND_PAGE_READ_FROM_CACHE_8D_8D_8D_OP(addr, ndummy, buf, len, freq) \
+	SPI_MEM_OP(SPI_MEM_DTR_OP_RPT_CMD(0x9d, 8),			\
+		   SPI_MEM_DTR_OP_ADDR(2, addr, 8),			\
+		   SPI_MEM_DTR_OP_DUMMY(ndummy, 8),			\
+		   SPI_MEM_DTR_OP_DATA_IN(len, buf, 8),			\
+		   SPI_MEM_OP_MAX_FREQ(freq))
+
+#define SPINAND_PROG_EXEC_8D_8D_0_OP(addr)				\
+	SPI_MEM_OP(SPI_MEM_DTR_OP_RPT_CMD(0x10, 8),			\
+		   SPI_MEM_DTR_OP_ADDR(2, addr, 8),			\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_NO_DATA)
+
+#define SPINAND_PROG_LOAD_8D_8D_8D_OP(reset, addr, buf, len)		\
+	SPI_MEM_OP(SPI_MEM_DTR_OP_RPT_CMD((reset ? 0xc2 : 0xc4), 8),	\
+		   SPI_MEM_DTR_OP_ADDR(2, addr, 8),			\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_DTR_OP_DATA_OUT(len, buf, 8))
+
 /* feature register */
 #define REG_BLOCK_LOCK		0xa0
 #define BL_ALL_UNLOCKED		0x00
@@ -261,7 +332,7 @@
 struct spinand_op;
 struct spinand_device;
 
-#define SPINAND_MAX_ID_LEN	5
+#define SPINAND_MAX_ID_LEN	6
 /*
  * For erase, write and read operation, we got the following timings :
  * tBERS (erase) 1ms to 4ms
@@ -287,7 +358,7 @@ struct spinand_device;
 
 /**
  * struct spinand_id - SPI NAND id structure
- * @data: buffer containing the id bytes. Currently 5 bytes large, but can
+ * @data: buffer containing the id bytes. Currently 6 bytes large, but can
  *	  be extended if required
  * @len: ID length
  */
@@ -484,9 +555,11 @@ struct spinand_user_otp {
 /**
  * enum spinand_bus_interface - SPI NAND bus interface types
  * @SSDR: Bus configuration supporting all 1S-XX-XX operations, including dual and quad
+ * @ODTR: Bus configuration supporting only 8D-8D-8D operations
  */
 enum spinand_bus_interface {
 	SSDR,
+	ODTR,
 };
 
 /**
@@ -651,6 +724,7 @@ struct spinand_mem_ops {
  * @id: NAND ID as returned by READ_ID
  * @flags: NAND flags
  * @ssdr_op_templates: Templates for all single SDR SPI mem operations
+ * @odtr_op_templates: Templates for all octal DTR SPI mem operations
  * @op_templates: Templates for all SPI mem operations
  * @bus_iface: Current bus interface
  * @select_target: select a specific target/die. Usually called before sending
@@ -687,6 +761,7 @@ struct spinand_device {
 	u32 flags;
 
 	struct spinand_mem_ops ssdr_op_templates;
+	struct spinand_mem_ops odtr_op_templates;
 	struct spinand_mem_ops *op_templates;
 	enum spinand_bus_interface bus_iface;
 

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
