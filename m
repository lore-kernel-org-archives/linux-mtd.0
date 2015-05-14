Received: from mail-bn1on0139.outbound.protection.outlook.com
 ([157.56.110.139] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YsoqB-0007OK-FR
 for linux-mtd@lists.infradead.org; Thu, 14 May 2015 08:50:04 +0000
From: Haikun Wang <haikun.wang@freescale.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v1] mtd: spi-nor: Specify wait ready time for every chip
Date: Thu, 14 May 2015 16:45:52 +0800
Message-ID: <1431593152-30642-1-git-send-email-haikun.wang@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: computersforpeace@gmail.com, dwmw2@infradead.org,
 Haikun Wang <haikun.wang@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Chip erase cycle time is different among different chips.
Cycle time is also differnet among different operations for a special chip.
So we had better use corresponding timeout value for a specail chip and
a special operation when wait chip ready.
This patch add the method to specify the timeout value and use them
when wait chip ready.

Signed-off-by: Haikun Wang <haikun.wang@freescale.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 60 ++++++++++++++++++++++++++++++++-----------
 include/linux/mtd/spi-nor.h   |  4 +++
 2 files changed, 49 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 14a5d23..63a7488 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -46,6 +46,14 @@ struct flash_info {
 	u16		page_size;
 	u16		addr_width;
 
+	/*
+	 * common_wait, wait ready time applying to most operations .
+	 * max_wait defines the max wait ready time.
+	 * Specified in seconds.
+	 */
+	s16		common_wait;
+	s16		max_wait;
+
 	u16		flags;
 #define	SECT_4K			0x01	/* SPINOR_OP_BE_4K works uniformly */
 #define	SPI_NOR_NO_ERASE	0x02	/* No erase command needed */
@@ -231,12 +239,15 @@ static int spi_nor_ready(struct spi_nor *nor)
  * Service routine to read status register until ready, or timeout occurs.
  * Returns non-zero if error.
  */
-static int spi_nor_wait_till_ready(struct spi_nor *nor)
+static int spi_nor_wait_till_ready(struct spi_nor *nor, int wait_time)
 {
 	unsigned long deadline;
 	int timeout = 0, ret;
 
-	deadline = jiffies + MAX_READY_WAIT_JIFFIES;
+	if (wait_time > 0)
+		deadline = jiffies + wait_time * HZ;
+	else
+		deadline = jiffies + MAX_READY_WAIT_JIFFIES;
 
 	while (!timeout) {
 		if (time_after_eq(jiffies, deadline))
@@ -326,7 +337,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 			goto erase_err;
 		}
 
-		ret = spi_nor_wait_till_ready(nor);
+		ret = spi_nor_wait_till_ready(nor, nor->max_wait);
 		if (ret)
 			goto erase_err;
 
@@ -348,7 +359,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 			addr += mtd->erasesize;
 			len -= mtd->erasesize;
 
-			ret = spi_nor_wait_till_ready(nor);
+			ret = spi_nor_wait_till_ready(nor, nor->common_wait);
 			if (ret)
 				goto erase_err;
 		}
@@ -467,8 +478,9 @@ static int spi_nor_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	return ret;
 }
 
-/* Used when the "_ext_id" is two bytes at most */
-#define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
+/* Used when the "_ext_id" is two bytes at most, WATTM: wait time */
+#define INFO_WATTM(_jedec_id, _ext_id, _sector_size, _n_sectors,	\
+		   _common_wait, _max_wait, _flags)			\
 	((kernel_ulong_t)&(struct flash_info) {				\
 		.id = {							\
 			((_jedec_id) >> 16) & 0xff,			\
@@ -481,10 +493,13 @@ static int spi_nor_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 		.sector_size = (_sector_size),				\
 		.n_sectors = (_n_sectors),				\
 		.page_size = 256,					\
+		.common_wait = (_common_wait),				\
+		.max_wait = (_max_wait),				\
 		.flags = (_flags),					\
 	})
 
-#define INFO6(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
+#define INFO6_WATTM(_jedec_id, _ext_id, _sector_size, _n_sectors,	\
+		    _common_wait, _max_wait, _flags)			\
 	((kernel_ulong_t)&(struct flash_info) {				\
 		.id = {							\
 			((_jedec_id) >> 16) & 0xff,			\
@@ -498,6 +513,8 @@ static int spi_nor_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 		.sector_size = (_sector_size),				\
 		.n_sectors = (_n_sectors),				\
 		.page_size = 256,					\
+		.common_wait = (_common_wait),				\
+		.max_wait = (_max_wait),				\
 		.flags = (_flags),					\
 	})
 
@@ -510,6 +527,16 @@ static int spi_nor_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 		.flags = (_flags),					\
 	})
 
