Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZK16Z-00023t-IY
 for linux-mtd@lists.infradead.org; Tue, 28 Jul 2015 09:23:27 +0000
Date: 28 Jul 2015 09:23:02 -0000
Message-Id: <79b4c3521cdb13872c7cf939ea25219399c1a345.1438074682.git.hramrach@gmail.com>
In-Reply-To: <cover.1438074682.git.hramrach@gmail.com>
References: <cover.1438074682.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH 1/2] mtd: spi-nor: rework spi nor read and write.
To: David Woodhouse <dwmw2@infradead.org>,
  Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>,
  "Rafał Miłecki" <zajec5@gmail.com>, Michal Suchanek <hramrach@gmail.com>,
  Alison Chaiken <alison_chaiken@mentor.com>,
  Huang Shijie <b32955@freescale.com>, Ben Hutchings <ben@decadent.org.uk>,
  Marek Vasut <marex@denx.de>, Gabor Juhos <juhosg@openwrt.org>,
  "Bean Huo 霍斌斌 \(beanhuo\)" <beanhuo@micron.com>,
  linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The spi_nor read and write functions pass thru the mtd retlen to the
chip-specific read and write function. This makes it difficult to check
for errors in read and write functions and these errors are not checked.
This leads to silent data corruption.

This patch styles the chip-specific read and write function as unix
read(2) and write(2) and updates the retlen in the spi-nor generic driver.

This also makes it possible to check for write errors.
When pl330 fails to transfer the flash data over SPI I get I/O error
instead of 4M of zeroes.

I do not have sst and fsl hardware to test with.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
---
 drivers/mtd/devices/m25p80.c      | 33 ++++++++++++++---------
 drivers/mtd/spi-nor/fsl-quadspi.c | 29 ++++++++++----------
 drivers/mtd/spi-nor/spi-nor.c     | 57 ++++++++++++++++++++++++++++-----------
 include/linux/mtd/spi-nor.h       |  8 +++---
 4 files changed, 81 insertions(+), 46 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index d313f948b..d8f064b 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -75,14 +75,15 @@ static int m25p80_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len,
 	return spi_write(spi, flash->command, len + 1);
 }
 
-static void m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
-			size_t *retlen, const u_char *buf)
+static ssize_t m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
+			    const u_char *buf)
 {
 	struct m25p *flash = nor->priv;
 	struct spi_device *spi = flash->spi;
 	struct spi_transfer t[2] = {};
 	struct spi_message m;
 	int cmd_sz = m25p_cmdsz(nor);
+	ssize_t ret;
 
 	spi_message_init(&m);
 
@@ -100,9 +101,14 @@ static void m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
 	t[1].len = len;
 	spi_message_add_tail(&t[1], &m);
 
-	spi_sync(spi, &m);
+	ret = spi_sync(spi, &m);
+	if (ret)
+		return ret;
 
-	*retlen += m.actual_length - cmd_sz;
+	ret = m.actual_length - cmd_sz;
+	if (ret < 0)
+		return -EIO;
+	return ret;
 }
 
 static inline unsigned int m25p80_rx_nbits(struct spi_nor *nor)
@@ -121,14 +127,15 @@ static inline unsigned int m25p80_rx_nbits(struct spi_nor *nor)
  * Read an address range from the nor chip.  The address range
  * may be any size provided it is within the physical boundaries.
  */
-static int m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
-			size_t *retlen, u_char *buf)
+static ssize_t m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
+			   u_char *buf)
 {
 	struct m25p *flash = nor->priv;
 	struct spi_device *spi = flash->spi;
 	struct spi_transfer t[2];
 	struct spi_message m;
 	unsigned int dummy = nor->read_dummy;
+	ssize_t ret;
 
 	/* convert the dummy cycles to the number of bytes */
 	dummy /= 8;
@@ -148,10 +155,14 @@ static int m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 	t[1].len = len;
 	spi_message_add_tail(&t[1], &m);
 
-	spi_sync(spi, &m);
+	ret = spi_sync(spi, &m);
+	if (ret)
+		return ret;
 
-	*retlen = m.actual_length - m25p_cmdsz(nor) - dummy;
-	return 0;
+	ret = m.actual_length - m25p_cmdsz(nor) - dummy;
+	if (ret < 0)
+		return -EIO;
+	return ret;
 }
 
 static int m25p80_erase(struct spi_nor *nor, loff_t offset)
