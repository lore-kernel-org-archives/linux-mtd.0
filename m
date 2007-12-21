Received: from wa-out-1112.google.com ([209.85.146.183])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J5X7g-0000PT-69
	for linux-mtd@lists.infradead.org; Fri, 21 Dec 2007 01:56:30 +0000
Received: by wa-out-1112.google.com with SMTP id v33so180358wah.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 20 Dec 2007 17:56:23 -0800 (PST)
Message-ID: <f17812d70712201756h501a80cch8305d40fa479f5cf@mail.gmail.com>
Date: Fri, 21 Dec 2007 09:56:23 +0800
From: "eric miao" <eric.y.miao@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] basic pxa3 nand controller support
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Cc: David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[ the 1st mail seems to be dropped by the mailer, resend ]

Below is the patch for basic pxa3xx nand controller support. PXA3xx does
not leave too much flexibility for NAND flash types, thus the nand flash
information is built-in. The driver below support only samsung 512Mb
small page and micron 1Gb large page, x8 / x16.

Depending on nand_ids.c to decide the nand flash type seems quite
difficult, since scan_ident() will complain about the incorrect
NAND_BUSWIDTH_16 while the buswidth has to be detected according
to the IDs.

Early feedback is welcome, thanks!

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 246d451..b774847 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -279,6 +279,13 @@ config MTD_NAND_AT91
 	  Enables support for NAND Flash / Smart Media Card interface
 	  on Atmel AT91 processors.

+config MTD_NAND_PXA3xx
+	bool "Support for NAND flash devices on PXA3xx"
+	depends on MTD_NAND && PXA3xx
+	help
+	  This enables the driver for the NAND flash device found on
+	  PXA3xx processors
+
 config MTD_NAND_CM_X270
 	tristate "Support for NAND Flash on CM-X270 modules"
 	depends on MTD_NAND && MACH_ARMCORE
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index 3ad6c01..ba8805b 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_MTD_NAND_NDFC)		+= ndfc.o
 obj-$(CONFIG_MTD_NAND_AT91)		+= at91_nand.o
 obj-$(CONFIG_MTD_NAND_CM_X270)		+= cmx270_nand.o
 obj-$(CONFIG_MTD_NAND_BASLER_EXCITE)	+= excite_nandflash.o
