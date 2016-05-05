Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayNu9-0006gQ-E1
 for linux-mtd@lists.infradead.org; Thu, 05 May 2016 18:21:42 +0000
Received: by mail-pa0-x230.google.com with SMTP id xk12so38784338pac.0
 for <linux-mtd@lists.infradead.org>; Thu, 05 May 2016 11:21:20 -0700 (PDT)
From: Moritz Fischer <moritz.fischer@ettus.com>
To: dwmw2@infradead.org
Cc: computersforpeace@gmail.com, javier@osg.samsung.com,
 boris.brezillon@free-electrons.com, jic23@kernel.org, jteki@openedev.com,
 zajec5@gmail.com, marex@denx.de, ezequiel@vanguardiasur.com.ar,
 furquan@google.com, cyrille.pitchen@atmel.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 moritz.fischer.private@gmail.com, Moritz Fischer <moritz.fischer@ettus.com>
Subject: [RFC/PATCH] mtd: m25p80: Add support for One-Time-Programmable area.
Date: Thu,  5 May 2016 11:20:56 -0700
Message-Id: <1462472456-26213-1-git-send-email-moritz.fischer@ettus.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This adds support for the One-Time-Programmable area
in Micron chips (tested on N25Q016A).
The N25Q016A has 64 bytes of OTP. Bits written to zero
cannot be reset to ones.

While unlocked bytes 0-63 can be rewritten (with limitation
explained above).

Writing bit 0 of byte 64 will lock the OTP area and will
prevent further writes to any of the 64 bytes.

Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
---

Hi all,

this is much a work in progress and unfortunately given the hardware
(zynq 7000 qspi driver from vendor tree)
I have, and the nature of it being an *one* time programmable part
it's really hard to test. I've successfully written the OTP part of
my N25Q016A, but I'm running out of devices to test...

If someone has any pointers on:

a) Whether I put this in the right place by splitting up
   into a part in spi-nor and a part in m25p80

b) Whether I'm doing something terribly wrong (waiting at the right
   places, #dummy cycles correct, etc)

c) How to test OTP parts in general

Even better if someone has hardware to test on (and is willing to sacrifice
their *one* chance to write it with random garbage) on a non zynq platform,
that would be awesome.

I do realize that this patch still contains dark corners, TODOs and hacks
that need cleanup (i.e. probably size info should be not hardcoded in spi-nor.c etc)

Thanks for your reviews, comments / help

Moritz

---
 drivers/mtd/devices/m25p80.c  | 87 +++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/spi-nor.c | 80 +++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spi-nor.h   | 15 ++++++++
 3 files changed, 182 insertions(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index c9c3b7f..2843ead 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -149,6 +149,90 @@ static int m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 	spi_sync(spi, &m);
 
 	*retlen = m.actual_length - m25p_cmdsz(nor) - dummy;
+
+	return 0;
+}
+
+static int m25p80_read_otp(struct spi_nor *nor, loff_t from, size_t len,
+			   size_t *retlen, u_char *read_buf)
+{
+	struct m25p *flash = nor->priv;
+	struct spi_device *spi = flash->spi;
+	struct spi_transfer t[2];
+	struct spi_message m;
+	unsigned int dummy = nor->read_otp_dummy;
+
+	if (from > 65)
+		return -EINVAL;
+
+	if ((from + len) > 65)
+		len = 65 - from;
+
+	/* convert the dummy cycles to the number of bytes */
+	dummy /= 8;
+
+	spi_message_init(&m);
+	memset(t, 0, sizeof(t));
+
+	flash->command[0] = SPINOR_OP_RD_OTP;
+	m25p_addr2cmd(nor, from, flash->command);
+
+	t[0].tx_buf = flash->command;
+	t[0].len = m25p_cmdsz(nor) + dummy;
+	spi_message_add_tail(&t[0], &m);
+
+	t[1].rx_buf = read_buf;
+	t[1].rx_nbits = m25p80_rx_nbits(nor);
+	t[1].len = len;
+	spi_message_add_tail(&t[1], &m);
+
+	spi_sync(spi, &m);
+
+	*retlen = m.actual_length - m25p_cmdsz(nor) - dummy;
+
+	return 0;
+}
+
+static int m25p80_write_otp(struct spi_nor *nor, loff_t to, size_t len,
+			    size_t *retlen, const u_char *write_buf)
+{
+	struct m25p *flash = nor->priv;
+	struct spi_device *spi = flash->spi;
+	struct spi_transfer t[2];
+	struct spi_message m;
+	int cmd_sz = m25p_cmdsz(nor);
+
+	/* TODO: Ghetto hack ... */
+	if (to > 64)
+		return -EINVAL;
+
+	if ((to + len) > 64)
+		len = 64 - to;
+
+	/* TODO: Deal with locking */
+
+	spi_message_init(&m);
+
+	flash->command[0] = SPINOR_OP_WR_OTP;
+	m25p_addr2cmd(nor, to, flash->command);
+
+	t[0].tx_buf = flash->command;
+	t[0].len = cmd_sz;
+	spi_message_add_tail(&t[0], &m);
+
+	t[1].tx_buf = write_buf;
+	t[1].len = len;
+	spi_message_add_tail(&t[1], &m);
+
+	spi_sync(spi, &m);
+
+	*retlen += m.actual_length - cmd_sz;
+
+	return 0;
+}
+
+static int m25p80_lock_otp(struct spi_nor *nor)
+{
 	return 0;
 }
 
