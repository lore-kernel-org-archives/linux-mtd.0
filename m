Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbQ7e-0003lA-Ik
 for linux-mtd@lists.infradead.org; Wed, 30 Oct 2013 07:23:23 +0000
From: Sourav Poddar <sourav.poddar@ti.com>
To: <computersforpeace@gmail.com>
Subject: [PATCHv2] drivers: mtd: m25p80: Add quad read support.
Date: Wed, 30 Oct 2013 12:52:45 +0530
Message-ID: <1383117765-31732-1-git-send-email-sourav.poddar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: marex@denx.de, Sourav Poddar <sourav.poddar@ti.com>,
 linux-mtd@lists.infradead.org, balbi@ti.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some flash also support quad read mode.
Adding support for adding quad mode in m25p80
for spansion and macronix flash.

Signed-off-by: Sourav Poddar <sourav.poddar@ti.com>
---
v1->v2:
Small dev_err message fix to make it
mode appropriate.
v1: http://patchwork.ozlabs.org/patch/286109/

There is one cleanup suggestion from Marek Vasut on read_sr
value. I will take that up as a seperate patch, once this 
patch gets done.
 drivers/mtd/devices/m25p80.c |  160 ++++++++++++++++++++++++++++++++++++++++--
 1 files changed, 155 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index d6c5c57..921e30e 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -41,6 +41,7 @@
 #define	OPCODE_WRSR		0x01	/* Write status register 1 byte */
 #define	OPCODE_NORM_READ	0x03	/* Read data bytes (low frequency) */
 #define	OPCODE_FAST_READ	0x0b	/* Read data bytes (high frequency) */
+#define	OPCODE_QUAD_READ        0x6b    /* Read data bytes */
 #define	OPCODE_PP		0x02	/* Page program (up to 256 bytes) */
 #define	OPCODE_BE_4K		0x20	/* Erase 4KiB block */
 #define	OPCODE_BE_4K_PMC	0xd7	/* Erase 4KiB block on PMC chips */
@@ -48,10 +49,12 @@
 #define	OPCODE_CHIP_ERASE	0xc7	/* Erase whole flash chip */
 #define	OPCODE_SE		0xd8	/* Sector erase (usually 64KiB) */
 #define	OPCODE_RDID		0x9f	/* Read JEDEC ID */
+#define	OPCODE_RDCR             0x35    /* Read configuration register */
 
 /* 4-byte address opcodes - used on Spansion and some Macronix flashes. */
 #define	OPCODE_NORM_READ_4B	0x13	/* Read data bytes (low frequency) */
 #define	OPCODE_FAST_READ_4B	0x0c	/* Read data bytes (high frequency) */
+#define	OPCODE_QUAD_READ_4B	0x6c    /* Read data bytes */
 #define	OPCODE_PP_4B		0x12	/* Page program (up to 256 bytes) */
 #define	OPCODE_SE_4B		0xdc	/* Sector erase (usually 64KiB) */
 
@@ -76,6 +79,10 @@
 #define	SR_BP2			0x10	/* Block protect 2 */
 #define	SR_SRWD			0x80	/* SR write protect */
 
+/* Configuration Register bits. */
+#define CR_QUAD_EN_SPAN		0x2     /* Spansion Quad I/O */
+#define SR_QUAD_EN_MX		0x40    /* Macronix Quad I/O */
+
 /* Define max times to check status register before we give up. */
 #define	MAX_READY_WAIT_JIFFIES	(40 * HZ)	/* M25P16 specs 40s max chip erase */
 #define	MAX_CMD_SIZE		6
@@ -95,6 +102,7 @@ struct m25p {
 	u8			program_opcode;
 	u8			*command;
 	bool			fast_read;
+	bool                    quad_read;
 };
 
 static inline struct m25p *mtd_to_m25p(struct mtd_info *mtd)
