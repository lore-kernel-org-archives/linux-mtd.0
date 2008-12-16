Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LCRLl-0004fn-JU
	for linux-mtd@lists.infradead.org; Tue, 16 Dec 2008 04:16:02 +0000
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
	by mailout3.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KBY0093SBUG6I@mailout3.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 16 Dec 2008 13:15:52 +0900 (KST)
Received: from spapp01.rdscm.com ([165.213.149.150])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KBY00GDIBUE8E@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 16 Dec 2008 13:15:50 +0900 (KST)
Date: Tue, 16 Dec 2008 13:15:34 +0900
From: Kyungmin Park <kmpark@infradead.org>
Subject: [RFC PATCH] [MTD] [OneNAND] S3C64XX support (v2)
To: linux-mtd@lists.infradead.org
Message-id: <20081216041534.GA17035@july>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Content-disposition: inline
Cc: linux-arm-kernel@lists.arm.linux.org.uk, ben-linux@fluff.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

S3C64XX has its own OneNAND controller and interface
To do this there are two choices, New implementation or
hook the required function

In this implementation I choose latter.
To work with current OneNAND, I emulate the BufferRAM at system memory
So it's not need to modify OneNAND base file as previous one

This patch will be merged after s3c64xx kernel tree merged.

Note:
header file will be located at arch/arm/plat-s3c64xx/include/plat
But this patch doesn't since there's no plat-s3c64xx
Also cpu_is_s3c64xx and cpu_is_s3c6400 is simply redefined as same reason.

