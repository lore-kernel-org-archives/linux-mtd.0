Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cg5Cr-0007oo-3S
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2017 07:49:57 +0000
From: Peter Pan <peterpandong@micron.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <peterpandong@micron.com>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: [PATCH 05/11] nand: spi: Add write function support
Date: Tue, 21 Feb 2017 16:00:04 +0800
Message-ID: <1487664010-25926-6-git-send-email-peterpandong@micron.com>
In-Reply-To: <1487664010-25926-1-git-send-email-peterpandong@micron.com>
References: <1487664010-25926-1-git-send-email-peterpandong@micron.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add write/writeoob support for SPI NAND. Will be
registered under struct mtd_info later.

Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 drivers/mtd/nand/spi/spi-nand-base.c | 228 +++++++++++++++++++++++++++++++++++
 1 file changed, 228 insertions(+)

diff --git a/drivers/mtd/nand/spi/spi-nand-base.c b/drivers/mtd/nand/spi/spi-nand-base.c
index ee94eb8..d0cf552 100644
--- a/drivers/mtd/nand/spi/spi-nand-base.c
+++ b/drivers/mtd/nand/spi/spi-nand-base.c
@@ -497,6 +497,44 @@ static int spi_nand_do_read_page(struct mtd_info *mtd, u32 page_addr,
 }
 
 /**
+ * spi_nand_do_write_page - write data from buffer to flash
+ * @mtd: MTD device structure
+ * @page_addr: page address/raw address
+ * @column: column address
+ * @buf: data buffer
+ * @len: data length to write
+ * @clr_cache: clear cache register with 0xFF or not
+ */
+static int spi_nand_do_write_page(struct mtd_info *mtd, u32 page_addr,
+						bool oob_only)
+{
+	struct spi_nand_chip *chip = mtd_to_spi_nand(mtd);
+	struct nand_device *nand = mtd_to_nand(mtd);
+	u8 status;
+	int ret = 0;
+
+	spi_nand_write_enable(chip);
+	if (!oob_only)
+		spi_nand_program_data_to_cache(chip, page_addr, 0,
+		nand_page_size(nand) + nand_per_page_oobsize(nand), chip->buf);
+	else
+		spi_nand_program_data_to_cache(chip, page_addr, nand_page_size(nand),
+				nand_per_page_oobsize(nand), chip->oobbuf);
+	spi_nand_program_execute(chip, page_addr);
+	ret = spi_nand_wait(chip, &status);
+	if (ret < 0) {
+		pr_err("error %d reading page 0x%x from cache\n",
+			ret, page_addr);
+		return ret;
+	}
+	if ((status & STATUS_P_FAIL_MASK) == STATUS_P_FAIL) {
+		pr_err("program page 0x%x failed\n", page_addr);
+		ret = -EIO;
+	}
+	return ret;
+}
+
+/**
  * spi_nand_transfer_oob - transfer oob to client buffer
  * @chip: SPI-NAND device structure
  * @oob: oob destination address
@@ -528,6 +566,39 @@ static void spi_nand_transfer_oob(struct spi_nand_chip *chip, u8 *oob,
 }
 
 /**
+ * spi_nand_fill_oob - transfer client buffer to oob
+ * @chip: SPI-NAND device structure
+ * @oob: oob data buffer
+ * @len: oob data write length
+ * @ops: oob ops structure
+ */
+static void spi_nand_fill_oob(struct spi_nand_chip *chip, uint8_t *oob,
+				size_t len, struct mtd_oob_ops *ops)
+{
+	struct mtd_info *mtd = spi_nand_to_mtd(chip);
+	struct nand_device *nand = mtd_to_nand(mtd);
+	int ret;
+
+	memset(chip->oobbuf, 0xff, nand_per_page_oobsize(nand));
+	switch (ops->mode) {
+
+	case MTD_OPS_PLACE_OOB:
+	case MTD_OPS_RAW:
+		memcpy(chip->oobbuf + ops->ooboffs, oob, len);
+		return;
+
+	case MTD_OPS_AUTO_OOB:
+		ret = mtd_ooblayout_set_databytes(mtd, oob, chip->oobbuf,
+						  ops->ooboffs, len);
+		BUG_ON(ret);
+		return;
+
+	default:
+		BUG();
+	}
+}
+
+/**
  * spi_nand_read_pages - read data from flash to buffer
  * @mtd: MTD device structure
  * @from: offset to read from
@@ -625,6 +696,102 @@ static int spi_nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 }
 
 /**
+ * spi_nand_write_pages - write data from buffer to flash
+ * @mtd: MTD device structure
+ * @to: offset to write to
+ * @ops: oob operations description structure
+ * @max_bitflips: maximum bitflip count
+ * Description:
+ *   Normal read function, read one page to buffer before issue
+ *   another.
+ */
+static int spi_nand_write_pages(struct mtd_info *mtd, loff_t to,
+			  struct mtd_oob_ops *ops)
+{
+	struct spi_nand_chip *chip = mtd_to_spi_nand(mtd);
+	struct nand_device *nand = mtd_to_nand(mtd);
+	int page_addr, page_offset, size, ret;
+	int writelen = ops->len;
+	int oobwritelen = ops->ooblen;
+	int ooblen = ops->mode == MTD_OPS_AUTO_OOB ?
+		mtd->oobavail : mtd->oobsize;
+	bool oob_only = ops->datbuf == NULL;
+
+	page_addr = nand_offs_to_page(nand, to);
+	page_offset = to & (nand_page_size(nand) - 1);
+	ops->retlen = 0;
+
+	while (1) {
+		memset(chip->buf, 0xff, nand_page_size(nand) + nand_per_page_oobsize(nand));
+		if (ops->oobbuf) {
+			size = min(oobwritelen, ooblen);
+			spi_nand_fill_oob(chip, ops->oobbuf + ops->oobretlen,
+					size, ops);
+			ops->oobretlen += size;
+			oobwritelen -= size;
+		}
+		if (ops->datbuf) {
+			size = min_t(int, writelen, nand_page_size(nand) - page_offset);
+			memcpy(chip->buf + page_offset,
+				ops->datbuf + ops->retlen, size);
+			ops->retlen += size;
+			writelen -= size;
+		}
+		ret = spi_nand_do_write_page(mtd, page_addr, oob_only);
+		if (ret) {
+			pr_err("error %d writing page 0x%x\n",
+				ret, page_addr);
+			return ret;
+		}
+		page_offset = 0;
+		if (!writelen && !oobwritelen)
+			break;
+		page_addr++;
+	}
+
+	return ret;
+}
+
+/**
+ * spi_nand_do_write_ops - write data from buffer to flash
+ * @mtd: MTD device structure
+ * @to: offset to write to
+ * @ops: oob operations description structure
+ * Description:
+ *   Disable internal ECC before writing when MTD_OPS_RAW set.
+ */
+static int spi_nand_do_write_ops(struct mtd_info *mtd, loff_t to,
+			 struct mtd_oob_ops *ops)
+{
+	struct spi_nand_chip *chip = mtd_to_spi_nand(mtd);
+	struct nand_device *nand = mtd_to_nand(mtd);
+	int page_addr, page_offset;
+	int oobwritelen = ops->ooblen;
+	int ret = 0;
+	int ooblen = ops->mode == MTD_OPS_AUTO_OOB ?
+		mtd->oobavail : mtd->oobsize;
+	bool ecc_off = ops->mode == MTD_OPS_RAW;
+
+	page_addr = nand_offs_to_page(nand, to);
+	page_offset = to & (nand_page_size(nand) - 1);
+	ops->retlen = 0;
+
+	/* for oob */
+	if (oobwritelen > 0) {
+		ooblen -= ops->ooboffs;
+		ops->oobretlen = 0;
+	}
+
+	if (ecc_off)
+		spi_nand_disable_ecc(chip);
+	ret = spi_nand_write_pages(mtd, to, ops);
+	if (ecc_off)
+		spi_nand_enable_ecc(chip);
+
+	return ret;
+}
+
+/**
  * spi_nand_read - [MTD Interface] SPI-NAND read
  * @mtd: MTD device structure
  * @from: offset to read from
@@ -654,6 +821,35 @@ static int spi_nand_read(struct mtd_info *mtd, loff_t from, size_t len,
 }
 
 /**
+ * spi_nand_write - [MTD Interface] SPI-NAND write
+ * @mtd: MTD device structure
+ * @to: offset to write to
+ * @len: number of bytes to write
+ * @retlen: pointer to variable to store the number of written bytes
+ * @buf: the data to write
+ */
+static int spi_nand_write(struct mtd_info *mtd, loff_t to, size_t len,
+	size_t *retlen, const u8 *buf)
+{
+	struct mtd_oob_ops ops;
+	int ret;
+
+	spi_nand_get_device(mtd, FL_WRITING);
+
+	memset(&ops, 0, sizeof(ops));
+	ops.len = len;
+	ops.datbuf = (uint8_t *)buf;
+	ops.mode = MTD_OPS_PLACE_OOB;
+	ret =  spi_nand_do_write_ops(mtd, to, &ops);
+
+	*retlen = ops.retlen;
+
+	spi_nand_release_device(mtd);
+
+	return ret;
+}
+
+/**
  * spi_nand_read_oob - [MTD Interface] read data and/or out-of-band
  * @mtd: MTD device structure
  * @from: offset to read from
@@ -684,6 +880,38 @@ static int spi_nand_read_oob(struct mtd_info *mtd, loff_t from,
 
 	return ret;
 }
+
+/**
+ * spi_nand_write_oob - [MTD Interface] write data and/or out-of-band
+ * @mtd: MTD device structure
+ * @to: offset to write to
+ * @ops: oob operation description structure
+ */
+static int spi_nand_write_oob(struct mtd_info *mtd, loff_t to,
+			  struct mtd_oob_ops *ops)
+{
+	int ret = -ENOTSUPP;
+
+	ops->retlen = 0;
+	spi_nand_get_device(mtd, FL_WRITING);
+
+	switch (ops->mode) {
+	case MTD_OPS_PLACE_OOB:
+	case MTD_OPS_AUTO_OOB:
+	case MTD_OPS_RAW:
+		break;
+
+	default:
+		goto out;
+	}
+
+	ret = spi_nand_do_write_ops(mtd, to, ops);
+
+out:
+	spi_nand_release_device(mtd);
+
+	return ret;
+}
 MODULE_DESCRIPTION("SPI NAND framework");
 MODULE_AUTHOR("Peter Pan<peterpandong@micron.com>");
 MODULE_LICENSE("GPL v2");
-- 
1.9.1