@@ -165,9 +176,7 @@ static int m25p80_erase(struct spi_nor *nor, loff_t offset)
 	flash->command[0] = nor->erase_opcode;
 	m25p_addr2cmd(nor, offset, flash->command);
 
-	spi_write(flash->spi, flash->command, m25p_cmdsz(nor));
-
-	return 0;
+	return spi_write(flash->spi, flash->command, m25p_cmdsz(nor));
 }
 
 /*
diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 52a872f..cef3d85 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -525,9 +525,9 @@ static inline void fsl_qspi_invalid(struct fsl_qspi *q)
 	writel(reg, q->iobase + QUADSPI_MCR);
 }
 
-static int fsl_qspi_nor_write(struct fsl_qspi *q, struct spi_nor *nor,
+static ssize_t fsl_qspi_nor_write(struct fsl_qspi *q, struct spi_nor *nor,
 				u8 opcode, unsigned int to, u32 *txbuf,
-				unsigned count, size_t *retlen)
+				unsigned count)
 {
 	int ret, i, j;
 	u32 tmp;
@@ -549,8 +549,8 @@ static int fsl_qspi_nor_write(struct fsl_qspi *q, struct spi_nor *nor,
 	/* Trigger it */
 	ret = fsl_qspi_runcmd(q, opcode, to, count);
 
-	if (ret == 0 && retlen)
-		*retlen += count;
+	if (ret == 0)
+		return count;
 
 	return ret;
 }
@@ -703,7 +703,9 @@ static int fsl_qspi_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len,
 
 	} else if (len > 0) {
 		ret = fsl_qspi_nor_write(q, nor, opcode, 0,
-					(u32 *)buf, len, NULL);
+					(u32 *)buf, len);
+		if (ret > 0)
+			return 0;
 	} else {
 		dev_err(q->dev, "invalid cmd %d\n", opcode);
 		ret = -EINVAL;
@@ -712,20 +714,20 @@ static int fsl_qspi_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len,
 	return ret;
 }
 
-static void fsl_qspi_write(struct spi_nor *nor, loff_t to,
-		size_t len, size_t *retlen, const u_char *buf)
+static ssize_t fsl_qspi_write(struct spi_nor *nor, loff_t to,
+			      size_t len, const u_char *buf)
 {
 	struct fsl_qspi *q = nor->priv;
-
-	fsl_qspi_nor_write(q, nor, nor->program_opcode, to,
-				(u32 *)buf, len, retlen);
+	ssize_t ret = fsl_qspi_nor_write(q, nor, nor->program_opcode, to,
+					 (u32 *)buf, len);
 
 	/* invalid the data in the AHB buffer. */
 	fsl_qspi_invalid(q);
+	return ret;
 }
 
-static int fsl_qspi_read(struct spi_nor *nor, loff_t from,
-		size_t len, size_t *retlen, u_char *buf)
+static ssize_t fsl_qspi_read(struct spi_nor *nor, loff_t from,
+			     size_t len, u_char *buf)
 {
 	struct fsl_qspi *q = nor->priv;
 	u8 cmd = nor->read_opcode;
@@ -736,8 +738,7 @@ static int fsl_qspi_read(struct spi_nor *nor, loff_t from,
 	/* Read out the data directly from the AHB buffer.*/
 	memcpy(buf, q->ahb_base + q->chip_base_addr + from, len);
 
-	*retlen += len;
-	return 0;
+	return len;
 }
 
 static int fsl_qspi_erase(struct spi_nor *nor, loff_t offs)
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index e55689d..c19fa7d 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -741,10 +741,14 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 	if (ret)
 		return ret;
 
-	ret = nor->read(nor, from, len, retlen, buf);
+	ret = nor->read(nor, from, len, buf);
 
 	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_READ);
-	return ret;
+	if (ret < 0)
+		return ret;
+
+	*retlen += ret;
+	return 0;
 }
 
 static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