@@ -131,6 +139,26 @@ static int read_sr(struct m25p *flash)
 }
 
 /*
+ * Read configuration register, returning its value in the
+ * location. Return the configuration register value.
+ * Returns negative if error occured.
+ */
+static int read_cr(struct m25p *flash)
+{
+	u8 code = OPCODE_RDCR;
+	int ret;
+	u8 val;
+
+	ret = spi_write_then_read(flash->spi, &code, 1, &val, 1);
+	if (ret < 0) {
+		dev_err(&flash->spi->dev, "error %d reading CR\n", ret);
+		return ret;
+	}
+
+	return val;
+}
+
+/*
  * Write status register 1 byte
  * Returns negative if error occurred.
  */
@@ -220,6 +248,95 @@ static int wait_till_ready(struct m25p *flash)
 }
 
 /*
+ * Write status Register and configuration register with 2 bytes
+ * The first byte will be written to the status register, while the
+ * second byte will be written to the configuration register.
+ * Return negative if error occured.
+ */
+static int write_sr_cr(struct m25p *flash, u16 val)
+{
+	flash->command[0] = OPCODE_WRSR;
+	flash->command[1] = val & 0xff;
+	flash->command[2] = (val >> 8);
+
+	return spi_write(flash->spi, flash->command, 3);
+}
+
+static int macronix_quad_enable(struct m25p *flash)
+{
+	int ret, val;
+	u8 cmd[2];
+	cmd[0] = OPCODE_WRSR;
+
+	val = read_sr(flash);
+	cmd[1] = val | SR_QUAD_EN_MX;
+	write_enable(flash);
+
+	spi_write(flash->spi, &cmd, 2);
+
+	if (wait_till_ready(flash))
+		return 1;
+
+	ret = read_sr(flash);
+	if (!(ret > 0 && (ret & SR_QUAD_EN_MX))) {
+		dev_err(&flash->spi->dev,
+			"Macronix Quad bit not set");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int spansion_quad_enable(struct m25p *flash)
+{
+	int ret;
+	int quad_en = CR_QUAD_EN_SPAN << 8;
+
+	write_enable(flash);
+
+	ret = write_sr_cr(flash, quad_en);
+	if (ret < 0) {
+		dev_err(&flash->spi->dev,
+			"error while writing configuration register");
+		return -EINVAL;
+	}
+
+	/* read back and check it */
+	ret = read_cr(flash);
+	if (!(ret > 0 && (ret & CR_QUAD_EN_SPAN))) {
+		dev_err(&flash->spi->dev,
+			"Spansion Quad bit not set");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static inline int set_quad_mode(struct m25p *flash, u32 jedec_id)
+{
+	int status;
+
+	switch (JEDEC_MFR(jedec_id)) {
+	case CFI_MFR_MACRONIX:
+		status = macronix_quad_enable(flash);
+		if (status) {
+			dev_err(&flash->spi->dev,
+				"Macronix quad-read not enabled");
+			return -EINVAL;
+		}
+		return status;
+	default:
+		status = spansion_quad_enable(flash);
+		if (status) {
+			dev_err(&flash->spi->dev,
+				"Spansion quad-read not enabled");
+			return -EINVAL;
+		}
+		return status;
+	}
+}
+
+/*
  * Erase the whole flash memory
  *
  * Returns 0 if successful, non-zero otherwise.
@@ -253,11 +370,24 @@ static void m25p_addr2cmd(struct m25p *flash, unsigned int addr, u8 *cmd)
 	cmd[4] = addr >> (flash->addr_width * 8 - 32);
 }
 
+/*
+ * Dummy Cycle calculation for fast and quad read.
+ * It can be used to support more commands with
+ * different dummy cycle requirement.
+ */
 static int m25p_cmdsz(struct m25p *flash)
 {
 	return 1 + flash->addr_width;
 }
 
+static inline int m25p80_dummy_cycles_read(struct m25p *flash)
+{
+	if (flash->quad_read || flash->fast_read)
+		return 1;
+
+	return 0;
+}
+
 /*
  * Erase one sector of flash memory at offset ``offset'' which is any
  * address within the sector which should be erased.
@@ -368,9 +498,10 @@ static int m25p80_read(struct mtd_info *mtd, loff_t from, size_t len,
 	memset(t, 0, (sizeof t));
 
 	t[0].tx_buf = flash->command;
-	t[0].len = m25p_cmdsz(flash) + (flash->fast_read ? 1 : 0);
+	t[0].len = m25p_cmdsz(flash) + m25p80_dummy_cycles_read(flash);
 	spi_message_add_tail(&t[0], &m);
 
+	t[1].rx_nbits = flash->quad_read ? SPI_NBITS_QUAD : 1;
 	t[1].rx_buf = buf;
 	t[1].len = len;
 	spi_message_add_tail(&t[1], &m);
@@ -392,7 +523,7 @@ static int m25p80_read(struct mtd_info *mtd, loff_t from, size_t len,
 	spi_sync(flash->spi, &m);
 
 	*retlen = m.actual_length - m25p_cmdsz(flash) -
-			(flash->fast_read ? 1 : 0);
+			m25p80_dummy_cycles_read(flash);
 
 	mutex_unlock(&flash->lock);
 
@@ -698,6 +829,7 @@ struct flash_info {
 #define	SST_WRITE	0x04		/* use SST byte programming */
 #define	M25P_NO_FR	0x08		/* Can't do fastread */
 #define	SECT_4K_PMC	0x10		/* OPCODE_BE_4K_PMC works uniformly */
+#define	M25P80_QUAD_READ	0x20    /* Flash supports Quad Read */
 };
 
 #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
@@ -774,7 +906,7 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
 	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, 0) },
 	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
-	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, 0) },
+	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, M25P80_QUAD_READ) },
 
 	/* Micron */
 	{ "n25q064",     INFO(0x20ba17, 0, 64 * 1024,  128, 0) },
