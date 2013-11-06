Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ve4DT-0001nW-IP
 for linux-mtd@lists.infradead.org; Wed, 06 Nov 2013 14:36:21 +0000
From: Sourav Poddar <sourav.poddar@ti.com>
To: <computersforpeace@gmail.com>
Subject: [PATCHv3 2/2] drivers: mtd: m25p80: Add quad read support.
Date: Wed, 6 Nov 2013 20:05:35 +0530
Message-ID: <1383748535-20462-3-git-send-email-sourav.poddar@ti.com>
In-Reply-To: <1383748535-20462-1-git-send-email-sourav.poddar@ti.com>
References: <1383748535-20462-1-git-send-email-sourav.poddar@ti.com>
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
v2->v3:
Re arrange the code based on the cleanup done as
first patch of the series.
 drivers/mtd/devices/m25p80.c |  149 ++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 145 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index cfafdce..7460fb3 100644
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
 
@@ -76,6 +79,11 @@
 #define	SR_BP2			0x10	/* Block protect 2 */
 #define	SR_SRWD			0x80	/* SR write protect */
 
+#define SR_QUAD_EN_MX           0x40    /* Macronix Quad I/O */
+
+/* Configuration Register bits. */
+#define CR_QUAD_EN_SPAN		0x2     /* Spansion Quad I/O */
+
 /* Define max times to check status register before we give up. */
 #define	MAX_READY_WAIT_JIFFIES	(40 * HZ)	/* M25P16 specs 40s max chip erase */
 #define	MAX_CMD_SIZE		6
@@ -87,6 +95,7 @@
 enum read_type {
 	M25P80_NORMAL = 0,
 	M25P80_FAST,
+	M25P80_QUAD,
 };
 
 struct m25p {
@@ -136,6 +145,26 @@ static int read_sr(struct m25p *flash)
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
@@ -225,6 +254,95 @@ static int wait_till_ready(struct m25p *flash)
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
@@ -363,6 +481,7 @@ static inline int m25p80_dummy_cycles_read(struct m25p *flash)
 {
 	switch (flash->flash_read) {
 	case M25P80_FAST:
+	case M25P80_QUAD:
 		return 1;
 	case M25P80_NORMAL:
 		return 0;
@@ -397,6 +516,7 @@ static int m25p80_read(struct mtd_info *mtd, loff_t from, size_t len,
 		return -EINVAL;
 	}
 
+
 	t[0].tx_buf = flash->command;
 	t[0].len = m25p_cmdsz(flash) + dummy;
 	spi_message_add_tail(&t[0], &m);
@@ -727,6 +847,7 @@ struct flash_info {
 #define	SST_WRITE	0x04		/* use SST byte programming */
 #define	M25P_NO_FR	0x08		/* Can't do fastread */
 #define	SECT_4K_PMC	0x10		/* OPCODE_BE_4K_PMC works uniformly */
+#define	M25P80_QUAD_READ	0x20    /* Flash supports Quad Read */
 };
 
 #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
@@ -804,7 +925,7 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
 	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, 0) },
 	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
-	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, 0) },
+	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, M25P80_QUAD_READ) },
 
 	/* Micron */
 	{ "n25q064",     INFO(0x20ba17, 0, 64 * 1024,  128, 0) },
@@ -824,7 +945,7 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "s25sl032p",  INFO(0x010215, 0x4d00,  64 * 1024,  64, 0) },
 	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, 0) },
 	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, 0) },
-	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, 0) },
+	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, M25P80_QUAD_READ) },
 	{ "s25fl512s",  INFO(0x010220, 0x4d00, 256 * 1024, 256, 0) },
 	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
 	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
@@ -966,6 +1087,7 @@ static int m25p_probe(struct spi_device *spi)
 	unsigned			i;
 	struct mtd_part_parser_data	ppdata;
 	struct device_node *np = spi->dev.of_node;
+	int ret;
 
 	/* Platform data helps sort out which chip type we have, as
 	 * well as how this board partitions it.  If we don't have
@@ -1080,6 +1202,15 @@ static int m25p_probe(struct spi_device *spi)
 	flash->page_size = info->page_size;
 	flash->mtd.writebufsize = flash->page_size;
 
+	if (spi->mode & SPI_RX_QUAD && info->flags & M25P80_QUAD_READ) {
+		ret = set_quad_mode(flash, info->jedec_id);
+		if (ret) {
+			dev_err(&flash->spi->dev, "quad mode not supported\n");
+			return ret;
+		}
+		flash->flash_read = M25P80_QUAD;
+	}
+
 	if (np) {
 		/* If we were instantiated by DT, use it */
 		if (of_property_read_bool(np, "m25p,fast-read"))
@@ -1089,12 +1220,19 @@ static int m25p_probe(struct spi_device *spi)
 		flash->flash_read = M25P80_FAST;
 	}
 
-	/* Some devices cannot do fast-read, no matter what DT tells us */
-	if (info->flags & M25P_NO_FR)
+	/*
+	 * Some devices cannot do fast-read, no matter what DT tells us
+	 * Some device might support Quad read also. So, If fast read and quad
+	 * read both are not supported, default to NORMAL mode.
+	 */
+	if ((info->flags & M25P_NO_FR) || !(info->flags & M25P80_QUAD_READ))
 		flash->flash_read = M25P80_NORMAL;
 
 	/* Default commands */
 	switch (flash->flash_read) {
+	case M25P80_QUAD:
+		flash->read_opcode = OPCODE_QUAD_READ;
+		break;
 	case M25P80_FAST:
 		flash->read_opcode = OPCODE_FAST_READ;
 		break;
@@ -1116,6 +1254,9 @@ static int m25p_probe(struct spi_device *spi)
 		if (JEDEC_MFR(info->jedec_id) == CFI_MFR_AMD) {
 			/* Dedicated 4-byte command set */
 			switch (flash->flash_read) {
+			case M25P80_QUAD:
+				flash->read_opcode = OPCODE_QUAD_READ;
+				break;
 			case M25P80_FAST:
 				flash->read_opcode = OPCODE_FAST_READ_4B;
 				break;
-- 
1.7.1
