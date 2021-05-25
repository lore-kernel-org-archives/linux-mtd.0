Return-Path: <SRS0=nVbp=KU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC0EC2B9F8
	for <linux-mtd@archiver.kernel.org>; Tue, 25 May 2021 16:28:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6BA66141C
	for <linux-mtd@archiver.kernel.org>; Tue, 25 May 2021 16:28:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6BA66141C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E0/eTlHrfymNLM5lHU2EDFXCGl3H0KzOOmeaeSncqa8=; b=zykBmmZkex5LLq
	haoT4ONKGpMLrHIFTQ2ITPvYZPRFEBINIvC4Ta7WJwV9SwyhqZY7M1sjXKsEm0Zuz1keNhDfNRETS
	HarsQQUwFBuvJL1plnZM7xzw/cLaTMi2/3+LsReCjFKjdy+BRuBgt2C/Vw1SkzQtUsy+M4Qlm9KjV
	ts4HPXtgXMx1p76Yhw9Qp6N/LyI7gyD8vz6Nrsxp/JP6znymlBjgT7jojCJzsayGFuSLjH09d5jyc
	b6eleqBD0Vi6h5iRW7u35aJEEzgyBYekRBrGo6Vk6/3Oz9bEKBAX9lySiuVZF+it1sWcQQJf18Uh3
	hSU3DC0oCFSWDtNZqCwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llZtj-006QEY-D4; Tue, 25 May 2021 16:27:15 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llZZa-006G9s-2c
 for linux-mtd@lists.infradead.org; Tue, 25 May 2021 16:06:28 +0000
IronPort-SDR: I0RnxByxGqdreEAncSHc0YOUuE7U35HPneznEgLXLaxxQTSCgX1zEWEjYOfh+7zr4j5slNqm6t
 wZ0if7RQB1Hw==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="202246931"
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="202246931"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 09:02:59 -0700
IronPort-SDR: wa58UReMlGfdIh74fpaI3QhwjdnSJBbW6HNVbgpJY55ekb0qAS0o+Qr4/URK/DvHmBt3MRfFem
 KFHmD5CUnMLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="471303369"
Received: from black.fi.intel.com ([10.237.72.28])
 by FMSMGA003.fm.intel.com with ESMTP; 25 May 2021 09:02:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
 id CFEF312A; Tue, 25 May 2021 19:03:18 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: intel-spi: Add support for second flash chip
Date: Tue, 25 May 2021 19:03:18 +0300
Message-Id: <20210525160318.35802-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_090626_206481_C7DB59B3 
X-CRM114-Status: GOOD (  29.75  )
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

Intel SPI flash controller has been supporting two chip selects long
time already even if the most common configuration is to have single
flash chip for the BIOS and related data. This adds support for the
second chip select if we find out that there are two flash components
(this information is available in the mandatory flash descriptor on the
first chip). The second chip is exposed as is without any partition
information with name "chip1". The first chip continues work as is.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/mtd/spi-nor/controllers/intel-spi.c | 208 ++++++++++++++------
 1 file changed, 150 insertions(+), 58 deletions(-)

diff --git a/drivers/mtd/spi-nor/controllers/intel-spi.c b/drivers/mtd/spi-nor/controllers/intel-spi.c
index a413892ff449..f9a900c4dd40 100644
--- a/drivers/mtd/spi-nor/controllers/intel-spi.c
+++ b/drivers/mtd/spi-nor/controllers/intel-spi.c
@@ -118,6 +118,11 @@
 #define ERASE_64K_OPCODE_SHIFT		16
 #define ERASE_64K_OPCODE_MASK		(0xff << ERASE_OPCODE_SHIFT)
 
+/* Flash descriptor fields */
+#define FLVALSIG_MAGIC			0x0ff0a55a
+#define FLMAP0_NC_MASK			GENMASK(9, 8)
+#define FLMAP0_NC_SHIFT			8
+
 #define INTEL_SPI_TIMEOUT		5000 /* ms */
 #define INTEL_SPI_FIFO_SZ		64
 
@@ -125,7 +130,8 @@
  * struct intel_spi - Driver private data
  * @dev: Device pointer
  * @info: Pointer to board specific info