@@ -794,7 +926,7 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "s25sl032p",  INFO(0x010215, 0x4d00,  64 * 1024,  64, 0) },
 	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, 0) },
 	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, 0) },
-	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, 0) },
+	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, M25P80_QUAD_READ) },
 	{ "s25fl512s",  INFO(0x010220, 0x4d00, 256 * 1024, 256, 0) },
 	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
 	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
@@ -936,6 +1068,7 @@ static int m25p_probe(struct spi_device *spi)
 	unsigned			i;
 	struct mtd_part_parser_data	ppdata;
 	struct device_node __maybe_unused *np = spi->dev.of_node;
+	int ret;
 
 #ifdef CONFIG_MTD_OF_PARTS
 	if (!of_device_is_available(np))
@@ -1055,6 +1188,15 @@ static int m25p_probe(struct spi_device *spi)
 	flash->page_size = info->page_size;
 	flash->mtd.writebufsize = flash->page_size;
 
+	if (spi->mode & SPI_RX_QUAD && info->flags & M25P80_QUAD_READ) {
+		ret = set_quad_mode(flash, info->jedec_id);
+		if (ret) {
+			dev_err(&flash->spi->dev, "quad mode not supported\n");
+			return ret;
+		}
+		flash->quad_read = true;
+	}
+
 	if (np)
 		/* If we were instantiated by DT, use it */
 		flash->fast_read = of_property_read_bool(np, "m25p,fast-read");
@@ -1067,7 +1209,9 @@ static int m25p_probe(struct spi_device *spi)
 		flash->fast_read = false;
 
 	/* Default commands */
-	if (flash->fast_read)
+	if (flash->quad_read)
+		flash->read_opcode = OPCODE_QUAD_READ;
+	else if (flash->fast_read)
 		flash->read_opcode = OPCODE_FAST_READ;
 	else
 		flash->read_opcode = OPCODE_NORM_READ;
@@ -1081,6 +1225,12 @@ static int m25p_probe(struct spi_device *spi)
 		flash->addr_width = 4;
 		if (JEDEC_MFR(info->jedec_id) == CFI_MFR_AMD) {
 			/* Dedicated 4-byte command set */
+			if (flash->quad_read)
+				flash->read_opcode = OPCODE_QUAD_READ_4B;
+			else
+				flash->read_opcode = flash->fast_read ?
+					OPCODE_FAST_READ_4B :
+					OPCODE_NORM_READ_4B;
 			flash->read_opcode = flash->fast_read ?
 				OPCODE_FAST_READ_4B :
 				OPCODE_NORM_READ_4B;
-- 
1.7.1
