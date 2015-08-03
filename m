Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMKlp-0000z0-9X
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2015 18:47:36 +0000
Date: 3 Aug 2015 18:39:03 -0000
Message-Id: <d7c7ce0cbaaf9137fbb64998d6aadbbc7294fa40.1438626500.git.hramrach@gmail.com>
In-Reply-To: <cover.1438626500.git.hramrach@gmail.com>
References: <cover.1438626500.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH v2 5/6] mtd: spi-nor: stop passing around retlen
To: David Woodhouse <dwmw2@infradead.org>,
  Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>,
  "Rafał Miłecki" <zajec5@gmail.com>, Michal Suchanek <hramrach@gmail.com>,
  Huang Shijie <b32955@freescale.com>, Ben Hutchings <ben@decadent.org.uk>,
  Marek Vasut <marex@denx.de>, Gabor Juhos <juhosg@openwrt.org>,
  "Bean Huo 霍斌斌" <beanhuo@micron.com>, linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org, , Hou Zhiqiang <B48286@freescale.com>,
  shijie.huang@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Do not pass retlen to hardware driver read/write functions. Update it in
spi-nor generic driver instead.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
---
 drivers/mtd/devices/m25p80.c      |  6 ++----
 drivers/mtd/spi-nor/fsl-quadspi.c | 16 ++++++----------
 drivers/mtd/spi-nor/spi-nor.c     | 21 +++++++++++++--------
 include/linux/mtd/spi-nor.h       |  4 ++--
 4 files changed, 23 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index c93bc41..d8f064b 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -76,7 +76,7 @@ static int m25p80_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len,
 }
 
 static ssize_t m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
-			size_t *retlen, const u_char *buf)
+			    const u_char *buf)
 {
 	struct m25p *flash = nor->priv;
 	struct spi_device *spi = flash->spi;
@@ -108,7 +108,6 @@ static ssize_t m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
 	ret = m.actual_length - cmd_sz;
 	if (ret < 0)
 		return -EIO;
-	*retlen += ret;
 	return ret;
 }
 
@@ -129,7 +128,7 @@ static inline unsigned int m25p80_rx_nbits(struct spi_nor *nor)
  * may be any size provided it is within the physical boundaries.
  */
 static ssize_t m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
-			size_t *retlen, u_char *buf)
+			   u_char *buf)
 {
 	struct m25p *flash = nor->priv;
 	struct spi_device *spi = flash->spi;
@@ -163,7 +162,6 @@ static ssize_t m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 	ret = m.actual_length - m25p_cmdsz(nor) - dummy;
 	if (ret < 0)
 		return -EIO;
-	*retlen += ret;
 	return ret;
 }
 
diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index a39f09e..cef3d85 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -527,7 +527,7 @@ static inline void fsl_qspi_invalid(struct fsl_qspi *q)
 
 static ssize_t fsl_qspi_nor_write(struct fsl_qspi *q, struct spi_nor *nor,
 				u8 opcode, unsigned int to, u32 *txbuf,
-				unsigned count, size_t *retlen)
+				unsigned count)
 {
 	int ret, i, j;
 	u32 tmp;
@@ -549,11 +549,8 @@ static ssize_t fsl_qspi_nor_write(struct fsl_qspi *q, struct spi_nor *nor,
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
@@ -706,7 +703,7 @@ static int fsl_qspi_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len,
 
 	} else if (len > 0) {
 		ret = fsl_qspi_nor_write(q, nor, opcode, 0,
-					(u32 *)buf, len, NULL);
+					(u32 *)buf, len);
 		if (ret > 0)
 			return 0;
 	} else {
@@ -718,12 +715,11 @@ static int fsl_qspi_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len,
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
@@ -731,7 +727,7 @@ static ssize_t fsl_qspi_write(struct spi_nor *nor, loff_t to,
 }
 
 static ssize_t fsl_qspi_read(struct spi_nor *nor, loff_t from,
-		size_t len, size_t *retlen, u_char *buf)
+			     size_t len, u_char *buf)
 {
 	struct fsl_qspi *q = nor->priv;
 	u8 cmd = nor->read_opcode;
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 5116bbd..837e3df 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -738,12 +738,13 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
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
 
@@ -770,7 +771,7 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 		nor->program_opcode = SPINOR_OP_BP;
 
 		/* write one byte. */
-		ret = nor->write(nor, to, 1, retlen, buf);
+		ret = nor->write(nor, to, 1, buf);
 		if (ret < 0)
 			goto sst_write_err;
 		WARN(ret != 1, "While writing 1 byte written %i bytes\n",
@@ -786,7 +787,7 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 		nor->program_opcode = SPINOR_OP_AAI_WP;
 
 		/* write two bytes. */
-		ret = nor->write(nor, to, 2, retlen, buf + actual);
+		ret = nor->write(nor, to, 2, buf + actual);
 		if (ret < 0)
 			goto sst_write_err;
 		WARN(ret != 2, "While writing 2 bytes written %i bytes\n",
@@ -809,7 +810,7 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 		write_enable(nor);
 
 		nor->program_opcode = SPINOR_OP_BP;
-		ret = nor->write(nor, to, 1, retlen, buf + actual);
+		ret = nor->write(nor, to, 1, buf + actual);
 		if (ret < 0)
 			goto sst_write_err;
 		WARN(ret != 1, "While writing 1 byte written %i bytes\n",
@@ -818,8 +819,10 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
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
@@ -848,15 +851,17 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
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
@@ -870,10 +875,10 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
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
index 7d782cb..45972ee 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -186,9 +186,9 @@ struct spi_nor {
 			int write_enable);
 
 	ssize_t (*read)(struct spi_nor *nor, loff_t from,
-			size_t len, size_t *retlen, u_char *read_buf);
+			size_t len, u_char *read_buf);
 	ssize_t (*write)(struct spi_nor *nor, loff_t to,
-			size_t len, size_t *retlen, const u_char *write_buf);
+			size_t len, const u_char *write_buf);
 	int (*erase)(struct spi_nor *nor, loff_t offs);
 
 	int (*flash_lock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
-- 
2.1.4
