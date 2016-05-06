Received: from mail-pf0-x236.google.com ([2607:f8b0:400e:c00::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayThW-0006Qv-2U
 for linux-mtd@lists.infradead.org; Fri, 06 May 2016 00:33:04 +0000
Received: by mail-pf0-x236.google.com with SMTP id y69so42854020pfb.1
 for <linux-mtd@lists.infradead.org>; Thu, 05 May 2016 17:32:41 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@nxp.com>,
 Michal Suchanek <hramrach@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Rafal Milecki <zajec5@gmail.com>, Jagan Teki <jteki@openedev.com>,
 "Andrew F. Davis" <afd@ti.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Gabor Juhos <juhosg@openwrt.org>, Bean Huo <beanhuo@micron.com>,
 linux-kernel@vger.kernel.org, Bayi Cheng <bayi.cheng@mediatek.com>,
 Joachim Eastwood <manabian@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH v7 07/10] mtd: spi-nor: stop passing around retlen
Date: Thu,  5 May 2016 17:31:53 -0700
Message-Id: <1462494716-95312-8-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1462494716-95312-1-git-send-email-computersforpeace@gmail.com>
References: <1462494716-95312-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Michal Suchanek <hramrach@gmail.com>

Do not pass retlen to hardware driver read/write functions. Update it in
spi-nor generic driver instead.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v6 -> v7:
 * fix new drivers

 drivers/mtd/devices/m25p80.c      |  7 ++-----
 drivers/mtd/spi-nor/fsl-quadspi.c | 17 ++++++-----------
 drivers/mtd/spi-nor/mtk-quadspi.c |  8 +++-----
 drivers/mtd/spi-nor/nxp-spifi.c   |  6 ++----
 drivers/mtd/spi-nor/spi-nor.c     | 21 +++++++++++++--------
 include/linux/mtd/spi-nor.h       |  4 ++--
 6 files changed, 28 insertions(+), 35 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 2ef5a6015276..eab46d211ae6 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -74,7 +74,7 @@ static int m25p80_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
 }
 
 static ssize_t m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
-			size_t *retlen, const u_char *buf)
+			    const u_char *buf)
 {
 	struct m25p *flash = nor->priv;
 	struct spi_device *spi = flash->spi;
@@ -106,7 +106,6 @@ static ssize_t m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
 	ret = m.actual_length - cmd_sz;
 	if (ret < 0)
 		return -EIO;
-	*retlen += ret;
 	return ret;
 }
 
@@ -127,7 +126,7 @@ static inline unsigned int m25p80_rx_nbits(struct spi_nor *nor)
  * may be any size provided it is within the physical boundaries.
  */
 static ssize_t m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
-			size_t *retlen, u_char *buf)
+			   u_char *buf)
 {
 	struct m25p *flash = nor->priv;
 	struct spi_device *spi = flash->spi;
@@ -156,7 +155,6 @@ static ssize_t m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 		msg.data_nbits = m25p80_rx_nbits(nor);
 
 		ret = spi_flash_read(spi, &msg);
-		*retlen = msg.retlen;
 		if (ret < 0)
 			return ret;
 		return msg.retlen;
@@ -184,7 +182,6 @@ static ssize_t m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 	ret = m.actual_length - m25p_cmdsz(nor) - dummy;
 	if (ret < 0)
 		return -EIO;
-	*retlen += ret;
 	return ret;
 }
 
diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index ea296769f015..5c82e4ef1904 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -620,7 +620,7 @@ static inline void fsl_qspi_invalid(struct fsl_qspi *q)
 
 static ssize_t fsl_qspi_nor_write(struct fsl_qspi *q, struct spi_nor *nor,
 				u8 opcode, unsigned int to, u32 *txbuf,
-				unsigned count, size_t *retlen)
+				unsigned count)
 {
 	int ret, i, j;
 	u32 tmp;
@@ -647,11 +647,8 @@ static ssize_t fsl_qspi_nor_write(struct fsl_qspi *q, struct spi_nor *nor,
 	/* Trigger it */
 	ret = fsl_qspi_runcmd(q, opcode, to, count);
 
-	if (ret == 0) {
-		if (retlen)
-			*retlen += count;
+	if (ret == 0)
 		return count;
-	}
 
 	return ret;
 }
@@ -862,7 +859,7 @@ static int fsl_qspi_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
 
 	} else if (len > 0) {
 		ret = fsl_qspi_nor_write(q, nor, opcode, 0,
-					(u32 *)buf, len, NULL);
+					(u32 *)buf, len);
 		if (ret > 0)
 			return 0;
 	} else {
@@ -874,12 +871,11 @@ static int fsl_qspi_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
 }
 
 static ssize_t fsl_qspi_write(struct spi_nor *nor, loff_t to,
-		size_t len, size_t *retlen, const u_char *buf)
+			      size_t len, const u_char *buf)
 {
 	struct fsl_qspi *q = nor->priv;
-
 	ssize_t ret = fsl_qspi_nor_write(q, nor, nor->program_opcode, to,
-				(u32 *)buf, len, retlen);
+					 (u32 *)buf, len);
 
 	/* invalid the data in the AHB buffer. */
 	fsl_qspi_invalid(q);