+obj-$(CONFIG_MTD_NAND_PXA3xx)		+= pxa3xx_nand.o
 obj-$(CONFIG_MTD_NAND_PLATFORM)		+= plat_nand.o
 obj-$(CONFIG_MTD_ALAUDA)		+= alauda.o

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
new file mode 100644
index 0000000..9951c0c
--- /dev/null
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -0,0 +1,1287 @@
+/*
+ * drivers/mtd/nand/pxa3xx_nand.c
+ *
+ * Copyright (C) 2005 Intel Corporation
+ * Copyright (C) 2006 Marvell International Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/module.h>
+#include <linux/interrupt.h>
+#include <linux/platform_device.h>
+#include <linux/dma-mapping.h>
+#include <linux/delay.h>
+#include <linux/clk.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/partitions.h>
+#include <asm/io.h>
+#include <asm/irq.h>
+#include <asm/dma.h>
+
+#include <asm/arch/pxa-regs.h>
+#include <asm/arch/pxa3xx_nand.h>
+
+#define	CHIP_DELAY_TIMEOUT	(2 * HZ/10)
+
+/* registers and bit definitions */
+#define NDCR		(0x00) /* Control register */
+#define NDTR0CS0	(0x04) /* Timing Parameter 0 for CS0 */
+#define NDTR1CS0	(0x0C) /* Timing Parameter 1 for CS0 */
+#define NDSR		(0x14) /* Status Register */
+#define NDPCR		(0x18) /* Page Count Register */
+#define NDBDR0		(0x1C) /* Bad Block Register 0 */
+#define NDBDR1		(0x20) /* Bad Block Register 1 */
+#define NDDB		(0x40) /* Data Buffer */
+#define NDCB0		(0x48) /* Command Buffer0 */
+#define NDCB1		(0x4C) /* Command Buffer1 */
+#define NDCB2		(0x50) /* Command Buffer2 */
+
+#define NDCR_SPARE_EN		(0x1 << 31)
+#define NDCR_ECC_EN		(0x1 << 30)
+#define NDCR_DMA_EN		(0x1 << 29)
+#define NDCR_ND_RUN		(0x1 << 28)
+#define NDCR_DWIDTH_C		(0x1 << 27)
+#define NDCR_DWIDTH_M		(0x1 << 26)
+#define NDCR_PAGE_SZ		(0x1 << 24)
+#define NDCR_NCSX		(0x1 << 23)
+#define NDCR_ND_MODE		(0x3 << 21)
+#define NDCR_NAND_MODE   	(0x0)
+#define NDCR_CLR_PG_CNT		(0x1 << 20)
+#define NDCR_CLR_ECC		(0x1 << 19)
+#define NDCR_RD_ID_CNT_MASK	(0x7 << 16)
+#define NDCR_RD_ID_CNT(x)	(((x) << 16) & NDCR_RD_ID_CNT_MASK)
+
+#define NDCR_RA_START		(0x1 << 15)
+#define NDCR_PG_PER_BLK		(0x1 << 14)
+#define NDCR_ND_ARB_EN		(0x1 << 12)
+
+#define NDSR_MASK		(0xfff)
+#define NDSR_RDY		(0x1 << 11)
+#define NDSR_CS0_PAGED		(0x1 << 10)
+#define NDSR_CS1_PAGED		(0x1 << 9)
+#define NDSR_CS0_CMDD		(0x1 << 8)
+#define NDSR_CS1_CMDD		(0x1 << 7)
+#define NDSR_CS0_BBD		(0x1 << 6)
+#define NDSR_CS1_BBD		(0x1 << 5)
+#define NDSR_DBERR		(0x1 << 4)
+#define NDSR_SBERR		(0x1 << 3)
+#define NDSR_WRDREQ		(0x1 << 2)
+#define NDSR_RDDREQ		(0x1 << 1)
+#define NDSR_WRCMDREQ		(0x1)
+
+#define NDCB0_AUTO_RS		(0x1 << 25)
+#define NDCB0_CSEL		(0x1 << 24)
+#define NDCB0_CMD_TYPE_MASK	(0x7 << 21)
+#define NDCB0_CMD_TYPE(x)	(((x) << 21) & NDCB0_CMD_TYPE_MASK)
+#define NDCB0_NC		(0x1 << 20)
+#define NDCB0_DBC		(0x1 << 19)
+#define NDCB0_ADDR_CYC_MASK	(0x7 << 16)
+#define NDCB0_ADDR_CYC(x)	(((x) << 16) & NDCB0_ADDR_CYC_MASK)
+#define NDCB0_CMD2_MASK		(0xff << 8)
+#define NDCB0_CMD1_MASK		(0xff)
+#define NDCB0_ADDR_CYC_SHIFT	(16)
+
+/* dma-able I/O address for the NAND data and commands */
+#define NDCB0_DMA_ADDR		(0x43100048)
+#define NDDB_DMA_ADDR		(0x43100040)
+
+/* macros for registers read/write */
+#define nand_writel(info, off, val)	\
+	__raw_writel((val), (info)->mmio_base + (off))
+
+#define nand_readl(info, off)		\
+	__raw_readl((info)->mmio_base + (off))
+
+/* error code and state */
+enum {
+	ERR_NONE	= 0,
+	ERR_DMABUSERR	= -1,
+	ERR_SENDCMD	= -2,
+	ERR_DBERR	= -3,
+	ERR_BBERR	= -4,
+	ERR_BUSY	= -5,
+};
+
+enum {
+	STATE_CMD_SEND = 1,
+	STATE_CMD_HANDLE,
+	STATE_DMA_TRANSFER,
+	STATE_DMA_DONE,
+	STATE_READY,
+	STATE_SUSPENDED,
+	STATE_DATA_TRANSFER,
+};
+
+struct pxa3xx_nand_timing {
+	unsigned int	tCH;  /* Enable signal hold time */
+	unsigned int	tCS;  /* Enable signal setup time */
+	unsigned int	tWH;  /* ND_nWE high duration */
+	unsigned int	tWP;  /* ND_nWE pulse time */
+	unsigned int	tRH;  /* ND_nRE high duration */
+	unsigned int	tRP;  /* ND_nRE pulse width */
+	unsigned int	tR;   /* ND_nWE high to ND_nRE low for read */
+	unsigned int	tWHR; /* ND_nWE high to ND_nRE low for status read */
+	unsigned int	tAR;  /* ND_ALE low to ND_nRE low delay */
+};
+
+struct pxa3xx_nand_cmdset {
+	uint16_t	read1;
+	uint16_t	read2;
+	uint16_t	program;
+	uint16_t	read_status;
+	uint16_t	read_id;
+	uint16_t	erase;
+	uint16_t	reset;
+	uint16_t	lock;
+	uint16_t	unlock;
+	uint16_t	lock_status;
+};
+
+struct pxa3xx_nand_flash {
+	struct pxa3xx_nand_timing *timing; /* NAND Flash timing */
+	struct pxa3xx_nand_cmdset *cmdset;
+
+	uint32_t page_per_block;/* Pages per block (PG_PER_BLK) */
+	uint32_t page_size;	/* Page size in bytes (PAGE_SZ) */
+	uint32_t flash_width;	/* Width of Flash memory (DWIDTH_M) */
+	uint32_t dfc_width;	/* Width of flash controller(DWIDTH_C) */
+	uint32_t num_blocks;	/* Number of physical blocks in Flash */
+	uint32_t chip_id;
+
+	/* NOTE: these are automatically calculated, do not define */
+	size_t		oob_size;
+	size_t		read_id_bytes;
+
+	unsigned int	col_addr_cycles;
+	unsigned int	row_addr_cycles;
+};
+
+struct pxa3xx_nand_info {
+	struct nand_chip	nand_chip;
+
+	struct platform_device	 *pdev;
+	struct pxa3xx_nand_flash *flash_info;
+
+	struct clk		*clk;
+	void __iomem		*mmio_base;
+
+	unsigned int 		buf_start;
+	unsigned int		buf_count;
+
+	/* DMA information */
+	unsigned char		*data_buff;
+	dma_addr_t 		data_buff_phys;
+	size_t			data_buff_size;
+	int 			data_dma_ch;
+	struct pxa_dma_desc	*data_desc;
+	dma_addr_t 		data_desc_addr;
+
+	uint32_t		reg_ndcr;
+
+	/* saved column/page_addr during CMD_SEQIN */
+	int			seqin_column;
+	int			seqin_page_addr;
+
+	/* relate to the command */
+	unsigned int		state;
+
+	int			use_ecc;	/* use HW ECC ? */
+	int			use_dma;	/* use DMA ? */
+
+	size_t			data_size;	/* data size in FIFO */
+	unsigned int		cur_cmd;
+	int 			retcode;
+	struct completion 	cmd_complete;
+
+	/* generated NDCBx register values */
+	uint32_t		ndcb0;
+	uint32_t		ndcb1;
+	uint32_t		ndcb2;
+};
+
+static int use_dma = 0;
+module_param(use_dma, bool, 0444);
+MODULE_PARM_DESC(use_dma, "enable DMA for data transfering to/from NAND HW");
+
+static struct pxa3xx_nand_cmdset smallpage_cmdset = {
+	.read1		= 0x0000,
+	.read2		= 0x0050,
+	.program	= 0x1080,
+	.read_status	= 0x0070,
+	.read_id	= 0x0090,
+	.erase		= 0xD060,
+	.reset		= 0x00FF,
+	.lock		= 0x002A,
+	.unlock		= 0x2423,
+	.lock_status	= 0x007A,
+};
+
+static struct pxa3xx_nand_cmdset largepage_cmdset = {
+	.read1		= 0x3000,
+	.read2		= 0x0050,
+	.program	= 0x1080,
+	.read_status	= 0x0070,
+	.read_id	= 0x0090,
+	.erase		= 0xD060,
+	.reset		= 0x00FF,
+	.lock		= 0x002A,
+	.unlock		= 0x2423,
+	.lock_status	= 0x007A,
+};
+
+static struct pxa3xx_nand_timing samsung512MbX16_timing = {
+	.tCH	= 10,
+	.tCS	= 0,
+	.tWH	= 20,
+	.tWP	= 40,
+	.tRH	= 30,
+	.tRP	= 40,
+	.tR	= 11123,
+	.tWHR	= 110,
+	.tAR	= 10,
+};
+
+static struct pxa3xx_nand_flash samsung512MbX16 = {
+	.timing		= &samsung512MbX16_timing,
+	.cmdset		= &smallpage_cmdset,
+	.page_per_block	= 32,
+	.page_size	= 512,
+	.flash_width	= 16,
+	.dfc_width	= 16,
+	.num_blocks	= 4096,
+	.chip_id	= 0x46ec,
+};
+
+static struct pxa3xx_nand_timing micron_timing = {
+	.tCH	= 10,
+	.tCS	= 25,
+	.tWH	= 15,
+	.tWP	= 25,
+	.tRH	= 15,
+	.tRP	= 25,
+	.tR	= 25000,
+	.tWHR	= 60,
+	.tAR	= 10,
+};
+
+static struct pxa3xx_nand_flash micron1GbX8 = {
+	.timing		= &micron_timing,
+	.cmdset		= &largepage_cmdset,
+	.page_per_block	= 64,
+	.page_size	= 2048,
+	.flash_width	= 8,
+	.dfc_width	= 8,
+	.num_blocks	= 1024,
+	.chip_id	= 0xa12c,
+};
+
+static struct pxa3xx_nand_flash micron1GbX16 = {
+	.timing		= &micron_timing,
+	.cmdset		= &largepage_cmdset,
+	.page_per_block	= 64,
+	.page_size	= 2048,
+	.flash_width	= 16,
+	.dfc_width	= 16,
+	.num_blocks	= 1024,
+	.chip_id	= 0xb12c,
+};
+
+static struct pxa3xx_nand_flash *builtin_flash_types[] = {
+	&samsung512MbX16,
+	&micron1GbX8,
+	&micron1GbX16,
+};
+
+#define NDTR0_tCH(c)	(min((c), 7) << 19)
+#define NDTR0_tCS(c)	(min((c), 7) << 16)
+#define NDTR0_tWH(c)	(min((c), 7) << 11)
+#define NDTR0_tWP(c)	(min((c), 7) << 8)
+#define NDTR0_tRH(c)	(min((c), 7) << 3)
+#define NDTR0_tRP(c)	(min((c), 7) << 0)
+
+#define NDTR1_tR(c)	(min((c), 65535) << 16)
+#define NDTR1_tWHR(c)	(min((c), 15) << 4)
+#define NDTR1_tAR(c)	(min((c), 15) << 0)
+
+/* convert nano-seconds to nand flash controller clock cycles */
+#define ns2cycle(ns, clk)	(int)(((ns) * (clk / 1000000) / 1000) + 1)
+
+static void pxa3xx_nand_set_timing(struct pxa3xx_nand_info *info,
+				   struct pxa3xx_nand_timing *t)
+{
+	unsigned long nand_clk = clk_get_rate(info->clk);
+	uint32_t ndtr0, ndtr1;
+
+	ndtr0 = NDTR0_tCH(ns2cycle(t->tCH, nand_clk)) |
+		NDTR0_tCS(ns2cycle(t->tCS, nand_clk)) |
+		NDTR0_tWH(ns2cycle(t->tWH, nand_clk)) |
+		NDTR0_tWP(ns2cycle(t->tWP, nand_clk)) |
+		NDTR0_tRH(ns2cycle(t->tRH, nand_clk)) |
+		NDTR0_tRP(ns2cycle(t->tRP, nand_clk));
+
+	ndtr1 = NDTR1_tR(ns2cycle(t->tR, nand_clk)) |
+		NDTR1_tWHR(ns2cycle(t->tWHR, nand_clk)) |
+		NDTR1_tAR(ns2cycle(t->tAR, nand_clk));
+
+	nand_writel(info, NDTR0CS0, ndtr0);
+	nand_writel(info, NDTR1CS0, ndtr1);
+}
+
+#define WAIT_EVENT_TIMEOUT	10
+
+static int wait_for_event(struct pxa3xx_nand_info *info, uint32_t event)
+{
+	int timeout = WAIT_EVENT_TIMEOUT;
+	uint32_t ndsr;
+
+	while (timeout--) {
+		ndsr = nand_readl(info, NDSR) & NDSR_MASK;
+		if (ndsr & event) {
+			nand_writel(info, NDSR, ndsr);
+			return 0;
+		}
+		udelay(10);
+	}
+
+	return -ETIMEDOUT;
+}
+
+static int prepare_read_prog_cmd(struct pxa3xx_nand_info *info,
+			uint16_t cmd, int column, int page_addr)
+{
+	struct pxa3xx_nand_flash *f = info->flash_info;
+	struct pxa3xx_nand_cmdset *cmdset = f->cmdset;
+
+	/* calculate data size */
+	switch (f->page_size) {
+	case 2048:
+		info->data_size = (info->use_ecc) ? 2088 : 2112;
+		break;
+	case 512:
+		info->data_size = (info->use_ecc) ? 520 : 528;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* generate values for NDCBx registers */
+	info->ndcb0 = cmd | ((cmd & 0xff00) ? NDCB0_DBC : 0);
+	info->ndcb0 |= NDCB0_ADDR_CYC(f->row_addr_cycles + f->col_addr_cycles);
+
+	if (f->col_addr_cycles == 2) {
+		/* large block, 2 cycles for column address
+		 * row address starts from 3rd cycle
+		 */
+		info->ndcb1 |= (page_addr << 16) | (column & 0xffff);
+		if (f->row_addr_cycles == 3)
+			info->ndcb2 = (page_addr >> 16) & 0xff;
+	} else
+		/* small block, 1 cycles for column address
+		 * row address starts from 2nd cycle
+		 */
+		info->ndcb1 = (page_addr << 8) | (column & 0xff);
+
+	if (cmd == cmdset->program)
+		info->ndcb0 |= NDCB0_CMD_TYPE(1) | NDCB0_AUTO_RS;
+
+	info->cur_cmd = cmd;
+	return 0;
+}
+
+static int prepare_erase_cmd(struct pxa3xx_nand_info *info,
+			uint16_t cmd, int page_addr)
+{
+	info->ndcb0 = cmd | ((cmd & 0xff00) ? NDCB0_DBC : 0);
+	info->ndcb0 |= NDCB0_CMD_TYPE(2) | NDCB0_AUTO_RS | NDCB0_ADDR_CYC(3);
+	info->ndcb1 = page_addr;
+
+	info->cur_cmd = cmd;
+	return 0;
+}
+
+static int prepare_other_cmd(struct pxa3xx_nand_info *info, uint16_t cmd)
+{
+	struct pxa3xx_nand_cmdset *cmdset = info->flash_info->cmdset;
+
+	info->ndcb0 = cmd | ((cmd & 0xff00) ? NDCB0_DBC : 0);
+
+	if (cmd == cmdset->read_id) {
+		info->ndcb0 |= NDCB0_CMD_TYPE(3);
+		info->data_size = 8;
+	} else if (cmd == cmdset->read_status) {
+		info->ndcb0 |= NDCB0_CMD_TYPE(4);
+		info->data_size = 8;
+	} else if (cmd == cmdset->reset || cmd == cmdset->lock ||
+		   cmd == cmdset->unlock) {
+		info->ndcb0 |= NDCB0_CMD_TYPE(5);
+	} else
+		return -EINVAL;
+
+	info->cur_cmd = cmd;
+	return 0;
+}
+
+static void enable_int(struct pxa3xx_nand_info *info, uint32_t int_mask)
+{
+	uint32_t ndcr;
+
+	ndcr = nand_readl(info, NDCR);
+	nand_writel(info, NDCR, ndcr & ~int_mask);
+}
+
+static void disable_int(struct pxa3xx_nand_info *info, uint32_t int_mask)
+{
+	uint32_t ndcr;
+
+	ndcr = nand_readl(info, NDCR);
+	nand_writel(info, NDCR, ndcr | int_mask);
+}
+
+/* NOTE: it is a must to set ND_RUN firstly, then write command buffer
+ * otherwise, it does not work
+ */
+static int write_cmd(struct pxa3xx_nand_info *info)
+{
+	uint32_t ndcr;
+
+	/* clear status bits and run */
+	nand_writel(info, NDSR, NDSR_MASK);
+
+	ndcr = info->reg_ndcr;
+
+	ndcr |= info->use_ecc ? NDCR_ECC_EN : 0;
+	ndcr |= info->use_dma ? NDCR_DMA_EN : 0;
+	ndcr |= NDCR_ND_RUN;
+
+	nand_writel(info, NDCR, ndcr);
+
+	if (wait_for_event(info, NDSR_WRCMDREQ)) {
+		printk(KERN_ERR "timed out writing command\n");
+		return -ETIMEDOUT;
+	}
+
+	nand_writel(info, NDCB0, info->ndcb0);
+	nand_writel(info, NDCB0, info->ndcb1);
+	nand_writel(info, NDCB0, info->ndcb2);
+	return 0;
+}
+
+/* NOTE: {read, write}_fifo_pio() assume the buffer is 4-byte aligned,
+ * and data_size are 4-byte multiples as well
+ */
+static void read_fifo_pio(struct pxa3xx_nand_info *info)
+{
+	uint32_t *buff = (uint32_t *)info->data_buff;
+	int i, data_size = info->data_size;
+
+	BUG_ON((data_size % sizeof(uint32_t)) != 0);
+
+	for (i = 0; i < data_size / sizeof(uint32_t); i++)
+		*buff++ = __raw_readl(info->mmio_base + NDDB);
+}
+
+static void write_fifo_pio(struct pxa3xx_nand_info *info)
+{
+	uint32_t *buff = (uint32_t *)info->data_buff;
+	int i, data_size = info->data_size;
+
+	BUG_ON((data_size % sizeof(uint32_t)) != 0);
+
+	for (i = 0; i < data_size / sizeof(uint32_t); i++)
+		__raw_writel(*buff++, info->mmio_base + NDDB);
+}
+
+static int handle_data_pio(struct pxa3xx_nand_info *info)
+{
+	struct pxa3xx_nand_cmdset *cmdset = info->flash_info->cmdset;
+	int ret, timeout = CHIP_DELAY_TIMEOUT;
+
+	if (info->cur_cmd == cmdset->program) {
+		write_fifo_pio(info);
+
+		enable_int(info, NDSR_CS0_BBD | NDSR_CS0_CMDD);
+
+		ret = wait_for_completion_timeout(&info->cmd_complete, timeout);
+		if (!ret) {
+			printk(KERN_ERR "program command time out\n");
+			return -1;
+		}
+	} else
+		read_fifo_pio(info);
+
+	info->state = STATE_READY;
+	return 0;
+}
+
+static void setup_data_dma(struct pxa3xx_nand_info *info)
+{
+	struct pxa3xx_nand_flash * f = info->flash_info;
+	struct pxa_dma_desc *desc = info->data_desc;
+	int dma_len = ALIGN(info->data_size, 32);
+
+	desc->ddadr = DDADR_STOP;
+	desc->dcmd = DCMD_ENDIRQEN | DCMD_WIDTH4 | DCMD_BURST32 | dma_len;
+
+	if (info->cur_cmd == f->cmdset->program) {
+		desc->dsadr = info->data_buff_phys;
+		desc->dtadr = NDDB_DMA_ADDR;
+		desc->dcmd |= DCMD_INCSRCADDR | DCMD_FLOWTRG;
+	} else {
+		desc->dtadr = info->data_buff_phys;
+		desc->dsadr = NDDB_DMA_ADDR;
+		desc->dcmd |= DCMD_INCTRGADDR | DCMD_FLOWSRC;
+	}
+}
+
+static void start_data_dma(struct pxa3xx_nand_info *info)
+{
+	DRCMR97 = DRCMR_MAPVLD | info->data_dma_ch;
+	DDADR(info->data_dma_ch) = info->data_desc_addr;
+	DCSR(info->data_dma_ch) |= DCSR_RUN;
+}
+
+static void pxa3xx_nand_data_dma_irq(int channel, void *data)
+{
+	struct pxa3xx_nand_info *info = data;
+	struct pxa3xx_nand_flash *f = info->flash_info;
+	uint32_t dcsr, intm;
+
+	dcsr = DCSR(channel);
+	DCSR(channel) = dcsr;
+
+	intm = NDSR_CS0_BBD | NDSR_CS0_CMDD;
+
+	if (dcsr & DCSR_BUSERR) {
+		info->retcode = ERR_DMABUSERR;
+		complete(&info->cmd_complete);
+	}
+
+	if (info->cur_cmd == f->cmdset->program) {
+		info->state = STATE_DMA_DONE;
+		enable_int(info, intm);
+	} else {
+		info->state = STATE_READY;
+		complete(&info->cmd_complete);
+	}
+}
+
+static irqreturn_t pxa3xx_nand_irq(int irq, void *devid)
+{
+	unsigned int status, event, intm;
+	struct pxa3xx_nand_info *info = devid;
+
+	intm = NDSR_CS0_BBD | NDSR_CS0_CMDD;
+	event = NDSR_CS0_BBD | NDSR_CS0_CMDD;
+
+	status = nand_readl(info, NDSR);
+
+	if (status & (NDSR_RDDREQ | NDSR_DBERR)) {
+		if (status & NDSR_DBERR)
+			info->retcode = ERR_DBERR;
+
+		disable_int(info, NDSR_RDDREQ | NDSR_DBERR);
+
+		if (info->use_dma) {
+			info->state = STATE_DMA_TRANSFER;
+			start_data_dma(info);
+		} else {
+			info->state = STATE_DATA_TRANSFER;
+			complete(&info->cmd_complete);
+		}
+	} else if (status & NDSR_WRDREQ) {
+		disable_int(info, NDSR_WRDREQ);
+		if (info->use_dma) {
+			info->state = STATE_DMA_TRANSFER;
+			start_data_dma(info);
+		} else {
+			info->state = STATE_DATA_TRANSFER;
+			complete(&info->cmd_complete);
+		}
+	} else if (status & event) {
+		if (status & NDSR_CS0_BBD)
+			info->retcode = ERR_BBERR;
+
+		disable_int(info, intm);
+		info->state = STATE_READY;
+		complete(&info->cmd_complete);
+	}
+	nand_writel(info, NDSR, status);
+	return IRQ_HANDLED;
+}
+
+static int pxa3xx_nand_do_cmd(struct pxa3xx_nand_info *info, uint32_t event)
+{
+	uint32_t ndcr;
+	int ret, timeout = CHIP_DELAY_TIMEOUT;
+
+	info->state = STATE_CMD_SEND;
+
+	if (write_cmd(info)) {
+		info->retcode = ERR_SENDCMD;
+		goto fail_stop;
+	}
+
+	info->state = STATE_CMD_HANDLE;
+
+	if (info->use_dma)
+		setup_data_dma(info);
+
+	enable_int(info, event);
+
+	ret = wait_for_completion_timeout(&info->cmd_complete, timeout);
+	if (!ret) {
+		printk(KERN_ERR "command execution timed out\n");
+		info->retcode = ERR_SENDCMD;
+		goto fail_stop;
+	}
+
+	if (info->use_dma == 0 && info->data_size > 0)
+		if (handle_data_pio(info))
+			goto fail_stop;
+
+	return 0;
+
+fail_stop:
+	ndcr = nand_readl(info, NDCR);
+	nand_writel(info, NDCR, ndcr & ~NDCR_ND_RUN);
+	udelay(10);
+	return -ETIMEDOUT;
+}
+
+static int pxa3xx_nand_dev_ready(struct mtd_info *mtd)
+{
+	struct pxa3xx_nand_info *info = mtd->priv;
+	return (nand_readl(info, NDSR) & NDSR_RDY) ? 1 : 0;
+}
+
+static inline int is_buf_blank(uint8_t *buf, size_t len)
+{
+	for (; len > 0; len--)
+		if (*buf++ != 0xff)
+			return 0;
+	return 1;
+}
+
+static void pxa3xx_nand_cmdfunc(struct mtd_info *mtd, unsigned command,
+		int column, int page_addr )
+{
+	struct pxa3xx_nand_info *info = mtd->priv;
+	struct pxa3xx_nand_flash * flash_info = info->flash_info;
+	struct pxa3xx_nand_cmdset *cmdset = flash_info->cmdset;
+	int ret;
+
+	info->ndcb0 = 0;
+	info->ndcb1 = 0;
+	info->ndcb2 = 0;
+	info->use_dma = 0;
+	info->use_ecc = 0;
+	info->cur_cmd = -1;
+	info->data_size = 0;
+	info->state = STATE_READY;
+
+	init_completion(&info->cmd_complete);
+
+	switch (command) {
+	case NAND_CMD_READOOB:
+		/* disable HW ECC to get all the OOB data */
+		info->use_ecc = 0;
+		info->use_dma = use_dma ? 1 : 0;
+		info->buf_count = mtd->writesize + mtd->oobsize;
+		info->buf_start = mtd->writesize + column;
+
+		if (prepare_read_prog_cmd(info, cmdset->read1, column, page_addr))
+			break;
+
+		pxa3xx_nand_do_cmd(info, NDSR_RDDREQ | NDSR_DBERR);
+
+		/* We only are OOB, so if the data has error, does not matter */
+		if (info->retcode == ERR_DBERR)
+			info->retcode = ERR_NONE;
+		break;
+
+	case NAND_CMD_READ0:
+		info->use_ecc = 1;
+		info->use_dma = use_dma ? 1 : 0;
+		info->retcode = ERR_NONE;
+		info->buf_start = column;
+		info->buf_count = mtd->writesize + mtd->oobsize;
+		memset(info->data_buff, 0xFF, info->buf_count);
+
+		if (prepare_read_prog_cmd(info, cmdset->read1, column, page_addr))
+			break;
+
+		pxa3xx_nand_do_cmd(info, NDSR_RDDREQ | NDSR_DBERR);
+
+		if (info->retcode == ERR_DBERR) {
+			/* for blank page (all 0xff), HW will calculate its ECC as
+			 * 0, which is different from the ECC information within
+			 * OOB, ignore such double bit errors
+			 */
+			if (is_buf_blank(info->data_buff, mtd->writesize))
+				info->retcode = ERR_NONE;
+		}
+		break;
+	case NAND_CMD_SEQIN:
+		info->buf_start = column;
+		info->buf_count = mtd->writesize + mtd->oobsize;
+		memset(info->data_buff, 0xff, info->buf_count);
+
+		/* save column/page_addr for next CMD_PAGEPROG */
+		info->seqin_column = column;
+		info->seqin_page_addr = page_addr;
+		break;
+	case NAND_CMD_PAGEPROG:
+		info->use_ecc = (info->seqin_column >= mtd->writesize) ? 0 : 1;
+		info->use_dma = use_dma ? 1 : 0;
+
+		if (prepare_read_prog_cmd(info, cmdset->program,
+				info->seqin_column, info->seqin_page_addr))
+			break;
+
+		pxa3xx_nand_do_cmd(info, NDSR_WRDREQ);
+		break;
+	case NAND_CMD_ERASE1:
+		if (prepare_erase_cmd(info, cmdset->erase, page_addr))
+			break;
+
+		pxa3xx_nand_do_cmd(info, NDSR_CS0_BBD | NDSR_CS0_CMDD);
+		break;
+	case NAND_CMD_ERASE2:
+		break;
+	case NAND_CMD_READID:
+		info->use_dma = 0;
+		info->buf_count = flash_info->read_id_bytes;
+		info->buf_start = 0;
+
+		if (prepare_other_cmd(info, cmdset->read_id))
+			break;
+
+		pxa3xx_nand_do_cmd(info, NDSR_RDDREQ);
+		break;
+	case NAND_CMD_STATUS:
+		info->use_dma = 0;
+		info->buf_count = 1;
+		info->buf_start = 0;
+		if (prepare_other_cmd(info, cmdset->read_status))
+			break;
+
+		pxa3xx_nand_do_cmd(info, NDSR_RDDREQ);
+		break;
+	case NAND_CMD_RESET:
+		if (prepare_other_cmd(info, cmdset->reset))
+			break;
+		
+		ret = pxa3xx_nand_do_cmd(info, NDSR_CS0_CMDD);
+		if (ret == 0) {
+			int timeout = 2;
+			uint32_t ndcr;
+
+			while (timeout--) {
+				if (nand_readl(info, NDSR) & NDSR_RDY)
+					break;
+				msleep(10);
+			}
+
+			ndcr = nand_readl(info, NDCR);
+			nand_writel(info, NDCR, ndcr & ~NDCR_ND_RUN);
+		}
+		break;
+	default:
+		printk(KERN_ERR "non-supported command.\n");
+		break;
+	}
+
+	if (info->retcode == ERR_DBERR) {
+		printk(KERN_ERR "double bit error @ page %08x\n", page_addr);
+		info->retcode = ERR_NONE;
+	}
+
+	if (info->retcode != ERR_NONE)
+		info->state = STATE_READY;
+}
+
+static uint8_t pxa3xx_nand_read_byte(struct mtd_info *mtd)
+{
+	struct pxa3xx_nand_info *info = mtd->priv;
+	char retval = 0xFF;
+
+	if (info->buf_start < info->buf_count)
+		/* Has just send a new command? */
+		retval = info->data_buff[info->buf_start++];
+
+	return retval;
+}
+
+static u16 pxa3xx_nand_read_word(struct mtd_info *mtd)
+{
+	struct pxa3xx_nand_info *info = mtd->priv;
+	u16 retval = 0xFFFF;
+
+	if (!(info->buf_start & 0x01) && info->buf_start < info->buf_count) {
+		retval = *((u16 *)(info->data_buff+info->buf_start));
+		info->buf_start += 2;
+	}
+	return retval;
+}
+
+static void pxa3xx_nand_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
+{
+	struct pxa3xx_nand_info *info = mtd->priv;
+	int real_len = min_t(size_t, len, info->buf_count - info->buf_start);
+
+	memcpy(buf, info->data_buff + info->buf_start, real_len);
+	info->buf_start += real_len;
+}
+
+static void pxa3xx_nand_write_buf(struct mtd_info *mtd,
+		const uint8_t *buf, int len)
+{
+	struct pxa3xx_nand_info *info = mtd->priv;
+	int real_len = min_t(size_t, len, info->buf_count - info->buf_start);
+
+	memcpy(info->data_buff + info->buf_start, buf, real_len);
+	info->buf_start += real_len;
+}
+
+static int pxa3xx_nand_verify_buf(struct mtd_info *mtd,
+		const uint8_t *buf, int len)
+{
+	return 0;
+}
+
+static void pxa3xx_nand_select_chip(struct mtd_info *mtd, int chip)
+{
+	return;
+}
+
+static int pxa3xx_nand_waitfunc(struct mtd_info *mtd, struct nand_chip *this)
+{
+	struct pxa3xx_nand_info *info = mtd->priv;
+
+	/* pxa3xx_nand_send_command has waited for command complete */
+	if (this->state == FL_WRITING || this->state == FL_ERASING) {
+		if (info->retcode == ERR_NONE)
+			return 0;
+		else {
+			/*
+			 * any error make it return 0x01 which will tell
+			 * the caller the erase and write fail
+			 */
+			return 0x01;
+		}
+	}
+
+	return 0;
+}
+
+static void pxa3xx_nand_ecc_hwctl(struct mtd_info *mtd, int mode)
+{
+	return;
+}
+
+static int pxa3xx_nand_ecc_calculate(struct mtd_info *mtd,
+		const uint8_t *dat, uint8_t *ecc_code)
+{
+	return 0;
+}
+
+static int pxa3xx_nand_ecc_correct(struct mtd_info *mtd,
+		uint8_t *dat, uint8_t *read_ecc, uint8_t *calc_ecc)
+{
+	struct pxa3xx_nand_info *info = mtd->priv;
+	/*
+	 * Any error include ERR_SEND_CMD, ERR_DBERR, ERR_BUSERR, we
+	 * consider it as a ecc error which will tell the caller the
+	 * read fail We have distinguish all the errors, but the
+	 * nand_read_ecc only check this function return value
+	 */
+	if (info->retcode != ERR_NONE)
+		return -1;
+
+	return 0;
+}
+
+static int dfc_readid(struct pxa3xx_nand_info *info, uint32_t *id)
+{
+	struct pxa3xx_nand_flash *f = info->flash_info;
+	struct pxa3xx_nand_cmdset *cmdset = f->cmdset;
+	uint32_t ndcr;
+
+	info->ndcb0 = 0;
+	info->ndcb1 = 0;
+	info->ndcb2 = 0;
+	info->data_size = 0;
+
+	if (prepare_other_cmd(info, cmdset->read_id)) {
+		printk(KERN_ERR "failed to prepare command\n");
+		return -EINVAL;
+	}
+
+	/* Send command */
+	if (write_cmd(info))
+		goto fail_timeout;
+
+	/* Wait for CMDDM(command done successfully) */
+	if (wait_for_event(info, NDSR_RDDREQ))
+		goto fail_timeout;
+
+	read_fifo_pio(info);
+	*id = info->data_buff[0] | (info->data_buff[1] << 8);
+	return 0;
+
+fail_timeout:
+	ndcr = nand_readl(info, NDCR);
+	nand_writel(info, NDCR, ndcr & ~NDCR_ND_RUN);
+	udelay(10);
+	return -ETIMEDOUT;
+}
+
+static int pxa3xx_nand_config_flash(struct pxa3xx_nand_info *info,
+				    struct pxa3xx_nand_flash *f)
+{
+	struct platform_device *pdev = info->pdev;
+	struct pxa3xx_nand_platform_data *pdata = pdev->dev.platform_data;
+	uint32_t ndcr = 0x00000FFF; /* disable all interrupts */
+
+	if (f->page_size != 2048 && f->page_size != 512)
+		return -EINVAL;
+
+	if (f->flash_width != 16 && f->flash_width != 8)
+		return -EINVAL;
+
+	/* calculate flash information */
+	f->oob_size = (f->page_size == 2048) ? 64 : 16;
+	f->read_id_bytes = (f->page_size == 2048) ? 4 : 2;
+
+	/* calculate addressing information */
+	f->col_addr_cycles = (f->page_size == 2048) ? 2 : 1;
+
+	if (f->num_blocks * f->page_per_block > 65536)
+		f->row_addr_cycles = 3;
+	else
+		f->row_addr_cycles = 2;
+
+	ndcr |= (pdata->enable_arbiter) ? NDCR_ND_ARB_EN : 0;
+	ndcr |= (f->col_addr_cycles == 2) ? NDCR_RA_START : 0;
+	ndcr |= (f->page_per_block == 64) ? NDCR_PG_PER_BLK : 0;
+	ndcr |= (f->page_size == 2048) ? NDCR_PAGE_SZ : 0;
+	ndcr |= (f->flash_width == 16) ? NDCR_DWIDTH_M : 0;
+	ndcr |= (f->dfc_width == 16) ? NDCR_DWIDTH_C : 0;
+
+	ndcr |= NDCR_RD_ID_CNT(f->read_id_bytes);
+	ndcr |= NDCR_SPARE_EN; /* enable spare by default */
+
+	info->reg_ndcr = ndcr;
+
+	pxa3xx_nand_set_timing(info, f->timing);
+	info->flash_info = f;
+	return 0;
+}
+
+static int pxa3xx_nand_detect_flash(struct pxa3xx_nand_info *info)
+{
+	struct pxa3xx_nand_flash *f;
+	uint32_t id;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(builtin_flash_types); i++) {
+
+		f = builtin_flash_types[i];
+
+		if (pxa3xx_nand_config_flash(info, f))
+			continue;
+
+		if (dfc_readid(info, &id))
+			continue;
+
+		if (id == f->chip_id)
+			return 0;
+	}
+
+	return -ENODEV;
+}
+
+/* the maximum possible buffer size for large page with OOB data
+ * is: 2048 + 64 = 2112 bytes, allocate a page here for both the
+ * data buffer and the DMA descriptor
+ */
+#define MAX_BUFF_SIZE	PAGE_SIZE
+
+static int pxa3xx_nand_init_buff(struct pxa3xx_nand_info *info)
+{
+	struct platform_device *pdev = info->pdev;
+	int data_desc_offset = MAX_BUFF_SIZE - sizeof(struct pxa_dma_desc);
+
+	if (use_dma == 0) {
+		info->data_buff = kmalloc(MAX_BUFF_SIZE, GFP_KERNEL);
+		if (info->data_buff == NULL)
+			return -ENOMEM;
+		return 0;
+	}
+
+	info->data_buff = dma_alloc_coherent(&pdev->dev, MAX_BUFF_SIZE,
+				&info->data_buff_phys, GFP_KERNEL);
+	if (info->data_buff == NULL) {
+		dev_err(&pdev->dev, "failed to allocate dma buffer\n");
+		return -ENOMEM;
+	}
+
+	info->data_buff_size = MAX_BUFF_SIZE;
+	info->data_desc = (void *)info->data_buff + data_desc_offset;
+	info->data_desc_addr = info->data_buff_phys + data_desc_offset;
+
+	info->data_dma_ch = pxa_request_dma("nand-data", DMA_PRIO_LOW,
+				pxa3xx_nand_data_dma_irq, info);
+	if (info->data_dma_ch < 0) {
+		dev_err(&pdev->dev, "failed to request data dma\n");
+		dma_free_coherent(&pdev->dev, info->data_buff_size,
+				info->data_buff, info->data_buff_phys);
+		return info->data_dma_ch;
+	}
+
+	return 0;
+}
+
+static struct nand_ecclayout hw_smallpage_ecclayout = {
+	.eccbytes = 6,
+	.eccpos = {8, 9, 10, 11, 12, 13 },
+	.oobfree = { {2, 6} }
+};
+
+static struct nand_ecclayout hw_largepage_ecclayout = {
+	.eccbytes = 24,
+	.eccpos = {
+		40, 41, 42, 43, 44, 45, 46, 47,
+		48, 49, 50, 51, 52, 53, 54, 55,
+		56, 57, 58, 59, 60, 61, 62, 63},
+	.oobfree = { {2, 38} }
+};
+
+static void pxa3xx_nand_init_mtd(struct mtd_info *mtd,
+				 struct pxa3xx_nand_info *info)
+{
+	struct pxa3xx_nand_flash *f = info->flash_info;
+	struct nand_chip *this = &info->nand_chip;
+
+	this->options = (f->flash_width == 16) ? NAND_BUSWIDTH_16: 0;
+
+	this->waitfunc		= pxa3xx_nand_waitfunc;
+	this->select_chip	= pxa3xx_nand_select_chip;
+	this->dev_ready		= pxa3xx_nand_dev_ready;
+	this->cmdfunc		= pxa3xx_nand_cmdfunc;
+	this->read_word		= pxa3xx_nand_read_word;
+	this->read_byte		= pxa3xx_nand_read_byte;
+	this->read_buf		= pxa3xx_nand_read_buf;
+	this->write_buf		= pxa3xx_nand_write_buf;
+	this->verify_buf	= pxa3xx_nand_verify_buf;
+
+	this->ecc.mode		= NAND_ECC_HW;
+	this->ecc.hwctl		= pxa3xx_nand_ecc_hwctl;
+	this->ecc.calculate	= pxa3xx_nand_ecc_calculate;
+	this->ecc.correct	= pxa3xx_nand_ecc_correct;
+	this->ecc.size		= f->page_size;
+
+	if (f->page_size == 2048)
+		this->ecc.layout = &hw_largepage_ecclayout;
+	else
+		this->ecc.layout = &hw_smallpage_ecclayout;
+
+	this->chip_delay= 25;
+}
+
+static int pxa3xx_nand_probe(struct platform_device *pdev)
+{
+	struct pxa3xx_nand_platform_data *pdata;
+	struct pxa3xx_nand_info *info;
+	struct nand_chip *this;
+	struct mtd_info *mtd;
+	struct resource *res;
+	int ret = 0;
+
+	pdata = pdev->dev.platform_data;
+
+	if (pdata == NULL) {
+		dev_err(&pdev->dev, "no platform data defined\n");
+		return -ENODEV;
+	}
+
+	mtd = kzalloc(sizeof(struct mtd_info) + sizeof(struct pxa3xx_nand_info),
+			GFP_KERNEL);
+	if (mtd == NULL) {
+		dev_err(&pdev->dev, "failed to allocate memory\n");
+		return -ENOMEM;
+        }
+
+	info = (struct pxa3xx_nand_info *)(&mtd[1]);
+	info->pdev = pdev;
+
+	this = &info->nand_chip;
+	mtd->priv = info;
+
+	info->clk = clk_get(&pdev->dev, "NANDCLK");
+	if (IS_ERR(info->clk)) {
+		dev_err(&pdev->dev, "failed to get nand clock\n");
+		ret = PTR_ERR(info->clk);
+		goto free_mtd;
+	}
+	clk_enable(info->clk);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (res == NULL) {
+		dev_err(&pdev->dev, "no IO memory resource defined\n");
+		ret = -ENODEV;
+		goto fail_put_clk;
+	}
+
+	res = request_mem_region(res->start, res->end - res->start + 1,
+			pdev->name);
+	if (res == NULL) {
+		dev_err(&pdev->dev, "failed to request memory resource\n");
+		ret = -EBUSY;
+		goto fail_put_clk;
+	}
+
+	info->mmio_base = ioremap(res->start, res->end - res->start + 1);
+	if (info->mmio_base == NULL) {
+		dev_err(&pdev->dev, "ioremap() failed\n");
+		ret = -ENODEV;
+		goto fail_free_res;
+	}
+
+	ret = pxa3xx_nand_init_buff(info);
+	if (ret)
+		goto fail_free_io;
+
+	ret = request_irq(IRQ_NAND, pxa3xx_nand_irq, IRQF_DISABLED,
+				pdev->name, info);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to request IRQ\n");
+		goto free_buf;
+	}
+
+	ret = pxa3xx_nand_detect_flash(info);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to detect flash\n");
+		ret = -ENODEV;
+		goto fail_free_io;
+	}
+
+	pxa3xx_nand_init_mtd(mtd, info);
+
+	platform_set_drvdata(pdev, mtd);
+
+	if (nand_scan(mtd, 1)) {
+		printk(KERN_ERR "Nand scan failed\n");
+		ret = -ENXIO;
+		goto free_irq;
+	}
+
+	return add_mtd_partitions(mtd, pdata->parts, pdata->nr_parts);
+free_irq:
+	free_irq(IRQ_NAND, info);
+free_buf:
+	pxa_free_dma(info->data_dma_ch);
+	dma_free_coherent(&pdev->dev, info->data_buff_size,
+			info->data_buff, info->data_buff_phys);
+fail_free_io:
+	iounmap(info->mmio_base);
+fail_free_res:
+	release_mem_region(res->start, res->end - res->start + 1);
+fail_put_clk:
+	clk_put(info->clk);
+free_mtd:
+	kfree(mtd);
+	return ret;
+}
+
+static int pxa3xx_nand_remove(struct platform_device *pdev)
+{
+	struct mtd_info *mtd = platform_get_drvdata(pdev);
+	struct pxa3xx_nand_info *info = mtd->priv;
+
+	platform_set_drvdata(pdev, NULL);
+
+	del_mtd_device(mtd);
+	del_mtd_partitions(mtd);
+	free_irq(IRQ_NAND, info);
+	if (use_dma) {
+		pxa_free_dma(info->data_dma_ch);
+		dma_free_writecombine(&pdev->dev, info->data_buff_size,
+				info->data_buff, info->data_buff_phys);
+	} else
+		kfree(info->data_buff);
+	kfree(mtd);
+	return 0;
+}
+
+#ifdef CONFIG_PM
+static int pxa3xx_nand_suspend(struct platform_device *pdev,
pm_message_t state)
+{
+	struct mtd_info *mtd = (struct mtd_info *)platform_get_drvdata(pdev);
+	struct pxa3xx_nand_info *info = mtd->priv;
+
+	if (info->state != STATE_READY) {
+		printk(KERN_ERR "current state is %d\n", info->state);
+		return -EAGAIN;
+	}
+	info->state = STATE_SUSPENDED;
+	/*
+	 * The PM code need read the mobm from NAND.
+	 * So the NAND clock can't be stop here.
+	 * The PM code will cover this.
+	 */
+	/* pxa_set_cken(CKEN_NAND, 0); */
+	return 0;
+}
+
+static int pxa3xx_nand_resume(struct platform_device *pdev)
+{
+	struct mtd_info *mtd = (struct mtd_info *)platform_get_drvdata(pdev);
+	struct pxa3xx_nand_info *info = mtd->priv;
+	int status;
+
+	if (info->state != STATE_SUSPENDED)
+		printk(KERN_WARNING "Error State after resume back\n");
+
+	info->state = STATE_READY;
+
+	clk_disable(info->clk);
+
+	status = pxa3xx_nand_config_flash(info);
+	if (status) {
+		dev_err(&pdev->dev, "failed to initialize\n");
+		return -ENXIO;
+	}
+	return 0;
+}
+#else
+#define pxa3xx_nand_suspend	NULL
+#define pxa3xx_nand_resume	NULL
+#endif
+
+static struct platform_driver pxa3xx_nand_driver = {
+	.driver = {
+		.name	= "pxa3xx-nand",
+	},
+	.probe		= pxa3xx_nand_probe,
+	.remove		= pxa3xx_nand_remove,
+	.suspend	= pxa3xx_nand_suspend,
+	.resume		= pxa3xx_nand_resume,
+};
+
+static int __init pxa3xx_nand_init(void)
+{
+	return platform_driver_register(&pxa3xx_nand_driver);
+}
+
+static void __exit pxa3xx_nand_exit(void)
+{
+	platform_driver_unregister(&pxa3xx_nand_driver);
+}
+
+module_init(pxa3xx_nand_init);
+module_exit(pxa3xx_nand_exit);
diff --git a/include/asm-arm/arch-pxa/pxa3xx_nand.h
b/include/asm-arm/arch-pxa/pxa3xx_nand.h
new file mode 100644
index 0000000..81a8937
--- /dev/null
+++ b/include/asm-arm/arch-pxa/pxa3xx_nand.h
@@ -0,0 +1,18 @@
+#ifndef __ASM_ARCH_PXA3XX_NAND_H
+#define __ASM_ARCH_PXA3XX_NAND_H
+
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/partitions.h>
+
+struct pxa3xx_nand_platform_data {
+
+	/* the data flash bus is shared between the Static Memory
+	 * Controller and the Data Flash Controller,  the arbiter
+	 * controls the ownership of the bus
+	 */
+	int	enable_arbiter;
+
+	struct mtd_partition *parts;
+	unsigned int	nr_parts;
+};
+#endif /* __ASM_ARCH_PXA3XX_NAND_H */


-- 
Cheers
- eric
