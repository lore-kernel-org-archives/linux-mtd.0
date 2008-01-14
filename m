Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JEICP-0000X9-Hs
	for linux-mtd@lists.infradead.org; Mon, 14 Jan 2008 05:49:41 +0000
Subject: [PATCH][MTD][NAND] PXA300 Zylonite controller support
From: Sergey Podstavin <podstavin@dev.rtsoft.ru>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Mon, 14 Jan 2008 08:44:35 +0300
Message-Id: <1200289475.1727.106.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: podstavin@dev.rtsoft.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a fixed version for pxa3 nand controller from eric miao, 
working on pxa300 Zylonite

Best wishes,
Sergey Podstavin.

>From 8e078f4fa24f5d3d8e7ee887f135f040dce0580f Mon Sep 17 00:00:00 2001
From: Sergey Podstavin <spodstavin@ru.mvista.com>
Date: Fri, 11 Jan 2008 09:46:30 +0300
Subject: [PATCH] fixed basic pxa3 nand controller support

---
 arch/arm/kernel/head.S                 |    6 +-
 arch/arm/mach-pxa/generic.c            |    6 +
 arch/arm/mach-pxa/pxa3xx.c             |    1 +
 arch/arm/mach-pxa/zylonite.c           |   21 +
 drivers/mtd/nand/Kconfig               |    6 +
 drivers/mtd/nand/Makefile              |    1 +
 drivers/mtd/nand/pxa3xx_nand.c         | 1419
++++++++++++++++++++++++++++++++
 include/asm-arm/arch-pxa/hardware.h    |   30 +-
 include/asm-arm/arch-pxa/pxa-regs.h    |   19 +
 include/asm-arm/arch-pxa/pxa3xx_nand.h |   18 +
 include/asm-arm/arch-pxa/zylonite.h    |  710 ++++++++++++++++
 11 files changed, 2212 insertions(+), 25 deletions(-)
 create mode 100644 drivers/mtd/nand/pxa3xx_nand.c
 create mode 100644 include/asm-arm/arch-pxa/pxa3xx_nand.h

diff --git a/arch/arm/kernel/head.S b/arch/arm/kernel/head.S
index 7898cbc..a89c0f2 100644
--- a/arch/arm/kernel/head.S
+++ b/arch/arm/kernel/head.S
@@ -86,9 +86,9 @@ ENTRY(stext)
 	bl	__lookup_processor_type		@ r5=procinfo r9=cpuid
 	movs	r10, r5				@ invalid processor (r5=0)?
 	beq	__error_p			@ yes, error 'p'
-	bl	__lookup_machine_type		@ r5=machinfo
-	movs	r8, r5				@ invalid machine (r5=0)?
-	beq	__error_a			@ yes, error 'a'
+//	bl	__lookup_machine_type		@ r5=machinfo
+//	movs	r8, r5				@ invalid machine (r5=0)?
+//	beq	__error_a			@ yes, error 'a'
 	bl	__vet_atags
 	bl	__create_page_tables
 
diff --git a/arch/arm/mach-pxa/generic.c b/arch/arm/mach-pxa/generic.c
index 1c34946..4b0f6ea 100644
--- a/arch/arm/mach-pxa/generic.c
+++ b/arch/arm/mach-pxa/generic.c
@@ -195,6 +195,11 @@ static struct map_desc standard_io_desc[]
__initdata = {
 		.pfn		= __phys_to_pfn(0x40000000),
 		.length		= 0x02000000,
 		.type		= MT_DEVICE
+	}, {	/* nand               */
+		.virtual	= 0xf8300000,
+		.pfn		= __phys_to_pfn(0x43100000),
+		.length		= 0x00100000,
+		.type		= MT_DEVICE
 	}, {	/* LCD */
 		.virtual	=  0xf4000000,
 		.pfn		= __phys_to_pfn(0x44000000),
@@ -471,6 +476,7 @@ void __init pxa_set_ficp_info(struct
pxaficp_platform_data *info)
 	pxa_device_ficp.dev.platform_data = info;
 }
 
