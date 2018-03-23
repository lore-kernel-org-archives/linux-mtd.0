Received: from mail-bn3nam01on0073.outbound.protection.outlook.com
 ([104.47.33.73] helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ezLjD-0006VA-Vn
 for linux-mtd@lists.infradead.org; Fri, 23 Mar 2018 12:23:41 +0000
From: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
To: <cyrille.pitchen@wedev4u.fr>, <marek.vasut@gmail.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <boris.brezillon@free-electrons.com>
CC: <linux-mtd@lists.infradead.org>, Naga Sureshkumar Relli
 <nagasure@xilinx.com>
Subject: [RFC PATCH 3/5] mtd: spi-nor: Add Dual Parallel and Stacked support
 for Zynq QSPI
Date: Fri, 23 Mar 2018 17:52:00 +0530
Message-ID: <1521807722-21626-4-git-send-email-nagasure@xilinx.com>
In-Reply-To: <1521807722-21626-1-git-send-email-nagasure@xilinx.com>
References: <1521807722-21626-1-git-send-email-nagasure@xilinx.com>
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

This patch adds Xilinx Zynq QSPI dual parallel and stacked support.

Signed-off-by: Naga Sureshkumar Relli <nagasure@xilinx.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 241 ++++++++++++++++++++++++++++++++++++++----
 include/linux/mtd/spi-nor.h   |   2 +
 2 files changed, 220 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 7698a92..03aa8c9 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -106,15 +106,24 @@ static const struct flash_info *spi_nor_match_id(const char *name);
 static int read_sr(struct spi_nor *nor)
 {
 	int ret;
-	u8 val;
+	u8 val[2];
 
-	ret = nor->read_reg(nor, SPINOR_OP_RDSR, &val, 1);
-	if (ret < 0) {
-		pr_err("error %d reading SR\n", (int) ret);
-		return ret;
+	if (nor->isparallel) {
+		ret = nor->read_reg(nor, SPINOR_OP_RDSR, &val[0], 2);
+		if (ret < 0) {
+			pr_err("error %d reading SR\n", (int) ret);
+			return ret;
+		}
+		val[0] |= val[1];
+	} else {
+		ret = nor->read_reg(nor, SPINOR_OP_RDSR, &val[0], 1);
+		if (ret < 0) {
+			pr_err("error %d reading SR\n", (int) ret);
+			return ret;
+		}
 	}
 
-	return val;
+	return val[0];
 }
 
 /*
@@ -125,15 +134,24 @@ static int read_sr(struct spi_nor *nor)
 static int read_fsr(struct spi_nor *nor)
 {
 	int ret;
-	u8 val;
+	u8 val[2];
 
-	ret = nor->read_reg(nor, SPINOR_OP_RDFSR, &val, 1);
-	if (ret < 0) {
-		pr_err("error %d reading FSR\n", ret);
-		return ret;
+	if (nor->isparallel) {
+		ret = nor->read_reg(nor, SPINOR_OP_RDFSR, &val[0], 2);
+		if (ret < 0) {
+			pr_err("error %d reading FSR\n", ret);
+			return ret;
+		}
+		val[0] &= val[1];
+	} else {
+		ret = nor->read_reg(nor, SPINOR_OP_RDFSR, &val[0], 1);
+		if (ret < 0) {
+			pr_err("error %d reading FSR\n", ret);
+			return ret;
+		}
 	}
 
-	return val;
+	return val[0];
 }
 
 /*
@@ -451,7 +469,10 @@ static int write_ear(struct spi_nor *nor, u32 addr)
 	addr = addr % (u32) mtd->size;
 	ear = addr >> 24;
 
-	if (ear == nor->curbank)
+	if ((!nor->isstacked) && (ear == nor->curbank))
+		return 0;
+
+	if (nor->isstacked && (mtd->size <= 0x2000000))
 		return 0;
 
 	if (nor->jedec_id == CFI_MFR_AMD)
@@ -480,9 +501,21 @@ static int erase_chip(struct spi_nor *nor)
 	u32 ret;
 	dev_dbg(nor->dev, " %lldKiB\n", (long long)(nor->mtd.size >> 10));
 
+	if (nor->isstacked)
+		nor->spi->master->flags &= ~SPI_MASTER_U_PAGE;
 	ret = nor->write_reg(nor, SPINOR_OP_CHIP_ERASE, NULL, 0);
 	if (ret)
 		return ret;
+	if (nor->isstacked) {
+		/* Wait until previous write command finished */
+		ret = spi_nor_wait_till_ready(nor);
+		if (ret)
+			return ret;
+
+		nor->spi->master->flags |= SPI_MASTER_U_PAGE;
+
+		ret = nor->write_reg(nor, SPINOR_OP_CHIP_ERASE, NULL, 0);
+	}
 
 	return ret;
 }
@@ -619,6 +652,20 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 			write_enable(nor);
 			offset = addr;
 