Thank you,
Kyungmin Park

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
diff --git a/arch/arm/plat-s3c/include/plat/regs-onenand.h b/arch/arm/plat-s3c/include/plat/regs-onenand.h
new file mode 100644
index 0000000..6087866
--- /dev/null
+++ b/arch/arm/plat-s3c/include/plat/regs-onenand.h
@@ -0,0 +1,88 @@
+/*
+ * linux/arch/arm/plat-s3c64xx/include/plat/regs-onenand.h
+ *
+ *  Copyright (C) 2008 Samsung Electronics
+ *  Kyungmin Park <kyungmin.park@samsung.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+#ifndef __S3C64XX_ONENAND_H__
+#define __S3C64XX_ONENAND_H__
+
+#include <mach/hardware.h>
+
+/*
+ * OneNAND Controller
+ */
+#define S3C64XX_ONENAND0_BASE	0x70100000
+#define S3C64XX_ONENAND1_BASE	0x70200000
+
+#define MEM_CFG_OFFSET		0x0000
+#define BURST_LEN_OFFSET	0x0010
+#define MEM_RESET_OFFSET	0x0020
+#define INT_ERR_STAT_OFFSET	0x0030
+#define INT_ERR_MASK_OFFSET	0x0040
+#define INT_ERR_ACK_OFFSET	0x0050
+#define ECC_ERR_STAT_OFFSET	0x0060
+#define MANUFACT_ID_OFFSET	0x0070
+#define DEVICE_ID_OFFSET	0x0080
+#define DATA_BUF_SIZE_OFFSET	0x0090
+#define BOOT_BUF_SIZE_OFFSET	0x00A0
+#define BUF_AMOUNT_OFFSET	0x00B0
+#define TECH_OFFSET		0x00C0
+#define FBA_WIDTH_OFFSET	0x00D0
+#define FPA_WIDTH_OFFSET	0x00E0
+#define FSA_WIDTH_OFFSET	0x00F0
+#define TRANS_SPARE_OFFSET	0x0140
+#define DBS_DFS_WIDTH_OFFSET	0x0160
+#define INT_PIN_ENABLE_OFFSET	0x01A0
+#define ACC_CLOCK_OFFSET	0x01C0
+#define FLASH_VER_ID_OFFSET	0x01F0
+#define FLASH_AUX_CNTRL_OFFSET	0x0300
+
+#ifndef __KERNEL__
+#define MEM_CFG0_REG		__REG(S3C64XX_ONENAND0_BASE + MEM_CFG_OFFSET)
+#define BURST_LEN0_REG		__REG(S3C64XX_ONENAND0_BASE + BURST_LEN_OFFSET)
+#define MEM_RESET0_REG		__REG(S3C64XX_ONENAND0_BASE + MEM_RESET_OFFSET)
+#define INT_ERR_STAT0_REG	__REG(S3C64XX_ONENAND0_BASE + INT_ERR_STAT_OFFSET)
+#define INT_ERR_MASK0_REG	__REG(S3C64XX_ONENAND0_BASE + INT_ERR_MASK_OFFSET)
+#define INT_ERR_ACK0_REG	__REG(S3C64XX_ONENAND0_BASE + INT_ERR_ACK_OFFSET)
+#define ECC_ERR_STAT0_REG	__REG(S3C64XX_ONENAND0_BASE + ECC_ERR_STAT_OFFSET)
+#define MANUFACT_ID0_REG	__REG(S3C64XX_ONENAND0_BASE + MANUFACT_ID_OFFSET)
+#define DEVICE_ID0_REG		__REG(S3C64XX_ONENAND0_BASE + DEVICE_ID_OFFSET)
+#define DATA_BUF_SIZE0_REG	__REG(S3C64XX_ONENAND0_BASE + DATA_BUF_SIZE_OFFSET)
+#define FBA_WIDTH0_REG		__REG(S3C64XX_ONENAND0_BASE + FBA_WIDTH_OFFSET)
+#define FPA_WIDTH0_REG		__REG(S3C64XX_ONENAND0_BASE + FPA_WIDTH_OFFSET)
+#define FSA_WIDTH0_REG		__REG(S3C64XX_ONENAND0_BASE + FSA_WIDTH_OFFSET)
+#define TRANS_SPARE0_REG	__REG(S3C64XX_ONENAND0_BASE + TRANS_SPARE_OFFSET)
+#define DBS_DFS_WIDTH0_REG	__REG(S3C64XX_ONENAND0_BASE + DBS_DFS_WIDTH_OFFSET)
+#define INT_PIN_ENABLE0_REG	__REG(S3C64XX_ONENAND0_BASE + INT_PIN_ENABLE_OFFSET)
+#define ACC_CLOCK0_REG		__REG(S3C64XX_ONENAND0_BASE + ACC_CLOCK_OFFSET)
+#define FLASH_VER_ID0_REG	__REG(S3C64XX_ONENAND0_BASE + FLASH_VER_ID_OFFSET)
+#define FLASH_AUX_CNTRL0_REG	__REG(S3C64XX_ONENAND0_BASE + FLASH_AUX_CNTRL_OFFSET)
+#endif
+
+#define ONENAND_MEM_RESET_HOT	0x3
+#define ONENAND_MEM_RESET_COLD	0x2
+#define ONENAND_MEM_RESET_WARM	0x1
+
+#define CACHE_OP_ERR		(1 << 13)
+#define RST_CMP			(1 << 12)
+#define RDY_ACT			(1 << 11)
+#define INT_ACT			(1 << 10)
+#define UNSUP_CMD		(1 << 9)
+#define LOCKED_BLK		(1 << 8)
+#define BLK_RW_CMP		(1 << 7)
+#define ERS_CMP			(1 << 6)
+#define PGM_CMP			(1 << 5)
+#define LOAD_CMP		(1 << 4)
+#define ERS_FAIL		(1 << 3)
+#define PGM_FAIL		(1 << 2)
+#define INT_TO			(1 << 1)
+#define LD_FAIL_ECC_ERR		(1 << 0)
+
+#define TSRF			(1 << 0)
+
+#endif
diff --git a/drivers/mtd/onenand/Kconfig b/drivers/mtd/onenand/Kconfig
index 0c8fa54..dfcb4be 100644
--- a/drivers/mtd/onenand/Kconfig
+++ b/drivers/mtd/onenand/Kconfig
@@ -34,6 +34,14 @@ config MTD_ONENAND_OMAP2
 	  Support for a OneNAND flash device connected to an OMAP2/OMAP3 CPU
 	  via the GPMC memory controller.
 
+config MTD_ONENAND_S3C64XX
+	tristate "OneNAND on S3C64XX support"
+	depends on MTD_ONENAND && ARCH_S3C64XX
+	help
+	  Support for a OneNAND flash device connected to an S3C64XX CPU
+	  via the Denali OneNAND controller.
+
+
 config MTD_ONENAND_OTP
 	bool "OneNAND OTP Support"
 	select HAVE_MTD_OTP