@@ -887,7 +883,7 @@ static ssize_t fsl_qspi_write(struct spi_nor *nor, loff_t to,
 }
 
 static ssize_t fsl_qspi_read(struct spi_nor *nor, loff_t from,
-		size_t len, size_t *retlen, u_char *buf)
+			     size_t len, u_char *buf)
 {
 	struct fsl_qspi *q = nor->priv;
 	u8 cmd = nor->read_opcode;
@@ -929,7 +925,6 @@ static ssize_t fsl_qspi_read(struct spi_nor *nor, loff_t from,
 	memcpy(buf, q->ahb_addr + q->chip_base_addr + from - q->memmap_offs,
 		len);
 
-	*retlen += len;
 	return len;
 }
 
diff --git a/drivers/mtd/spi-nor/mtk-quadspi.c b/drivers/mtd/spi-nor/mtk-quadspi.c
index e85687126c25..21c31b373cd3 100644
--- a/drivers/mtd/spi-nor/mtk-quadspi.c
+++ b/drivers/mtd/spi-nor/mtk-quadspi.c
@@ -244,7 +244,7 @@ static void mt8173_nor_set_addr(struct mt8173_nor *mt8173_nor, u32 addr)
 }
 
 static ssize_t mt8173_nor_read(struct spi_nor *nor, loff_t from, size_t length,
-			       size_t *retlen, u_char *buffer)
+			       u_char *buffer)
 {
 	int i, ret;
 	int addr = (int)from;
@@ -255,7 +255,7 @@ static ssize_t mt8173_nor_read(struct spi_nor *nor, loff_t from, size_t length,
 	mt8173_nor_set_read_mode(mt8173_nor);
 	mt8173_nor_set_addr(mt8173_nor, addr);
 
-	for (i = 0; i < length; i++, (*retlen)++) {
+	for (i = 0; i < length; i++) {
 		ret = mt8173_nor_execute_cmd(mt8173_nor, MTK_NOR_PIO_READ_CMD);
 		if (ret < 0)
 			return ret;
@@ -298,7 +298,7 @@ static int mt8173_nor_write_buffer(struct mt8173_nor *mt8173_nor, int addr,
 }
 
 static ssize_t mt8173_nor_write(struct spi_nor *nor, loff_t to, size_t len,
-				size_t *retlen, const u_char *buf)
+				const u_char *buf)
 {
 	int ret;
 	struct mt8173_nor *mt8173_nor = nor->priv;
@@ -318,7 +318,6 @@ static ssize_t mt8173_nor_write(struct spi_nor *nor, loff_t to, size_t len,
 		}
 		to += SFLASH_WRBUF_SIZE;
 		buf += SFLASH_WRBUF_SIZE;
-		(*retlen) += SFLASH_WRBUF_SIZE;
 	}
 	ret = mt8173_nor_write_buffer_disable(mt8173_nor);
 	if (ret < 0) {
@@ -333,7 +332,6 @@ static ssize_t mt8173_nor_write(struct spi_nor *nor, loff_t to, size_t len,
 			dev_err(mt8173_nor->dev, "write single byte failed!\n");
 			return ret;
 		}
-		(*retlen) += len;
 	}
 
 	return len;
diff --git a/drivers/mtd/spi-nor/nxp-spifi.c b/drivers/mtd/spi-nor/nxp-spifi.c
index b0fb86996b8f..73a14f40928b 100644
--- a/drivers/mtd/spi-nor/nxp-spifi.c
+++ b/drivers/mtd/spi-nor/nxp-spifi.c
@@ -173,7 +173,7 @@ static int nxp_spifi_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
 }
 
 static ssize_t nxp_spifi_read(struct spi_nor *nor, loff_t from, size_t len,
-			      size_t *retlen, u_char *buf)
+			      u_char *buf)
 {
 	struct nxp_spifi *spifi = nor->priv;
 	int ret;
@@ -183,13 +183,12 @@ static ssize_t nxp_spifi_read(struct spi_nor *nor, loff_t from, size_t len,
 		return ret;
 
 	memcpy_fromio(buf, spifi->flash_base + from, len);
-	*retlen += len;
 
 	return len;
 }
 
 static ssize_t nxp_spifi_write(struct spi_nor *nor, loff_t to, size_t len,
-			       size_t *retlen, const u_char *buf)
+			       const u_char *buf)
 {
 	struct nxp_spifi *spifi = nor->priv;
 	u32 cmd;
@@ -201,7 +200,6 @@ static ssize_t nxp_spifi_write(struct spi_nor *nor, loff_t to, size_t len,
 		return ret;
 
 	writel(to, spifi->io_base + SPIFI_ADDR);
-	*retlen += len;
 
 	cmd = SPIFI_CMD_DOUT |
 	      SPIFI_CMD_DATALEN(len) |
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index dd5c9eb9b9e0..937e8d6a28bb 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1030,12 +1030,13 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 	if (ret)
 		return ret;
 
-	ret = nor->read(nor, from, len, retlen, buf);
+	ret = nor->read(nor, from, len, buf);
 
 	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_READ);
 	if (ret < 0)
 		return ret;
 
+	*retlen += ret;
 	return 0;
 }
 
@@ -1062,7 +1063,7 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 		nor->program_opcode = SPINOR_OP_BP;
 
 		/* write one byte. */
-		ret = nor->write(nor, to, 1, retlen, buf);
+		ret = nor->write(nor, to, 1, buf);
 		if (ret < 0)
 			goto sst_write_err;
 		WARN(ret != 1, "While writing 1 byte written %i bytes\n",
@@ -1078,7 +1079,7 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 		nor->program_opcode = SPINOR_OP_AAI_WP;
 
 		/* write two bytes. */
-		ret = nor->write(nor, to, 2, retlen, buf + actual);
+		ret = nor->write(nor, to, 2, buf + actual);
 		if (ret < 0)
 			goto sst_write_err;
 		WARN(ret != 2, "While writing 2 bytes written %i bytes\n",
@@ -1101,7 +1102,7 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 		write_enable(nor);
 
 		nor->program_opcode = SPINOR_OP_BP;
-		ret = nor->write(nor, to, 1, retlen, buf + actual);
+		ret = nor->write(nor, to, 1, buf + actual);
 		if (ret < 0)
 			goto sst_write_err;
 		WARN(ret != 1, "While writing 1 byte written %i bytes\n",
@@ -1110,8 +1111,10 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 		if (ret)
 			goto sst_write_err;
 		write_disable(nor);
+		actual += 1;
 	}
 sst_write_err:
+	*retlen += actual;
 	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_WRITE);
 	return ret;
 }
@@ -1140,15 +1143,17 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 	/* do all the bytes fit onto one page? */
 	if (page_offset + len <= nor->page_size) {
-		ret = nor->write(nor, to, len, retlen, buf);
+		ret = nor->write(nor, to, len, buf);
 		if (ret < 0)
 			goto write_err;
+		*retlen += ret;
 	} else {
 		/* the size of data remaining on the first page */
 		page_size = nor->page_size - page_offset;
-		ret = nor->write(nor, to, page_size, retlen, buf);
+		ret = nor->write(nor, to, page_size, buf);
 		if (ret < 0)
 			goto write_err;
+		*retlen += ret;
 
 		/* write everything in nor->page_size chunks */
 		for (i = ret; i < len; ) {
@@ -1162,10 +1167,10 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 			write_enable(nor);
 
-			ret = nor->write(nor, to + i, page_size, retlen,
-					 buf + i);
+			ret = nor->write(nor, to + i, page_size, buf + i);
 			if (ret < 0)
 				goto write_err;
+			*retlen += ret;
 			i += ret;
 		}
 	}
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index a21c9e4f1fdf..43c290566d20 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -173,9 +173,9 @@ struct spi_nor {
 	int (*write_reg)(struct spi_nor *nor, u8 opcode, u8 *buf, int len);
 
 	ssize_t (*read)(struct spi_nor *nor, loff_t from,
-			size_t len, size_t *retlen, u_char *read_buf);
+			size_t len, u_char *read_buf);
 	ssize_t (*write)(struct spi_nor *nor, loff_t to,
-			size_t len, size_t *retlen, const u_char *write_buf);
+			size_t len, const u_char *write_buf);
 	int (*erase)(struct spi_nor *nor, loff_t offs);
 
 	int (*flash_lock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
-- 
2.8.0.rc3.226.g39d4020