+			if (nor->isparallel == 1)
+				offset /= 2;
+
+			if (nor->isstacked == 1) {
+				if (offset >= (mtd->size / 2)) {
+					offset = offset - (mtd->size / 2);
+					nor->spi->master->flags |=
+						SPI_MASTER_U_PAGE;
+				} else {
+					nor->spi->master->flags &=
+						~SPI_MASTER_U_PAGE;
+				}
+			}
+
 			if (nor->addr_width == 3) {
 				/* Update Extended Address Register */
 				ret = write_ear(nor, offset);
@@ -949,6 +996,16 @@ static int spi_nor_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	ret = spi_nor_lock_and_prep(nor, SPI_NOR_OPS_LOCK);
 	if (ret)
 		return ret;
+	if (nor->isparallel == 1)
+		ofs = ofs >> nor->shift;
+
+	if (nor->isstacked == 1) {
+		if (ofs >= (mtd->size / 2)) {
+			ofs = ofs - (mtd->size / 2);
+			nor->spi->master->flags |= SPI_MASTER_U_PAGE;
+		} else
+			nor->spi->master->flags &= ~SPI_MASTER_U_PAGE;
+	}
 
 	ret = nor->flash_lock(nor, ofs, len);
 
@@ -964,6 +1021,16 @@ static int spi_nor_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	ret = spi_nor_lock_and_prep(nor, SPI_NOR_OPS_UNLOCK);
 	if (ret)
 		return ret;
+	if (nor->isparallel == 1)
+		ofs = ofs >> nor->shift;
+
+	if (nor->isstacked == 1) {
+		if (ofs >= (mtd->size / 2)) {
+			ofs = ofs - (mtd->size / 2);
+			nor->spi->master->flags |= SPI_MASTER_U_PAGE;
+		} else
+			nor->spi->master->flags &= ~SPI_MASTER_U_PAGE;
+	}
 
 	ret = nor->flash_unlock(nor, ofs, len);
 
@@ -1355,6 +1422,7 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
 	int ret;
 	u32 offset = from;
+	u32 stack_shift = 0;
 	u32 read_len = 0;
 	u32 rem_bank_len = 0;
 	u8 bank;
@@ -1375,8 +1443,25 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 							(bank + 1)) - from;
 		}
 		offset = from;
+		if (nor->isparallel == 1)
+			offset /= 2;
+
+		if (nor->isstacked == 1) {
+			stack_shift = 1;
+			if (offset >= (mtd->size / 2)) {
+				offset = offset - (mtd->size / 2);
+				nor->spi->master->flags |= SPI_MASTER_U_PAGE;
+			} else {
+				nor->spi->master->flags &= ~SPI_MASTER_U_PAGE;
+			}
+		}
 
 		/* Die cross over issue is not handled */
+		if (nor->addr_width == 4) {
+			rem_bank_len = (mtd->size >> stack_shift) -
+					(offset << nor->shift);
+		}
+
 		if (nor->addr_width == 3)
 			write_ear(nor, offset);
 		if (len < rem_bank_len)
@@ -1390,9 +1475,9 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 			goto read_err;
 
 		if (nor->flags & SNOR_F_S3AN_ADDR_DEFAULT)
-			addr = spi_nor_s3an_addr_convert(nor, addr);
+			addr = spi_nor_s3an_addr_convert(nor, offset);
 