+
 struct platform_device pxa_device_rtc = {
 	.name		= "sa1100-rtc",
 	.id		= -1,
diff --git a/arch/arm/mach-pxa/pxa3xx.c b/arch/arm/mach-pxa/pxa3xx.c
index 61d9c9d..4d800c6 100644
--- a/arch/arm/mach-pxa/pxa3xx.c
+++ b/arch/arm/mach-pxa/pxa3xx.c
@@ -183,6 +183,7 @@ static struct clk pxa3xx_clks[] = {
 	PXA3xx_CK("LCDCLK", LCD,    &clk_pxa3xx_hsio_ops, &pxa_device_fb.dev),
 	PXA3xx_CK("CAMCLK", CAMERA, &clk_pxa3xx_hsio_ops, NULL),
 
+	PXA3xx_CK("NANDCLK", NAND, &clk_pxa3xx_hsio_ops, NULL),
 	PXA3xx_CKEN("UARTCLK", FFUART, 14857000, 1, &pxa_device_ffuart.dev),
 	PXA3xx_CKEN("UARTCLK", BTUART, 14857000, 1, &pxa_device_btuart.dev),
 	PXA3xx_CKEN("UARTCLK", STUART, 14857000, 1, NULL),
diff --git a/arch/arm/mach-pxa/zylonite.c b/arch/arm/mach-pxa/zylonite.c
index 743a87b..dc761bd 100644
--- a/arch/arm/mach-pxa/zylonite.c
+++ b/arch/arm/mach-pxa/zylonite.c
@@ -156,6 +156,26 @@ static void __init zylonite_init_lcd(void)
 static inline void zylonite_init_lcd(void) {}
 #endif
 
+static struct resource nand_resources[] = {
+	[0] = {
+		.start	= 0x43100000,
+		.end	= 0x431000ff,
+		.flags	= IORESOURCE_MEM,
+	},
+	[1] = {
+		.start	= -1,	/* for run-time assignment */
+		.end	= -1,
+		.flags	= IORESOURCE_IRQ,
+	}
+};
+
+static struct platform_device nand_device = {
+	.name		= "pxa3xx-nand",
+	.id		= 0,
+	.num_resources	= ARRAY_SIZE(nand_resources),
+	.resource	= nand_resources,
+};
+
 static void __init zylonite_init(void)
 {
 	/* board-processor specific initialization */
@@ -171,6 +191,7 @@ static void __init zylonite_init(void)
 	platform_device_register(&smc91x_device);
 
 	zylonite_init_lcd();
+	platform_device_register(&nand_device);
 }
 
 MACHINE_START(ZYLONITE, "PXA3xx Platform Development Kit (aka
Zylonite)")
diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 246d451..2be073f 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -84,6 +84,12 @@ config MTD_NAND_TS7250
 config MTD_NAND_IDS
 	tristate
 
+config MTD_NAND_PXA3xx
+	tristate "NAND flash support for PXA3xx"
+	depends on MTD_NAND && PXA3xx
+	help
+	  This enables the driver for the NAND flash device on Zylonite board
+
 config MTD_NAND_AU1550
 	tristate "Au1550/1200 NAND support"
 	depends on SOC_AU1200 || SOC_AU1550
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index 3ad6c01..ecb7968 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_MTD_NAND_BF5XX)		+= bf5xx_nand.o
 obj-$(CONFIG_MTD_NAND_PPCHAMELEONEVB)	+= ppchameleonevb.o
 obj-$(CONFIG_MTD_NAND_S3C2410)		+= s3c2410.o
 obj-$(CONFIG_MTD_NAND_DISKONCHIP)	+= diskonchip.o
+obj-$(CONFIG_MTD_NAND_PXA3xx)		+= pxa3xx_nand.o
 obj-$(CONFIG_MTD_NAND_H1900)		+= h1910.o
 obj-$(CONFIG_MTD_NAND_RTC_FROM4)	+= rtc_from4.o
 obj-$(CONFIG_MTD_NAND_SHARPSL)		+= sharpsl.o
diff --git a/drivers/mtd/nand/pxa3xx_nand.c
b/drivers/mtd/nand/pxa3xx_nand.c
new file mode 100644
index 0000000..74c5460
--- /dev/null
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -0,0 +1,1419 @@
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
+MODULE_PARM_DESC(use_dma, "enable DMA for data transfering to/from NAND
HW");
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
+static int wait_for_event(struct pxa3xx_nand_info *info, uint32_t
event)
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
+	info->ndcb0 |= NDCB0_ADDR_CYC(f->row_addr_cycles +
f->col_addr_cycles);
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
+static int prepare_other_cmd(struct pxa3xx_nand_info *info, uint16_t
cmd)
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
+static void enable_int(struct pxa3xx_nand_info *info, uint32_t
int_mask)
+{
+	uint32_t ndcr;
+
+	ndcr = nand_readl(info, NDCR);
+	nand_writel(info, NDCR, ndcr & ~int_mask);
+}
+
+static void disable_int(struct pxa3xx_nand_info *info, uint32_t
int_mask)
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
+static int pxa3xx_nand_do_cmd(struct pxa3xx_nand_info *info, uint32_t
event)
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
+static void pxa3xx_nand_read_buf(struct mtd_info *mtd, uint8_t *buf,
int len)
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
+static int pxa3xx_nand_waitfunc(struct mtd_info *mtd, struct nand_chip
*this)
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
+	ndcr |= NDCR_ND_ARB_EN;
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
+/*
+ * BootRom and XDB will use last 127 block, and they will keep all the
status
+ * of the bootloader and image, so skip the first 2M size and last 2M
size
+ */
+static struct mtd_partition partition_info[] = {
+	{
+		name:		"Bootloader",
+		offset:		0,
+		mask_flags:	MTD_WRITEABLE  /* force read-only */
+	},{
+		name:		"Kernel",
+		size:		0x00200000,
+		mask_flags:	MTD_WRITEABLE  /* force read-only */
+	},{
+		name:		"Filesystem",
+		size:		0x03000000,	/* only mount 48M fs */
+	}, {
+		name:		"MassStorage",
+		size:		0x0, /* It will be set at probe function */
+		offset:		MTDPART_OFS_APPEND /* Append after fs section */
+	}, {
+		name:		"BBT",
+		size:		0x0, /* It will be set at probe function */
+		offset:		MTDPART_OFS_APPEND,/* Append after fs section */
+		mask_flags:	MTD_WRITEABLE  /* force read-only */
+	}
+};
+
+#define		PART_NUM	ARRAY_SIZE(partition_info)
+
+/* MHN_OBM_V2 is related to BBT in MOBM V2
+ * MHN_OBM_V3 is related to BBT in MOBM V3
+ */
+enum {
+	MHN_OBM_NULL = 0,
+	MHN_OBM_V1,
+	MHN_OBM_V2,
+	MHN_OBM_V3,
+	MHN_OBM_INVAL
+} MHN_OBM_TYPE;
+
+static uint8_t scan_ff_pattern[] = { 0xff, 0xff };
+static uint8_t scan_main_bbt_pattern[] = { 'p', 'x', 'a', '1' };
+static uint8_t scan_mirror_bbt_pattern[] = { '0', 'a', 'x', 'p' };
+
+static struct nand_bbt_descr monahans_bbt_default = {
+	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
+			| NAND_BBT_2BIT | NAND_BBT_VERSION,
+	.maxblocks = 2,
+	.len = 2,
+	.offs = 0,
+	.pattern = scan_ff_pattern,
+};
+
+static struct nand_bbt_descr monahans_bbt_main = {
+	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
+			| NAND_BBT_2BIT | NAND_BBT_VERSION,
+	.veroffs = 6,
+	.maxblocks = 2,
+        .offs = 2,
+        .len = 4,
+        .pattern = scan_main_bbt_pattern,
+};
+
+static struct nand_bbt_descr monahans_bbt_mirror = {
+	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
+			| NAND_BBT_2BIT | NAND_BBT_VERSION,
+	.veroffs = 6,
+	.maxblocks = 2,
+        .offs = 2,
+        .len = 4,
+        .pattern = scan_mirror_bbt_pattern,
+};
+
+/*
+ * The relocation table management is different between MOBM V2 and V3.
+ *
+ * MOBM V2 is applied on chips taped out before MhnLV A0.
+ * MOBM V3 is applied on chips taped out after MhnLV A0. It's also
applied
+ * on MhnLV A0.
+ */
+static int calc_obm_ver(void)
+{
+	unsigned int	cpuid;
+	
+	cpuid = read_cpuid(CPUID_ID);
+	/* It's not xscale chip. */
+	if ((cpuid & 0xFFFF0000) != 0x69050000)
+		return MHN_OBM_INVAL;
+	/* It's MhnP Ax */
+	if ((cpuid & 0x0000FFF0) == 0x00006420)
+		return MHN_OBM_V2;
+	/* It's MhnP Bx */
+	if ((cpuid & 0x0000FFF0) == 0x00006820) {
+		if ((cpuid & 0x0F) <= 6)
+			return MHN_OBM_V2;
+		else
+			return MHN_OBM_V3;
+	}
+	/* It's MhnL Ax */
+	if ((cpuid & 0x0000FFF0) == 0x00006880) {
+		if ((cpuid & 0x0F) == 0)
+			return MHN_OBM_V2;
+		else
+			return MHN_OBM_V3;
+	}
+	/* It's MhnLV Ax */
+	if ((cpuid & 0x0000FFF0) == 0x00006890)
+		return MHN_OBM_V3;
+	return MHN_OBM_INVAL;
+}
+static int pxa3xx_nand_probe(struct platform_device *pdev)
+{
+	struct pxa3xx_nand_info *info;
+	struct nand_chip *this;
+	struct mtd_info *mtd;
+	struct resource *res;
+	int ret = 0;
+	int obm;
+
+	mtd = kzalloc(sizeof(struct mtd_info) + sizeof(struct
pxa3xx_nand_info),
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
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (res == NULL) {
+		dev_err(&pdev->dev, "no IO memory resource defined\n");
+		ret = -ENODEV;
+		goto fail_put_clk;
+	}
+	res = request_mem_region(res->start, res->end - res->start + 1,
+			pdev->name);
+	if (res == NULL) {
+		dev_err(&pdev->dev, "failed to request memory resource\n");
+		ret = -EBUSY;
+		goto fail_put_clk;
+	}
+	info->mmio_base = ioremap(res->start, res->end - res->start + 1);
+	if (info->mmio_base == NULL) {
+		dev_err(&pdev->dev, "ioremap() failed\n");
+		ret = -ENODEV;
+		goto fail_free_res;
+	}
+	ret = pxa3xx_nand_init_buff(info);
+	if (ret)
+		goto fail_free_io;
+	ret = request_irq(IRQ_NAND, pxa3xx_nand_irq, IRQF_DISABLED,
+				pdev->name, info);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to request IRQ\n");
+		goto free_buf;
+	}
+	ret = pxa3xx_nand_detect_flash(info);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to detect flash\n");
+		ret = -ENODEV;
+		goto fail_free_io;
+	}
+	pxa3xx_nand_init_mtd(mtd, info);
+	platform_set_drvdata(pdev, mtd);
+	if (nand_scan(mtd, 1)) {
+		printk(KERN_ERR "Nand scan failed\n");
+		ret = -ENXIO;
+		goto free_irq;
+	}
+
+	/* There is a potential limitation that no more partition can be
+	 * added between MassStorage and BBT(last block).
+	 *
+	 * The last 127 blocks is reserved for relocation table, they aren't
+	 * statistical data of mtd size and chip size.
+	 *
+	 * BBT partitions contains 4 blocks. Two blocks are used to store
+	 * main descriptor, the other two are used to store mirror descriptor.
+	 */
+
+	/* boot loader partition */
+	obm = calc_obm_ver();
+	if (obm == MHN_OBM_V3) {
+		partition_info[0].size = 0x60000;
+	}else{
+		partition_info[0].size = 0x40000;
+	}
+
+	/* kernel partition */
+	partition_info[1].offset = partition_info[0].offset +
partition_info[0].size;
+
+	/* rootfs partition */
+	partition_info[2].offset = partition_info[1].offset +
partition_info[1].size;
+
+	/* bbt partition */
+	partition_info[PART_NUM - 1].size = (monahans_bbt_main.maxblocks
+					+ monahans_bbt_mirror.maxblocks)
+					<< this->phys_erase_shift;
+	partition_info[PART_NUM - 1].offset = this->chipsize
+					- partition_info[PART_NUM - 1].size;
+
+	/* mass storage partition */
+	partition_info[PART_NUM - 2].offset = partition_info[PART_NUM -
3].offset
+					+ partition_info[PART_NUM - 3].size;
+	partition_info[PART_NUM - 2].size = this->chipsize
+					- partition_info[PART_NUM - 2].offset
+					- partition_info[PART_NUM - 1].size;
+
+	return add_mtd_partitions(mtd, partition_info, PART_NUM);
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
+	status = pxa3xx_nand_config_flash(info, info->flash_info);
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
diff --git a/include/asm-arm/arch-pxa/hardware.h
b/include/asm-arm/arch-pxa/hardware.h
index ab2d963..6e8b6b5 100644
--- a/include/asm-arm/arch-pxa/hardware.h
+++ b/include/asm-arm/arch-pxa/hardware.h
@@ -41,10 +41,12 @@
  */
 #define io_p2v(x) (0xf2000000 + ((x) & 0x01ffffff) + (((x) &
0x1c000000) >> 1))
 #define io_v2p(x) (0x3c000000 + ((x) & 0x01ffffff) + (((x) &
0x0e000000) << 1))
-
+#define io_p2v_2(x)	(((((x) - 0x42000000) & 0xff000000) >> 3) +
0xf8000000\
+ 			+ ((x) & 0x001fffff))
 #ifndef __ASSEMBLY__
 
 # define __REG(x)	(*((volatile u32 *)io_p2v(x)))
+#define __REG_2(x)	(*((volatile u32 *)io_p2v_2(x)))
 
 /* With indexed regs we don't want to feed the index through io_p2v()
    especially if it is a variable, otherwise horrible code will result.
*/
@@ -90,31 +92,19 @@
 #endif
 
 #ifdef CONFIG_CPU_PXA300