@@ -770,22 +774,29 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 		nor->program_opcode = SPINOR_OP_BP;
 
 		/* write one byte. */
-		nor->write(nor, to, 1, retlen, buf);
+		nor->write(nor, to, 1, buf);
+		if (ret < 0)
+			goto sst_write_err;
+		BUG_ON(ret != 1);
 		ret = spi_nor_wait_till_ready(nor);
 		if (ret)
-			goto time_out;
+			goto sst_write_err;
 	}
 	to += actual;
 
 	/* Write out most of the data here. */
-	for (; actual < len - 1; actual += 2) {
+	for (; actual < len - 1;) {
 		nor->program_opcode = SPINOR_OP_AAI_WP;
 
 		/* write two bytes. */
-		nor->write(nor, to, 2, retlen, buf + actual);
+		nor->write(nor, to, 2, buf + actual);
+		if (ret < 0)
+			goto sst_write_err;
+		BUG_ON(ret != 2);
 		ret = spi_nor_wait_till_ready(nor);
 		if (ret)
-			goto time_out;
+			goto sst_write_err;
+		actual += 2;
 		to += 2;
 		nor->sst_write_second = true;
 	}
@@ -794,21 +805,25 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 	write_disable(nor);
 	ret = spi_nor_wait_till_ready(nor);
 	if (ret)
-		goto time_out;
+		goto sst_write_err;
 
 	/* Write out trailing byte if it exists. */
 	if (actual != len) {
 		write_enable(nor);
 
 		nor->program_opcode = SPINOR_OP_BP;
-		nor->write(nor, to, 1, retlen, buf + actual);
-
+		ret = nor->write(nor, to, 1, buf + actual);
+		if (ret < 0)
+			goto sst_write_err;
+		BUG_ON(ret != 1);
 		ret = spi_nor_wait_till_ready(nor);
 		if (ret)
-			goto time_out;
+			goto sst_write_err;
 		write_disable(nor);
+		actual += 1;
 	}
-time_out:
+sst_write_err:
+	*retlen += actual;
 	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_WRITE);
 	return ret;
 }
@@ -837,14 +852,20 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 	/* do all the bytes fit onto one page? */
 	if (page_offset + len <= nor->page_size) {
-		nor->write(nor, to, len, retlen, buf);
+		ret = nor->write(nor, to, len, buf);
+		if (ret < 0)
+			goto write_err;
+		*retlen += ret;
 	} else {
 		/* the size of data remaining on the first page */
 		page_size = nor->page_size - page_offset;
-		nor->write(nor, to, page_size, retlen, buf);
+		nor->write(nor, to, page_size, buf);
+		if (ret < 0)
+			goto write_err;
+		*retlen += ret;
 
 		/* write everything in nor->page_size chunks */
-		for (i = page_size; i < len; i += page_size) {
+		for (i = ret; i < len; ) {
 			page_size = len - i;
 			if (page_size > nor->page_size)
 				page_size = nor->page_size;
@@ -855,7 +876,11 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 			write_enable(nor);
 
-			nor->write(nor, to + i, page_size, retlen, buf + i);
+			ret = nor->write(nor, to + i, page_size, buf + i);
+			if (ret < 0)
+				goto write_err;
+			*retlen += ret;
+			i += ret;
 		}
 	}
 
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index e540952..45972ee 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -185,10 +185,10 @@ struct spi_nor {
 	int (*write_reg)(struct spi_nor *nor, u8 opcode, u8 *buf, int len,
 			int write_enable);
 
-	int (*read)(struct spi_nor *nor, loff_t from,
-			size_t len, size_t *retlen, u_char *read_buf);
-	void (*write)(struct spi_nor *nor, loff_t to,
-			size_t len, size_t *retlen, const u_char *write_buf);
+	ssize_t (*read)(struct spi_nor *nor, loff_t from,
+			size_t len, u_char *read_buf);
+	ssize_t (*write)(struct spi_nor *nor, loff_t to,
+			size_t len, const u_char *write_buf);
 	int (*erase)(struct spi_nor *nor, loff_t offs);
 
 	int (*flash_lock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
-- 
2.1.4