-		ret = nor->read(nor, addr, len, buf);
+		ret = nor->read(nor, offset, len, buf);
 		if (ret == 0) {
 			/* We shouldn't see 0-length reads */
 			ret = -EIO;
@@ -1504,6 +1589,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
 	size_t page_offset, page_remain, i;
 	ssize_t ret;
+	u32 offset, stack_shift = 0;
 	u8 bank = 0;
 	u32 rem_bank_len = 0;
 #define OFFSET_16_MB 0x1000000
@@ -1517,7 +1603,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 	for (i = 0; i < len; ) {
 		ssize_t written;
 		loff_t addr = to + i;
-
+		offset = (to + i);
 		if (nor->addr_width == 3) {
 			bank = (u32)to / (OFFSET_16_MB << nor->shift);
 			rem_bank_len = ((OFFSET_16_MB << nor->shift) *
@@ -1535,26 +1621,53 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 		 * modulus (do_div()) or not.
 		 */
 		if (hweight32(nor->page_size) == 1) {
-			page_offset = addr & (nor->page_size - 1);
+			page_offset = offset & (nor->page_size - 1);
 		} else {
-			uint64_t aux = addr;
+			uint64_t aux = offset;
 
 			page_offset = do_div(aux, nor->page_size);
 		}
+		if (nor->isparallel == 1)
+			offset /= 2;
+
+		if (nor->isstacked == 1) {
+			stack_shift = 1;
+			if (offset >= (mtd->size / 2)) {
+				offset = offset - (mtd->size / 2);
+				nor->spi->master->flags |= SPI_MASTER_U_PAGE;
+			} else {
+				nor->spi->master->flags &= ~SPI_MASTER_U_PAGE;
+			}
+		}
 		/* Die cross over issue is not handled */
+		if (nor->addr_width == 4)
+			rem_bank_len = (mtd->size >> stack_shift) - offset;
 		if (nor->addr_width == 3)
-			write_ear(nor, addr);
-		else {
-			/* the size of data remaining on the first page */
+			write_ear(nor, offset);
+		if (nor->isstacked == 1) {
+			if (len <= rem_bank_len) {
+				page_remain = min_t(size_t,
+					 nor->page_size - page_offset, len - i);
+			} else {
+				/*
+				 * the size of data remaining
+				 * on the first page
+				 */
+				page_remain = rem_bank_len;
+			}
+		} else {
 			page_remain = min_t(size_t,
-				    nor->page_size - page_offset, len - i);
+					 nor->page_size - page_offset, len - i);
 		}
+		ret = spi_nor_wait_till_ready(nor);
+		if (ret)
+			goto write_err;
 
 		if (nor->flags & SNOR_F_S3AN_ADDR_DEFAULT)
 			addr = spi_nor_s3an_addr_convert(nor, addr);
 
 		write_enable(nor);
-		ret = nor->write(nor, addr, page_remain, buf + i);
+		ret = nor->write(nor, offset, page_remain, buf + i);
 		if (ret < 0)
 			goto write_err;
 		written = ret;
@@ -2897,6 +3010,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	struct device_node *np_spi;
 	int ret;
 	int i;
+	u32 is_dual;
 
 	ret = spi_nor_check(nor);
 	if (ret)
@@ -2965,6 +3079,69 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	mtd->_read = spi_nor_read;
 	mtd->_resume = spi_nor_resume;
 
+#ifdef CONFIG_OF
+	np_spi = of_get_next_parent(np);
+	if ((of_property_match_string(np_spi, "compatible",
+		    "xlnx,zynq-qspi-1.0") >= 0) ||
+			(of_property_match_string(np_spi, "compatible",
+					"xlnx,zynqmp-qspi-1.0") >= 0)) {
+		if (of_property_read_u32(np_spi, "is-dual",
+					 &is_dual) < 0) {
+			/* Default to single if prop not defined */
+			nor->shift = 0;
+			nor->isstacked = 0;
+			nor->isparallel = 0;
+		} else {
+			if (is_dual == 1) {
+				/* dual parallel */
+				nor->shift = 1;
+				info->sector_size <<= nor->shift;
+				info->page_size <<= nor->shift;
+				mtd->size <<= nor->shift;
+				nor->isparallel = 1;
+				nor->isstacked = 0;
+			} else {
+#ifdef CONFIG_SPI_ZYNQ_QSPI_DUAL_STACKED
+				/* dual stacked */
+				nor->shift = 0;
+				mtd->size <<= 1;
+				info->n_sectors <<= 1;
+				nor->isstacked = 1;
+				nor->isparallel = 0;
+#else
+				u32 is_stacked;
+
+				if (of_property_read_u32(np_spi,
+						"is-stacked",
+						&is_stacked) < 0) {
+					is_stacked = 0;
+				}
+				if (is_stacked) {
+					/* dual stacked */
+					nor->shift = 0;
+					mtd->size <<= 1;
+					info->n_sectors <<= 1;
+					nor->isstacked = 1;
+					nor->isparallel = 0;
+				} else {
+					/* single */
+					nor->shift = 0;
+					nor->isstacked = 0;
+					nor->isparallel = 0;
+				}
+#endif
+			}
+		}
+	}
+
+#else
+	/* Default to single */
+	nor->shift = 0;
+	nor->isstacked = 0;
+	nor->isparallel = 0;
+#endif
+
+
 	/* NOR protection support for STmicro/Micron chips and similar */
 	if (JEDEC_MFR(info) == SNOR_MFR_MICRON ||
 			info->flags & SPI_NOR_HAS_LOCK) {
@@ -3063,6 +3240,24 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 			if (JEDEC_MFR(info) == SNOR_MFR_SPANSION ||
 			    info->flags & SPI_NOR_4B_OPCODES)
 				spi_nor_set_4byte_opcodes(nor, info);
+			else {
+				np_spi = of_get_next_parent(np);
+				if (of_property_match_string(np_spi,
+						"compatible",
+						"xlnx,xps-spi-2.00.a") >= 0) {
+					nor->addr_width = 3;
+					set_4byte(nor, info, 0);
+				} else {
+					set_4byte(nor, info, 1);
+					if (nor->isstacked) {
+						nor->spi->master->flags |=
+							SPI_MASTER_U_PAGE;
+						set_4byte(nor, info, 1);
+						nor->spi->master->flags &=
+							~SPI_MASTER_U_PAGE;
+					}
+				}
+			}
 #ifdef CONFIG_OF
 		}
 #endif
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 64232b1..bdf6433 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -303,6 +303,8 @@ struct spi_nor {
 	enum spi_nor_protocol	reg_proto;
 	bool			sst_write_second;
 	bool			shift;
+	bool			isparallel;
+	bool			isstacked;
 	u8			flags;
 	u8			cmd_buf[SPI_NOR_MAX_CMD_SIZE];
 
-- 
2.7.4