- * @nor: SPI NOR layer structure
+ * @nor: SPI NOR layer structures
+ * @nc: Number of flash chips
  * @base: Beginning of MMIO space
  * @pregs: Start of protection registers
  * @sregs: Start of software sequencer registers
@@ -143,7 +149,8 @@
 struct intel_spi {
 	struct device *dev;
 	const struct intel_spi_boardinfo *info;
-	struct spi_nor nor;
+	struct spi_nor nor[2];
+	size_t nc;
 	void __iomem *base;
 	void __iomem *pregs;
 	void __iomem *sregs;
@@ -554,14 +561,23 @@ static int intel_spi_sw_cycle(struct intel_spi *ispi, u8 opcode, size_t len,
 	return 0;
 }
 
+static void intel_spi_set_addr(const struct spi_nor *nor, loff_t addr)
+{
+	const struct intel_spi *ispi = nor->priv;
+
+	/* Pick correct flash component */
+	if (nor == &ispi->nor[1])
+		addr += ispi->nor[0].mtd.size;
+	writel(addr, ispi->base + FADDR);
+}
+
 static int intel_spi_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf,
 			      size_t len)
 {
 	struct intel_spi *ispi = nor->priv;
 	int ret;
 
-	/* Address of the first chip */
-	writel(0, ispi->base + FADDR);
+	intel_spi_set_addr(nor, 0);
 
 	if (ispi->swseq_reg)
 		ret = intel_spi_sw_cycle(ispi, opcode, len,
@@ -620,7 +636,7 @@ static int intel_spi_write_reg(struct spi_nor *nor, u8 opcode, const u8 *buf,
 	if (opcode == SPINOR_OP_WRDI)
 		return 0;
 
-	writel(0, ispi->base + FADDR);
+	intel_spi_set_addr(nor, 0);
 
 	/* Write the value beforehand */
 	ret = intel_spi_write_block(ispi, buf, len);
@@ -633,12 +649,49 @@ static int intel_spi_write_reg(struct spi_nor *nor, u8 opcode, const u8 *buf,
 	return intel_spi_hw_cycle(ispi, opcode, len);
 }
 
+static ssize_t __intel_spi_read(struct intel_spi *ispi, struct spi_nor *nor,
+				loff_t from, size_t len, u_char *read_buf)
+{
+	u32 val, status;
+	int ret;
+
+	if (nor)
+		intel_spi_set_addr(nor, from);
+	else
+		writel(from, ispi->base + FADDR);
+
+	val = readl(ispi->base + HSFSTS_CTL);
+	val &= ~(HSFSTS_CTL_FDBC_MASK | HSFSTS_CTL_FCYCLE_MASK);
+	val |= HSFSTS_CTL_AEL | HSFSTS_CTL_FCERR | HSFSTS_CTL_FDONE;
+	val |= (len - 1) << HSFSTS_CTL_FDBC_SHIFT;
+	val |= HSFSTS_CTL_FCYCLE_READ;
+	val |= HSFSTS_CTL_FGO;
+	writel(val, ispi->base + HSFSTS_CTL);
+
+	ret = intel_spi_wait_hw_busy(ispi);
+	if (ret)
+		return ret;
+
+	status = readl(ispi->base + HSFSTS_CTL);
+	if (status & HSFSTS_CTL_FCERR)
+		ret = -EIO;
+	else if (status & HSFSTS_CTL_AEL)
+		ret = -EACCES;
+
+	if (ret < 0) {
+		dev_err(ispi->dev, "read error: %llx: %#x\n", from,
+			status);
+		return ret;
+	}
+
+	return intel_spi_read_block(ispi, read_buf, len);
+}
+
 static ssize_t intel_spi_read(struct spi_nor *nor, loff_t from, size_t len,
 			      u_char *read_buf)
 {
 	struct intel_spi *ispi = nor->priv;
 	size_t block_size, retlen = 0;
-	u32 val, status;
 	ssize_t ret;
 
 	/*
@@ -665,33 +718,7 @@ static ssize_t intel_spi_read(struct spi_nor *nor, loff_t from, size_t len,
 		block_size = min_t(loff_t, from + block_size,
 				   round_up(from + 1, SZ_4K)) - from;
 
-		writel(from, ispi->base + FADDR);
-
-		val = readl(ispi->base + HSFSTS_CTL);
-		val &= ~(HSFSTS_CTL_FDBC_MASK | HSFSTS_CTL_FCYCLE_MASK);
-		val |= HSFSTS_CTL_AEL | HSFSTS_CTL_FCERR | HSFSTS_CTL_FDONE;
-		val |= (block_size - 1) << HSFSTS_CTL_FDBC_SHIFT;
-		val |= HSFSTS_CTL_FCYCLE_READ;
-		val |= HSFSTS_CTL_FGO;
-		writel(val, ispi->base + HSFSTS_CTL);
-
-		ret = intel_spi_wait_hw_busy(ispi);
-		if (ret)
-			return ret;
-
-		status = readl(ispi->base + HSFSTS_CTL);
-		if (status & HSFSTS_CTL_FCERR)
-			ret = -EIO;
-		else if (status & HSFSTS_CTL_AEL)
-			ret = -EACCES;
-
-		if (ret < 0) {
-			dev_err(ispi->dev, "read error: %llx: %#x\n", from,
-				status);
-			return ret;
-		}
-
-		ret = intel_spi_read_block(ispi, read_buf, block_size);
+		ret = __intel_spi_read(ispi, nor, from, block_size, read_buf);
 		if (ret)
 			return ret;
 
@@ -722,7 +749,7 @@ static ssize_t intel_spi_write(struct spi_nor *nor, loff_t to, size_t len,
 		block_size = min_t(loff_t, to + block_size,
 				   round_up(to + 1, SZ_4K)) - to;
 
-		writel(to, ispi->base + FADDR);
+		intel_spi_set_addr(nor, to);
 
 		val = readl(ispi->base + HSFSTS_CTL);
 		val &= ~(HSFSTS_CTL_FDBC_MASK | HSFSTS_CTL_FCYCLE_MASK);
@@ -785,7 +812,7 @@ static int intel_spi_erase(struct spi_nor *nor, loff_t offs)
 
 	if (ispi->swseq_erase) {
 		while (len > 0) {
-			writel(offs, ispi->base + FADDR);
+			intel_spi_set_addr(nor, offs);
 
 			ret = intel_spi_sw_cycle(ispi, nor->erase_opcode,
 						 0, OPTYPE_WRITE_WITH_ADDR);
@@ -803,7 +830,7 @@ static int intel_spi_erase(struct spi_nor *nor, loff_t offs)
 	ispi->atomic_preopcode = 0;
 
 	while (len > 0) {
-		writel(offs, ispi->base + FADDR);
+		intel_spi_set_addr(nor, offs);
 
 		val = readl(ispi->base + HSFSTS_CTL);
 		val &= ~(HSFSTS_CTL_FDBC_MASK | HSFSTS_CTL_FCYCLE_MASK);
@@ -851,6 +878,37 @@ static bool intel_spi_is_protected(const struct intel_spi *ispi,
 	return false;
 }
 
+static int intel_spi_read_desc(struct intel_spi *ispi)
+{
+	u32 buf[2], nc;
+	ssize_t ret;
+
+	ret = __intel_spi_read(ispi, NULL, 0x10, sizeof(buf), (u_char *)buf);
+	if (ret < 0) {
+		dev_warn(ispi->dev, "failed to read descriptor\n");
+		return ret;
+	}
+
+	dev_dbg(ispi->dev, "FLVALSIG=0x%08x\n", buf[0]);
+	dev_dbg(ispi->dev, "FLMAP0=0x%08x\n", buf[1]);
+
+	if (buf[0] != FLVALSIG_MAGIC) {
+		dev_warn(ispi->dev, "descriptor signature not valid\n");
+		return -ENODEV;
+	}
+
+	nc = (buf[1] & FLMAP0_NC_MASK) >> FLMAP0_NC_SHIFT;
+	if (nc == 0)
+		ispi->nc = 1;
+	else if (nc == 1)
+		ispi->nc = 2;
+	else
+		return -EINVAL;
+
+	dev_dbg(ispi->dev, "%zd flash components found\n", ispi->nc);
+	return 0;
+}
+
 /*
  * There will be a single partition holding all enabled flash regions. We
  * call this "BIOS".
@@ -861,8 +919,6 @@ static void intel_spi_fill_partition(struct intel_spi *ispi,
 	u64 end;
 	int i;
 
-	memset(part, 0, sizeof(*part));
-
 	/* Start from the mandatory descriptor region */
 	part->size = 4096;
 	part->name = "BIOS";
@@ -889,7 +945,7 @@ static void intel_spi_fill_partition(struct intel_spi *ispi,
 			ispi->writeable = false;
 
 		end = (limit << 12) + 4096;
-		if (end > part->size)
+		if (end > part->size && end <= ispi->nor[0].mtd.size)
 			part->size = end;
 	}
 }
@@ -902,15 +958,47 @@ static const struct spi_nor_controller_ops intel_spi_controller_ops = {
 	.erase = intel_spi_erase,
 };
 
-struct intel_spi *intel_spi_probe(struct device *dev,
-	struct resource *mem, const struct intel_spi_boardinfo *info)
+static int intel_spi_add_chip(struct intel_spi *ispi, struct spi_nor *nor,
+			      const char *name)
 {
 	const struct spi_nor_hwcaps hwcaps = {
 		.mask = SNOR_HWCAPS_READ |
 			SNOR_HWCAPS_READ_FAST |
 			SNOR_HWCAPS_PP,
 	};
-	struct mtd_partition part;
+	struct mtd_partition parts[1];
+	int ret, nr_parts = 0;
+
+	nor->dev = ispi->dev;
+	nor->priv = ispi;
+	nor->controller_ops = &intel_spi_controller_ops;
+
+	memset(parts, 0, sizeof(parts));
+
+	ret = spi_nor_scan(nor, NULL, &hwcaps);
+	if (ret) {
+		dev_info(ispi->dev, "failed to locate the chip\n");
+		return ret;
+	}
+
+	/* Only the first chip has partition */
+	if (nor == &ispi->nor[0]) {
+		intel_spi_fill_partition(ispi, &parts[0]);
+		nr_parts = 1;
+	}
+
+	/* Prevent writes if not explicitly enabled */
+	if (!ispi->writeable || !writeable)
+		nor->mtd.flags &= ~MTD_WRITEABLE;
+	if (name)
+		nor->mtd.name = name;
+
+	return mtd_device_register(&nor->mtd, parts, nr_parts);
+}
+
+struct intel_spi *intel_spi_probe(struct device *dev,
+	struct resource *mem, const struct intel_spi_boardinfo *info)
+{
 	struct intel_spi *ispi;
 	int ret;
 
@@ -933,33 +1021,37 @@ struct intel_spi *intel_spi_probe(struct device *dev,
 	if (ret)
 		return ERR_PTR(ret);
 
-	ispi->nor.dev = ispi->dev;
-	ispi->nor.priv = ispi;
-	ispi->nor.controller_ops = &intel_spi_controller_ops;
-
-	ret = spi_nor_scan(&ispi->nor, NULL, &hwcaps);
-	if (ret) {
-		dev_info(dev, "failed to locate the chip\n");
+	ret = intel_spi_read_desc(ispi);
+	if (ret)
 		return ERR_PTR(ret);
-	}
-
-	intel_spi_fill_partition(ispi, &part);
 
-	/* Prevent writes if not explicitly enabled */
-	if (!ispi->writeable || !writeable)
-		ispi->nor.mtd.flags &= ~MTD_WRITEABLE;
-
-	ret = mtd_device_register(&ispi->nor.mtd, &part, 1);
+	ret = intel_spi_add_chip(ispi, &ispi->nor[0], NULL);
 	if (ret)
 		return ERR_PTR(ret);
 
+	if (ispi->nc > 1) {
+		ret = intel_spi_add_chip(ispi, &ispi->nor[1], "chip1");
+		if (ret) {
+			mtd_device_unregister(&ispi->nor[0].mtd);
+			return ERR_PTR(ret);
+		}
+	}
+
 	return ispi;
 }
 EXPORT_SYMBOL_GPL(intel_spi_probe);
 
 int intel_spi_remove(struct intel_spi *ispi)
 {
-	return mtd_device_unregister(&ispi->nor.mtd);
+	int i, ret;
+
+	for (i = ispi->nc - 1; i >= 0; i--) {
+		ret = mtd_device_unregister(&ispi->nor[i].mtd);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(intel_spi_remove);
 
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