diff --git a/drivers/mtd/onenand/Makefile b/drivers/mtd/onenand/Makefile
index 64b6cc6..3e1ac5f 100644
--- a/drivers/mtd/onenand/Makefile
+++ b/drivers/mtd/onenand/Makefile
@@ -8,6 +8,8 @@ obj-$(CONFIG_MTD_ONENAND)		+= onenand.o
 # Board specific.
 obj-$(CONFIG_MTD_ONENAND_GENERIC)	+= generic.o
 obj-$(CONFIG_MTD_ONENAND_OMAP2)		+= omap2.o
+#obj-$(CONFIG_MTD_ONENAND_S3C64XX)	+= s3c64xx.o
+obj-y					+= s3c64xx.o
 
 # Simulator
 obj-$(CONFIG_MTD_ONENAND_SIM)		+= onenand_sim.o
diff --git a/drivers/mtd/onenand/s3c64xx.c b/drivers/mtd/onenand/s3c64xx.c
new file mode 100644
index 0000000..bc5bf5e
--- /dev/null
+++ b/drivers/mtd/onenand/s3c64xx.c
@@ -0,0 +1,694 @@
+/*
+ *  linux/drivers/mtd/onenand/s3c64xx.c
+ *
+ *  Copyright (C) 2008 Samsung Electronics
+ *  Kyungmin Park <kyungmin.park@samsung.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * Implementation:
+ * 	Emulate the pseudo BufferRAM
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/sched.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/onenand.h>
+#include <linux/mtd/partitions.h>
+
+#include <asm/mach/flash.h>
+//#include <plat/regs-onenand.h>
+#include "../../../arch/arm/plat-s3c/include/plat/regs-onenand.h"
+
+#include <asm/io.h>
+
+#include <mach/cpu.h>
+
+/* REVISIT It will be removed after s3c64xx tree merge */
+#ifndef cpu_is_s3c6400
+#define cpu_is_s3c6400()		0
+#endif
+#ifndef cpu_is_s3c64xx
+#define cpu_is_s3c64xx()		1
+#endif
+
+#ifdef ONENAND_DEBUG
+#define DPRINTK(format, args...)					\
+do {									\
+	printk("%s[%d]: " format "\n", __func__, __LINE__, ##args);	\
+} while (0)
+#else
+#define DPRINTK(...)			do { } while (0)
+#endif
+
+/* b0010000 << 26 */
+#define AHB_ADDR			0x20000000
+
+#define ONENAND_ERASE_STATUS		0x00
+#define ONENAND_MULTI_ERASE_SET		0x01
+#define ONENAND_ERASE_START		0x03
+
+#define ONENAND_UNLOCK_START		0x08
+#define ONENAND_UNLOCK_END		0x09
+#define ONENAND_LOCK_START		0x0A
+#define ONENAND_LOCK_END		0x0B
+#define ONENAND_LOCK_TIGHT_START	0x0C
+#define ONENAND_LOCK_TIGHT_END		0x0D
+#define ONENAND_UNLOCK_ALL		0x0E
+
+#define MAP_00				(0x0 << 24)
+#define MAP_01				(0x1 << 24)
+#define MAP_10				(0x2 << 24)
+#define MAP_11				(0x3 << 24)
+
+/* The 'addr' is byte address. It makes a 16-bit word */
+#define CMD_MAP_00(addr)		(AHB_ADDR | MAP_00 | ((addr) << 1))
+#define CMD_MAP_01(mem_addr)	 	(AHB_ADDR | MAP_01 | (mem_addr))
+#define CMD_MAP_10(mem_addr)		(AHB_ADDR | MAP_10 | (mem_addr))
+#define CMD_MAP_11(addr)		(AHB_ADDR | MAP_11 | ((addr) << 2))
+
+#define ONENAND_DATA_SIZE		2048
+#define ONENAND_SPARE_SIZE		64
+
+struct s3c64xx_onenand {
+	struct mtd_info	*mtd;
+
+	int		sync_mode;
+
+	void __iomem	*base;
+	void __iomem	*ahb_addr;
+
+	int		command_mask;
+	int		bootram_command;
+
+	void __iomem	*page_buf;
+	void __iomem	*oob_buf;
+
+	unsigned int	(*mem_addr)(int fba, int fpa, int fsa);
+};
+
+static struct s3c64xx_onenand *onenand;
+
+#ifdef CONFIG_MTD_PARTITIONS
+static const char *part_probes[] = { "cmdlinepart", NULL, };
+#endif
+
+static inline int s3c64xx_read_reg(int offset)
+{
+	return readl(onenand->base + offset);
+}
+
+static inline void s3c64xx_write_reg(int value, int offset)
+{
+	writel(value, onenand->base + offset);
+}
+
+static inline int s3c64xx_read_cmd(unsigned int cmd)
+{
+	return readl(onenand->ahb_addr + ((cmd) & onenand->command_mask));
+}
+
+static inline void s3c64xx_write_cmd(int value, unsigned int cmd)
+{
+	writel(value, onenand->ahb_addr + ((cmd) & onenand->command_mask));
+}
+
+static unsigned int s3c6400_mem_addr(int fba, int fpa, int fsa)
+{
+	return (fba << 10 | fpa << 4 | fsa << 2) & 0x003fffff;
+}
+
+static unsigned int s3c64xx_mem_addr(int fba, int fpa, int fsa)
+{
+	return (fba << 12 | fpa << 6 | fsa << 4) & 0x00ffffff;
+}
+
+static void s3c64xx_onenand_reset(void)
+{
+	int stat;
+
+	s3c64xx_write_reg(ONENAND_MEM_RESET_COLD, MEM_RESET_OFFSET);
+	while (1) {
+		stat = s3c64xx_read_reg(INT_ERR_STAT_OFFSET);
+		if (stat & INT_ACT)
+			break;
+	}
+	s3c64xx_write_reg(stat, INT_ERR_ACK_OFFSET);
+
+	/* Clear interrupt */
+	s3c64xx_write_reg(0x0, INT_ERR_ACK_OFFSET);
+	/* Clear the ECC status */
+	s3c64xx_write_reg(0x0, ECC_ERR_STAT_OFFSET);
+}
+
+static unsigned short s3c64xx_onenand_readw(void __iomem *addr)
+{
+	struct onenand_chip *this = onenand->mtd->priv;
+	int reg = addr - this->base;
+	int word_addr = reg >> 1;
+	int value;
+
+	/* It's used for probing time */
+	switch (reg) {
+	case ONENAND_REG_MANUFACTURER_ID:
+		return s3c64xx_read_reg(MANUFACT_ID_OFFSET);
+	case ONENAND_REG_DEVICE_ID:
+		return s3c64xx_read_reg(DEVICE_ID_OFFSET);
+	case ONENAND_REG_VERSION_ID:
+		return s3c64xx_read_reg(FLASH_VER_ID_OFFSET);
+	case ONENAND_REG_DATA_BUFFER_SIZE:
+		return s3c64xx_read_reg(DATA_BUF_SIZE_OFFSET);
+	case ONENAND_REG_SYS_CFG1:
+		return s3c64xx_read_reg(MEM_CFG_OFFSET);
+
+	default:
+		break;
+	}
+
+	/* BootRAM access control */
+	if ((unsigned int) addr < ONENAND_DATARAM && onenand->bootram_command) {
+		if (word_addr == 0)
+			return s3c64xx_read_reg(MANUFACT_ID_OFFSET);
+		if (word_addr == 1)
+			return s3c64xx_read_reg(DEVICE_ID_OFFSET);
+		if (word_addr == 2)
+			return s3c64xx_read_reg(FLASH_VER_ID_OFFSET);
+	}
+
+	value = s3c64xx_read_cmd(CMD_MAP_11(word_addr)) & 0xffff;
+	printk(KERN_INFO "s3c64xx_onenand_readw: Illegal access"
+		" at reg 0x%x, value 0x%x\n", word_addr, value);
+	return value;
+}
+
+static void s3c64xx_onenand_writew(unsigned short value, void __iomem *addr)
+{
+	struct onenand_chip *this = onenand->mtd->priv;
+	int reg = addr - this->base;
+	int word_addr = reg >> 1;
+
+	/* It's used for probing time */
+	switch (reg) {
+	case ONENAND_REG_SYS_CFG1:
+		s3c64xx_write_reg(value, MEM_CFG_OFFSET);
+		return;
+
+	/* Lock/lock-tight/unlock/unlock_all */
+	case ONENAND_REG_START_BLOCK_ADDRESS:
+		return;
+
+	default:
+		break;
+	}
+
+	/* BootRAM access control */
+	if ((unsigned int) addr < ONENAND_DATARAM) {
+		if (value == ONENAND_CMD_READID) {
+			onenand->bootram_command = 1;
+			return;
+		}
+		if (value == ONENAND_CMD_RESET) {
+			s3c64xx_write_reg(ONENAND_MEM_RESET_COLD, MEM_RESET_OFFSET);
+			onenand->bootram_command = 0;
+			return;
+		}
+	}
+
+	printk(KERN_INFO "s3c64xx_onenand_writew: Illegal access"
+		" at reg 0x%x, value 0x%x\n", word_addr, value);
+	s3c64xx_write_cmd(value, CMD_MAP_11(word_addr));
+}
+
+static int s3c64xx_onenand_wait(struct mtd_info *mtd, int state)
+{
+	unsigned long timeout;
+	unsigned int flags = INT_ACT;
+	unsigned int stat, ecc;
+
+	/* The 20 msec is enough */
+	timeout = jiffies + msecs_to_jiffies(20);
+	while (time_before(jiffies, timeout)) {
+		stat = s3c64xx_read_reg(INT_ERR_STAT_OFFSET);
+		if (stat & flags)
+			break;
+
+		if (state != FL_READING)
+			cond_resched();
+	}
+	/* To get correct interrupt status in timeout case */
+	stat = s3c64xx_read_reg(INT_ERR_STAT_OFFSET);
+	s3c64xx_write_reg(stat, INT_ERR_ACK_OFFSET);
+
+	/*
+	 * In the Spec. it checks the controller status first
+	 * However if you get the correct information in case of
+	 * power off recovery (POR) test, it should read ECC status first
+	 */
+	if (stat & LOAD_CMP) {
+		ecc = s3c64xx_read_reg(ECC_ERR_STAT_OFFSET);
+		if (ecc & ONENAND_ECC_2BIT_ALL) {
+			printk(KERN_INFO "onenand_wait: ECC error = 0x%04x\n", ecc);
+			mtd->ecc_stats.failed++;
+			return -EBADMSG;
+		} else if (ecc & ONENAND_ECC_1BIT_ALL) {
+			printk(KERN_INFO "onenand_wait: correctable ECC error = 0x%04x\n", ecc);
+			mtd->ecc_stats.corrected++;
+		}
+	}
+
+	if (stat & (LOCKED_BLK | ERS_FAIL | PGM_FAIL | INT_TO | LD_FAIL_ECC_ERR)) {
+		printk(KERN_INFO "s3c64xx_onenand_wait: controller error = 0x%04x\n", stat);
+		if (stat & LOCKED_BLK)
+			printk(KERN_INFO "s3c64xx_onenand_wait: it's locked error = 0x%04x\n", stat);
+
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int s3c64xx_onenand_command(struct mtd_info *mtd, int cmd, loff_t addr,
+                           size_t len)
+{
+	struct onenand_chip *this = mtd->priv;
+	unsigned int *m, *s;
+	int fba, fpa, fsa = 0;
+	unsigned int mem_addr;
+	int i, mcount, scount;
+	int dummy, index;
+
+	fba = (int) (addr >> this->erase_shift);
+	fpa = (int) (addr >> this->page_shift);
+	fpa &= this->page_mask;
+
+	mem_addr = onenand->mem_addr(fba, fpa, fsa);
+
+	switch (cmd) {
+	case ONENAND_CMD_READ:
+	case ONENAND_CMD_READOOB:
+	case ONENAND_CMD_BUFFERRAM:
+		ONENAND_SET_NEXT_BUFFERRAM(this);
+	default:
+		break;
+	}
+
+	index = ONENAND_CURRENT_BUFFERRAM(this);
+
+	/*
+	 * Emulate Two BufferRAMs and access with 4 bytes pointer
+	 */
+	m = (unsigned int *) onenand->page_buf;
+	s = (unsigned int *) onenand->oob_buf;
+
+	if (index) {
+		m += (ONENAND_DATA_SIZE >> 2);
+		s += (ONENAND_SPARE_SIZE >> 2);
+	}
+
+	mcount = mtd->writesize >> 2;
+	scount = mtd->oobsize >> 2;
+
+	switch (cmd) {
+	case ONENAND_CMD_READ:
+		/* Main */
+		for (i = 0; i < mcount; i++)
+			*m++ = s3c64xx_read_cmd(CMD_MAP_01(mem_addr));
+
+		return 0;
+
+	case ONENAND_CMD_READOOB:
+		s3c64xx_write_reg(TSRF, TRANS_SPARE_OFFSET);
+
+		/* Main - dummy read */
+		for (i = 0; i < mcount; i++)
+			dummy = s3c64xx_read_cmd(CMD_MAP_01(mem_addr));
+
+		/* Spare */
+		for (i = 0; i < scount; i++)
+			*s++ = s3c64xx_read_cmd(CMD_MAP_01(mem_addr));
+
+		s3c64xx_write_reg(0, TRANS_SPARE_OFFSET);
+		return 0;
+
+	case ONENAND_CMD_PROG:
+		if (unlikely(len != mtd->writesize))
+			printk(KERN_ERR "length error %d", len);
+
+		/* Main */
+		for (i = 0; i < mcount; i++)
+			s3c64xx_write_cmd(*m++, CMD_MAP_01(mem_addr));
+
+		return 0;
+
+	case ONENAND_CMD_PROGOOB:
+		s3c64xx_write_reg(TSRF, TRANS_SPARE_OFFSET);
+
+		/* Main - dummy write */
+		for (i = 0; i < mcount; i++)
+			s3c64xx_write_cmd(0xffffffff, CMD_MAP_01(mem_addr));
+
+		/* Spare */
+		for (i = 0; i < scount; i++)
+			s3c64xx_write_cmd(*s++, CMD_MAP_01(mem_addr));
+
+		s3c64xx_write_reg(0, TRANS_SPARE_OFFSET);
+		return 0;
+
+	case ONENAND_CMD_UNLOCK_ALL:
+		s3c64xx_write_cmd(ONENAND_UNLOCK_ALL, CMD_MAP_10(mem_addr));
+		return 0;
+
+	case ONENAND_CMD_ERASE:
+		s3c64xx_write_cmd(ONENAND_ERASE_START, CMD_MAP_10(mem_addr));
+		return 0;
+
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static unsigned char *s3c64xx_get_bufferram(struct mtd_info *mtd, int area)
+{
+	struct onenand_chip *this = mtd->priv;
+	int index = ONENAND_CURRENT_BUFFERRAM(this);
+	unsigned char *p;
+
+	if (area == ONENAND_DATARAM) {
+		p = (unsigned char *) onenand->page_buf;
+		if (index == 1)
+			p += ONENAND_DATA_SIZE;
+	} else {
+		p = (unsigned char *) onenand->oob_buf;
+		if (index == 1)
+			p += ONENAND_SPARE_SIZE;
+	}
+
+	return p;
+}
+
+static int s3c64xx_read_bufferram(struct mtd_info *mtd, int area,
+				  unsigned char *buffer, int offset,
+				  size_t count)
+{
+	unsigned char *p;
+
+	p = s3c64xx_get_bufferram(mtd, area);
+	memcpy(buffer, p + offset, count);
+	return 0;
+}
+
+static int s3c64xx_write_bufferram(struct mtd_info *mtd, int area,
+				   const unsigned char *buffer, int offset,
+				   size_t count)
+{
+	unsigned char *p;
+
+	p = s3c64xx_get_bufferram(mtd, area);
+	memcpy(p + offset, buffer, count);
+	return 0;
+}
+
+static int s3c64xx_onenand_bbt_wait(struct mtd_info *mtd, int state)
+{
+	unsigned long timeout;
+	unsigned int flags = INT_ACT;
+	unsigned int stat;
+
+	/* The 20 msec is enough */
+	timeout = jiffies + msecs_to_jiffies(20);
+	while (time_before(jiffies, timeout)) {
+		stat = s3c64xx_read_reg(INT_ERR_STAT_OFFSET);
+		if (stat & flags)
+			break;
+
+		if (state != FL_READING)
+			cond_resched();
+	}
+	/* To get correct interrupt status in timeout case */
+	stat = s3c64xx_read_reg(INT_ERR_STAT_OFFSET);
+
+	s3c64xx_write_reg(stat, INT_ERR_ACK_OFFSET);
+	if (stat & LD_FAIL_ECC_ERR) {
+		s3c64xx_onenand_reset();
+		return ONENAND_BBT_READ_ERROR;
+	}
+
+	if (stat & LOAD_CMP) {
+		int ecc = s3c64xx_read_reg(ECC_ERR_STAT_OFFSET);
+		if (ecc & ONENAND_ECC_2BIT_ALL) {
+			s3c64xx_onenand_reset();
+			return ONENAND_BBT_READ_ERROR;
+		}
+	} else
+		return ONENAND_BBT_READ_FATAL_ERROR;
+
+	return 0;
+}
+
+static void s3c64xx_set_width_regs(struct onenand_chip *this)
+{
+	int dev_id, ddp, density;
+	int dbs_dfs, fba, fpa, fsa;
+
+	dev_id = s3c64xx_read_reg(DEVICE_ID_OFFSET);
+
+	ddp = dev_id & ONENAND_DEVICE_IS_DDP;
+	density = (dev_id >> ONENAND_DEVICE_DENSITY_SHIFT) & 0xf;
+
+	dbs_dfs = 0;
+	fba = density + 7;
+	fpa = 6;
+	fsa = 2;
+
+	if (ddp) {
+		dbs_dfs = 1;
+		fba--;
+	}
+
+	s3c64xx_write_reg(fba, FBA_WIDTH_OFFSET); 
+	s3c64xx_write_reg(fpa, FPA_WIDTH_OFFSET); 
+	s3c64xx_write_reg(fsa, FSA_WIDTH_OFFSET); 
+	s3c64xx_write_reg(dbs_dfs, DBS_DFS_WIDTH_OFFSET); 
+}
+
+static void s3c64xx_onenand_setup(struct mtd_info *mtd)
+{
+	struct onenand_chip *this = mtd->priv;
+
+	onenand->mtd = mtd;
+
+	/* Default for s3c6410 or later */
+	onenand->command_mask = 0x03ffffff;
+	onenand->mem_addr = s3c64xx_mem_addr;
+
+	if (cpu_is_s3c6400()) {
+		onenand->command_mask = 0x00ffffff;
+		onenand->mem_addr = s3c6400_mem_addr;
+	}
+
+	this->read_word = s3c64xx_onenand_readw;
+	this->write_word = s3c64xx_onenand_writew;
+
+	this->wait = s3c64xx_onenand_wait;
+	this->bbt_wait = s3c64xx_onenand_bbt_wait;
+	this->command = s3c64xx_onenand_command;
+
+	this->read_bufferram = s3c64xx_read_bufferram;
+	this->write_bufferram = s3c64xx_write_bufferram;
+
+	this->options |= ONENAND_SKIP_UNLOCK_CHECK;
+}
+
+static int s3c64xx_onenand_probe(struct platform_device *pdev)
+{
+	struct flash_platform_data *pdata;
+	struct onenand_chip *this;
+	struct mtd_info *mtd;
+	struct resource *r;
+	int size, err;
+
+	if (!cpu_is_s3c64xx())
+		return -ENODEV;
+
+	pdata = pdev->dev.platform_data;
+	if (!pdata) {
+		dev_err(&pdev->dev, "no platform data defined\n");
+		return -ENODEV;
+	}
+
+	size = sizeof(struct mtd_info) + sizeof(struct onenand_chip);
+	mtd = kzalloc(size, GFP_KERNEL);
+	if (!mtd) {
+		dev_err(&pdev->dev, "failed to allocate memory\n");
+		return -ENOMEM;
+	}
+
+	onenand = kzalloc(sizeof(struct s3c64xx_onenand), GFP_KERNEL);
+	if (!onenand) {
+		err = -ENOMEM;
+		goto onenand_fail;
+	}
+
+	this = (struct onenand_chip *) &mtd[1];
+	mtd->priv = this;
+
+	s3c64xx_onenand_setup(mtd);
+
+	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!r) {
+		dev_err(&pdev->dev, "no resource defined\n");
+		return -ENXIO;
+		goto resource_failed;
+	}
+
+	r = request_mem_region(r->start, r->end - r->start + 1, pdev->name);
+	if (!r) {
+		dev_err(&pdev->dev, "failed to request memory resource\n");
+		err = -EBUSY;
+		goto request_failed;
+	}
+
+	onenand->base = ioremap(r->start, r->end - r->start + 1);
+	if (!onenand->base) {
+		err = -EFAULT;
+		goto ioremap_failed;
+	}
+
+	onenand->ahb_addr = ioremap(AHB_ADDR, SZ_256M);
+	if (!onenand->ahb_addr) {
+		err = -EINVAL;
+		goto ahb_failed;
+	}
+
+	platform_set_drvdata(pdev, mtd);
+
+	/* Allocate 4KiB BufferRAM */
+	onenand->page_buf = kzalloc(SZ_4K * sizeof(char), GFP_KERNEL);
+	if (!onenand->page_buf) {
+		err = -ENOMEM;
+		goto page_buf_fail;
+	}
+
+	/* Allocate 128 SpareRAM */
+	onenand->oob_buf = kzalloc(128 * sizeof(char), GFP_KERNEL);
+	if (!onenand->oob_buf) {
+		err = -ENOMEM;
+		goto oob_buf_fail;
+	}
+
+	if (onenand_scan(mtd, 1)) {
+		err = -EFAULT;
+		goto scan_failed;
+	}
+
+	s3c64xx_set_width_regs(this);
+	
+	/* S3C64XX don't handle subpage write */
+	mtd->subpage_sft = 0;
+	this->subpagesize = mtd->writesize;
+
+	if (s3c64xx_read_reg(MEM_CFG_OFFSET) & ONENAND_SYS_CFG1_SYNC_READ) {
+		printk(KERN_INFO "OneNAND Sync. Burst Read enabled\n");
+		onenand->sync_mode = 1;
+	}
+
+#ifdef CONFIG_MTD_PARTITIONS
+	err = parse_mtd_partitions(mtd, part_probes, &pdata->parts, 0);
+	if (err > 0)
+		add_mtd_partitions(mtd, pdata->parts, err);
+	else if (pdata->parts)
+		add_mtd_partitions(mtd, pdata->parts, pdata->nr_parts);
+	else
+#endif
+		err = add_mtd_device(mtd);
+
+	return 0;
+scan_failed:
+	kfree(onenand->oob_buf);
+oob_buf_fail:
+	kfree(onenand->page_buf);
+page_buf_fail:
+	iounmap(onenand->ahb_addr);
+ahb_failed:
+	iounmap(onenand->base);
+ioremap_failed:
+	release_mem_region(r->start, r->end - r->start + 1);
+request_failed:
+resource_failed:
+	kfree(onenand);
+onenand_fail:
+	kfree(mtd);
+	return err;
+}
+
+static int s3c64xx_onenand_remove(struct platform_device *pdev)
+{
+	struct mtd_info *mtd = platform_get_drvdata(pdev);
+
+	onenand_release(mtd);
+	iounmap(onenand->base);
+	platform_set_drvdata(pdev, NULL);
+	kfree(onenand->oob_buf);
+	kfree(onenand->page_buf);
+	kfree(onenand);
+	kfree(mtd);
+
+	return 0;
+}
+
+#ifdef CONFIG_PM
+static int s3c64xx_onenand_suspend(struct platform_device *pdev, pm_message_t pm)
+{
+	struct mtd_info *mtd = platform_get_drvdata(pdev);
+	struct onenand_chip *this = mtd->priv;
+
+	this->wait(mtd, FL_PM_SUSPENDED);
+	return mtd->suspend(mtd);
+}
+
+static int s3c64xx_onenand_resume(struct platform_device *pdev)
+{
+	struct mtd_info *mtd = platform_get_drvdata(pdev);
+	struct onenand_chip *this = mtd->priv;
+
+	mtd->resume(mtd);
+	this->unlock_all(mtd);
+	return 0;
+}
+#else
+#define s3c64xx_onenand_suspend		NULL
+#define s3c64xx_onenand_resume		NULL
+#endif
+
+static struct platform_driver s3c64xx_onenand_driver = {
+	.driver		= {
+		.name	= "s3c64xx-onenand",
+	},
+	.probe		= s3c64xx_onenand_probe,
+	.remove		= s3c64xx_onenand_remove,
+	.suspend	= s3c64xx_onenand_suspend,
+	.resume		= s3c64xx_onenand_resume,
+};
+
+static int __init s3c64xx_onenand_init(void)
+{
+	return platform_driver_register(&s3c64xx_onenand_driver);
+}
+
+static void __exit s3c64xx_onenand_exit(void)
+{
+	platform_driver_unregister(&s3c64xx_onenand_driver);
+}
+
+module_init(s3c64xx_onenand_init);
+module_exit(s3c64xx_onenand_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Kyungmin Park <kyungmin.park@samsung.com>");
+MODULE_DESCRIPTION("Samsung S3C64XX OneNAND controller support");
+MODULE_ALIAS("platform:s3c64xx-onenand");