@@ -179,6 +263,9 @@ static int m25p_probe(struct spi_device *spi)
 	nor->write = m25p80_write;
 	nor->write_reg = m25p80_write_reg;
 	nor->read_reg = m25p80_read_reg;
+	nor->read_otp = m25p80_read_otp;
+	nor->write_otp = m25p80_write_otp;
+	nor->lock_otp = m25p80_lock_otp;
 
 	nor->dev = &spi->dev;
 	spi_nor_set_flash_node(nor, spi->dev.of_node);
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 885ab0f..e40441c 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -157,6 +157,22 @@ static inline int spi_nor_read_dummy_cycles(struct spi_nor *nor)
 }
 
 /*
+ * Dummy cycle calculation for different types of otp reads.
+ */
+static inline int spi_nor_otp_read_dummy_cycles(struct spi_nor *nor)
+{
+	switch (nor->flash_read) {
+	case SPI_NOR_QUAD:
+		return 10;
+	case SPI_NOR_FAST:
+	case SPI_NOR_DUAL:
+	case SPI_NOR_NORMAL:
+		return 8;
+	}
+	return 0;
+}
+
+/*
  * Write status register 1 byte
  * Returns negative if error occurred.
  */
@@ -682,6 +698,66 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	return spi_nor_wait_till_ready(nor);
 }
 
