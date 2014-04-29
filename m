Received: from mail-bl2on0126.outbound.protection.outlook.com ([65.55.169.126]
 helo=na01-bl2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wf9zS-0008DN-2F
 for linux-mtd@lists.infradead.org; Tue, 29 Apr 2014 15:30:38 +0000
From: Graham Moore <grmoore@altera.com>
To: <ggrahammoore@gmail.com>
Subject: [PATCH V4] Add support for flag status register on Micron chips.
Date: Tue, 29 Apr 2014 10:29:51 -0500
Message-ID: <1398785391-10744-1-git-send-email-grmoore@altera.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: ZY - marex <marex@denx.de>,
 Geert Uytterhoeven <geert+renesas@linux-m68k.org>,
 Graham Moore <grmoore@altera.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jingoo Han <jg1.han@samsung.com>,
 linux-kernel@vger.kernel.org, Yves Vandervennet <rocket.yvanderv@gmail.com>,
 linux-mtd@lists.infradead.org, Insop Song <insop.song@gainspeed.com>,
 Alan Tull <atull@altera.com>, Sourav Poddar <sourav.poddar@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Dinh Nguyen <dinguyen@altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some new Micron flash chips require reading the flag
status register to determine when operations have completed.

Furthermore, chips with multi-die stacks of the 65nm 256Mb QSPI also
require reading the status register before reading the flag status register.

This patch adds support for the flag status register in the n25q512ax3 and n25q00
Micron QSPI flash chips.

Signed-off-by: Graham Moore <grmoore@altera.com>
---
V4:
Do not set nor->wait_till_ready if driver has already set it.
V3:
Rebase to l2-mtd spinor branch.
V2:
Remove leading underscore in function names.
Remove type cast in dev_err call and use the proper format
specifier instead.
---
 drivers/mtd/spi-nor/spi-nor.c |   52 +++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spi-nor.h   |    4 ++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d6f44d5..7e2817e 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -48,6 +48,25 @@ static int read_sr(struct spi_nor *nor)
 }
 
 /*
+ * Read the flag status register, returning its value in the location
+ * Return the status register value.
+ * Returns negative if error occurred.
+ */
+static int read_fsr(struct spi_nor *nor)
+{
+	int ret;
+	u8 val;
+
+	ret = nor->read_reg(nor, SPINOR_OP_RDFSR, &val, 1);
+	if (ret < 0) {
+		pr_err("error %d reading FSR\n", ret);
+		return ret;
+	}
+
+	return val;
+}
+
+/*
  * Read configuration register, returning its value in the
  * location. Return the configuration register value.
  * Returns negative if error occured.
@@ -165,6 +184,32 @@ static int spi_nor_wait_till_ready(struct spi_nor *nor)
 	return -ETIMEDOUT;
 }
 
+static int spi_nor_wait_till_fsr_ready(struct spi_nor *nor)
+{
+	unsigned long deadline;
+	int sr;
+	int fsr;
+
+	deadline = jiffies + MAX_READY_WAIT_JIFFIES;
+
+	do {
+		cond_resched();
+
+		sr = read_sr(nor);
+		if (sr < 0) {
+			break;
+		} else if (!(sr & SR_WIP)) {
+			fsr = read_fsr(nor);
+			if (fsr < 0)
+				break;
+			if (fsr & FSR_READY)
+				return 0;
+		}
+	} while (!time_after_eq(jiffies, deadline));
+
+	return -ETIMEDOUT;
+}
+
 /*
  * Service routine to read status register until ready, or timeout occurs.
  * Returns non-zero if error.
@@ -402,6 +447,7 @@ struct flash_info {
 #define	SECT_4K_PMC		0x10	/* SPINOR_OP_BE_4K_PMC works uniformly */
 #define	SPI_NOR_DUAL_READ	0x20    /* Flash supports Dual Read */
 #define	SPI_NOR_QUAD_READ	0x40    /* Flash supports Quad Read */
+#define	USE_FSR			0x80	/* use flag status register */
 };
 
 #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
@@ -488,6 +534,8 @@ const struct spi_device_id spi_nor_ids[] = {
 	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, 0) },
 	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K) },
 	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K) },
+	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, USE_FSR) },
+	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, USE_FSR) },
 
 	/* PMC */
 	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2, SECT_4K_PMC) },
@@ -965,6 +1013,10 @@ int spi_nor_scan(struct spi_nor *nor, const struct spi_device_id *id,
 	else
 		mtd->_write = spi_nor_write;
 
+	if ((info->flags & USE_FSR) &&
+	    nor->wait_till_ready == spi_nor_wait_till_ready)
+		nor->wait_till_ready = spi_nor_wait_till_fsr_ready;
+
 	/* prefer "small sector" erase if possible */
 	if (info->flags & SECT_4K) {
 		nor->erase_opcode = SPINOR_OP_BE_4K;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 5324184..9e6294f 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -34,6 +34,7 @@
 #define SPINOR_OP_SE		0xd8	/* Sector erase (usually 64KiB) */
 #define SPINOR_OP_RDID		0x9f	/* Read JEDEC ID */
 #define SPINOR_OP_RDCR		0x35	/* Read configuration register */
+#define SPINOR_OP_RDFSR		0x70	/* Read flag status register */
 
 /* 4-byte address opcodes - used on Spansion and some Macronix flashes. */
 #define SPINOR_OP_READ4		0x13	/* Read data bytes (low frequency) */
@@ -66,6 +67,9 @@
 
 #define SR_QUAD_EN_MX		0x40	/* Macronix Quad I/O */
 
+/* Flag Status Register bits */
+#define FSR_READY		0x80
+
 /* Configuration Register bits. */
 #define CR_QUAD_EN_SPAN		0x2	/* Spansion Quad I/O */
 
-- 
1.7.9.5
