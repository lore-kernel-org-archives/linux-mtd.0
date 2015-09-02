Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZX4qE-0002Uu-Iy
 for linux-mtd@lists.infradead.org; Wed, 02 Sep 2015 10:00:37 +0000
Received: from localhost (localhost [127.0.0.1])
 by bastet.se.axis.com (Postfix) with ESMTP id ECCF9181AF
 for <linux-mtd@lists.infradead.org>; Wed,  2 Sep 2015 12:00:06 +0200 (CEST)
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
 by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 3QVMWmE87eIh for <linux-mtd@lists.infradead.org>;
 Wed,  2 Sep 2015 12:00:01 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
 by bastet.se.axis.com (Postfix) with ESMTP id AC86F181B4
 for <linux-mtd@lists.infradead.org>; Wed,  2 Sep 2015 12:00:01 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
 by postfix.imss71 (Postfix) with ESMTP id 9C91D13BD
 for <linux-mtd@lists.infradead.org>; Wed,  2 Sep 2015 12:00:01 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
 by boulder.se.axis.com (Postfix) with ESMTP id 8ED9FF15
 for <linux-mtd@lists.infradead.org>; Wed,  2 Sep 2015 12:00:01 +0200 (CEST)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
 by seth.se.axis.com (Postfix) with ESMTP id 8B3783E049
 for <linux-mtd@lists.infradead.org>; Wed,  2 Sep 2015 12:00:01 +0200 (CEST)
Date: Wed, 2 Sep 2015 12:00:00 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
CC: Jesper Nilsson <jespern@axis.com>
Subject: [PATCH] nand: evatronix_nand: Support for Evatronix NANDFLASH-CTRL
 NAND flash controller
Message-ID: <alpine.DEB.2.02.1509021125260.3915@lnxricardw1.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Add support for the Evatronix NANDFLASH-CTRL NAND flash controller

The Evatronix NANDFLASH-CTRL is a NAND flash controller IP, which is 
available in various configurations. The IP takes care of virtually all of 
the low-level flash chip communication so that the driver doesn't have to 
worry about it, on the other hand, specific NAND flash chip support can be 
limited by the IP configuration.

This driver supports the following IP configuration: 1 flash chip per 
bank, 2 banks. 8-bit parallel flash interface. No support for synchronous 
NAND chips or ToggleMode or ClearNAND chips. Hardware BCH error correction 
with a correction capability of 4, 8, 16, 24 or 32 bits per 256, 512 or 
1024 bytes ECC block.

The driver supports flash chips with 4 or 5 byte addressing, but not 
small-page (512 byte) flash chips.

Tested in both a software as well as hardware (RTL level) simulated
environment, but not tested on real silicon as yet.

Signed-off-by Ricard Wanderlof <ricardw@axis.com>
---
 .../devicetree/bindings/mtd/evatronix-nand.txt     |   41 +
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 drivers/mtd/nand/Kconfig                           |    6 +
 drivers/mtd/nand/Makefile                          |    1 +
 drivers/mtd/nand/evatronix_nand.c                  | 1874 ++++++++++++++++++++
 5 files changed, 1923 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/evatronix-nand.txt
 create mode 100644 drivers/mtd/nand/evatronix_nand.c

diff --git a/Documentation/devicetree/bindings/mtd/evatronix-nand.txt b/Documentation/devicetree/bindings/mtd/evatronix-nand.txt
new file mode 100644
index 0000000..cb3f3cac
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/evatronix-nand.txt
@@ -0,0 +1,41 @@
+Evatronix NANDFLASH-CTRL NAND flash controller
+
+Required properties:
+- compatible : "evatronix,nandflash-ctrl"
+- reg : specify bus address and register area size.
+- interrupts : controller interrupt number and irq type.
+- nand-ecc-mode : See nand.txt. Supported values "hw", "soft_bch".
+- nand-ecc-strength : See nand.txt. Supported values: 4, 8, 16, 24, 32.
+- nand-ecc-step-size : See nand.txt. Supported values: 256, 512, 1024.
+
+Optional properties:
+- nand-on-flash-bbt: See nand.txt.
+- #address-cells, #size-cells: See partition.txt.
+- use-bank-select : Use controller bank select function to access multiple
+		    chips, rather than chip enable.
+- rb-wired-and: Assume ready/busy signal from all flash chips are connected
+		using a wired-AND topology rather than individually.
+- timings: Seven 32-bit values for initializing the TIME_SEQ_0, TIME_SEQ_1,
+	   TIMINGS_ASYN, TIME_GEN_SEQ_0, TIME_GEN_SEQ_1,
+	   TIME_GEN_SEQ_2 and TIME_GEN_SEQ_3 registers, respectively.
+
+Example:
+
+nand: nand@f801e000 {
+	compatible = "evatronix,nandflash-ctrl";
+	#address-cells = <1>;
+	#size-cells = <1>;
+	reg = <0xf801e000 0x0200>;
+	interrupts = <0 139 IRQ_TYPE_LEVEL_HIGH>;
+	/* ONFi mode 0 timing. */
+	/* Order is TIME_SEQ_0, TIME_SEQ_1, TIMINGS_ASYN,
+	 * TIME_GEN_SEQ_0, _1, _2, _3 */
+	timings = <0x0d151533 0x000b0515 0x00000046
+		   0x00150000 0x00000000 0x00000005 0x00000015>;
+	nand-ecc-mode = "hw";
+	nand-on-flash-bbt;
+	nand-ecc-strength = <8>;
+	nand-ecc-step-size = <512>;
+	use-bank-select;
+	rb-wired-and;
+};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 8033919..4a497c2 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -71,6 +71,7 @@ epson	Seiko Epson Corp.
 est	ESTeem Wireless Modems
 ettus	NI Ettus Research
 eukrea  EukrÃ©a Electromatique
+evatronix	Evatronix SA
 everest	Everest Semiconductor Co. Ltd.
 everspin	Everspin Technologies, Inc.
 excito	Excito
diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 5897d8d..d9c16e6 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -297,6 +297,12 @@ config MTD_NAND_DOCG4
 	  by the block containing the saftl partition table.  This is probably
 	  typical.
 
+config MTD_NAND_EVATRONIX
+	tristate "Enable Evatronix NANDFLASH-CTRL driver"
+	help
+	  NAND hardware driver for Evatronix NANDFLASH-CTRL
+	  NAND flash controller.
+
 config MTD_NAND_SHARPSL
 	tristate "Support for NAND Flash on Sharp SL Series (C7xx + others)"
 	depends on ARCH_PXA
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index 582bbd05..44da9b3 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_MTD_NAND_S3C2410)		+= s3c2410.o
 obj-$(CONFIG_MTD_NAND_DAVINCI)		+= davinci_nand.o
 obj-$(CONFIG_MTD_NAND_DISKONCHIP)	+= diskonchip.o
 obj-$(CONFIG_MTD_NAND_DOCG4)		+= docg4.o
+obj-$(CONFIG_MTD_NAND_EVATRONIX)	+= evatronix_nand.o
 obj-$(CONFIG_MTD_NAND_FSMC)		+= fsmc_nand.o
 obj-$(CONFIG_MTD_NAND_SHARPSL)		+= sharpsl.o
 obj-$(CONFIG_MTD_NAND_NANDSIM)		+= nandsim.o