+static int spi_nor_get_user_prot_info(struct mtd_info *mtd, size_t len,
+				      size_t *retlen, struct otp_info *info)
+{
+	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+
+	info->start = 0;
+	info->length = 64;
+	info->locked = 0;
+
+	*retlen = sizeof(*info);
+
+	return 0;
+}
+
+static int spi_nor_read_user_prot_reg(struct mtd_info *mtd, loff_t from,
+				      size_t len, size_t *retlen,
+				      u_char *read_buf)
+{
+	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+	int ret;
+
+	dev_dbg(nor->dev, "from 0x%08x, len %zd\n", (u32)from, len);
+
+	ret = spi_nor_lock_and_prep(nor, SPI_NOR_OPS_OTP_READ);
+	if (ret)
+		return ret;
+
+	ret = nor->read_otp(nor, from, len, retlen, read_buf);
+
+	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_OTP_READ);
+
+	return ret;
+}
+
+static int spi_nor_write_user_prot_reg(struct mtd_info *mtd, loff_t to,
+				       size_t len, size_t *retlen,
+				       u_char *write_buf)
+{
+	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+	int ret;
+
+	dev_dbg(nor->dev, "to 0x%08x, len %zd\n", (u32)to, len);
+
+	ret = spi_nor_lock_and_prep(nor, SPI_NOR_OPS_OTP_WRITE);
+	if (ret)
+		return ret;
+
+	write_enable(nor);
+
+	ret = nor->write_otp(nor, to, len, retlen, write_buf);
+
+	ret = spi_nor_wait_till_ready(nor);
+
+	write_disable(nor);
+
+	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_OTP_WRITE);
+
+	return ret;
+}
+
 /*
  * Check if a region of the flash is (completely) locked. See stm_lock() for
  * more info.
@@ -1328,6 +1404,9 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 		nor->flash_lock = stm_lock;
 		nor->flash_unlock = stm_unlock;
 		nor->flash_is_locked = stm_is_locked;
+		mtd->_read_user_prot_reg = spi_nor_read_user_prot_reg;
+		mtd->_write_user_prot_reg = spi_nor_write_user_prot_reg;
+		mtd->_get_user_prot_info = spi_nor_get_user_prot_info;
 	}
 
 	if (nor->flash_lock && nor->flash_unlock && nor->flash_is_locked) {
@@ -1455,6 +1534,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	}
 
 	nor->read_dummy = spi_nor_read_dummy_cycles(nor);
+	nor->read_otp_dummy = spi_nor_otp_read_dummy_cycles(nor);
 
 	dev_info(dev, "%s (%lld Kbytes)\n", info->name,
 			(long long)mtd->size >> 10);
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 3c36113..0b733a8 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -77,6 +77,10 @@
 /* Used for Micron flashes only. */
 #define SPINOR_OP_RD_EVCR      0x65    /* Read EVCR register */
 #define SPINOR_OP_WD_EVCR      0x61    /* Write EVCR register */
+#define SPINOR_OP_RD_OTP       0x4b    /* Read OTP location */
+#define SPINOR_OP_WR_OTP       0x42    /* Write OTP location */
+
+
 
 /* Status Register bits. */
 #define SR_WIP			BIT(0)	/* Write in progress */
@@ -113,6 +117,9 @@ enum spi_nor_ops {
 	SPI_NOR_OPS_ERASE,
 	SPI_NOR_OPS_LOCK,
 	SPI_NOR_OPS_UNLOCK,
+	SPI_NOR_OPS_OTP_WRITE,
+	SPI_NOR_OPS_OTP_READ,
+	SPI_NOR_OPS_OTP_LOCK,
 };
 
 enum spi_nor_option_flags {
@@ -130,6 +137,7 @@ enum spi_nor_option_flags {
  * @erase_opcode:	the opcode for erasing a sector
  * @read_opcode:	the read opcode
  * @read_dummy:		the dummy needed by the read operation
+ * @read_otp_dummy:	the dummy needed by the read otp operation
  * @program_opcode:	the program opcode
  * @flash_read:		the mode of the read
  * @sst_write_second:	used by the SST write operation
@@ -161,6 +169,7 @@ struct spi_nor {
 	u8			erase_opcode;
 	u8			read_opcode;
 	u8			read_dummy;
+	u8			read_otp_dummy;
 	u8			program_opcode;
 	enum read_mode		flash_read;
 	bool			sst_write_second;
@@ -178,6 +187,12 @@ struct spi_nor {
 			size_t len, size_t *retlen, const u_char *write_buf);
 	int (*erase)(struct spi_nor *nor, loff_t offs);
 
+	int (*read_otp)(struct spi_nor *nor, loff_t from, size_t len,
+		       size_t *retlen, u_char *read_buf);
+	int (*write_otp)(struct spi_nor *nor, loff_t to, size_t len,
+			size_t *retlen, const u_char *write_buf);
+	int (*lock_otp)(struct spi_nor *nor);
+
 	int (*flash_lock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
 	int (*flash_unlock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
 	int (*flash_is_locked)(struct spi_nor *nor, loff_t ofs, uint64_t len);
-- 
2.5.5