+#define DEFAULT_WAIT_TIME	40 /* in seconds */
+
+#define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
+	INFO_WATTM(_jedec_id, _ext_id, _sector_size, _n_sectors,	\
+		    DEFAULT_WAIT_TIME, DEFAULT_WAIT_TIME, _flags)
+
+#define INFO6(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
+	INFO6_WATTM(_jedec_id, _ext_id, _sector_size, _n_sectors,	\
+		      DEFAULT_WAIT_TIME, DEFAULT_WAIT_TIME, _flags)
+
 /* NOTE: double check command sets and memory organization when you add
  * more nor chips.  This current list focusses on newer chips, which
  * have been converging on command sets which including JEDEC ID.
@@ -756,7 +783,7 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 		/* write one byte. */
 		nor->write(nor, to, 1, retlen, buf);
-		ret = spi_nor_wait_till_ready(nor);
+		ret = spi_nor_wait_till_ready(nor, nor->common_wait);
 		if (ret)
 			goto time_out;
 	}
@@ -768,7 +795,7 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 		/* write two bytes. */
 		nor->write(nor, to, 2, retlen, buf + actual);
-		ret = spi_nor_wait_till_ready(nor);
+		ret = spi_nor_wait_till_ready(nor, nor->common_wait);
 		if (ret)
 			goto time_out;
 		to += 2;
@@ -777,7 +804,7 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 	nor->sst_write_second = false;
 
 	write_disable(nor);
-	ret = spi_nor_wait_till_ready(nor);
+	ret = spi_nor_wait_till_ready(nor, nor->common_wait);
 	if (ret)
 		goto time_out;
 
@@ -788,7 +815,7 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 		nor->program_opcode = SPINOR_OP_BP;
 		nor->write(nor, to, 1, retlen, buf + actual);
 
-		ret = spi_nor_wait_till_ready(nor);
+		ret = spi_nor_wait_till_ready(nor, nor->common_wait);
 		if (ret)
 			goto time_out;
 		write_disable(nor);
@@ -834,7 +861,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 			if (page_size > nor->page_size)
 				page_size = nor->page_size;
 
-			ret = spi_nor_wait_till_ready(nor);
+			ret = spi_nor_wait_till_ready(nor, nor->common_wait);
 			if (ret)
 				goto write_err;
 
@@ -844,7 +871,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 		}
 	}
 
-	ret = spi_nor_wait_till_ready(nor);
+	ret = spi_nor_wait_till_ready(nor, nor->common_wait);
 write_err:
 	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_WRITE);
 	return ret;
@@ -860,7 +887,7 @@ static int macronix_quad_enable(struct spi_nor *nor)
 	nor->cmd_buf[0] = val | SR_QUAD_EN_MX;
 	nor->write_reg(nor, SPINOR_OP_WRSR, nor->cmd_buf, 1, 0);
 
-	if (spi_nor_wait_till_ready(nor))
+	if (spi_nor_wait_till_ready(nor, nor->common_wait))
 		return 1;
 
 	ret = read_sr(nor);
@@ -931,7 +958,7 @@ static int micron_quad_enable(struct spi_nor *nor)
 		return ret;
 	}
 
-	ret = spi_nor_wait_till_ready(nor);
+	ret = spi_nor_wait_till_ready(nor, nor->common_wait);
 	if (ret)
 		return ret;
 
@@ -1184,6 +1211,9 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 
 	nor->read_dummy = spi_nor_read_dummy_cycles(nor);
 
+	nor->common_wait = info->common_wait;
+	nor->max_wait = info->max_wait;
+
 	dev_info(dev, "%s (%lld Kbytes)\n", id->name,
 			(long long)mtd->size >> 10);
 
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index e540952..a0f29c7 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -158,6 +158,8 @@ enum spi_nor_option_flags {
  * @lock:		[FLASH-SPECIFIC] lock a region of the SPI NOR
  * @unlock:		[FLASH-SPECIFIC] unlock a region of the SPI NOR
  * @priv:		the private data
+ * @common_wait:	wait ready time applying to most operations, in seconds
+ * @max_wait:		max wait ready time of all operations, in seconds
  */
 struct spi_nor {
 	struct mtd_info		*mtd;
@@ -195,6 +197,8 @@ struct spi_nor {
 	int (*flash_unlock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
 
 	void *priv;
+	s16			common_wait;
+	s16			max_wait;
 };
 
 /**
-- 
2.1.0.27.g96db324