diff --git a/drivers/mtd/nand/evatronix_nand.c b/drivers/mtd/nand/evatronix_nand.c
new file mode 100644
index 0000000..cf60475
--- /dev/null
+++ b/drivers/mtd/nand/evatronix_nand.c
@@ -0,0 +1,1874 @@
+/*
+ * evatronix_nand.c - NAND Flash Driver for Evatronix NANDFLASH-CTRL
+ * NAND Flash Controller IP.
+ *
+ * Intended to handle one NFC, with up to two connected NAND flash chips,
+ * one per bank.
+ *
+ * This implementation has been designed against Rev 1.15 and Rev 1.16 of the
+ * NANDFLASH-CTRL Design Specification.
+ * Note that Rev 1.15 specifies up to 8 chip selects, whereas Rev 1.16
+ * only specifies one. We keep the definitions for the multiple chip
+ * selects though for future reference.
+ *
+ * The corresponding IP version is NANDFLASH-CTRL-DES-6V09H02RE08 .
+ *
+ * Copyright (c) 2015 Axis Communication AB, Lund, Sweden.
+ * Portions Copyright (c) 2010 ST Microelectronics
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#include <asm/dma.h>
+#include <linux/bitops.h> /* for ffs() */
+#include <linux/io.h>
+#include <linux/dma-mapping.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_mtd.h>
+#include <linux/slab.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/concat.h>
+#include <linux/mtd/partitions.h>
+#include <linux/version.h>
+
+/* Driver configuration */
+/* Anything we want to keep should be moved to DT; the stuff remaining here
+ * is stuff we really want to get rid of once we know everthing is working
+ * smoothly on real silicon. */
+
+#define NFC_HWECC_SUBPAGE_WRITE
+#define NFC_HWECC_SUBPAGE_READ
+
+#undef POLLED_XFERS
+
+/* Workarounds and features for development environment */
+
+#define CLEAR_DMA_BUF_AFTER_WRITE
+#define WORKAROUND_NO_ECC_CNT
+#define WORKAROUND_READ_ID
+
+#define DMA_BUF_SIZE (8192 + 640) /* main + spare for 8k page flash */
+
+/* # bytes into the OOB we put our ECC */
+#define ECC_OFFSET 2
+
+/* Debugging */
+
+#if 0
+#define MTD_TRACE(FORMAT, ...) \
+	pr_info("mtd trace: %s: " FORMAT, __func__, ## __VA_ARGS__)
+#else
+#define MTD_TRACE(FORMAT, ...) do { } while (0)
+#endif
+
+/* Register offsets for Evatronix NANDFLASH-CTRL IP */
+/* Register field shift values and masks are interespersed as it makes
+ * them easier to locate. */
+/* We use shift values rather than direct masks (e.g. 0x0000d000), as the
+ * hardware manual lists the bit number, making the definitions below
+ * easier to verify against the manual. */
+/* All (known) registers are here, but we only put in the bit fields
+ * for the fields we need. */
+/* We try to be consistent regarding _SIZE/_MASK/_value macros so as to
+ * get a consistent layout here, except for trivial cases where there is
+ * only a single bit or field in a register at bit offset 0. */
+
+#define COMMAND_REG		0x00
+/* The masks reflect the input data to the MAKE_COMMAND macro, rather than
+ * the bits in the register itself. These macros are not intended to be
+ * used by the user, who should use the MAKE_COMMAND et al macros. */
+#define _CMD_SEQ_SHIFT			0
+#define _INPUT_SEL_SHIFT		6
+#define _DATA_SEL_SHIFT			7
+#define _CMD_0_SHIFT			8
+#define _CMD_1_3_SHIFT			16
+#define _CMD_2_SHIFT			24
+
+#define _CMD_SEQ_MASK			0x3f
+#define _INPUT_SEL_MASK			1
+#define _DATA_SEL_MASK			1
+#define _CMD_MASK			0xff /* for all CMD_foo */
+
+#define MAKE_COMMAND(CMD_SEQ, INPUT_SEL, DATA_SEL, CMD_0, CMD_1_3, CMD_2) \
+	((((CMD_SEQ)	& _CMD_SEQ_MASK)	<< _CMD_SEQ_SHIFT)	| \
+	 (((INPUT_SEL)	& _INPUT_SEL_MASK)	<< _INPUT_SEL_SHIFT)	| \
+	 (((DATA_SEL)	& _DATA_SEL_MASK)	<< _DATA_SEL_SHIFT)	| \
+	 (((CMD_0)	& _CMD_MASK)		<< _CMD_0_SHIFT)	| \
+	 (((CMD_1_3)	& _CMD_MASK)		<< _CMD_1_3_SHIFT)	| \
+	 (((CMD_2)	& _CMD_MASK)		<< _CMD_2_SHIFT))
+
+#define INPUT_SEL_SIU			0
+#define INPUT_SEL_DMA			1
+#define DATA_SEL_FIFO			0
+#define DATA_SEL_DATA_REG		1
+
+#define CONTROL_REG		0x04
+#define CONTROL_BLOCK_SIZE_32		(0 << 6)
+#define CONTROL_BLOCK_SIZE_64		(1 << 6)
+#define CONTROL_BLOCK_SIZE_128		(2 << 6)
+#define CONTROL_BLOCK_SIZE_256		(3 << 6)
+#define CONTROL_BLOCK_SIZE(SIZE)	((ffs(SIZE) - 6) << 6)
+#define CONTROL_ECC_EN			(1 << 5)
+#define CONTROL_INT_EN			(1 << 4)
+#define CONTROL_ECC_BLOCK_SIZE_256	(0 << 1)
+#define CONTROL_ECC_BLOCK_SIZE_512	(1 << 1)
+#define CONTROL_ECC_BLOCK_SIZE_1024	(2 << 1)
+#define CONTROL_ECC_BLOCK_SIZE(SIZE)	((ffs(SIZE) - 9) << 1)
+#define STATUS_REG		0x08
+#define STATUS_MEM_ST(CS)		(1 << (CS))
+#define STATUS_CTRL_STAT		(1 << 8)
+#define STATUS_MASK_REG		0x0C
+#define STATE_MASK_SHIFT		0
+#define STATUS_MASK_STATE_MASK(MASK)	(((MASK) & 0xff) << STATE_MASK_SHIFT)
+#define ERROR_MASK_SHIFT		8
+#define STATUS_MASK_ERROR_MASK(MASK)	(((MASK) & 0xff) << ERROR_MASK_SHIFT)
+#define INT_MASK_REG		0x10
+#define INT_MASK_ECC_INT_EN(CS)		(1 << (24 + (CS)))
+#define INT_MASK_STAT_ERR_INT_EN(CS)	(1 << (16 + (CS)))
+#define INT_MASK_MEM_RDY_INT_EN(CS)	(1 << (8 + (CS)))
+#define INT_MASK_DMA_INT_EN		(1 << 3)
+#define INT_MASK_DATA_REG_EN		(1 << 2)
+#define INT_MASK_CMD_END_INT_EN		(1 << 1)
+#define INT_STATUS_REG		0x14
+#define INT_STATUS_ECC_INT_FL(CS)	(1 << (24 + (CS)))
+#define INT_STATUS_STAT_ERR_INT_FL(CS)	(1 << (16 + (CS)))
+#define INT_STATUS_MEM_RDY_INT_FL(CS)	(1 << (8 + (CS)))
+#define INT_STATUS_DMA_INT_FL		(1 << 3)
+#define INT_STATUS_DATA_REG_FL		(1 << 2)
+#define INT_STATUS_CMD_END_INT_FL	(1 << 1)
+#define ECC_CTRL_REG		0x18
+#define ECC_CTRL_ECC_CAP_2		(0 << 0)
+#define ECC_CTRL_ECC_CAP_4		(1 << 0)
+#define ECC_CTRL_ECC_CAP_8		(2 << 0)
+#define ECC_CTRL_ECC_CAP_16		(3 << 0)
+#define ECC_CTRL_ECC_CAP_24		(4 << 0)
+#define ECC_CTRL_ECC_CAP_32		(5 << 0)
+#define ECC_CTRL_ECC_CAP(B)		((B) < 24 ? ffs(B) - 2 : (B) / 6)
+/* # ECC corrections that are acceptable during read before setting OVER flag */
+#define ECC_CTRL_ECC_THRESHOLD(VAL)	(((VAL) & 0x3f) << 8)
+#define ECC_OFFSET_REG		0x1C
+#define ECC_STAT_REG		0x20
+/* Correctable error flag(s) */
+#define ECC_STAT_ERROR(CS)		(1 << (0 + (CS)))
+/* Uncorrectable error flag(s) */
+#define ECC_STAT_UNC(CS)		(1 << (8 + (CS)))
+/* Acceptable errors level overflow flag(s) */
+#define ECC_STAT_OVER(CS)		(1 << (16 + (CS)))
+#define ADDR0_COL_REG		0x24
+#define ADDR0_ROW_REG		0x28
+#define ADDR1_COL_REG		0x2C
+#define ADDR1_ROW_REG		0x30
+#define PROTECT_REG		0x34
+#define FIFO_DATA_REG		0x38
+#define DATA_REG_REG		0x3C
+#define DATA_REG_SIZE_REG	0x40
+#define DATA_REG_SIZE_DATA_REG_SIZE(SIZE) (((SIZE) - 1) & 3)
+#define DEV0_PTR_REG		0x44
+#define DEV1_PTR_REG		0x48
+#define DEV2_PTR_REG		0x4C
+#define DEV3_PTR_REG		0x50
+#define DEV4_PTR_REG		0x54
+#define DEV5_PTR_REG		0x58
+#define DEV6_PTR_REG		0x5C
+#define DEV7_PTR_REG		0x60
+#define DMA_ADDR_L_REG		0x64
+#define DMA_ADDR_H_REG		0x68
+#define DMA_CNT_REG		0x6C
+#define DMA_CTRL_REG		0x70
+#define DMA_CTRL_DMA_START		(1 << 7) /* start on command */
+#define DMA_CTRL_DMA_MODE_SG		(1 << 5) /* scatter/gather mode */
+#define DMA_CTRL_DMA_BURST_I_P_4	(0 << 2) /* incr. precise burst */
+#define DMA_CTRL_DMA_BURST_S_P_16	(1 << 2) /* stream precise burst */
+#define DMA_CTRL_DMA_BURST_SINGLE	(2 << 2) /* single transfer */
+#define DMA_CTRL_DMA_BURST_UNSPEC	(3 << 2) /* burst of unspec. length */
+#define DMA_CTRL_DMA_BURST_I_P_8	(4 << 2) /* incr. precise burst */
+#define DMA_CTRL_DMA_BURST_I_P_16	(5 << 2) /* incr. precise burst */
+#define DMA_CTRL_ERR_FLAG		(1 << 1) /* read only */
+#define DMA_CTRL_DMA_READY		(1 << 0) /* read only */
+#define BBM_CTRL_REG		0x74
+#define MEM_CTRL_REG		0x80
+#define MEM_CTRL_MEM_CE(CE)		(((CE) & 7) << 0)
+#define MEM_CTRL_BANK_SEL(BANK)		(((BANK) & 7) << 16)
+#define DATA_SIZE_REG		0x84
+#define TIMINGS_ASYN_REG	0x88
+#define TIMINGS_SYN_REG		0x8C
+#define TIME_SEQ_0_REG		0x90
+#define TIME_SEQ_1_REG		0x94
+#define TIME_GEN_SEQ_0_REG	0x98
+#define TIME_GEN_SEQ_1_REG	0x9C
+#define TIME_GEN_SEQ_2_REG	0xA0
+#define FIFO_INIT_REG		0xB0
+#define FIFO_INIT_FIFO_INIT			1 /* Flush FIFO */
+#define FIFO_STATE_REG		0xB4
+#define FIFO_STATE_DF_W_EMPTY		(1 << 7)
+#define FIFO_STATE_DF_R_FULL		(1 << 6)
+#define FIFO_STATE_CF_ACCPT_W		(1 << 5)
+#define FIFO_STATE_CF_ACCPT_R		(1 << 4)
+#define FIFO_STATE_CF_FULL		(1 << 3)
+#define FIFO_STATE_CF_EMPTY		(1 << 2)
+#define FIFO_STATE_DF_W_FULL		(1 << 1)
+#define FIFO_STATE_DF_R_EMPTY		(1 << 0)
+#define GEN_SEQ_CTRL_REG	0xB8		/* aka GENERIC_SEQ_CTRL */
+#define _CMD0_EN_SHIFT			0
+#define _CMD1_EN_SHIFT			1
+#define _CMD2_EN_SHIFT			2
+#define _CMD3_EN_SHIFT			3
+#define _COL_A0_SHIFT			4
+#define _COL_A1_SHIFT			6
+#define _ROW_A0_SHIFT			8
+#define _ROW_A1_SHIFT			10
+#define _DATA_EN_SHIFT			12
+#define _DELAY_EN_SHIFT			13
+#define _IMD_SEQ_SHIFT			15
+#define _CMD3_SHIFT			16
+#define ECC_CNT_REG		0x14C
+#define ECC_CNT_ERR_LVL_MASK		0x3F
+
+#define _CMD0_EN_MASK			1
+#define _CMD1_EN_MASK			1
+#define _CMD2_EN_MASK			1
+#define _CMD3_EN_MASK			1
+#define _COL_A0_MASK			3
+#define _COL_A1_MASK			3
+#define _ROW_A0_MASK			3
+#define _ROW_A1_MASK			3
+#define _DATA_EN_MASK			1
+#define _DELAY_EN_MASK			3
+#define _IMD_SEQ_MASK			1
+#define _CMD3_MASK			0xff
+
+/* DELAY_EN field values, non-shifted */
+#define _BUSY_NONE			0
+#define _BUSY_0				1
+#define _BUSY_1				2
+
+/* Slightly confusingly, the DELAYx_EN fields enable BUSY phases. */
+#define MAKE_GEN_CMD(CMD0_EN, CMD1_EN, CMD2_EN, CMD3_EN, \
+		     COL_A0, ROW_A0, COL_A1, ROW_A1, \
+		     DATA_EN, BUSY_EN, IMMEDIATE_SEQ, CMD3) \
+	((((CMD0_EN)	& _CMD0_EN_MASK)	<< _CMD0_EN_SHIFT)	| \
+	 (((CMD1_EN)	& _CMD1_EN_MASK)	<< _CMD1_EN_SHIFT)	| \
+	 (((CMD2_EN)	& _CMD2_EN_MASK)	<< _CMD2_EN_SHIFT)	| \
+	 (((CMD3_EN)	& _CMD3_EN_MASK)	<< _CMD3_EN_SHIFT)	| \
+	 (((COL_A0)	& _COL_A0_MASK)		<< _COL_A0_SHIFT)	| \
+	 (((COL_A1)	& _COL_A1_MASK)		<< _COL_A1_SHIFT)	| \
+	 (((ROW_A0)	& _ROW_A0_MASK)		<< _ROW_A0_SHIFT)	| \
+	 (((ROW_A1)	& _ROW_A1_MASK)		<< _ROW_A1_SHIFT)	| \
+	 (((DATA_EN)	& _DATA_EN_MASK)	<< _DATA_EN_SHIFT)	| \
+	 (((BUSY_EN)	& _DELAY_EN_MASK)	<< _DELAY_EN_SHIFT)	| \
+	 (((IMMEDIATE_SEQ) & _IMD_SEQ_MASK)	<< _IMD_SEQ_SHIFT)	| \
+	 (((CMD3)	& _CMD3_MASK)		<< _CMD3_SHIFT))
+
+/* The sequence encodings are not trivial. The ones we use are listed here. */
+#define _SEQ_0			0x00 /* send one cmd, then wait for ready */
+#define _SEQ_1			0x21 /* send one cmd, one addr, fetch data */
+#define _SEQ_2			0x22 /* send one cmd, one addr, fetch data */
+#define _SEQ_4			0x24 /* single cycle write then read */
+#define _SEQ_10			0x2A /* read page */
+#define _SEQ_12			0x0C /* write page, don't wait for R/B */
+#define _SEQ_18			0x32 /* read page using general cycle */
+#define _SEQ_19			0x13 /* write page using general cycle */
+#define _SEQ_14			0x0E /* 3 address cycles, for block erase */
+
+#define MLUN_REG		0xBC
+#define DEV0_SIZE_REG		0xC0
+#define DEV1_SIZE_REG		0xC4
+#define DEV2_SIZE_REG		0xC8
+#define DEV3_SIZE_REG		0xCC
+#define DEV4_SIZE_REG		0xD0
+#define DEV5_SIZE_REG		0xD4
+#define DEV6_SIZE_REG		0xD8
+#define DEV7_SIZE_REG		0xDC
+#define SS_CCNT0_REG		0xE0
+#define SS_CCNT1_REG		0xE4
+#define SS_SCNT_REG		0xE8
+#define SS_ADDR_DEV_CTRL_REG	0xEC
+#define SS_CMD0_REG		0xF0
+#define SS_CMD1_REG		0xF4
+#define SS_CMD2_REG		0xF8
+#define SS_CMD3_REG		0xFC
+#define SS_ADDR_REG		0x100
+#define SS_MSEL_REG		0x104
+#define SS_REQ_REG		0x108
+#define SS_BRK_REG		0x10C
+#define DMA_TLVL_REG		0x114
+#define DMA_TLVL_MAX		0xFF
+#define AES_CTRL_REG		0x118
+#define AES_DATAW_REG		0x11C
+#define AES_SVECT_REG		0x120
+#define CMD_MARK_REG		0x124
+#define LUN_STATUS_0_REG	0x128
+#define LUN_STATUS_1_REG	0x12C
+#define TIMINGS_TOGGLE_REG	0x130
+#define TIME_GEN_SEQ_3_REG	0x134
+#define SQS_DELAY_REG		0x138
+#define CNE_MASK_REG		0x13C
+#define CNE_VAL_REG		0x140
+#define CNA_CTRL_REG		0x144
+#define INTERNAL_STATUS_REG	0x148
+#define ECC_CNT_REG		0x14C
+#define PARAM_REG_REG		0x150
+
+/* NAND flash command generation */
+
+/* NAND flash command codes */
+#define NAND_RESET		0xff
+#define NAND_READ_STATUS	0x70
+#define NAND_READ_ID		0x90
+#define NAND_READ_ID_ADDR_STD	0x00	/* address written to ADDR0_COL */
+#define NAND_READ_ID_ADDR_ONFI	0x20	/* address written to ADDR0_COL */
+#define NAND_READ_ID_ADDR_JEDEC	0x40	/* address written to ADDR0_COL */
+#define NAND_PARAM		0xEC
+#define NAND_PARAM_SIZE_MAX		768 /* bytes */
+#define NAND_PAGE_READ		0x00
+#define NAND_PAGE_READ_END	0x30
+#define NAND_BLOCK_ERASE	0x60
+#define NAND_BLOCK_ERASE_END	0xd0
+#define NAND_PAGE_WRITE		0x80
+#define NAND_PAGE_WRITE_END	0x10
+
+#define _DONT_CARE 0x00 /* When we don't have anything better to say */
+
+
+/* Assembled values for putting into COMMAND register */
+
+/* Reset NAND flash */
+
+/* Uses SEQ_0: non-directional sequence, single command, wait for ready */
+#define COMMAND_RESET \
+	MAKE_COMMAND(_SEQ_0, INPUT_SEL_SIU, DATA_SEL_FIFO, \
+		NAND_RESET, _DONT_CARE, _DONT_CARE)
+
+/* Read status */
+
+/* Uses SEQ_4: single command, then read data via DATA_REG */
+#define COMMAND_READ_STATUS \
+	MAKE_COMMAND(_SEQ_4, INPUT_SEL_SIU, DATA_SEL_DATA_REG, \
+		NAND_READ_STATUS, _DONT_CARE, _DONT_CARE)
+
+/* Read ID */
+
+/* Uses SEQ_1: single command, ADDR0_COL, then read data via FIFO */
+/* ADDR0_COL is set to NAND_READ_ID_ADDR_STD for non-ONFi, and
+ * NAND_READ_ID_ADDR_ONFI for ONFi.
+ * The controller reads 5 bytes in the non-ONFi case, and 4 bytes in the
+ * ONFi case, so the data reception (DMA or FIFO_REG) needs to be set up
+ * accordingly. */
+#define COMMAND_READ_ID \
+	MAKE_COMMAND(_SEQ_1, INPUT_SEL_DMA, DATA_SEL_FIFO, \
+		NAND_READ_ID, _DONT_CARE, _DONT_CARE)
+
+#define COMMAND_PARAM \
+	MAKE_COMMAND(_SEQ_2, INPUT_SEL_DMA, DATA_SEL_FIFO, \
+		NAND_PARAM, _DONT_CARE, _DONT_CARE)
+
+/* Page read via slave interface (FIFO_DATA register) */
+
+/* Standard 5-cycle read command, with 0x30 end-of-cycle marker */
+/* Uses SEQ_10: CMD0 + 5 address cycles + CMD2, read data */
+#define COMMAND_READ_PAGE_STD \
+	MAKE_COMMAND(_SEQ_10, INPUT_SEL_SIU, DATA_SEL_FIFO, \
+		NAND_PAGE_READ, _DONT_CARE, NAND_PAGE_READ_END)
+
+/* 4-cycle read command, together with GEN_SEQ_CTRL_READ_PAGE_4CYCLE */
+/* Uses SEQ_18 (generic command sequence, see GEN_SEQ_ECTRL_READ_PAGE_4CYCLE)):
+   CMD0 + 2+2 address cycles + CMD2, read data */
+#define COMMAND_READ_PAGE_GEN \
+	MAKE_COMMAND(_SEQ_18, INPUT_SEL_SIU, DATA_SEL_FIFO, \
+		NAND_PAGE_READ, _DONT_CARE, NAND_PAGE_READ_END)
+
+/* Page read via master interface (DMA) */
+
+/* Standard 5-cycle read command, with 0x30 end-of-cycle marker */
+/* Uses SEQ_10: CMD0 + 5 address cycles + CMD2, read data */
+#define COMMAND_READ_PAGE_DMA_STD \
+	MAKE_COMMAND(_SEQ_10, INPUT_SEL_DMA, DATA_SEL_FIFO, \
+		NAND_PAGE_READ, _DONT_CARE, NAND_PAGE_READ_END)
+
+/* 4-cycle read command, together with GEN_SEQ_CTRL_READ_PAGE_4CYCLE */
+/* Uses SEQ_18 (generic command sequence, see GEN_SEQ_ECTRL_READ_PAGE_4CYCLE)):
+   CMD0 + 2+2 address cycles + CMD2, read data */
+#define COMMAND_READ_PAGE_DMA_GEN \
+	MAKE_COMMAND(_SEQ_18, INPUT_SEL_DMA, DATA_SEL_FIFO, \
+		NAND_PAGE_READ, _DONT_CARE, NAND_PAGE_READ_END)
+
+/* Page write via master interface (DMA) */
+
+/* Uses SEQ_12: CMD0 + 5 address cycles + write data + CMD1 */
+#define COMMAND_WRITE_PAGE_DMA_STD \
+	MAKE_COMMAND(_SEQ_12, INPUT_SEL_DMA, DATA_SEL_FIFO, \
+		NAND_PAGE_WRITE, NAND_PAGE_WRITE_END, _DONT_CARE)
+
+/* Uses SEQ_19: CMD0 + 4 address cycles + write data + CMD1 */
+#define COMMAND_WRITE_PAGE_DMA_GEN \
+	MAKE_COMMAND(_SEQ_19, INPUT_SEL_DMA, DATA_SEL_FIFO, \
+		NAND_PAGE_WRITE, NAND_PAGE_WRITE_END, _DONT_CARE)
+
+/* Block erase */
+
+/* Uses SEQ_14: CMD0 + 3 address cycles + CMD1 */
+#define COMMAND_BLOCK_ERASE \
+	MAKE_COMMAND(_SEQ_14, INPUT_SEL_SIU, DATA_SEL_FIFO, \
+		NAND_BLOCK_ERASE, NAND_BLOCK_ERASE_END, _DONT_CARE)
+
+/* Assembled values for putting into GEN_SEQ_CTRL register */
+
+/* General command sequence specification for 4 cycle PAGE_READ command */
+#define GEN_SEQ_CTRL_READ_PAGE_4CYCLE \
+	MAKE_GEN_CMD(1, 0, 1, 0,	/* enable command 0 and 2 phases */ \
+		     2, 2,		/* col A0 2 cycles, row A0 2 cycles */ \
+		     0, 0,		/* col A1, row A1 not used */ \
+		     1,			/* data phase enabled */ \
+		     _BUSY_0,		/* busy0 phase enabled */ \
+		     0,			/* immediate cmd execution disabled */ \
+		     _DONT_CARE)	/* command 3 code not needed */
+
+/* General command sequence specification for 4 cycle PAGE_PROGRAM command */
+#define GEN_SEQ_CTRL_WRITE_PAGE_4CYCLE \
+	MAKE_GEN_CMD(1, 1, 0, 0,	/* enable command 0 and 1 phases */ \
+		     2, 2,		/* col A0 2 cycles, row A0 2 cycles */ \
+		     0, 0,		/* col A1, row A1 not used */ \
+		     1,			/* data phase enabled */ \
+		     _BUSY_1,		/* busy1 phase enabled */ \
+		     0,			/* immediate cmd execution disabled */ \
+		     _DONT_CARE)	/* command 3 code not needed */
+
+/* BCH ECC size calculations. Should really go somewhere else? */
+/* From "Mr. NAND's Wild Ride: Warning: Suprises Ahead", by Robert Pierce,
+ * Denali Software Inc. 2009, table on page 5 */
+/* Use 8 bit correction as base. */
+#define ECC8_BYTES(BLKSIZE) (ffs(BLKSIZE) + 3)
+/* The following would be valid for 4..24 bits of correction. */
+#define ECC_BYTES_PACKED(CAP, BLKSIZE) ((ECC8_BYTES(BLKSIZE) * (CAP) + 7) / 8)
+/* Our hardware however requires more bytes than strictly necessary due to
+ * the internal design. */
+#define ECC_BYTES(CAP, BLKSIZE) ((ECC8_BYTES(1024) * (CAP) + 7) / 8)
+
+/* Read modes */
+enum nfc_read_mode {
+	NFC_READ_STD, /* Standard page read with ECC */
+	NFC_READ_RAW, /* Raw mode read of main area without ECC */
+	NFC_READ_OOB, /* Read oob only (no ECC) */
+	NFC_READ_ALL  /* Read main+oob in raw mode (no ECC) */
+};
+
+/* Timing parameters, from dt */
+struct nfc_timings {
+	uint32_t time_seq_0;
+	uint32_t time_seq_1;
+	uint32_t timings_asyn;
+	uint32_t time_gen_seq_0;
+	uint32_t time_gen_seq_1;
+	uint32_t time_gen_seq_2;
+	uint32_t time_gen_seq_3;
+};
+
+/* Configuration, from dt */
+struct nfc_setup {
+	nand_ecc_modes_t ecc_mode;
+	int ecc_blksize;
+	int ecc_strength;
+	bool on_flash_bbt;
+	struct nfc_timings timings;
+	bool use_bank_select; /* CE selects 'bank' rather than 'chip' */
+	bool rb_wired_and;    /* Ready/busy wired AND rather than per-chip */
+};
+
+/* DMA buffer, from both software (buf) and hardware (phys) perspective. */
+struct nfc_dma {
+	void *buf; /* mapped address */
+	dma_addr_t phys; /* physical address */
+	int bytes_left; /* how much data left to read from buffer? */
+	int buf_bytes; /* how much allocated data in the buffer? */
+	uint8_t *ptr; /* work pointer */
+};
+
+#ifndef POLLED_XFERS
+/* Interrupt management */
+struct nfc_irq {
+	int done; /* interrupt triggered, consequently we're done. */
+	uint32_t int_status; /* INT_STATUS at time of interrupt */
+	wait_queue_head_t wq; /* For waiting on controller interrupt */
+};
+#endif
+
+/* Information common to all chips, including the NANDFLASH-CTRL IP */
+struct nfc_info {
+	unsigned char __iomem *regbase;
+	struct device *dev;
+	struct nand_hw_control *controller;
+	spinlock_t lock;
+	struct nfc_setup *setup;
+	struct nfc_dma dma;
+#ifndef POLLED_XFERS
+	struct nfc_irq irq;
+#endif
+};
+
+/* Per-chip controller configuration */
+struct nfc_config {
+	uint32_t mem_ctrl;
+	uint32_t control;
+	uint32_t ecc_ctrl;
+	uint32_t mem_status_mask;
+	uint32_t cs;
+};
+
+/* Cache for info that we need to save across calls to nfc_command */
+struct nfc_cmd_cache {
+	unsigned int command;
+	int page;
+	int column;
+	int write_size;
+	int oob_required;
+	int write_raw;
+};
+
+/* Information for each physical NAND chip. */
+struct chip_info {
+	struct mtd_info mtd;
+	struct nand_chip chip;
+	struct nfc_cmd_cache cmd_cache;
+	struct nfc_config nfc_config;
+};
+
+/* What we tell mtd is an mtd_info actually is a complete chip_info */
+#define TO_CHIP_INFO(mtd) ((struct chip_info *)(mtd))
+
+/* This is a global pointer, as we only support one single instance of the NFC.
+ * For multiple instances, we would need to add nfc_info as a parameter to
+ * several functions, as well as adding it as a member of the chip_info struct.
+ * Since most likely a system would only have one NFC instance, we don't
+ * go all the way implementing that feature now. */
+static struct nfc_info *nfc_info;
+
+/* The timing setup is expected to come via DT. We keep some default timings
+ * here for reference, based on a 100 MHz reference clock. */
+
+static const struct nfc_timings default_mode0_pll_enabled = {
+	0x0d151533, 0x000b0515, 0x00000046,
+	0x00150000, 0x00000000, 0x00000005, 0x00000015 };
+
+/**** Utility routines. */
+
+/* Count the number of 0's in buff upto a max of max_bits */
+/* Used to determine how many bit flips there are in an allegely erased block */
+static int count_zero_bits(uint8_t *buff, int size, int max_bits)
+{
+	int k, zero_bits = 0;
+
+	for (k = 0; k < size; k++) {
+		zero_bits += hweight8(~buff[k]);
+		if (zero_bits > max_bits)
+			break;
+	}
+
+	return zero_bits;
+}
+
+/**** Low level stuff. Read and write registers, interrupt routine, etc. */
+
+/* Read and write NFC SFR registers */
+
+static uint32_t nfc_read(uint reg_offset)
+{
+	return ioread32(nfc_info->regbase + reg_offset);
+}
+
+static void nfc_write(uint32_t data, uint reg_offset)
+{
+	/* Note: According to NANDFLASH-CTRL Design Specification, rev 1.14,
+	 * p19, the NFC SFR's can only be written when STATUS.CTRL_STAT is 0.
+	 * So, should really check for that here. */
+	iowrite32(data, nfc_info->regbase  + reg_offset);
+}
+
+#ifndef POLLED_XFERS
+static irqreturn_t nfc_irq(int irq, void *device_info)
+{
+	/* Note that device_info = nfc_info, so if we don't want a global
+	 * nfc_info we can get it via device_info. */
+
+	/* Save interrupt status in case caller wants to check what actually
+	 * happened. */
+	nfc_info->irq.int_status = nfc_read(INT_STATUS_REG);
+
+	MTD_TRACE("Got interrupt %d, INT_STATUS 0x%08x\n",
+		  irq, nfc_info->irq.int_status);
+
+	/* Note: We can't (at least in the software model) clear the interrupts
+	 * by clearing CONTROL.INT_EN, as that does not disable the interrupt
+	 * output port from the nfc towards the gic. */
+	nfc_write(0, INT_STATUS_REG);
+
+	nfc_info->irq.done = 1;
+	wake_up(&nfc_info->irq.wq);
+
+	return IRQ_HANDLED;
+}
+#endif
+
+/* Get resources from platform: register bank mapping, irqs, etc */
+static int nfc_init_resources(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct resource *resource;
+#ifndef POLLED_XFERS
+	int irq;
+#endif
+	int res;
+
+	/* Register base for controller, ultimately from device tree */
+	resource = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!resource) {
+		dev_err(dev, "No register addresses configured!\n");
+		return -ENOMEM;
+	}
+	nfc_info->regbase = devm_ioremap_resource(dev, resource);
+	if (IS_ERR(nfc_info->regbase))
+		return PTR_ERR(nfc_info->regbase);
+
+	dev_info(dev, "Got SFRs at phys %p..%p, mapped to %p\n",
+		 (void *)resource->start, (void *)resource->end,
+		 nfc_info->regbase);
+
+	/* A DMA buffer */
+	nfc_info->dma.buf =
+		dma_alloc_coherent(dev, DMA_BUF_SIZE,
+				   &nfc_info->dma.phys, GFP_KERNEL);
+	if (nfc_info->dma.buf == NULL) {
+		dev_err(dev, "dma_alloc_coherent failed!\n");
+		return -ENOMEM;
+	}
+
+	dev_info(dev, "DMA buffer %p at physical %p\n",
+		 nfc_info->dma.buf, (void *)nfc_info->dma.phys);
+
+#ifndef POLLED_XFERS
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		dev_err(dev, "No irq configured\n");
+		return irq;
+	}
+	res = request_irq(irq, nfc_irq, 0, "evatronix-nand", nfc_info);
+	if (res < 0) {
+		dev_err(dev, "request_irq failed\n");
+		return res;
+	}
+	dev_info(dev, "Successfully registered IRQ %d\n", irq);
+#endif
+
+	return 0;
+}
+
+/* Write timing setup to controller */
+static void setup_nfc_timing(struct nfc_setup *nfc_setup)
+{
+	nfc_write(nfc_setup->timings.time_seq_0, TIME_SEQ_0_REG);
+	nfc_write(nfc_setup->timings.time_seq_1, TIME_SEQ_1_REG);
+	nfc_write(nfc_setup->timings.timings_asyn, TIMINGS_ASYN_REG);
+	nfc_write(nfc_setup->timings.time_gen_seq_0, TIME_GEN_SEQ_0_REG);
+	nfc_write(nfc_setup->timings.time_gen_seq_1, TIME_GEN_SEQ_1_REG);
+	nfc_write(nfc_setup->timings.time_gen_seq_2, TIME_GEN_SEQ_2_REG);
+	nfc_write(nfc_setup->timings.time_gen_seq_3, TIME_GEN_SEQ_3_REG);
+}
+
+/* Write per-chip specific config to controller */
+static void config_nfc(struct nfc_config *nfc_config, void *ref)
+{
+	static void *saved_ref;
+
+	/* To avoid rewriting these unnecessarily every time, we only do
+	 * it when the ref has changed, or if ref == NULL (=> force). */
+	if (ref) {
+		if (ref == saved_ref)
+			return;
+		saved_ref = ref; /* only save if non-null */
+	}
+
+	nfc_write(nfc_config->mem_ctrl, MEM_CTRL_REG);
+	nfc_write(nfc_config->control, CONTROL_REG);
+	nfc_write(nfc_config->ecc_ctrl, ECC_CTRL_REG);
+}
+
+
+#ifndef POLLED_XFERS
+/* Set up interrupt and wq, with supplied interrupt mask */
+static void setup_int(uint32_t what)
+{
+	/* Flag waited on by wq */
+	nfc_info->irq.done = 0;
+
+	/* clear interrupt status bits */
+	nfc_write(0, INT_STATUS_REG);
+
+	/* set interrupt mask */
+	nfc_write(what, INT_MASK_REG);
+
+	/* enable global NFC interrupt. Ooooh... */
+	nfc_write(nfc_read(CONTROL_REG) | CONTROL_INT_EN, CONTROL_REG);
+}
+#endif
+
+/* Set up interrupt, send command, then wait for (any bit of) expected state */
+/* Before issuing a command, we should check if the controller is ready.
+ * We can't check INT_STATUS_REG.MEM0_RDY_INT_FL as it is not a status bit,
+ * it is set on an nfc state transition after the completion of for
+ * instance a page program command, so we can use it as a command
+ * completed trigger however.
+ * (See NFC Design Spec (rev 1.15) figure 35 for illustration.)
+ * TODO: However, we could check STATUS.CTRL_STAT, which should always
+ * be 0 prior to issuing a command, indicating the controller is not
+ * busy. */
+static void command_and_wait(uint32_t nfc_command, uint32_t int_state)
+#ifndef POLLED_XFERS
+{
+	long timeout;
+
+	/* Set up interrupt condition. Here we utilize the fact that the
+	 * bits in INT_STATE are the same as in INT_MASK. */
+	setup_int(int_state);
+
+	/* Send command */
+	nfc_write(nfc_command, COMMAND_REG);
+
+	/* The timeout should only trigger in abnormal situations, so
+	 * we leave it at one second for now. (nand_base uses 20ms for write
+	 * and 400ms for erase, respectively.) */
+	/* TODO: A special case might be to consider the case of an
+	 * unconnected flash chip during probe. If that causes the timeout
+	 * to be triggered, we might want to lower it, and even make it
+	 * dependent on the NAND flash command being executed. */
+	timeout = wait_event_timeout(nfc_info->irq.wq, nfc_info->irq.done,
+				     1 * HZ);
+	if (timeout <= 0) {
+		dev_info(nfc_info->dev,
+			 "Request 0x%08x timed out waiting for 0x%08x\n",
+			 nfc_command, int_state);
+		/* TODO: Do something useful here? */
+	}
+}
+#else /* POLLED_XFERS */
+{
+	int cmd_loops = 0;
+	uint32_t read_status, read_int_status, dma_status;
+
+	/* Clear interrupt status bits */
+	nfc_write(0, INT_STATUS_REG);
+
+	/* Send command */
+	nfc_write(nfc_command, COMMAND_REG);
+
+	/* Wait for command to complete */
+	MTD_TRACE("Waiting for 0x%08x bit(s) to be set in int_status\n",
+		  int_state);
+
+#define MAX_CMD_LOOPS 100000
+	do {
+		cmd_loops++;
+		read_status = nfc_read(STATUS_REG);
+		read_int_status = nfc_read(INT_STATUS_REG);
+		dma_status = nfc_read(DMA_CTRL_REG);
+		MTD_TRACE("Wait for command done: 0x%08x/0x%08x/0x%08x (%d)\n",
+			  read_status, read_int_status, dma_status, cmd_loops);
+	} while (!(read_int_status & int_state) && cmd_loops < MAX_CMD_LOOPS);
+
+	if (cmd_loops >= MAX_CMD_LOOPS)
+		MTD_TRACE("Int wait for 0x%08x timed out after %d loops: STATUS = 0x%08x, INT_STATUS=0x%08x, DMA_CTRL = 0x%08x, command 0x%08x\n",
+			  cmd_loops, int_state, read_status, read_int_status,
+			  dma_status, nfc_command);
+}
+#endif
+
+/* Initialize DMA, wq and interrupt status for upcoming transfer. */
+static void init_dma(uint64_t addr, int bytes)
+{
+	int dma_trig_level;
+
+	/* DMA control */
+
+	/* Start when COMMAND register written, set burst type/size */
+	nfc_write(DMA_CTRL_DMA_START | DMA_CTRL_DMA_BURST_I_P_4, DMA_CTRL_REG);
+
+	/* DMA address and length */
+#ifdef CADENCE_DMA64BIT
+	/* The manual says this register does not 'occur' (sic) unless
+	 * 64 bit DMA support is included. */
+	nfc_write(addr >> 32, DMA_ADDR_H_REG);
+#endif
+	nfc_write(addr, DMA_ADDR_L_REG);
+
+	/* Byte counter */
+	/* Round up to nearest 32-bit word */
+	nfc_write((bytes + 3) & 0xfffffffc, DMA_CNT_REG);
+
+	/* Cap DMA trigger level at FIFO size */
+	dma_trig_level = bytes * 8 / 32; /* 32-bit entities */
+	if (dma_trig_level > DMA_TLVL_MAX)
+		dma_trig_level = DMA_TLVL_MAX;
+	nfc_write(dma_trig_level, DMA_TLVL_REG);
+}
+
+/* Initialize transfer to or from DMA buffer */
+static void init_dmabuf(int bytes)
+{
+	nfc_info->dma.ptr = nfc_info->dma.buf;
+	nfc_info->dma.buf_bytes = nfc_info->dma.bytes_left = bytes;
+}
+
+/* Initialize controller for DATA_REG readout */
+static void init_dreg_read(int bytes)
+{
+	/* Transfer to DATA_REG register */
+	nfc_write(DATA_REG_SIZE_DATA_REG_SIZE(bytes), DATA_REG_SIZE_REG);
+}
+
+/* Set up for ECC if needed */
+static void setup_ecc(struct chip_info *info, int enable_ecc, int column)
+{
+	uint32_t control;
+
+	/* When reading the oob, we never want ECC, when reading the
+	 * main area, it depends. */
+	control = nfc_read(CONTROL_REG) & ~CONTROL_ECC_EN;
+	if (enable_ecc) {
+		nfc_write(ECC_OFFSET + info->mtd.writesize +
+			  info->chip.ecc.bytes * column / info->chip.ecc.size,
+			  ECC_OFFSET_REG);
+		control |= CONTROL_ECC_EN;
+	}
+	nfc_write(control, CONTROL_REG);
+}
+
+/* Read from flash using DMA */
+/* Assumes basic setup for DMA has been done previously. */
+/* The MTD framework never reads a complete page (main + oob) in one go
+ * when using HW ECC, so we don't need to support NFC_READ_ALL in this mode.
+ * For SW ECC we read the whole page on one go in ALL mode however. */
+static void read_dma(struct chip_info *info, int page, int column,
+		     enum nfc_read_mode m)
+{
+	int size;
+	uint32_t command;
+
+	switch (m) {
+	case NFC_READ_OOB:
+		size = info->mtd.oobsize;
+		break;
+	case NFC_READ_ALL:
+		size = info->mtd.oobsize + info->mtd.writesize;
+		break;
+	case NFC_READ_STD:
+	case NFC_READ_RAW:
+		/* If the column is set to anything but 0 in this mode
+		 * we're doing a partial page read so we need to decrease
+		 * the size accordingly. */
+		size = info->mtd.writesize - column;
+		break;
+	default:
+		BUG();
+	}
+
+	/* Set up ECC depending on mode */
+	setup_ecc(info, m == NFC_READ_STD, column);
+
+	/* Set up DMA and transfer size */
+
+	init_dmabuf(size);
+	init_dma(nfc_info->dma.phys, size);
+	nfc_write(size, DATA_SIZE_REG);
+
+	/* Set up addresses */
+
+	if (m == NFC_READ_OOB)
+		column += info->mtd.writesize;
+	nfc_write(column, ADDR0_COL_REG);
+	nfc_write(page, ADDR0_ROW_REG);
+
+	/* For devices > 128 MiB we have 5 address cycles and can use a
+	 * standard NFC command sequence. For smaller devices we have
+	 * 4 address cycles and need to use a Generic Command Sequence. */
+	if (info->chip.chipsize > (128 << 20)) {
+		command = COMMAND_READ_PAGE_DMA_STD;
+	} else {
+		nfc_write(GEN_SEQ_CTRL_READ_PAGE_4CYCLE, GEN_SEQ_CTRL_REG);
+		command = COMMAND_READ_PAGE_DMA_GEN;
+	}
+
+	command_and_wait(command, INT_STATUS_DMA_INT_FL);
+}
+
+/* Write using DMA */
+/* Assumes DMA has been set up previously and buffer contains data. */
+/* Contrary to read, column is set to writesize when writing to oob, by mtd.
+ * oob is set when the caller wants to write oob data along with the main data.
+ */
+static void write_dma(struct chip_info *info, int page, int column,
+		int oob, int raw)
+{
+	int size = info->cmd_cache.write_size;
+	uint32_t command;
+
+	if (column >= info->mtd.writesize || oob)
+		raw = 1;
+
+	setup_ecc(info, !raw, column);
+
+	/* Dump selected parts of buffer */
+	MTD_TRACE("Write %d bytes: 0x%08x 0x%08x .. 0x%08x\n", size,
+		  ((uint32_t *)(nfc_info->dma.buf))[0],
+		  ((uint32_t *)(nfc_info->dma.buf))[1],
+		  ((uint32_t *)(nfc_info->dma.buf))[size / 4 - 1]);
+
+	/* Set up DMA and transfer size */
+	init_dma(nfc_info->dma.phys, size);
+	nfc_write(size, DATA_SIZE_REG);
+
+	/* Set up addresses */
+
+	nfc_write(column, ADDR0_COL_REG);
+	nfc_write(page, ADDR0_ROW_REG);
+
+	/* For devices > 128 MiB we have 5 address cycles and can use a
+	 * standard NFC command sequence. For smaller devices we have
+	 * 4 address cycles and need to use a Generic Command Sequence. */
+	if (info->chip.chipsize > (128 << 20)) {
+		command = COMMAND_WRITE_PAGE_DMA_STD;
+	} else {
+		nfc_write(GEN_SEQ_CTRL_WRITE_PAGE_4CYCLE, GEN_SEQ_CTRL_REG);
+		command = COMMAND_WRITE_PAGE_DMA_GEN;
+	}
+
+	/* TODO: Use INT_STATUS_MEM_RDY_INT_FL(cs) instead ? */
+	command_and_wait(command, INT_STATUS_DMA_INT_FL);
+
+	/* Wait for Ready from device */
+	/* TODO: ?needed ?how */
+	/* TODO: In the same way as for erase, we could check INT_STATUS_REG.
+	 * STAT_ERR_INT0_FL, but nand_base will check the device by reading
+	 * error status anyway after the write command. */
+
+#ifdef CLEAR_DMA_BUF_AFTER_WRITE
+	/* clear buffer so it doesn't contain the written data anymore */
+	memset(nfc_info->dma.buf, 0, DMA_BUF_SIZE);
+#endif
+}
+
+/* Block erase */
+static void block_erase(int page, int cs)
+{
+	/* Set up addresses */
+	nfc_write(page, ADDR0_ROW_REG);
+	MTD_TRACE("Erase block containing page %d\n", page);
+
+	/* Send 3 address cycle block erase command */
+	command_and_wait(COMMAND_BLOCK_ERASE, INT_STATUS_MEM_RDY_INT_FL(cs));
+
+#ifndef POLLED_XFERS
+	MTD_TRACE("Erase block: INT_STATUS 0x%08x\n", nfc_info->irq.int_status);
+#endif
+	/* TODO: What to do if we get an error bit set here (i.e.INT_STATUS_REG.
+	 * STAT_ERR_INT0_FL) ? Normally, error status is checked by nand_base
+	 * by doing a status read after the erase command. So we can probably
+	 * ignore STAT_ERR_INT0_FL here. If need be, we can save the
+	 * status so a subsequent status right might use it for something.
+	 * The err bit probably just indicates that the flash didn't pull
+	 * R/_B low within tWB. */
+}
+
+/* Check for erased page.
+ * The prerequisite to calling this routine is: page has been read with
+ * HW ECC, which has returned an 'ecc uncorrectable' status, so either the
+ * page does in fact contain too many bitflips for the ECC algorithm to correct
+ * or the page is in fact erased, which results in the all-FF's ECC to
+ * be invalid relative to the all-FF's data on the page.
+ * Since with the Evatronix NFC we don't have access to either the ECC bytes
+ * or the oob area after a HW ECC read, the following algorithm is adopted:
+ * - Count the number of 0's in the main area. If there are more than
+ *   the ECC strength per ECC block we assume the page wasn't in fact erased,
+ *   and return with an error status.
+ * - If the main area appears erased, we still need to determine if the oob is
+ *   also erased, if not, it would appear that the page wasn't in fact erased,
+ *   and what we're looking at is a page of mostly-FF data with an invalid ECC.
+ *   - Thus we need to read the oob, leaving the main area at the start of the
+ *     DMA buffer in case someone actually wants to read the data later (e.g.
+ *     nanddump).
+ *   - We then count the number of non-zero bits in the oob. The accepted
+ *     number of zeros could be determined by figuring the the size ratio
+ *     of the oob compared to an ECC block. For instance, if the oob is 64
+ *     bytes, an ECC block 512 bytes, and the error correction capability
+ *     of 8 bits, then the accepted number of zeros for the oob to be
+ *     considered erased would be 64/512 * 8 = 1. Alternatively we could just
+ *     accept an error correction capability number of zeros.
+ *     If there are less than this threshold number of zero bits, the page
+ *     is considered erased. In this case we return an all-FF page to the user.
+ *     Otherwise, we consider ourselves to have an ECC error on our hands,
+ *     and we return the apropriate error status while at the same time leaving
+ *     original main area data in place, for potential scrutiny by a user space
+ *     application (e.g. nanddump).
+ * Caveat: It could be that there are some cases for which an almost-FF page
+ * yields an almost-FF ECC. If there are fewer than the error correction
+ * capability number of zero bits, we could conclude that such a page would
+ * be erased when in fact it actually contains data with too many bitflips.
+ * Experience will have to determine whether this can actually occur. From
+ * past experiences with ECC codes it seems unlikely that that trivial
+ * data will in fact result in a trivial ECC code. Even the fairly basic
+ * 1-bit error correction capability Hamming code does not on its own return
+ * an all-FF ECC for all-FF data.
+ *
+ * Function returns 1 if the page is in fact (considered) erased, 0 if not.
+ */
+static int check_erased_page(struct mtd_info *mtd, uint8_t *buf, int len)
+{
+	struct chip_info *info = TO_CHIP_INFO(mtd);
+	struct nand_chip *chip = &info->chip;
+
+	/* We calculate the number of steps here rather than grabbing
+	 * ecc.steps to handle the case of a subpage read where we
+	 * haven't read a complete page. */
+	int eccsteps = len / chip->ecc.size;
+	int eccsize = chip->ecc.size;
+	int eccstrength = chip->ecc.strength;
+
+	int main_area_zeros = 0;
+
+	int step;
+	uint8_t *bufpos = buf;
+
+	MTD_TRACE("%s: %d byte page, ecc steps %d, size %d, strength %d\n",
+		  __func__, len, eccsteps, eccsize, eccstrength);
+
+	/* Check that main area appears erased. If not, return */
+
+	for (step = 0; step < eccsteps; step++) {
+		int zeros = count_zero_bits(bufpos, eccsize, eccstrength);
+
+		if (zeros > eccstrength)
+			return 0;
+		bufpos += eccsize;
+		main_area_zeros += zeros;
+	}
+
+	/* Ok, main area seems erased. Read oob so we can check it too. */
+
+	/* Note that this will overwrite the DMA buffer with the oob data,
+	 * which is ok since the main area data has already been copied
+	 * to buf earlier. */
+	read_dma(info, info->cmd_cache.page, info->cmd_cache.column,
+		 NFC_READ_OOB);
+
+	/* We go for the simple approach and accept eccstrength zero bits */
+	if (count_zero_bits(nfc_info->dma.buf, mtd->oobsize, eccstrength) >
+	    eccstrength)
+		return 0;
+
+	MTD_TRACE("%s: Page is erased.%s\n", __func__,
+		  main_area_zeros != 0 ? " Clearing main area to 0xff." : "");
+
+	if (main_area_zeros != 0)
+		memset(buf, 0xff, len);
+
+	return 1;
+}
+
+
+/**** MTD API ****/
+
+/* For cmd_ctrl (and possibly others) we need to do absolutely nothing, but the
+ * pointer is still required to point to a valid function. */
+static void nfc_dummy_cmd_ctrl(struct mtd_info *mtd, int cmd,
+		unsigned int ctrl)
+{
+}
+
+/* Read state of ready pin */
+static int nfc_dev_ready(struct mtd_info *mtd)
+{
+	struct chip_info *info = TO_CHIP_INFO(mtd);
+	struct nfc_config *nfc_config = &info->nfc_config;
+
+	MTD_TRACE("mtd %p\n", mtd);
+
+	return !!(nfc_read(STATUS_REG) & nfc_config->mem_status_mask);
+
+}
+
+/* Read byte from DMA buffer */
+/* Not used directly, only via nfc_read_byte */
+static uint8_t nfc_read_dmabuf_byte(struct mtd_info *mtd)
+{
+	MTD_TRACE("mtd %p\n", mtd);
+	if (nfc_info->dma.bytes_left) {
+		nfc_info->dma.bytes_left--;
+		return *nfc_info->dma.ptr++;
+	} else
+		return 0; /* no data */
+}
+
+/* Read block of data from DMA buffer */
+static void nfc_read_dmabuf(struct mtd_info *mtd, uint8_t *buf, int len)
+{
+	MTD_TRACE("mtd %p, buf %p, len %d\n", mtd, buf, len);
+	if (len > nfc_info->dma.bytes_left) {
+		dev_crit(nfc_info->dev,
+			 "Trying to read %d bytes with %d bytes remaining\n",
+			 len, nfc_info->dma.bytes_left);
+		BUG();
+	}
+	memcpy(buf, nfc_info->dma.ptr, len);
+	nfc_info->dma.ptr += len;
+	nfc_info->dma.bytes_left -= len;
+}
+
+/* Set readout position in DMA buffer. Used for NAND_CMD_RNDOUT. */
+static void nfc_set_dmabuf_read_position(struct mtd_info *mtd, int offset)
+{
+	MTD_TRACE("mtd %p, offset %d\n", mtd, offset);
+	if (offset > nfc_info->dma.buf_bytes) {
+		dev_crit(nfc_info->dev,
+			 "Trying to read outside (%d) DMA buffer (%d bytes)\n",
+			 offset, nfc_info->dma.buf_bytes);
+		/* We could BUG() here but it seems a bit severe. */
+		/* Just set sane value for offset. */
+		offset = nfc_info->dma.buf_bytes;
+	}
+	nfc_info->dma.ptr = nfc_info->dma.buf;
+	nfc_info->dma.ptr += offset;
+	nfc_info->dma.bytes_left = nfc_info->dma.buf_bytes - offset;
+}
+
+/* Write block of data to DMA buffer */
+static void nfc_write_dmabuf(struct mtd_info *mtd, const uint8_t *buf, int len)
+{
+	struct chip_info *info = TO_CHIP_INFO(mtd);
+
+	MTD_TRACE("mtd %p, buf %p, len %d\n", mtd, buf, len);
+	/* TODO: Grab info pointer from mtd instead of using same always ? */
+	if (len > nfc_info->dma.bytes_left) {
+		dev_crit(nfc_info->dev,
+			 "Trying to write %d bytes with %d bytes remaining\n",
+			 len, nfc_info->dma.bytes_left);
+		BUG();
+	}
+	memcpy(nfc_info->dma.ptr, buf, len);
+	nfc_info->dma.ptr += len;
+	nfc_info->dma.bytes_left -= len;
+	info->cmd_cache.write_size += len; /* calculate total length to write */
+}
+
+/* Read byte from DMA buffer or DATA_REG, depending on previous command. */
+/* Used by MTD for reading ID bytes, and chip status */
+static uint8_t nfc_read_byte(struct mtd_info *mtd)
+{
+	struct chip_info *info = TO_CHIP_INFO(mtd);
+	uint8_t status_value;
+
+	if (info->cmd_cache.command != NAND_CMD_STATUS)
+		return nfc_read_dmabuf_byte(mtd);
+
+	MTD_TRACE("Read status\n");
+
+	/* In order to read status, we need to send a READ_STATUS command
+	 * to the NFC first, in order to get the data into the DATA_REG */
+	init_dreg_read(1);
+	/* We want to read all status bits from the device */
+	nfc_write(STATUS_MASK_STATE_MASK(0xff), STATUS_MASK_REG);
+	command_and_wait(COMMAND_READ_STATUS, INT_STATUS_DATA_REG_FL);
+	status_value = nfc_read(DATA_REG_REG) & 0xff;
+	MTD_TRACE("Status 0x%08x\n", status_value);
+	return status_value;
+}
+
+/* Do the dirty work for read_page_foo */
+static int nfc_read_page_mode(struct mtd_info *mtd, struct nand_chip *chip,
+		int offset, int len, uint8_t *buf, int oob_required, int page,
+		enum nfc_read_mode m)
+{
+	struct chip_info *info = TO_CHIP_INFO(mtd);
+	unsigned int max_bitflips;
+	uint32_t ecc_status;
+
+	MTD_TRACE("page %d, col %d, offs %d, size %d\n",
+		  page, info->cmd_cache.column, offset, len);
+
+	if (page != info->cmd_cache.page) {
+		MTD_TRACE("Warning: Read page has different page number than READ0: %d vs. %d\n",
+			  page, info->cmd_cache.page);
+	}
+
+	if (m == NFC_READ_STD) {
+		/* ECC error flags and counters are not cleared automatically
+		 * so we do it here. */
+		/* Note that the design spec says nothing about having to
+		 * zero ECC_STAT (although it explicitly says that ECC_CNT
+		 * needs to be zeroed by software), but testing on actual
+		 * hardware (RTL at this stage) reveals that this is in fact
+		 * the case. */
+		nfc_write(0, ECC_STAT_REG);
+		nfc_write(0, ECC_CNT_REG);
+	}
+
+	read_dma(info, info->cmd_cache.page, info->cmd_cache.column + offset, m);
+
+	/* This is actually nfc_read_dmabuf */
+	/* We add the offset here because the nand_base expects the data
+	 * to be in the corresponding place in the page buffer, rather than
+	 * at the beginning. */
+	chip->read_buf(mtd, buf + offset, len);
+
+	if (m == NFC_READ_RAW)
+		return 0;
+
+	/* Get ECC status from controller */
+	ecc_status = nfc_read(ECC_STAT_REG);
+	max_bitflips = nfc_read(ECC_CNT_REG) & ECC_CNT_ERR_LVL_MASK;
+
+#ifdef WORKAROUND_NO_ECC_CNT
+	/* If we get an ERROR bit set, but ECC_CNT is 0, we assume
+	 * a single bit flip has occurred for want of better information. */
+	if ((ecc_status & ECC_STAT_ERROR(info->nfc_config.cs)) &&
+	    max_bitflips == 0)
+		max_bitflips = 1;
+#endif
+
+	if (ecc_status & ECC_STAT_UNC(info->nfc_config.cs))
+		if (!check_erased_page(mtd, buf, mtd->writesize)) {
+			dev_warn(nfc_info->dev, "Uncorrected errors!\n");
+			mtd->ecc_stats.failed++;
+		}
+
+	/* The following is actually not really correct, as the stats should
+	 * reflect _all_ bitflips, not just the largest one in the latest read.
+	 * We could rectify this by reading chip->ecc.bytes at a time,
+	 * and accumulating the statistics per read, but at least for now
+	 * the additional overhead doesn't seem to warrant the increased
+	 * accuracy of the statistics, since the important figure is the
+	 * max number of bitflips in a single ECC block returned by this
+	 * function. */
+	mtd->ecc_stats.corrected += max_bitflips;
+
+	MTD_TRACE("ECC read status: %s%s%s%s, correction count %d\n",
+		  ecc_status & ECC_STAT_UNC(info->nfc_config.cs) ?
+			"Uncorrected " : "",
+		  ecc_status & ECC_STAT_ERROR(info->nfc_config.cs)
+			? "Corrected " : "",
+		  ecc_status & ECC_STAT_OVER(info->nfc_config.cs)
+			? "Over limit " : "",
+		  ecc_status & (ECC_STAT_UNC(info->nfc_config.cs) |
+				ECC_STAT_ERROR(info->nfc_config.cs) |
+				ECC_STAT_OVER(info->nfc_config.cs))
+			?  "" : "ok",
+		  max_bitflips);
+
+	/* We shouldn't see oob_required for ECC reads. */
+	if (oob_required) {
+		dev_crit(nfc_info->dev, "Need separate read for the OOB\n");
+		BUG();
+	}
+
+	return max_bitflips;
+}
+
+/* Read page with HW ECC */
+static int nfc_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
+		uint8_t *buf, int oob_required, int page)
+{
+	MTD_TRACE("page %d, oobreq %d\n", page, oob_required);
+	return nfc_read_page_mode(mtd, chip, 0, mtd->writesize, buf,
+				  oob_required, page, NFC_READ_STD);
+}
+
+#ifdef NFC_HWECC_SUBPAGE_READ
+/* Read subpage with HW ECC */
+static int nfc_read_subpage_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
+		uint32_t offset, uint32_t bytes, uint8_t *buf, int page)
+{
+	struct chip_info *info = (struct chip_info *) mtd;
+	int start_step, end_step, num_steps;
+
+	MTD_TRACE("page %d, offset %d, bytes %d\n", page, offset, bytes);
+
+	/* We can get a read request for something less than an ECC block,
+	 * so need to round up to nearest ECC block size as that's the
+	 * smallest we can read with ECC. */
+	/* Column address within the page aligned to ECC size */
+	start_step = offset / info->chip.ecc.size;
+	end_step = (offset + bytes - 1) / info->chip.ecc.size;
+	num_steps = end_step - start_step + 1;
+
+	/* Data size aligned to ECC size */
+	bytes = num_steps * chip->ecc.size;
+	offset = start_step * chip->ecc.size;
+
+	return nfc_read_page_mode(mtd, chip, offset, bytes, buf, 0, page, NFC_READ_STD);
+}
+#endif
+
+
+/* Read page with no ECC */
+static int nfc_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
+		uint8_t *buf, int oob_required, int page)
+{
+	struct chip_info *info = TO_CHIP_INFO(mtd);
+
+	MTD_TRACE("page %d, oobreq %d\n", page, oob_required);
+	/* Since we're doing a raw read we can safely ignore the return value
+	 * as it is the number of bit flips in ECC mode only. */
+	nfc_read_page_mode(mtd, chip, 0, mtd->writesize, buf, oob_required,
+			   page, NFC_READ_RAW);
+
+	if (!oob_required)
+		return 0;
+
+	/* Read OOB */
+	read_dma(info, info->cmd_cache.page, info->cmd_cache.column,
+		 NFC_READ_OOB);
+	chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
+
+	return 0;
+}
+
+/* Write page with HW ECC */
+/* This is the only place where we know we'll be writing w/ ECC */
+static int nfc_write_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
+		const uint8_t *buf, int oob_required)
+{
+	struct chip_info *info = TO_CHIP_INFO(mtd);
+
+	MTD_TRACE("oob_required %d\n", oob_required);
+
+	/* The controller can't write data to the oob when ECC is enabled,
+	 * so we set oob_required to 0 here and don't process the oob
+	 * further even if requested. This could happen for instance if
+	 * using nandwrite -o without -n . */
+	if (oob_required)
+		dev_warn(nfc_info->dev, "Tried to write OOB with ECC!\n");
+	info->cmd_cache.oob_required = 0;
+	info->cmd_cache.write_raw = 0;
+
+	/* A bit silly this, this is actually nfc_write_dmabuf */
+	chip->write_buf(mtd, buf, mtd->writesize);
+
+	return 0;
+}
+
+/* Write page with no ECC */
+/* This is the only place where we know we won't be writing w/ ECC */
+static int nfc_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
+		const uint8_t *buf, int oob_required)
+{
+	struct chip_info *info = TO_CHIP_INFO(mtd);
+
+	MTD_TRACE("oob_required %d\n", oob_required);
+
+	/* We need this for the upcoming PAGEPROG command */
+	info->cmd_cache.oob_required = oob_required;
+	info->cmd_cache.write_raw = 1;
+
+	/* A bit silly this, this is actually nfc_write_dmabuf */
+	chip->write_buf(mtd, buf, mtd->writesize);
+
+	if (oob_required)
+		chip->write_buf(mtd, info->chip.oob_poi, mtd->oobsize);
+
+	return 0;
+}
+
+
+#ifdef NFC_HWECC_SUBPAGE_WRITE
+static int nfc_write_subpage_hwecc(struct mtd_info *mtd,
+				struct nand_chip *chip, uint32_t offset,
+				uint32_t data_len, const uint8_t *buf,
+				int oob_required)
+{
+	struct chip_info *info = TO_CHIP_INFO(mtd);
+
+	MTD_TRACE("mtd %p, page %d, col %d, offset %u, len %u, oob_required %d\n",
+		  mtd, info->cmd_cache.page, info->cmd_cache.column,
+		  offset, data_len, oob_required);
+
+	/* The controller can't write data to the oob when ECC is enabled,
+	 * so we set oob_required to 0 here and don't process the oob
+	 * further even if requested. This could happen for instance if
+	 * using nandwrite -o without -n . */
+	if (oob_required)
+		dev_warn(nfc_info->dev, "Tried to write OOB with ECC!\n");
+	info->cmd_cache.oob_required = 0;
+	info->cmd_cache.write_raw = 0;
+	info->cmd_cache.column += offset;
+
+	/* A bit silly this, this is actually nfc_write_dmabuf */
+	/* Note that we need to add offset here, because the nand mtd layer
+	 * has put it at that offset in the data buffer. */
+	chip->write_buf(mtd, buf + offset, data_len);
+
+	return 0;
+}
+#endif
+
+/* Handle commands from MTD NAND layer */
+static void nfc_command(struct mtd_info *mtd, unsigned int command,
+			     int column, int page_addr)
+{
+	/* We know that an mtd belonging to us is actually only the first
+	 * struct in a multi-struct structure. */
+	struct chip_info *info = TO_CHIP_INFO(mtd);
+
+	/* Save command so that other parts of the API can figure out
+	 * what's actually going on. */
+	info->cmd_cache.command = command;
+
+	/* Configure the NFC for the flash chip in question. */
+	config_nfc(&info->nfc_config, info);
+
+	/* Some commands we execute immediately, while some need to be
+	 * deferred until we have all the data needed, i.e. for page read,
+	 * we can't initiate the read until we know if we are going to be
+	 * using raw mode or not.
+	 */
+	switch (command) {
+	case NAND_CMD_READ0:
+		MTD_TRACE("READ0 page %d, column %d\n", page_addr, column);
+		if (nfc_info->setup->ecc_mode == NAND_ECC_HW) {
+			/* We do not yet know if the caller wants to
+			 * read the page with or without ECC, so we
+			 * just store the page number and main/oob flag
+			 * here.
+			 * TODO: Since the page number arrives via the
+			 * read_page call, we don't really need to
+			 * store it. */
+			info->cmd_cache.page = page_addr;
+			info->cmd_cache.column = column;
+		} else {
+			/* Read the whole page including oob */
+			info->cmd_cache.oob_required = 1;
+			read_dma(info, page_addr, column, NFC_READ_ALL);
+		}
+		break;
+	case NAND_CMD_READOOB:
+		MTD_TRACE("READOOB page %d, column %d\n", page_addr, column);
+		/* In contrast to READ0, where nand_base always calls
+		 * a read_page_foo function before reading the data,
+		 * for READOOB, read_buf is called instead.
+		 * We don't want the actual read in read_buf, so
+		 * we put it here. */
+		read_dma(info, page_addr, column, NFC_READ_OOB);
+		break;
+	case NAND_CMD_RNDOUT:
+		MTD_TRACE("RNDOUT column %d\n", column);
+		/* Just set read position in buffer of previously performed
+		 * read operation. */
+		nfc_set_dmabuf_read_position(mtd, column);
+		break;
+	case NAND_CMD_ERASE1:
+		MTD_TRACE("ERASE1 page %d\n", page_addr);
+		/* Just grab page parameter, wait until ERASE2 to do
+		 * something. */
+		info->cmd_cache.page = page_addr;
+		break;
+	case NAND_CMD_ERASE2:
+		MTD_TRACE("ERASE2 page %d, do it\n", info->cmd_cache.page);
+		/* Off we go! */
+		block_erase(info->cmd_cache.page, info->nfc_config.cs);
+		break;
+	case NAND_CMD_RESET:
+		MTD_TRACE("chip reset\n");
+		/* Clear the FIFOs */
+		nfc_write(FIFO_INIT_FIFO_INIT, FIFO_INIT_REG);
+		command_and_wait(COMMAND_RESET,
+				 INT_STATUS_CMD_END_INT_FL);
+		break;
+	case NAND_CMD_SEQIN:
+		MTD_TRACE("SEQIN column %d, page %d\n", column, page_addr);
+		/* Just grab some parameters, then wait until
+		 * PAGEPROG to do the actual operation. */
+		info->cmd_cache.page = page_addr;
+		info->cmd_cache.column = column;
+		info->cmd_cache.write_size = 0; /* bumped by nfc_write_dmabuf */
+		/* Prepare DMA buffer for data. We don't yet know
+		 * how much data there is, so set size to max. */
+		init_dmabuf(DMA_BUF_SIZE);
+		break;
+	case NAND_CMD_PAGEPROG:
+		/* Used for both main area and oob */
+		MTD_TRACE("PAGEPROG page %d, column %d, w/oob %d, raw %d\n",
+			  info->cmd_cache.page, info->cmd_cache.column,
+			  info->cmd_cache.oob_required,
+			  info->cmd_cache.write_raw);
+		write_dma(info, info->cmd_cache.page,
+			  info->cmd_cache.column,
+			  info->cmd_cache.oob_required,
+			  info->cmd_cache.write_raw);
+		break;
+	case NAND_CMD_READID:
+		MTD_TRACE("READID (0x%02x)\n", column);
+#ifdef WORKAROUND_READ_ID
+		/* The softare model can only handle 0x00 and 0x20; the
+		 * documentation for the IP doesn't actually say that values
+		 * other than 0x00 and 0x20 are illegal, but only specifies
+		 * the behavior for these two values. Since Linux 3.15 the
+		 * kernel tries to probe for JEDEC compatible flashes, with a
+		 * READ ID address byte of 0x40, and not just ONFi as
+		 * previously. So for addresses we can't handle simply bail
+		 * out here, setting the DMA read pointer to not read anything
+		 * from the DMA buffer, causing subsequent read_byte operations
+		 * to return zeros. */
+		if (column != 0x00 && column != 0x20) {
+			init_dmabuf(0);
+			return;
+		}
+#endif
+
+		/* Read specified ID bytes */
+		/* 0x00 would be NAND_READ_ID_ADDR_STD
+		 * 0x20 would be NAND_READ_ID_ADDR_ONFI,
+		 * but NAND subsystem knows this and sends us the
+		 * address values directly */
+		nfc_write(column, ADDR0_COL_REG);
+
+		/* Set up expected number of returned bytes */
+		{
+			/* TODO: Handle NAND_READ_ID_ADDR_JEDEC too,
+			 * or perhaps just set returned size to 8 for all
+			 * and be happy (but see WORKAROUND_READ_ID). */
+			int size = (column == NAND_READ_ID_ADDR_STD ? 5 : 4);
+
+			init_dmabuf(size);
+			init_dma(nfc_info->dma.phys, size);
+			nfc_write(size, DATA_SIZE_REG);
+		}
+
+		/* Send read id command */
+		command_and_wait(COMMAND_READ_ID,
+				 INT_STATUS_DMA_INT_FL);
+		break;
+	case NAND_CMD_STATUS:
+		MTD_TRACE("STATUS, defer to later read byte\n");
+		/* Don't do anything now, wait until we need to
+		 * actually read status. */
+		break;
+	case NAND_CMD_PARAM:
+		MTD_TRACE("PARAM (0x%02x)\n", column);
+
+		nfc_write(column, ADDR0_COL_REG);
+		nfc_write(0, ADDR0_ROW_REG);
+
+		init_dmabuf(NAND_PARAM_SIZE_MAX);
+		init_dma(nfc_info->dma.phys, NAND_PARAM_SIZE_MAX);
+		nfc_write(NAND_PARAM_SIZE_MAX, DATA_SIZE_REG);
+
+		command_and_wait(COMMAND_PARAM,
+				 INT_STATUS_DMA_INT_FL);
+		break;
+	default:
+		MTD_TRACE("Unhandled command 0x%02x (col %d, page addr %d)\n",
+			  command, column, page_addr);
+		break;
+	}
+}
+
+
+/**** Top level probing and device management ****/
+
+/* Get configuration from device tree */
+static int nfc_get_dt_config(struct platform_device *pdev)
+{
+	struct nfc_setup *nfc_setup = dev_get_platdata(&pdev->dev);
+	struct device *dev = &pdev->dev;
+	struct device_node *np = pdev->dev.of_node;
+	int res, timings;
+
+	if (!np) {
+		dev_err(dev, "No configuration\n");
+		return -EINVAL;
+	}
+
+	/* ECC parameters */
+	res = of_get_nand_ecc_mode(np);
+	if (res == NAND_ECC_HW || res == NAND_ECC_SOFT_BCH)
+		nfc_setup->ecc_mode = res;
+	else
+		dev_warn(dev, "Unsupported/unset ECC mode, using default\n");
+
+	res = of_get_nand_ecc_strength(np);
+	/* NFC can handle 2 bits but ECC_BYTES macro can't and it's
+	 * highly unlikely we'd ever need to support 2 bits correction
+	 * in practice, so don't allow that case here. */
+	if (res < 0 ||
+	    (res != 4 && res != 8 && res != 16 && res != 24 && res != 32))
+		dev_warn(dev, "Unsupported ECC strength, using default\n");
+	else
+		nfc_setup->ecc_strength = res;
+
+	res = of_get_nand_ecc_step_size(np);
+	if (res < 0 || (res != 256 && res != 512 && res != 1024))
+		dev_warn(dev, "Unsupported ECC step size, using default\n");
+	else
+		nfc_setup->ecc_blksize = res;
+
+	nfc_setup->on_flash_bbt = of_get_nand_on_flash_bbt(np);
+
+	timings = sizeof(nfc_setup->timings) / sizeof(u32);
+	res = of_property_read_u32_array(np, "timings",
+					 (u32 *)&nfc_setup->timings, timings);
+	if (res < 0) {
+		dev_warn(dev, "NAND timing setup missing, using defaults\n");
+		/* Default values have been set, but we don't know what
+		 * read_u32_array does if it fails during parsing, so reset
+		 * them here again. */
+		memcpy(&nfc_setup->timings, &default_mode0_pll_enabled,
+		       sizeof(nfc_setup->timings));
+	}
+
+	res = !!of_get_property(np, "use-bank-select", NULL);
+	if (res)
+		nfc_setup->use_bank_select = true;
+
+	res = !!of_get_property(np, "rb-wired-and", NULL);
+	if (res)
+		nfc_setup->rb_wired_and = true;
+
+	return 0;
+}
+
+/* Per-NAND-chip initialization. */
+static __init
+struct mtd_info *nfc_flash_probe(struct platform_device *pdev,
+				      unsigned bank_no)
+{
+	struct chip_info *this;
+	struct device *dev = &pdev->dev;
+	int pages_per_block, ecc_blksize, ecc_strength;
+	struct nfc_setup *nfc_setup = nfc_info->setup;
+
+	/* Allocate memory for MTD device structure and private data */
+	this = devm_kzalloc(dev, sizeof(struct chip_info), GFP_KERNEL);
+	if (!this)
+		return NULL;
+
+	/* Link the private data with the mtd structure */
+	this->mtd.priv = &this->chip;
+
+	/* Set up basic config for NAND controller hardware */
+
+	/* Device control. */
+	if (nfc_setup->use_bank_select) {
+		/* Separate chips regarded as different banks. */
+		this->nfc_config.mem_ctrl = MEM_CTRL_BANK_SEL(bank_no);
+		this->nfc_config.cs = 0;
+	} else {
+		/* Separate chips regarded as different chip selects. */
+		this->nfc_config.mem_ctrl = MEM_CTRL_MEM_CE(bank_no);
+		this->nfc_config.cs = bank_no;
+	}
+
+	if (nfc_setup->rb_wired_and) {
+		/* Ready/busy from all flash chips wired-AND:ed */
+		this->nfc_config.mem_status_mask = STATUS_MEM_ST(0);
+	} else {
+		/* Ready/busy from nand flash as separate per-device signals */
+		this->nfc_config.mem_status_mask = STATUS_MEM_ST(bank_no);
+	}
+
+	/* Our interface to the mtd API */
+	this->chip.cmdfunc = nfc_command;
+	this->chip.cmd_ctrl = nfc_dummy_cmd_ctrl;
+	this->chip.dev_ready = nfc_dev_ready;
+	this->chip.read_byte = nfc_read_byte;
+	this->chip.read_buf = nfc_read_dmabuf;
+	this->chip.write_buf = nfc_write_dmabuf;
+
+	/* Scan to find existence of the device */
+	/* Note that the NFC is not completely set up at this time, but
+	 * that is ok as we only need to identify the device here. */
+	if (nand_scan_ident(&this->mtd, 1, NULL))
+		return NULL;
+
+	/* Set up rest of config for NAND controller hardware */
+
+	/* set ECC block size and pages per block */
+	pages_per_block = this->mtd.erasesize / this->mtd.writesize;
+	ecc_blksize = nfc_info->setup->ecc_blksize;
+	ecc_strength = nfc_info->setup->ecc_strength;
+	this->nfc_config.control = CONTROL_ECC_BLOCK_SIZE(ecc_blksize) |
+				   CONTROL_BLOCK_SIZE(pages_per_block);
+
+	/* Set up ECC control and offset of ECC data */
+	/* We don't use the threshold capability of the controller, as we
+	 * let mtd handle that, so set the threshold to same as capability. */
+	this->nfc_config.ecc_ctrl = ECC_CTRL_ECC_THRESHOLD(ecc_strength) |
+				    ECC_CTRL_ECC_CAP(ecc_strength);
+
+	/* Since we've now completed the configuration, we need to force it to
+	 * be written to the NFC, else the caching in config_nfc will leave
+	 * the nfc_config values written since nand_scan_ident unwritten. */
+	config_nfc(&this->nfc_config, NULL);
+
+	/* ECC setup */
+
+	/* ECC API */
+	/* Override the following functions when using hardware ECC,
+	 * otherwise we use the defaults set up by nand_base. */
+	if (nfc_info->setup->ecc_mode == NAND_ECC_HW) {
+		this->chip.ecc.read_page = nfc_read_page_hwecc;
+		this->chip.ecc.read_page_raw = nfc_read_page_raw;
+		this->chip.ecc.write_page = nfc_write_page_hwecc;
+		this->chip.ecc.write_page_raw = nfc_write_page_raw;
+#ifdef NFC_HWECC_SUBPAGE_WRITE
+		this->chip.ecc.write_subpage = nfc_write_subpage_hwecc;
+#else
+		this->chip.options |= NAND_NO_SUBPAGE_WRITE;
+#endif
+#ifdef NFC_HWECC_SUBPAGE_READ
+		this->chip.ecc.read_subpage = nfc_read_subpage_hwecc;
+		this->chip.options |= NAND_SUBPAGE_READ;
+#endif
+	}
+
+	this->chip.ecc.mode = nfc_info->setup->ecc_mode;
+
+	/* TODO: Not sure if these really need to be set for HW ECC; but
+	 * if nothing else we can use the values for our lower level driver
+	 * to have a common point where it is all set up .*/
+	this->chip.ecc.size = ecc_blksize;
+	this->chip.ecc.strength = ecc_strength;
+	this->chip.ecc.bytes = ECC_BYTES(ecc_strength, ecc_blksize);
+
+	/* We set the bitflip_threshold at 75% of the error correction
+	 * level to get some margin in case bitflips happen in parts of the
+	 * flash that we don't read that often. */
+	/* We add 1 so that an ECC strength of 1 gives us a threshold of 1;
+	 * rather academic though, as we only support BCH anyway... */
+	this->mtd.bitflip_threshold = (ecc_strength + 1) * 3 / 4;
+
+	if (nfc_info->setup->on_flash_bbt)
+		/* Enable the use of a flash based bad block table.
+		 * Since the OOB is not ECC protected we don't put BBT stuff
+		 * there. We also don't mark user-detected badblocks as bad in
+		 * their oob, only in the BBT, to avoid potential chip problems
+		 * when attempting to write bad blocks (writing to bad blocks
+		 * is not recommended according to flash manufacturers). */
+		this->chip.bbt_options = NAND_BBT_USE_FLASH | NAND_BBT_NO_OOB |
+					 NAND_BBT_NO_OOB_BBM;
+
+	this->chip.controller = nfc_info->controller;
+
+	/* Finalize NAND scan, including BBT if requested */
+	if (nand_scan_tail(&this->mtd))
+		return NULL;
+
+	this->mtd.dev.parent = &pdev->dev;
+
+	return &this->mtd;
+}
+
+/* Main probe function. Called to probe and set up device. */
+static int __init nfc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtd_info *main_mtd;
+	struct nfc_setup *nfc_setup;
+	struct nand_hw_control *controller;
+	struct mtd_part_parser_data ppdata;
+	int err = 0;
+
+	dev_info(dev, "Initializing Evatronix NANDFLASH-CTRL driver\n");
+
+	/* nfc_info is where we keep runtime information about the NFC */
+	nfc_info = devm_kzalloc(dev, sizeof(*nfc_info), GFP_KERNEL);
+	if (!nfc_info)
+		return -ENOMEM;
+
+	nfc_info->dev = dev;
+	spin_lock_init(&nfc_info->lock);
+
+	/* Set up a controller struct to act as shared lock for all devices */
+	controller = devm_kzalloc(dev, sizeof(*controller), GFP_KERNEL);
+	if (!controller)
+		return -ENOMEM;
+
+	spin_lock_init(&controller->lock);
+	init_waitqueue_head(&controller->wq);
+	nfc_info->controller = controller;
+
+	/* nfc_setup is where we keep settings from DT, in digested form */
+	nfc_setup = devm_kzalloc(dev, sizeof(*nfc_setup), GFP_KERNEL);
+	if (!nfc_setup)
+		return -ENOMEM;
+
+	pdev->dev.platform_data = nfc_setup;
+	nfc_info->setup = nfc_setup;
+
+	/* Default parameters, potentially overridden by DT */
+	nfc_setup->ecc_mode = NAND_ECC_HW;
+	nfc_setup->ecc_strength = 8;
+	nfc_setup->ecc_blksize = 512;
+	memcpy(&nfc_setup->timings, &default_mode0_pll_enabled,
+	       sizeof(nfc_setup->timings));
+
+	/* Get config from device tree. */
+	err = nfc_get_dt_config(pdev);
+	if (err) {
+		dev_err(dev, "Can't retrieve dt config\n");
+		return err;
+	}
+
+	dev_info(dev, "ECC using %s mode with strength %i and block size %i.\n",
+		nfc_setup->ecc_mode == NAND_ECC_HW ? "hardware" : "software",
+		nfc_setup->ecc_strength, nfc_setup->ecc_blksize);
+
+	/* Initialize interrupts and DMA etc. */
+	err = nfc_init_resources(pdev);
+	if (err)
+		return err;
+
+	setup_nfc_timing(nfc_setup);
+
+#ifndef POLLED_XFERS
+	init_waitqueue_head(&nfc_info->irq.wq);
+#endif
+
+	main_mtd = nfc_flash_probe(pdev, 0);
+	if (!main_mtd)
+		return -ENXIO;
+
+	/* Map mtd partitions from DT */
+	ppdata.of_node = pdev->dev.of_node;
+	err = mtd_device_parse_register(main_mtd, NULL, &ppdata, NULL, 0);
+
+	return err;
+}
+
+static const struct of_device_id nfc_id_table[] = {
+	{ .compatible = "evatronix,nandflash-ctrl" },
+	{} /* sentinel */
+};
+MODULE_DEVICE_TABLE(of, nfc_id_table);
+
+static struct platform_driver nfc_driver = {
+	.driver = {
+		.name   = "evatronix-nand",
+		.of_match_table = of_match_ptr(nfc_id_table),
+	},
+	.probe = nfc_probe,
+};
+
+module_platform_driver(nfc_driver);
+
+MODULE_AUTHOR("Ricard Wanderlof <ricardw@axis.com>");
+MODULE_DESCRIPTION("Evatronix NANDFLASH-CTRL driver");
+MODULE_LICENSE("GPL v2");
-- 
1.7.10.4


-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