-#define __cpu_is_pxa300(id)				\
-	({						\
-		unsigned int _id = (id) >> 4 & 0xfff;	\
-		_id == 0x688;				\
-	 })
+#define __cpu_is_pxa300(id)	(1)
 #else
 #define __cpu_is_pxa300(id)	(0)
 #endif
 
 #ifdef CONFIG_CPU_PXA310
-#define __cpu_is_pxa310(id)				\
-	({						\
-		unsigned int _id = (id) >> 4 & 0xfff;	\
-		_id == 0x689;				\
-	 })
+#define __cpu_is_pxa310(id)	(0)
 #else
 #define __cpu_is_pxa310(id)	(0)
 #endif
 
-#ifdef CONFIG_CPU_PXA320
-#define __cpu_is_pxa320(id)				\
-	({						\
-		unsigned int _id = (id) >> 4 & 0xfff;	\
-		_id == 0x603 || _id == 0x682;		\
-	 })
+#ifdef CONFIG_CPU_PXA320	
+#define __cpu_is_pxa320(id)	(0)
 #else
 #define __cpu_is_pxa320(id)	(0)
 #endif
@@ -166,11 +156,7 @@
 		_id <= 0x2;				\
 	 })
 
-#define __cpu_is_pxa3xx(id)				\
-	({						\
-		unsigned int _id = (id) >> 13 & 0x7;	\
-		_id == 0x3;				\
-	 })
+#define __cpu_is_pxa3xx(id)	(1)
 
 #define cpu_is_pxa2xx()					\
 	({						\
diff --git a/include/asm-arm/arch-pxa/pxa-regs.h
b/include/asm-arm/arch-pxa/pxa-regs.h
index 6b33df6..9f1a32b 100644
--- a/include/asm-arm/arch-pxa/pxa-regs.h
+++ b/include/asm-arm/arch-pxa/pxa-regs.h
@@ -159,6 +159,21 @@
 #define DRCMR68		__REG(0x40001110)  /* Request to Channel Map Register
for Camera FIFO 0 Request */
 #define DRCMR69		__REG(0x40001114)  /* Request to Channel Map Register
for Camera FIFO 1 Request */
 #define DRCMR70		__REG(0x40001118)  /* Request to Channel Map Register
for Camera FIFO 2 Request */
+#define DRCMR71		__REG(0x4000111C)  /* Request to Channel Map Register
for TPM Receive Request */
+#define DRCMR72		__REG(0x40001120)  /* Request to Channel Map Register
for TPM Transmit Request 1 */
+#define DRCMR73		__REG(0x40001124)  /* Request to Channel Map Register
for TPM Transmit Request 2 */
+#define DRCMR74		__REG(0x40001128)  /* Request to Channel Map Register
for DREQ<2> */
+#define DRCMR91		__REG(0x4000116C)  /* Request to Channel Map Register
for USIM 2 Receive Request */
+#define DRCMR92		__REG(0x40001170)  /* Request to Channel Map Register
for USIM 2 Transmit Request */
+#define DRCMR93		__REG(0x40001174)  /* Request to Channel Map Register
for MMC Controller 1 Request */
+#define DRCMR94		__REG(0x40001178)  /* Request to Channel Map Register
for MMC Controller 2 Request */
+#define DRCMR95		__REG(0x4000117C)  /* Request to Channel Map Register
for AC97 Surround Transmit Request */
+#define DRCMR96		__REG(0x40001180)  /* Request to Channel Map Register
for AC97 centre/LFE Transmit Request */
+#define DRCMR97		__REG(0x40001184)  /* Request to Channel Map Register
for NAND interface data transmit & receive Request */
+#define DRCMR98		__REG(0x40001188)  /* Reserved */
+#define DRCMR99		__REG(0x4000118C)  /* Request to Channel Map Register
for NAND interface command transmit Request */
+#define DRCMR100	__REG(0x40001190)  /* Request to Channel Map Register
for MMC Controller 3 Request */
+#define DRCMR101	__REG(0x40001194)  /* Request to Channel Map Register
for MMC Controller 3 Request */
 
 #define DRCMRRXSADR	DRCMR2
 #define DRCMRTXSADR	DRCMR3
@@ -1780,6 +1795,8 @@
 #define OSCC		__REG(0x41300008)  /* Oscillator Configuration Register
*/
 #define CCSR		__REG(0x4130000C)  /* Core Clock Status Register */
 
+#define	CKEN_NAND	4	/* < NAND Flash Controller Clock Enable */
+
 #define CCCR_N_MASK	0x0380		/* Run Mode Frequency to Turbo Mode
Frequency Multiplier */
 #define CCCR_M_MASK	0x0060		/* Memory Frequency to Run Mode Frequency
Multiplier */
 #define CCCR_L_MASK	0x001f		/* Crystal Frequency to Memory Frequency
Multiplier */
@@ -2035,6 +2052,8 @@
 #define MDMRS		__REG(0x48000040)  /* MRS value to be written to SDRAM
*/
 #define BOOT_DEF	__REG(0x48000044)  /* Read-Only Boot-Time Register.
Contains BOOT_SEL and PKG_SEL */
 
+#define MECR_CIT	(1 << 1)	/* Card Is There: 0 -> no card, 1 -> card
inserted */
+
 /*
  * More handy macros for PCMCIA
  *
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
diff --git a/include/asm-arm/arch-pxa/zylonite.h
b/include/asm-arm/arch-pxa/zylonite.h
index f58b591..9516f2e 100644
--- a/include/asm-arm/arch-pxa/zylonite.h
+++ b/include/asm-arm/arch-pxa/zylonite.h
@@ -1,5 +1,715 @@
 #ifndef __ASM_ARCH_ZYLONITE_H
 #define __ASM_ARCH_ZYLONITE_H
+#include <asm/arch/mfp.h>
+
+#define MFP_RDY					(MFP_PIN_GPIO0)
+#define MFP_RDY_AF				(MFP_PIN_GPIO0_AF_DF_RDY)
+
+#define MFP_FLASH_NOR_CS_N_GPIO			(MFP_PIN_GPIO1)
+#define MFP_FLASH_NOR_CS_N_GPIO_AF		(MFP_PIN_GPIO1_AF_nCS2)
+
+#define MFP_DEBUG_ETH_CS_N_GPIO			(MFP_PIN_GPIO2)
+#define	MFP_DEBUG_ETH_CS_N_GPIO_AF		(MFP_PIN_GPIO2_AF_nCS3)
+
+#define MFP_MMC_DAT0				(MFP_PIN_GPIO3)
+#define MFP_MMC_DAT0_AF				(MFP_PIN_GPIO3_AF_MM1_DAT0)
+
+#define MFP_MMC_DAT1				(MFP_PIN_GPIO4)
+#define MFP_MMC_DAT1_AF				(MFP_PIN_GPIO4_AF_MM1_DAT1)
+
+#define MFP_MMC_DAT2				(MFP_PIN_GPIO5)
+#define MFP_MMC_DAT2_AF				(MFP_PIN_GPIO5_AF_MM1_DAT2)
+
+#define MFP_MMC_DAT3				(MFP_PIN_GPIO6)
+#define MFP_MMC_DAT3_AF				(MFP_PIN_GPIO6_AF_MM1_DAT3)
+
+#define MFP_MMC_CLK				(MFP_PIN_GPIO7)
+#define MFP_MMC_CLK_AF				(MFP_PIN_GPIO7_AF_MM1_CLK)
+
+#define MFP_MMC_CMD_0				(MFP_PIN_GPIO8)
+#define MFP_MMC_CMD_0_AF			(MFP_PIN_GPIO8_AF_MM1_CMD)
+
+#define MFP_MMC2_DAT0				(MFP_PIN_GPIO9)
+#define MFP_MMC2_DAT0_AF			(MFP_PIN_GPIO9_AF_MM2_DAT0)
+
+#define MFP_MMC2_DAT1				(MFP_PIN_GPIO10)
+#define MFP_MMC2_DAT1_AF			(MFP_PIN_GPIO10_AF_MM2_DAT1)
+
+#define MFP_MMC2_DAT2_CS0			(MFP_PIN_GPIO11)
+#define MFP_MMC2_DAT2_CS0_AF			(MFP_PIN_GPIO11_AF_MM2_DAT2)
+
+#define MFP_MMC2_DAT3_CS1			(MFP_PIN_GPIO12)
+#define MFP_MMC2_DAT3_CS1_AF			(MFP_PIN_GPIO12_AF_MM2_DAT3)
+
+
+#define MFP_MMC2_CLK				(MFP_PIN_GPIO13)
+#define MFP_MMC2_CLK_AF				(MFP_PIN_GPIO13_AF_MM2_CLK)
+
+#define MFP_MMC2_CMD				(MFP_PIN_GPIO14)
+#define MFP_MMC2_CMD_AF				(MFP_PIN_GPIO14_AF_MM2_CMD)
+
+#define MFP_MMC_CMD_1				(MFP_PIN_GPIO15)
+#define MFP_MMC_CMD_1_AF			(MFP_PIN_GPIO15_AF_MM1_CMD)
+
+#define MFP_CIR_ON_PWM				(MFP_PIN_GPIO16)
+#define MFP_CIR_ON_PWM_AF			(MFP_PIN_GPIO16_AF_CIR_OUT)
+
+#define MFP_RSVD_PWM_0				(MFP_PIN_GPIO17)
+#define MFP_RSVD_PWM_0_AF			(MFP_PIN_GPIO17_AF_PWM0_OUT)
+
+#define MFP_RSVD_AC97_SDATA_IN_0		(MFP_PIN_GPIO17)
+#define MFP_RSVD_AC97_SDATA_IN_0_AF
(MFP_PIN_GPIO17_AF_AC97_SDATA_IN_2)
+
+#define MFP_GPIO_EXP_0_N			(MFP_PIN_GPIO18)
+#define MFP_GPIO_EXP_0_N_AF			(MFP_PIN_GPIO18_AF_GPIO_18)
+
+#define MFP_GPIO_EXP_1_N			(MFP_PIN_GPIO19)
+#define MFP_GPIO_EXP_1_N_AF			(MFP_PIN_GPIO19_AF_GPIO_19)
+
+#define MFP_BACKLIGHT_PWM			(MFP_PIN_GPIO20)
+#define MFP_BACKLIGHT_PWM_AF			(MFP_PIN_GPIO20_AF_GPIO_20)
+
+#define MFP_SCL					(MFP_PIN_GPIO21)
+#define MFP_SCL_AF				(MFP_PIN_GPIO21_AF_I2C_SCL)
+
+#define MFP_SDA					(MFP_PIN_GPIO22)
+#define MFP_SDA_AF				(MFP_PIN_GPIO22_AF_I2C_SDA)
+
+#define MFP_AC97_nACRESET			(MFP_PIN_GPIO23)
+#define MFP_AC97_nACRESET_AF			(MFP_PIN_GPIO23_AF_AC97_RESET)
+
+#define MFP_AC97_SYSCLK				(MFP_PIN_GPIO24)
+#define MFP_AC97_SYSCLK_AF			(MFP_PIN_GPIO24_AF_AC97_SYSCLK)
+
+#define MFP_AC97_SDATA_IN_0			(MFP_PIN_GPIO25)
+#define MFP_AC97_SDATA_IN_0_AF			(MFP_PIN_GPIO25_AF_AC97_SDATA_IN_0)
+
+#define MFP_SSP_2_CLK				(MFP_PIN_GPIO25)
+#define MFP_SSP_2_CLK_AF			(MFP_PIN_GPIO25_AF_SSP2_SCLK)
+
+#define MFP_AC97_INT_N_GPIO			(MFP_PIN_GPIO26)
+#define MFP_AC97_INT_N_GPIO_AF			(MFP_PIN_GPIO26_AF_GPIO_26)
+
+#define MFP_SSP_2_FRM				(MFP_PIN_GPIO26)
+#define MFP_SSP_2_FRM_AF			(MFP_PIN_GPIO26_AF_SSP2_FRM)
+
+#define MFP_AC97_SDATA_OUT			(MFP_PIN_GPIO27)
+#define MFP_AC97_SDATA_OUT_AF			(MFP_PIN_GPIO27_AF_AC97_SDATA_OUT)
+
+#define MFP_SSP_2_TXD				(MFP_PIN_GPIO27)
+#define MFP_SSP_2_TXD_AF			(MFP_PIN_GPIO27_AF_SSP2_TXD)
+
+#define MFP_AC97_SYNC				(MFP_PIN_GPIO28)
+#define MFP_AC97_SYNC_AF			(MFP_PIN_GPIO28_AF_AC97_SYNC)
+
+#define MFP_SSP_2_RXD				(MFP_PIN_GPIO28)
+#define MFP_SSP_2_RXD_AF			(MFP_PIN_GPIO28_AF_SSP2_RXD)
+
+#define MFP_AC97_AC97_BITCLK			(MFP_PIN_GPIO29)
+#define MFP_AC97_AC97_BITCLK_AF			(MFP_PIN_GPIO29_AF_AC97_BITCLK)
+
+#define MFP_FFRXD				(MFP_PIN_GPIO30)
+#define MFP_FFRXD_AF				(MFP_PIN_GPIO30_AF_UART1_RXD)
+
+#define MFP_FFTXD				(MFP_PIN_GPIO31)
+#define MFP_FFTXD_AF				(MFP_PIN_GPIO31_AF_UART1_TXD)
+
+#define MFP_FFCTS				(MFP_PIN_GPIO32)
+#define MFP_FFCTS_AF				(MFP_PIN_GPIO32_AF_UART1_CTS)
+
+#define MFP_FFDCD				(MFP_PIN_GPIO33)
+#define MFP_FFDCD_AF				(MFP_PIN_GPIO33_AF_UART1_DCD)
+
+#define MFP_FFDSR				(MFP_PIN_GPIO34)
+#define MFP_FFDSR_AF				(MFP_PIN_GPIO34_AF_UART1_DSR)
+
+#define MFP_FFRI				(MFP_PIN_GPIO35)
+#define MFP_FFRI_AF				(MFP_PIN_GPIO35_AF_UART1_RI)
+
+#define MFP_FFDTR				(MFP_PIN_GPIO36)
+#define MFP_FFDTR_AF				(MFP_PIN_GPIO36_AF_UART1_DTR)
+
+#define MFP_FFRTS				(MFP_PIN_GPIO37)
+#define MFP_FFRTS_AF				(MFP_PIN_GPIO37_AF_UART1_RTS)
+
+#define MFP_U2D_UTM_CLK				(MFP_PIN_GPIO38)
+#define MFP_U2D_UTM_CLK_AF			(MFP_PIN_GPIO38_AF_UTM_CLK)
+
+#define MFP_CIF_DD_0				(MFP_PIN_GPIO39)
+#define MFP_CIF_DD_0_AF				(MFP_PIN_GPIO39_AF_CI_DD_0)
+
+#define MFP_U2D_DATA0				(MFP_PIN_GPIO39)
+#define MFP_U2D_DATA0_AF			(MFP_PIN_GPIO39_AF_UTM_PHYDATA_OUT_0)
+
+#define MFP_CIF_DD_1				(MFP_PIN_GPIO40)
+#define MFP_CIF_DD_1_AF				(MFP_PIN_GPIO40_AF_CI_DD_1)
+
+#define MFP_U2D_DATA1				(MFP_PIN_GPIO40)
+#define MFP_U2D_DATA1_AF			(MFP_PIN_GPIO40_AF_UTM_PHYDATA_OUT_1)
+
+#define MFP_CIF_DD_2				(MFP_PIN_GPIO41)
+#define MFP_CIF_DD_2_AF				(MFP_PIN_GPIO41_AF_CI_DD_2)
+
+#define MFP_U2D_DATA2				(MFP_PIN_GPIO41)
+#define MFP_U2D_DATA2_AF			(MFP_PIN_GPIO41_AF_UTM_PHYDATA_OUT_2)
+
+#define MFP_CIF_DD_3				(MFP_PIN_GPIO42)
+#define MFP_CIF_DD_3_AF				(MFP_PIN_GPIO42_AF_CI_DD_3)
+
+#define MFP_U2D_DATA3				(MFP_PIN_GPIO42)
+#define MFP_U2D_DATA3_AF			(MFP_PIN_GPIO42_AF_UTM_PHYDATA_OUT_3)
+
+#define MFP_CIF_DD_4				(MFP_PIN_GPIO43)
+#define MFP_CIF_DD_4_AF				(MFP_PIN_GPIO43_AF_CI_DD_4)
+
+#define MFP_U2D_DATA4				(MFP_PIN_GPIO43)
+#define MFP_U2D_DATA4_AF			(MFP_PIN_GPIO43_AF_UTM_PHYDATA_OUT_4)
+
+#define MFP_CIF_DD_5				(MFP_PIN_GPIO44)
+#define MFP_CIF_DD_5_AF				(MFP_PIN_GPIO44_AF_CI_DD_5)
+
+#define MFP_U2D_DATA5				(MFP_PIN_GPIO44)
+#define MFP_U2D_DATA5_AF			(MFP_PIN_GPIO44_AF_UTM_PHYDATA_OUT_5)
+
+#define MFP_CIF_DD_6				(MFP_PIN_GPIO45)
+#define MFP_CIF_DD_6_AF				(MFP_PIN_GPIO45_AF_CI_DD_6)
+
+#define MFP_U2D_DATA6				(MFP_PIN_GPIO45)
+#define MFP_U2D_DATA6_AF			(MFP_PIN_GPIO45_AF_UTM_PHYDATA_OUT_6)
+
+#define MFP_CIF_DD_7				(MFP_PIN_GPIO46)
+#define MFP_CIF_DD_7_AF				(MFP_PIN_GPIO46_AF_CI_DD_7)
+
+#define MFP_U2D_DATA7				(MFP_PIN_GPIO46)
+#define MFP_U2D_DATA7_AF			(MFP_PIN_GPIO46_AF_UTM_PHYDATA_OUT_7)
+
+#define MFP_CIF_DD_8				(MFP_PIN_GPIO47)
+#define MFP_CIF_DD_8_AF				(MFP_PIN_GPIO47_AF_CI_DD_8)
+
+#define MFP_U2D_RXACTIVE			(MFP_PIN_GPIO47)
+#define MFP_U2D_RXACTIVE_AF			(MFP_PIN_GPIO47_AF_UTM_RXACTIVE)
+
+#define MFP_CIF_DD_9				(MFP_PIN_GPIO48)
+#define MFP_CIF_DD_9_AF				(MFP_PIN_GPIO48_AF_CI_DD_9)
+
+#define MFP_U2D_RXVALID				(MFP_PIN_GPIO48)
+#define MFP_U2D_RXVALID_AF			(MFP_PIN_GPIO48_AF_UTM_RXVALID)
+
+#define MFP_CIF_MCLK				(MFP_PIN_GPIO49)
+#define MFP_CIF_MCLK_AF				(MFP_PIN_GPIO49_AF_CI_MCLK)
+
+#define MFP_CIF_PCLK				(MFP_PIN_GPIO50)
+#define MFP_CIF_PCLK_AF				(MFP_PIN_GPIO50_AF_CI_PCLK)
+
+#define MFP_U2D_RXERROR				(MFP_PIN_GPIO50)
+#define MFP_U2D_RXERROR_AF			(MFP_PIN_GPIO50_AF_UTM_RXERROR)
+
+#define MFP_CIF_HSYNC				(MFP_PIN_GPIO51)
+#define MFP_CIF_HSYNC_AF			(MFP_PIN_GPIO51_AF_CI_LV)
+
+#define MFP_U2D_OPMODE0				(MFP_PIN_GPIO51)
+#define MFP_U2D_OPMODE0_AF			(MFP_PIN_GPIO51_AF_UTM_OPMODE_PF_0)
+
+#define MFP_CIF_VSYNC				(MFP_PIN_GPIO52)
+#define MFP_CIF_VSYNC_AF			(MFP_PIN_GPIO52_AF_CI_FV)
+
+#define MFP_U2D_TXVALID				(MFP_PIN_GPIO52)
+#define MFP_U2D_TXVALID_AF			(MFP_PIN_GPIO52_AF_TXVALID)
+
+#define MFP_U2D_TXREADY				(MFP_PIN_GPIO53)
+#define MFP_U2D_TXREADY_AF			(MFP_PIN_GPIO53_AF_UTM_TXREADY)
+
+#define MFP_L_DD_0				(MFP_PIN_GPIO54)
+#define MFP_L_DD_0_AF				(MFP_PIN_GPIO54_AF_LCD_LDD_0)
+
+#define MFP_L_LP_DD_0				(MFP_PIN_GPIO54)
+#define MFP_L_LP_DD_0_AF			(MFP_PIN_GPIO54_AF_LCD_LDD_0)
+
+#define MFP_L_DD_1				(MFP_PIN_GPIO55)
+#define MFP_L_DD_1_AF				(MFP_PIN_GPIO55_AF_LCD_LDD_1)
+
+#define MFP_L_LP_DD_1				(MFP_PIN_GPIO55)
+#define MFP_L_LP_DD_1_AF			(MFP_PIN_GPIO55_AF_LCD_LDD_1)
+
+#define MFP_L_DD_2				(MFP_PIN_GPIO56)
+#define MFP_L_DD_2_AF				(MFP_PIN_GPIO56_AF_LCD_LDD_2)
+
+#define MFP_L_LP_DD_2				(MFP_PIN_GPIO56)
+#define MFP_L_LP_DD_2_AF			(MFP_PIN_GPIO56_AF_LCD_LDD_2)
+
+#define MFP_L_DD_3				(MFP_PIN_GPIO57)
+#define MFP_L_DD_3_AF				(MFP_PIN_GPIO57_AF_LCD_LDD_3)
+
+#define MFP_L_LP_DD_3				(MFP_PIN_GPIO57)
+#define MFP_L_LP_DD_3_AF			(MFP_PIN_GPIO57_AF_LCD_LDD_3)
+
+#define MFP_L_DD_4				(MFP_PIN_GPIO58)
+#define MFP_L_DD_4_AF				(MFP_PIN_GPIO58_AF_LCD_LDD_4)
+
+#define MFP_L_LP_DD_4				(MFP_PIN_GPIO58)
+#define MFP_L_LP_DD_4_AF			(MFP_PIN_GPIO58_AF_LCD_LDD_4)
+
+#define MFP_L_DD_5				(MFP_PIN_GPIO59)
+#define MFP_L_DD_5_AF				(MFP_PIN_GPIO59_AF_LCD_LDD_5)
+
+#define MFP_L_LP_DD_5				(MFP_PIN_GPIO59)
+#define MFP_L_LP_DD_5_AF			(MFP_PIN_GPIO59_AF_LCD_LDD_5)
+
+#define MFP_L_DD_6				(MFP_PIN_GPIO60)
+#define MFP_L_DD_6_AF				(MFP_PIN_GPIO60_AF_LCD_LDD_6)
+
+#define MFP_L_LP_DD_6				(MFP_PIN_GPIO60)
+#define MFP_L_LP_DD_6_AF			(MFP_PIN_GPIO60_AF_LCD_LDD_6)
+
+#define MFP_L_DD_7				(MFP_PIN_GPIO61)
+#define MFP_L_DD_7_AF				(MFP_PIN_GPIO61_AF_LCD_LDD_7)
+
+#define MFP_L_LP_DD_7				(MFP_PIN_GPIO61)
+#define MFP_L_LP_DD_7_AF			(MFP_PIN_GPIO61_AF_LCD_LDD_7)
+
+#define MFP_L_DD_8				(MFP_PIN_GPIO62)
+#define MFP_L_DD_8_AF				(MFP_PIN_GPIO62_AF_LCD_LDD_8)
+
+#define MFP_L_LP_DD_8				(MFP_PIN_GPIO62)
+#define MFP_L_LP_DD_8_AF			(MFP_PIN_GPIO62_AF_LCD_LDD_8)
+
+#define MFP_L_DD_9				(MFP_PIN_GPIO63)
+#define MFP_L_DD_9_AF				(MFP_PIN_GPIO63_AF_LCD_LDD_9)
+
+#define MFP_L_LP_DD_9				(MFP_PIN_GPIO63)
+#define MFP_L_LP_DD_9_AF			(MFP_PIN_GPIO63_AF_LCD_LDD_9)
+
+#define MFP_L_DD_10				(MFP_PIN_GPIO64)
+#define MFP_L_DD_10_AF				(MFP_PIN_GPIO64_AF_LCD_LDD_10)
+
+#define MFP_L_LP_DD_10				(MFP_PIN_GPIO64)
+#define MFP_L_LP_DD_10_AF			(MFP_PIN_GPIO64_AF_LCD_LDD_10)
+
+#define MFP_L_DD_11				(MFP_PIN_GPIO65)
+#define MFP_L_DD_11_AF				(MFP_PIN_GPIO65_AF_LCD_LDD_11)
+
+#define MFP_L_LP_DD_11				(MFP_PIN_GPIO65)
+#define MFP_L_LP_DD_11_AF			(MFP_PIN_GPIO65_AF_LCD_LDD_11)
+
+#define MFP_L_DD_12				(MFP_PIN_GPIO66)
+#define MFP_L_DD_12_AF				(MFP_PIN_GPIO66_AF_LCD_LDD_12)
+
+#define MFP_L_LP_DD_12				(MFP_PIN_GPIO66)
+#define MFP_L_LP_DD_12_AF			(MFP_PIN_GPIO66_AF_LCD_LDD_12)
+
+#define MFP_L_DD_13				(MFP_PIN_GPIO67)
+#define MFP_L_DD_13_AF				(MFP_PIN_GPIO67_AF_LCD_LDD_13)
+
+#define MFP_L_LP_DD_13				(MFP_PIN_GPIO67)
+#define MFP_L_LP_DD_13_AF			(MFP_PIN_GPIO67_AF_LCD_LDD_13)
+
+#define MFP_L_DD_14				(MFP_PIN_GPIO68)
+#define MFP_L_DD_14_AF				(MFP_PIN_GPIO68_AF_LCD_LDD_14)
+
+#define MFP_L_LP_DD_14				(MFP_PIN_GPIO68)
+#define MFP_L_LP_DD_14_AF			(MFP_PIN_GPIO68_AF_LCD_LDD_14)
+
+#define MFP_L_DD_15				(MFP_PIN_GPIO69)
+#define MFP_L_DD_15_AF				(MFP_PIN_GPIO69_AF_LCD_LDD_15)
+
+#define MFP_L_LP_DD_15				(MFP_PIN_GPIO69)
+#define MFP_L_LP_DD_15_AF			(MFP_PIN_GPIO69_AF_LCD_LDD_15)
+
+#define MFP_L_DD_16				(MFP_PIN_GPIO70)
+#define MFP_L_DD_16_AF				(MFP_PIN_GPIO70_AF_LCD_LDD_16)
+
+#define MFP_L_LP_DD_16				(MFP_PIN_GPIO70)
+#define MFP_L_LP_DD_16_AF			(MFP_PIN_GPIO70_AF_LCD_LDD_16)
+
+#define MFP_L_DD_17				(MFP_PIN_GPIO71)
+#define MFP_L_DD_17_AF				(MFP_PIN_GPIO71_AF_LCD_LDD_17)
+
+#define MFP_L_LP_DD_17				(MFP_PIN_GPIO71)
+#define MFP_L_LP_DD_17_AF			(MFP_PIN_GPIO71_AF_LCD_LDD_17)
+
+#define MFP_L_FCLK				(MFP_PIN_GPIO72)
+#define MFP_L_FCLK_AF				(MFP_PIN_GPIO72_AF_LCD_L_FCLK)
+
+#define MFP_L_LP_FCLK				(MFP_PIN_GPIO72)
+#define MFP_L_LP_FCLK_AF			(MFP_PIN_GPIO72_AF_LCD_L_FCLK)
+
+#define MFP_L_LCLK				(MFP_PIN_GPIO73)
+#define MFP_L_LCLK_AF				(MFP_PIN_GPIO73_AF_LCD_L_LCLK)
+
+#define MFP_L_LP_LCLK				(MFP_PIN_GPIO73)
+#define MFP_L_LP_LCLK_AF			(MFP_PIN_GPIO73_AF_LCD_L_LCLK)
+
+#define MFP_L_PCLK				(MFP_PIN_GPIO74)
+#define MFP_L_PCLK_AF				(MFP_PIN_GPIO74_AF_LCD_L_PCLK)
+
+#define MFP_L_LP_PCLK				(MFP_PIN_GPIO74)
+#define MFP_L_LP_PCLK_AF			(MFP_PIN_GPIO74_AF_LCD_L_PCLK)
+
+#define MFP_L_BIAS				(MFP_PIN_GPIO75)
+#define MFP_L_BIAS_AF				(MFP_PIN_GPIO75_AF_LCD_L_BIAS)
+
+#define MFP_L_LP_BIAS				(MFP_PIN_GPIO75)
+#define MFP_L_LP_BIAS_AF			(MFP_PIN_GPIO75_AF_LCD_L_BIAS)
+
+#define MFP_L_VSYNC				(MFP_PIN_GPIO76)
+#define MFP_L_VSYNC_AF				(MFP_PIN_GPIO76_AF_LCD_VSYNC)
+
+#define MFP_L_LP_VSYNC				(MFP_PIN_GPIO76)
+#define MFP_L_LP_VSYNC_AF			(MFP_PIN_GPIO76_AF_LCD_VSYNC)
+
+#define MFP_RSVD_MSL1_OB_DAT_0			(MFP_PIN_GPIO77)
+#define MFP_RSVD_MSL1_OB_DAT_0_AF		(MFP_PIN_GPIO77_AF_MSL_OB_DAT0)
+
+#define MFP_RSVD_MSL1_OB_CLK			(MFP_PIN_GPIO78)
+#define MFP_RSVD_MSL1_OB_CLK_AF			(MFP_PIN_GPIO78_AF_MSL_OB_CLK)
+
+#define MFP_RSVD_MSL1_OB_STB			(MFP_PIN_GPIO79)
+#define MFP_RSVD_MSL1_OB_STB_AF			(MFP_PIN_GPIO79_AF_MSL_OB_STB)
+
+#define MFP_RSVD_MSL1_OB_WAIT			(MFP_PIN_GPIO80)
+#define MFP_RSVD_MSL1_OB_WAIT_AF		(MFP_PIN_GPIO80_AF_MSL_OB_WAIT)
+
+#define MFP_RSVD_MSL1_IB_DAT_0			(MFP_PIN_GPIO81)
+#define MFP_RSVD_MSL1_IB_DAT_0_AF		(MFP_PIN_GPIO81_AF_MSL_IB_DAT0)
+
+#define MFP_HOST_WAKEUP_WIFI			(MFP_PIN_GPIO81)
+#define MFP_HOST_WAKEUP_WIFI_AF			(MFP_PIN_GPIO81_AF_GPIO_81)
+
+#define MFP_RSVD_MSL1_IB_CLK			(MFP_PIN_GPIO82)
+#define MFP_RSVD_MSL1_IB_CLK_AF			(MFP_PIN_GPIO82_AF_MSL_IB_CLK)
+
+#define MFP_RSVD_MSL1_IB_STB			(MFP_PIN_GPIO83)
+#define MFP_RSVD_MSL1_IB_STB_AF			(MFP_PIN_GPIO83_AF_MSL_IB_STB)
+
+#define MFP_WIFI_WAKEUP_HOST			(MFP_PIN_GPIO83)
+#define MFP_WIFI_WAKEUP_HOST_AF			(MFP_PIN_GPIO83_AF_UART1_DSR)
+
+#define MFP_RSVD_MSL1_IB_WAIT			(MFP_PIN_GPIO84)
+#define MFP_RSVD_MSL1_IB_WAIT_AF		(MFP_PIN_GPIO84_AF_MSL_IB_WAIT)
+
+#define MFP_RSVD_MSL1_IB_DAT_1			(MFP_PIN_GPIO85)
+#define MFP_RSVD_MSL1_IB_DAT_1_AF		(MFP_PIN_GPIO85_AF_MSL_IB_DAT1)
+
+#define MFP_RSVD_MSL1_IB_DAT_2			(MFP_PIN_GPIO86)
+#define MFP_RSVD_MSL1_IB_DAT_2_AF		(MFP_PIN_GPIO86_AF_MSL_IB_DAT2)
+
+#define MFP_RSVD_MSL1_IB_DAT_3			(MFP_PIN_GPIO87)
+#define MFP_RSVD_MSL1_IB_DAT_3_AF		(MFP_PIN_GPIO87_AF_MSL_IB_DATA3)
+
+#define MFP_RSVD_MSL1_OB_DAT_1			(MFP_PIN_GPIO88)
+#define MFP_RSVD_MSL1_OB_DAT_1_AF		(MFP_PIN_GPIO88_AF_MSL_OB_DAT1)
+
+#define MFP_RSVD_MSL1_OB_DAT_2			(MFP_PIN_GPIO89)
+#define MFP_RSVD_MSL1_OB_DAT_2_AF		(MFP_PIN_GPIO89_AF_MSL_OB_DAT2)
+
+#define MFP_RSVD_MSL1_OB_DAT_3			(MFP_PIN_GPIO90)
+#define MFP_RSVD_MSL1_OB_DAT_3_AF		(MFP_PIN_GPIO90_AF_MSL_OB_DAT3)
+
+#define MFP_SSP_AUDIO_SCLK			(MFP_PIN_GPIO91)
+#define MFP_SSP_AUDIO_SCLK_AF			(MFP_PIN_GPIO91_AF_SSP3_SCLK)
+
+#define MFP_SSP_AUDIO_FRM			(MFP_PIN_GPIO92)
+#define MFP_SSP_AUDIO_FRM_AF			(MFP_PIN_GPIO92_AF_SSP3_FRM)
+
+#define MFP_SSP_AUDIO_TXD			(MFP_PIN_GPIO93)
+#define MFP_SSP_AUDIO_TXD_AF			(MFP_PIN_GPIO93_AF_SSP3_TXD)
+
+#define MFP_SSP_AUDIO_RXD			(MFP_PIN_GPIO94)
+#define MFP_SSP_AUDIO_RXD_AF			(MFP_PIN_GPIO94_AF_SSP3_RXD)
+
+#define MFP_SSP_4_CLK				(MFP_PIN_GPIO95)
+#define MFP_SSP_4_CLK_AF			(MFP_PIN_GPIO95_AF_SSP4_SCLK)
+
+#define MFP_SSP_4_FRM				(MFP_PIN_GPIO96)
+#define MFP_SSP_4_FRM_AF			(MFP_PIN_GPIO96_AF_SSP4_FRM)
+
+#define MFP_SSP_4_TXD				(MFP_PIN_GPIO97)
+#define MFP_SSP_4_TXD_AF			(MFP_PIN_GPIO97_AF_SSP4_TXD)
+
+#define MFP_SSP_4_RXD				(MFP_PIN_GPIO98)
+#define MFP_SSP_4_RXD_AF			(MFP_PIN_GPIO98_AF_SSP4_RXD)
+
+#define MFP_DEBUG_ETH_INT_GPIO			(MFP_PIN_GPIO99)
+#define MFP_DEBUG_ETH_INT_GPIO_AF		(MFP_PIN_GPIO99_AF_GPIO_99)
+
+#define	MFP_U2D_RESET				(MFP_PIN_GPIO100)
+#define	MFP_U2D_RESET_AF			(MFP_PIN_GPIO100_AF_U2D_RESET)
+
+#define MFP_U2D_XCVR_SELECT			(MFP_PIN_GPIO101)
+#define MFP_U2D_XCVR_SELECT_AF
(MFP_PIN_GPIO101_AF_U2D_XCVR_SELECT_PF)
+
+#define MFP_U2D_TERM_SELECT			(MFP_PIN_GPIO102)
+#define MFP_U2D_TERM_SELECT_AF
(MFP_PIN_GPIO102_AF_U2D_TERM_SELECT_PF)
+
+#define MFP_U2D_SUSPENDM_X			(MFP_PIN_GPIO103)
+#define MFP_U2D_SUSPENDM_X_AF			(MFP_PIN_GPIO103_AF_U2D_SUSPENDM_X)
+
+#define MFP_U2D_LINESTATE0			(MFP_PIN_GPIO104)
+#define MFP_U2D_LINESTATE0_AF			(MFP_PIN_GPIO104_AF_UTM_LINESTATE_0)
+
+#define MFP_U2D_LINESTATE1			(MFP_PIN_GPIO105)
+#define MFP_U2D_LINESTATE1_AF			(MFP_PIN_GPIO105_AF_UTM_LINESTATE_1)
+
+#define MFP_OTG_ID				(MFP_PIN_GPIO106)
+#define MFP_OTG_ID_AF				(MFP_PIN_GPIO106_AF_USB_P2_7)
+
+#define MFP_U2D_OPMODE1				(MFP_PIN_GPIO106)
+#define MFP_U2D_OPMODE1_AF			(MFP_PIN_GPIO106_AF_UTM_OPMODE_PF_1)
+
+#define MFP_KP_DKIN_0				(MFP_PIN_GPIO107)
+#define MFP_KP_DKIN_0_AF			(MFP_PIN_GPIO107_AF_KP_DKIN_0)
+
+#define MFP_KP_DKIN_1				(MFP_PIN_GPIO108)
+#define MFP_KP_DKIN_1_AF			(MFP_PIN_GPIO108_AF_KP_DKIN_1)
+
+#define MFP_STD_TXD				(MFP_PIN_GPIO109)
+#define MFP_STD_TXD_AF				(MFP_PIN_GPIO109_AF_UART3_TXD)
+
+#define MFP_STD_RXD				(MFP_PIN_GPIO110)
+#define MFP_STD_RXD_AF				(MFP_PIN_GPIO110_AF_UART3_RXD)
+
+#define MFP_BT_RTS				(MFP_PIN_GPIO111)
+#define MFP_BT_RTS_AF			(MFP_PIN_GPIO111_AF_UART2_RTS)
+
+#define MFP_BT_RXD				(MFP_PIN_GPIO112)
+#define MFP_BT_RXD_AF			(MFP_PIN_GPIO112_AF_UART2_RXD)
+
+#define MFP_BT_TXD				(MFP_PIN_GPIO113)
+#define MFP_BT_TXD_AF			(MFP_PIN_GPIO113_AF_UART2_TXD)
+
+#define MFP_BT_CTS				(MFP_PIN_GPIO114)
+#define MFP_BT_CTS_AF			(MFP_PIN_GPIO114_AF_UART2_CTS)
+
+#define MFP_KP_MKIN_0				(MFP_PIN_GPIO115)
+#define MFP_KP_MKIN_0_AF			(MFP_PIN_GPIO115_AF_KP_MKIN_0)
+
+#define MFP_KP_MKIN_1				(MFP_PIN_GPIO116)
+#define MFP_KP_MKIN_1_AF			(MFP_PIN_GPIO116_AF_KP_MKIN_1)
+
+#define MFP_KP_MKIN_2				(MFP_PIN_GPIO117)
+#define MFP_KP_MKIN_2_AF			(MFP_PIN_GPIO117_AF_KP_MKIN_2)
+
+#define MFP_KP_MKIN_3				(MFP_PIN_GPIO118)
+#define MFP_KP_MKIN_3_AF			(MFP_PIN_GPIO118_AF_KP_MKIN_3)
+
+#define MFP_KP_MKIN_4				(MFP_PIN_GPIO119)
+#define MFP_KP_MKIN_4_AF			(MFP_PIN_GPIO119_AF_KP_MKIN_4)
+
+#define MFP_KP_MKIN_5				(MFP_PIN_GPIO120)
+#define MFP_KP_MKIN_5_AF			(MFP_PIN_GPIO120_AF_KP_MKIN_5)
+
+#define MFP_KP_MKOUT_0				(MFP_PIN_GPIO121)
+#define MFP_KP_MKOUT_0_AF			(MFP_PIN_GPIO121_AF_KP_MKOUT_0)
+
+#define MFP_KP_MKOUT_1				(MFP_PIN_GPIO122)
+#define MFP_KP_MKOUT_1_AF			(MFP_PIN_GPIO122_AF_KP_MKOUT_1)
+
+#define MFP_KP_MKOUT_2				(MFP_PIN_GPIO123)
+#define MFP_KP_MKOUT_2_AF			(MFP_PIN_GPIO123_AF_KP_MKOUT_2)
+
+#define MFP_KP_MKOUT_3				(MFP_PIN_GPIO124)
+#define MFP_KP_MKOUT_3_AF			(MFP_PIN_GPIO124_AF_KP_MKOUT_3)
+
+#define MFP_KP_MKOUT_4				(MFP_PIN_GPIO125)
+#define MFP_KP_MKOUT_4_AF			(MFP_PIN_GPIO125_AF_KP_MKOUT_4)
+
+#define MFP_CAMERA_STROBE_EN_GPIO		(MFP_PIN_GPIO126)
+#define MFP_CAMERA_STROBE_EN_GPIO_AF		(MFP_PIN_GPIO126_AF_GPIO_126)
+
+#define MFP_L_CS				(MFP_PIN_GPIO127)
+#define MFP_L_CS_AF				(MFP_PIN_GPIO127_AF_LCD_nCS)
+
+#define MFP_USBHPEN				(MFP_PIN_GPIO0_2)
+#define MFP_USBHPEN_AF				(MFP_PIN_GPIO0_2_AF_UHC_USBHPEN_MVT)
+
+#define MFP_USBHPWR				(MFP_PIN_GPIO1_2)
+#define MFP_USBHPWR_AF				(MFP_PIN_GPIO1_2_AF_UHC_USBHPWR_MVT)
+
+#define MFP_KP_MKIN_6				(MFP_PIN_GPIO2_2)
+#define MFP_KP_MKIN_6_AF			(MFP_PIN_GPIO2_2_AF_KP_MKIN_6)
+
+#define MFP_KP_MKIN_7				(MFP_PIN_GPIO3_2)
+#define MFP_KP_MKIN_7_AF			(MFP_PIN_GPIO3_2_AF_KP_MKIN_7)
+
+#define MFP_KP_MKOUT_5				(MFP_PIN_GPIO4_2)
+#define MFP_KP_MKOUT_5_AF			(MFP_PIN_GPIO4_2_AF_KP_MK0UT_5)
+
+#define MFP_KP_MKOUT_6				(MFP_PIN_GPIO5_2)
+#define MFP_KP_MKOUT_6_AF			(MFP_PIN_GPIO5_2_AF_KP_MKOUT_6)
+
+#define MFP_KP_MKOUT_7				(MFP_PIN_GPIO6_2)
+#define MFP_KP_MKOUT_7_AF			(MFP_PIN_GPIO6_2_AF_MK_MKOUT_7)
+
+#define MFP_MMC_CD_0_GPIO			(MFP_PIN_GPIO128)
+#define MFP_MMC_CD_0_GPIO_AF			(MFP_PIN_GPIO128_GPIO_128)
+
+#define MFP_MMC_CD_1_GPIO			(MFP_PIN_GPIO129)
+#define MFP_MMC_CD_1_GPIO_AF			(MFP_PIN_GPIO129_GPIO_129)
+
+#define MFP_MMC_WP_0_N_GPIO			(MFP_PIN_GPIO130)
+#define MFP_MMC_WP_0_N_GPIO_AF			(MFP_PIN_GPIO130_GPIO_130)
+
+#define MFP_MMC_WP_1_N_GPIO			(MFP_PIN_GPIO131)
+#define MFP_MMC_WP_1_N_GPIO_AF			(MFP_PIN_GPIO131_GPIO_131)
+
+#define MFP_PHONE_FLIPPED_GPIO			(MFP_PIN_GPIO132)
+#define MFP_PHONE_FLIPPED_GPIO_AF		(MFP_PIN_GPIO132_GPIO_132)
+
+#define MFP_PHONE_CLOSED_GPIO			(MFP_PIN_GPIO133)
+#define MFP_PHONE_CLOSED_GPIO_AF		(MFP_PIN_GPIO133_GPIO_133)
+
+#define MFP_USB2_DETECT				(MFP_PIN_GPIO134)
+#define MFP_USB2_DETECT_AF			(MFP_PIN_GPIO134_GPIO_134)
+
+#define MFP_CFCD_GPIO				(MFP_PIN_GPIO135)
+#define MFP_CFCD_GPIO_AF			(MFP_PIN_GPIO135_GPIO_135)
+
+#define MFP_CAMERA_LIGHT_EN_GPIO		(MFP_PIN_GPIO136)
+#define MFP_CAMERA_LIGHT_EN_GPIO_AF		(MFP_PIN_GPIO136_GPIO_136)
+
+#define MFP_IR_SHDN_N_GPIO			(MFP_PIN_GPIO137)
+#define MFP_IR_SHDN_N_GPIO_AF			(MFP_PIN_GPIO137_GPIO_137)
+
+#define MFP_CIF_HI_PWDN_GPIO			(MFP_PIN_GPIO138)
+#define MFP_CIF_HI_PWDN_GPIO_AF			(MFP_PIN_GPIO138_GPIO_138)
+
+#define MFP_CIF_LO_PWDN_GPIO			(MFP_PIN_GPIO139)
+#define MFP_CIF_LO_PWDN_GPIO_AF			(MFP_PIN_GPIO139_GPIO_139)
+
+#define	MFP_UTMI_TEST_EN			(MFP_PIN_GPIO140)
+#define	MFP_UTMI_TEST_EN_AF			(MFP_PIN_GPIO140_GPIO_140)
+
+#define	MFP_UTMI_SWITCH				(MFP_PIN_GPIO141)
+#define	MFP_UTMI_SWITCH_AF			(MFP_PIN_GPIO141_GPIO_141)
+
+#define	MFP_OTG_EN				(MFP_PIN_GPIO142)
+#define	MFP_OTG_EN_AF				(MFP_PIN_GPIO142_GPIO_142)
+
+#define	MFP_USB_OTG_SR				(MFP_PIN_GPIO143)
+#define	MFP_USB_OTG_SR_AF			(MFP_PIN_GPIO143_GPIO_143)
+
+#define MFP_MWB_BT_CLK_EN_N			(MFP_PIN_GPIO166)
+#define MFP_MWB_BT_CLK_EN_N_AF			(MFP_PIN_GPIO166_GPIO_166)
+
+#define MFP_MWB_BT_RESET			(MFP_PIN_GPIO167)
+#define MFP_MWB_BT_RESET_AF			(MFP_PIN_GPIO167_GPIO_167)
+
+#define MFP_MWB_WL_RESET			(MFP_PIN_GPIO169)
+#define MFP_MWB_WL_RESET_AF			(MFP_PIN_GPIO169_GPIO_169)
+
+#define MFP_ND_CLE				(MFP_PIN_CLE_nOE)
+#define MFP_ND_CLE_AF				(MFP_PIN_DF_CLE_AF_ND_CLE)
+
+#define MFP_DF_ALE				(MFP_PIN_DF_ALE_nWE)
+#define MFP_DF_ALE_AF				(MFP_PIN_DF_ALE_nWE1_AF_ND_ALE)
+
+#define MFP_DF_NCS1				(MFP_PIN_DF_nCS1)
+#define MFP_DF_NCS1_AF				(MFP_PIN_DF_nCS1_AF_DF_nCS1)
+
+#define MFP_DF_SCLK_E				(MFP_PIN_DF_SCLK_E)
+#define MFP_DF_SCLK_E_AF			(MFP_PIN_DF_SCLK_E_AF_DF_SCLK_E)
+
+#define MFP_DF_SCLK_S				(MFP_PIN_DF_SCLK_S)
+#define MFP_DF_SCLK_S_AF			(MFP_PIN_DF_SCLK_S_AF_DF_SCLK_S)
+
+#define MFP_DEBUG_ETH_nBE0			(MFP_PIN_nBE0)
+#define MFP_DEBUG_ETH_nBE0_AF			(MFP_PIN_nBE0_AF_DF_nBE0)
+
+#define MFP_DEBUG_ETH_nBE1			(MFP_PIN_nBE1)
+#define MFP_DEBUG_ETH_nBE1_AF			(MFP_PIN_nBE1_AF_DF_nBE1)
+
+#define MFP_DF_INT_RnB				(MFP_PIN_DF_INT_RnB)
+#define MFP_DF_INT_RnB_AF			(MFP_PIN_DF_INT_RnB_AF_INT_RnB)
+
+#define MFP_nLLA				(MFP_PIN_nLLA)
+#define MFP_nLLA_AF				(MFP_PIN_DF_nLLA_AF_DF_nLLA)
+
+#define MFP_nLUA				(MFP_PIN_nLUA)
+#define MFP_nLUA_AF				(MFP_PIN_DF_nLUA_AF_DF_nLUA)
+
+#define MFP_DF_nWE				(MFP_PIN_DF_nWE)
+#define MFP_DF_nWE_AF				(MFP_PIN_DF_nWE_AF_ND_WE)
+
+#define MFP_DF_nOE				(MFP_PIN_DF_nRE_nOE)
+#define MFP_DF_nOE_AF				(MFP_PIN_DF_nRE_AF_CD_OE)
+
+#define MFP_DF_nRE				(MFP_PIN_DF_nRE)
+#define MFP_DF_nRE_AF				(MFP_PIN_DF_nRE_AF_ND_RE)
+
+#define MFP_RSVD_DF_ADDR0			(MFP_PIN_DF_ADDR0)
+#define MFP_RSVD_DF_ADDR0_AF			(MFP_PIN_DF_ADDR0_AF_DF_ADDR0)
+
+#define MFP_RSVD_DF_ADDR1			(MFP_PIN_DF_ADDR1)
+#define MFP_RSVD_DF_ADDR1_AF			(MFP_PIN_DF_ADDR1_AF_DF_ADDR1)
+
+#define MFP_RSVD_DF_ADDR2			(MFP_PIN_DF_ADDR2)
+#define MFP_RSVD_DF_ADDR2_AF			(MFP_PIN_DF_ADDR2_AF_DF_ADDR2)
+
+#define MFP_RSVD_DF_ADDR3			(MFP_PIN_DF_ADDR3)
+#define MFP_RSVD_DF_ADDR3_AF			(MFP_PIN_DF_ADDR3_AF_DF_ADDR3)
+
+#define MFP_DF_IO_0				(MFP_PIN_DF_IO0)
+#define MFP_DF_IO_0_AF				(MFP_PIN_DF_IO_0_AF_ND)
+
+#define MFP_DF_IO_1				(MFP_PIN_DF_IO1)
+#define MFP_DF_IO_1_AF				(MFP_PIN_DF_IO_1_AF_ND)
+
+#define MFP_DF_IO_2				(MFP_PIN_DF_IO2)
+#define MFP_DF_IO_2_AF				(MFP_PIN_DF_IO_2_AF_ND)
+
+#define MFP_DF_IO_3				(MFP_PIN_DF_IO3)
+#define MFP_DF_IO_3_AF				(MFP_PIN_DF_IO_3_AF_ND)
+
+#define MFP_DF_IO_4				(MFP_PIN_DF_IO4)
+#define MFP_DF_IO_4_AF				(MFP_PIN_DF_IO_4_AF_ND)
+
+#define MFP_DF_IO_5				(MFP_PIN_DF_IO5)
+#define MFP_DF_IO_5_AF				(MFP_PIN_DF_IO_5_AF_ND)
+
+#define MFP_DF_IO_6				(MFP_PIN_DF_IO6)
+#define MFP_DF_IO_6_AF				(MFP_PIN_DF_IO_6_AF_ND)
+
+#define MFP_DF_IO_7				(MFP_PIN_DF_IO7)
+#define MFP_DF_IO_7_AF				(MFP_PIN_DF_IO_7_AF_ND)
+
+#define MFP_DF_IO_8				(MFP_PIN_DF_IO8)
+#define MFP_DF_IO_8_AF				(MFP_PIN_DF_IO_8_AF_ND)
+
+#define MFP_DF_IO_9				(MFP_PIN_DF_IO9)
+#define MFP_DF_IO_9_AF				(MFP_PIN_DF_IO_9_AF_ND)
+
+#define MFP_DF_IO_10				(MFP_PIN_DF_IO10)
+#define MFP_DF_IO_10_AF				(MFP_PIN_DF_IO_10_AF_ND)
+
+#define MFP_DF_IO_11				(MFP_PIN_DF_IO11)
+#define MFP_DF_IO_11_AF				(MFP_PIN_DF_IO_11_AF_ND)
+
+#define MFP_DF_IO_12				(MFP_PIN_DF_IO12)
+#define MFP_DF_IO_12_AF				(MFP_PIN_DF_IO_12_AF_ND)
+
+#define MFP_DF_IO_13				(MFP_PIN_DF_IO13)
+#define MFP_DF_IO_13_AF				(MFP_PIN_DF_IO_13_AF_ND)
+
+#define MFP_DF_IO_14				(MFP_PIN_DF_IO14)
+#define MFP_DF_IO_14_AF				(MFP_PIN_DF_IO_14_AF_ND)
+
+#define MFP_DF_IO_15				(MFP_PIN_DF_IO15)
+#define MFP_DF_IO_15_AF				(MFP_PIN_DF_IO_15_AF_ND)
+
+#define MFP_DF_nADV1				(MFP_PIN_DF_ALE_nWE)
+#define MFP_DF_nADV1_AF				(MFP_PIN_DF_ALE_nWE1_AF_ND_ALE)
+
+#define MFP_DF_NCS0				(MFP_PIN_DF_nCS0)
+#define MFP_DF_NCS0_AF				(MFP_PIN_DF_nCS0_AF_ND_nCS0)
+
+#define MFP_RSVD_DF_NCS1			(MFP_PIN_DF_nCS1)
+#define MFP_RSVD_DF_NCS1_AF			(MFP_PIN_DF_nCS1_AF_ND_nCS1)
+
+#define MFP_SIR_TXD				(MFP_STD_TXD)
+#define MFP_SIR_TXD_AF				(MFP_STD_TXD_AF)
+
+#define MFP_SIR_RXD				(MFP_STD_RXD)
+#define MFP_SIR_RXD_AF				(MFP_STD_RXD_AF)
 
 #define ZYLONITE_ETH_PHYS	0x14000000
 
-- 
1.5.3.7
