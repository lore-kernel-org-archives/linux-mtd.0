Received: from mms2.broadcom.com ([216.31.210.18])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MMuJW-0007jK-B7
	for linux-mtd@lists.infradead.org; Sat, 04 Jul 2009 01:45:40 +0000
From: "Leo (Hao) Chen" <leochen@broadcom.com>
To: "linux-arm-kernel@lists.arm.linux.org.uk"
	<linux-arm-kernel@lists.arm.linux.org.uk>,
	"Linux Kernel" <linux-kernel@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Fri, 3 Jul 2009 18:45:00 -0700
Subject: [PATCH v2 17/18] new ARM SoC support: BCMRing
Message-ID: <8628FE4E7912BF47A96AE7DD7BAC0AADCB25BA6C1F@SJEXCHCCR02.corp.ad.broadcom.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
	Russell King - ARM Linux <linux@arm.linux.org.uk>,
	Scott Branden <sbranden@broadcom.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>,
	"Leo \(Hao\) Chen" <leochen@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This is the nand driver for the new bcmring architecture.

>From d3f98479bf28324a3472f3f637014a28ffef29ab Mon Sep 17 00:00:00 2001
From: Leo Chen <leochen@broadcom.com>
Date: Fri, 3 Jul 2009 17:27:16 -0700
Subject: [PATCH 17/18] bcmring nand driver

add bcmring umi nand driver
with hardware ecc support

Signed-off-by: Leo Chen <leochen@broadcom.com>
---
 drivers/mtd/nand/Kconfig                 |   16 +
 drivers/mtd/nand/Makefile                |    2 +
 drivers/mtd/nand/nand_bcm_umi.c          |  879 ++++++++++++++++++++++++++=
++++
 drivers/mtd/nand/nand_calculate_ecc512.c |  254 +++++++++
 drivers/mtd/nand/nand_correct_data512.c  |  153 ++++++
 include/linux/mtd/nand_bcm_umi.h         |  235 ++++++++
 include/linux/mtd/nand_ecc512.h          |   26 +
 7 files changed, 1565 insertions(+), 0 deletions(-)
 create mode 100644 drivers/mtd/nand/nand_bcm_umi.c
 create mode 100644 drivers/mtd/nand/nand_calculate_ecc512.c
 create mode 100644 drivers/mtd/nand/nand_correct_data512.c
 create mode 100644 include/linux/mtd/nand_bcm_umi.h
 create mode 100644 include/linux/mtd/nand_ecc512.h

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index ce96c09..35a3f91 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -186,6 +186,22 @@ config MTD_NAND_S3C2410_CLKSTOP
          when the is NAND chip selected or released, but will save
          approximately 5mA of power when there is nothing happening.

+config MTD_NAND_BCM_UMI
+       tristate "NAND Flash support for BCM Reference Boards"
+       depends on ARCH_BCMRING && MTD_NAND
+       help
+         This enables the NAND flash controller on the BCM UMI block.
+
+         No board specfic support is done by this driver, each board
+         must advertise a platform_device for the driver to attach.
+
+config MTD_NAND_BCM_UMI_HWECC
+       bool "BCM UMI NAND Hardware ECC"
+       depends on MTD_NAND_BCM_UMI
+       help
+         Enable the use of the BCM UMI block's internal ECC generator when
+         using NAND.
+
 config MTD_NAND_DISKONCHIP
        tristate "DiskOnChip 2000, Millennium and Millennium Plus (NAND rei=
mplementation) (EXPERIMENTAL)"
        depends on EXPERIMENTAL
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index f3a786b..cfaaf38 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -40,5 +40,7 @@ obj-$(CONFIG_MTD_NAND_SH_FLCTL)               +=3D sh_flc=
tl.o
 obj-$(CONFIG_MTD_NAND_MXC)             +=3D mxc_nand.o
 obj-$(CONFIG_MTD_NAND_SOCRATES)                +=3D socrates_nand.o
 obj-$(CONFIG_MTD_NAND_TXX9NDFMC)       +=3D txx9ndfmc.o
+obj-$(CONFIG_MTD_NAND_BCM_UMI) +=3D nand_bcm_umi.o
+obj-$(CONFIG_MTD_NAND_BCM_UMI_HWECC)   +=3D nand_correct_data512.o nand_ca=
lculate_ecc512.o

 nand-objs :=3D nand_base.o nand_bbt.o
diff --git a/drivers/mtd/nand/nand_bcm_umi.c b/drivers/mtd/nand/nand_bcm_um=
i.c
new file mode 100644
index 0000000..0c75d19
--- /dev/null
+++ b/drivers/mtd/nand/nand_bcm_umi.c
@@ -0,0 +1,879 @@
+/*
+ * Copyright (c) 2005 Broadcom Corporation
+ *
+ *    This driver was based on the sharpl NAND driver written by
+ *    Richard Purdie.  Their copyright is below.
+ *    As such, this driver falls under the GPL license also below.
+ *
+ *  Copyright (C) 2004 Richard Purdie
+ *
+ *  Based on Sharp's NAND driver sharp_sl.c
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#include <linux/version.h>
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/string.h>
+#include <linux/ioport.h>
+#include <linux/device.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/platform_device.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/partitions.h>
+#include <linux/mtd/nand_ecc512.h>
+#include <linux/mtd/nand_bcm_umi.h>
+
+#include <asm/io.h>
+#include <asm/mach-types.h>
+
+#include <mach/reg_nand.h>
+#include <mach/reg_umi.h>
+#include <mach/memory_settings.h>
+
+#if NAND_ECC_BCH
+#define NAND_ECC_NUM_BYTES 13
+#else
+#define NAND_ECC_NUM_BYTES 3
+#endif
+
+#include <mach/dma.h>
+#include <linux/dma-mapping.h>
+#include <linux/completion.h>
+
+static char gBanner[] __initdata =3D KERN_INFO "BCM UMI MTD NAND Driver: 1=
.00\n";
+
+/*  Register offsets */
+#define REG_NAND_CMD_OFFSET     (0)
+#define REG_NAND_ADDR_OFFSET    (4)
+#ifndef __ARMEB__
+#define REG_NAND_DATA8_OFFSET   (8)
+#else
+#define REG_NAND_DATA8_OFFSET   (8 + 1)
+#endif
+
+/*************************************************************************=
***
+*
+*  nand_hw_eccoob
+*
+*   New oob placement block for use with hardware ecc generation.
+*
+**************************************************************************=
*/
+#if NAND_ECC_BCH
+static struct nand_ecclayout nand_hw_eccoob_512 =3D {
+       .eccbytes =3D 13,
+       .eccpos =3D {2, 3, 4, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15},
+       /* Reserve 5 for BI indicator */
+       .oobfree =3D {
+                   {.offset =3D 0, .length =3D 2}
+                        }
+};
+
+/* We treat the OOB for a 2K page as if it were 4 512 byte oobs, except th=
e BI is at byte 0. */
+
+static struct nand_ecclayout nand_hw_eccoob_2048 =3D {
+       .eccbytes =3D 52,
+       .eccpos =3D {3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
+                  19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31,
+                  35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47,
+                  51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 62},
+       /* Reserve 0 as BI indicator */
+       .oobfree =3D {
+                   {.offset =3D 1, .length =3D 2},
+                   {.offset =3D 16, .length =3D 3},
+                   {.offset =3D 32, .length =3D 3},
+                   {.offset =3D 48, .length =3D 3}
+                        }
+};
+
+/* We treat the OOB for a 4K page as if it were 8 512 byte oobs, except th=
e BI is at byte 0. */
+
+static struct nand_ecclayout nand_hw_eccoob_4096 =3D {
+       .eccbytes =3D 104,
+       .eccpos =3D {3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
+#if 0
+                  19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31,
+                  35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47,
+                  51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 62,
+                  67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79,
+                  83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95,
+                  99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 11=
0,
+                  111,
+#endif
+                  115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 1=
26,
+                  127},
+       /* Reserve 0 as BI indicator */
+       .oobfree =3D {
+                   {.offset =3D 1, .length =3D 2},
+                   {.offset =3D 16, .length =3D 3},
+                   {.offset =3D 32, .length =3D 3},
+                   {.offset =3D 48, .length =3D 3},
+                   {.offset =3D 64, .length =3D 3},
+                   {.offset =3D 80, .length =3D 3},
+                   {.offset =3D 96, .length =3D 3},
+                   {.offset =3D 112, .length =3D 3}
+                        }
+};
+#else
+/* Hamming ECC */
+
+static struct nand_ecclayout nand_hw_eccoob_512 =3D {
+       .eccbytes =3D 3,
+       .eccpos =3D {6, 7, 8},
+       /* Reserve 0/1 and 10/11 as BI indicators for 16-bit flash */
+       /* Reserve 5 for 8-bit BI */
+       /* 6/7/8 are for ecc so this is all that's left */
+       .oobfree =3D {
+                   {.offset =3D 2, .length =3D 3},
+                   {.offset =3D 9, .length =3D 1},
+                   {.offset =3D 12, .length =3D 4}
+                        }
+};
+
+/* We treat the OOB for a 2K page as if it were 4 512 byte oobs, except th=
at the ECC offset if 8 rather than 6. */
+
+static struct nand_ecclayout nand_hw_eccoob_2048 =3D {
+       .eccbytes =3D 12,
+       .eccpos =3D {8, 9, 10, 24, 25, 26, 40, 41, 42, 56, 57, 58},
+       /* Reserve 0/1 as BI indicators for 8/16-bit flash */
+       /* 8/9/10 are for ecc so this is all that's left */
+       .oobfree =3D {
+                   {.offset =3D 2, .length =3D 6},
+                   {.offset =3D 11, .length =3D 13},
+                   {.offset =3D 27, .length =3D 13},
+                   {.offset =3D 43, .length =3D 13},
+                   {.offset =3D 59, .length =3D 5}
+                        }
+};
+
+/* We treat the OOB for a 4K page as if it were 8 512 byte oobs, except th=
at the ECC offset if 8 rather than 6. */
+
+static struct nand_ecclayout nand_hw_eccoob_4096 =3D {
+       .eccbytes =3D 24,
+       .eccpos =3D
+           {8, 9, 10, 24, 25, 26, 40, 41, 42, 56, 57, 58, 72, 73, 74, 88, =
89,
+            90, 104, 105, 106, 120, 121, 122},
+       /* Reserve 0/1 as BI indicators for 8/16-bit flash */
+       /* 8/9/10 are for ecc so this is all that's left */
+       .oobfree =3D {
+                   {.offset =3D 2, .length =3D 6},
+                   {.offset =3D 11, .length =3D 13},
+                   {.offset =3D 27, .length =3D 13},
+                   {.offset =3D 43, .length =3D 13},
+                   {.offset =3D 59, .length =3D 13},
+                   {.offset =3D 75, .length =3D 13},
+                   {.offset =3D 91, .length =3D 13},
+                   {.offset =3D 107, .length =3D 13}
+                        }
+       /* .offset =3D 123,    .length =3D 5 }}    It turns out nand_ecclay=
out only has space for 8 entries */
+};
+#endif
+
+/*
+ * MTD structure for BCM UMI
+ */
+static struct mtd_info *board_mtd;
+static void __iomem *bcm_umi_io_base;
+
+/* Preallocate a buffer to avoid having to do this every dma operation. */
+/* This is the size of the preallocated coherent DMA buffer. */
+#define DMA_MIN_BUFLEN          512
+#define DMA_MAX_BUFLEN          PAGE_SIZE
+#define USE_DIRECT_IO(len)      (((len) < DMA_MIN_BUFLEN) || ((len) > DMA_=
MAX_BUFLEN))
+#if defined(CONFIG_ARCH_BCMRING)
+/*
+ * TODO: The current NAND data space goes from 0x80001900 to 0x80001FFF,
+ * which is only 0x700 =3D 1792 bytes long. This is too small for 2K, 4K p=
age
+ * size NAND flash. Need to break the DMA down to multiple 1Ks.
+ *
+ * Need to make sure REG_NAND_DATA_PADDR + DMA_MAX_LEN < 0x80002000
+ */
+#define DMA_MAX_LEN             1024
+#endif
+static void *virtPtr;
+static dma_addr_t physPtr;
+static struct completion nand_comp;
+
+/*************************************************************************=
***
+*
+*   Handler called when the DMA finishes.
+*
+**************************************************************************=
*/
+
+static void nand_dma_handler(DMA_Device_t dev, int reason, void *userData)
+{
+       complete(&nand_comp);
+}
+
+/*************************************************************************=
***
+*
+*   Function to perform DMA initialization
+*
+**************************************************************************=
*/
+
+static int nand_dma_init(void)
+{
+       int rc;
+
+       rc =3D dma_set_device_handler(DMA_DEVICE_NAND_MEM_TO_MEM, nand_dma_=
handler, NULL);
+       if (rc !=3D 0) {
+               printk(KERN_ERR "dma_set_device_handler failed: %d\n", rc);
+               return rc;
+       }
+
+       virtPtr =3D
+           dma_alloc_coherent(NULL, DMA_MAX_BUFLEN, &physPtr, GFP_KERNEL);
+       if (virtPtr =3D=3D NULL) {
+               printk("NAND - Failed to allocate memory for DMA buffer\n")=
;
+               return -ENOMEM;
+       }
+
+       return 0;
+}
+
+/*************************************************************************=
***
+*
+*   Function to perform DMA termination
+*
+**************************************************************************=
*/
+
+static void nand_dma_term(void)
+{
+       if (virtPtr !=3D NULL) {
+               dma_free_coherent(NULL, DMA_MAX_BUFLEN, virtPtr, physPtr);
+       }
+
+}
+
+/*************************************************************************=
***
+*
+*   Performs a read via DMA
+*
+**************************************************************************=
*/
+
+static void nand_dma_read(void *buf, int len)
+{
+       int offset =3D 0;
+       int tmp_len =3D 0;
+       int len_left =3D len;
+       DMA_Handle_t hndl;
+
+       if (virtPtr =3D=3D NULL) {
+               panic("nand_dma_read: virtPtr =3D=3D NULL\n");
+       }
+       if ((void *)physPtr =3D=3D NULL) {
+               panic("nand_dma_read: physPtr =3D=3D NULL\n");
+       }
+       hndl =3D dma_request_channel(DMA_DEVICE_NAND_MEM_TO_MEM);
+       if (hndl < 0) {
+               printk(KERN_ERR
+                      "nand_dma_read: unable to allocate dma channel: %d\n=
",
+                      (int)hndl);
+               panic("\n");
+       }
+
+       while (len_left > 0) {
+               if (len_left > DMA_MAX_LEN) {
+                       tmp_len =3D DMA_MAX_LEN;
+                       len_left -=3D DMA_MAX_LEN;
+               } else {
+                       tmp_len =3D len_left;
+                       len_left =3D 0;
+               }
+
+               init_completion(&nand_comp);
+               dma_transfer_mem_to_mem(hndl, REG_NAND_DATA_PADDR,
+                                       physPtr + offset, tmp_len);
+               wait_for_completion(&nand_comp);
+
+               offset +=3D tmp_len;
+       }
+
+       dma_free_channel(hndl);
+
+       if (buf !=3D NULL) {
+               memcpy(buf, virtPtr, len);
+       }
+}
+
+/*************************************************************************=
***
+*
+*   Performs a write via DMA
+*
+**************************************************************************=
*/
+
+static void nand_dma_write(const void *buf, int len)
+{
+       int offset =3D 0;
+       int tmp_len =3D 0;
+       int len_left =3D len;
+       DMA_Handle_t hndl;
+
+       if (buf =3D=3D NULL) {
+               panic("nand_dma_write: buf =3D=3D NULL\n");
+       }
+       if (virtPtr =3D=3D NULL) {
+               panic("nand_dma_write: virtPtr =3D=3D NULL\n");
+       }
+       if ((void *)physPtr =3D=3D NULL) {
+               panic("nand_dma_write: physPtr =3D=3D NULL\n");
+       }
+       memcpy(virtPtr, buf, len);
+
+       hndl =3D dma_request_channel(DMA_DEVICE_NAND_MEM_TO_MEM);
+       if (hndl < 0) {
+               printk(KERN_ERR
+                      "nand_dma_write: unable to allocate dma channel: %d\=
n",
+                      (int)hndl);
+               panic("\n");
+       }
+
+       while (len_left > 0) {
+               if (len_left > DMA_MAX_LEN) {
+                       tmp_len =3D DMA_MAX_LEN;
+                       len_left -=3D DMA_MAX_LEN;
+               } else {
+                       tmp_len =3D len_left;
+                       len_left =3D 0;
+               }
+
+               init_completion(&nand_comp);
+               dma_transfer_mem_to_mem(hndl, physPtr + offset,
+                                       REG_NAND_DATA_PADDR, tmp_len);
+               wait_for_completion(&nand_comp);
+
+               offset +=3D tmp_len;
+       }
+
+       dma_free_channel(hndl);
+}
+
+/*************************************************************************=
***
+*
+*  nand_dev_raedy
+*
+*   Routine to check if nand is ready.
+*
+**************************************************************************=
*/
+static int nand_dev_ready(struct mtd_info *mtd)
+{
+       return nand_bcm_umi_dev_ready();
+}
+
+/*************************************************************************=
***
+*
+*  bcm_umi_nand_inithw
+*
+*   This routine does the necessary hardware (board-specific)
+*   initializations.  This includes setting up the timings, etc.
+*
+**************************************************************************=
*/
+
+int bcm_umi_nand_inithw(void)
+{
+       /* Configure nand timing parameters */
+       /* Configure nand timing parameters */
+       REG_UMI_NAND_TCR &=3D ~0x7ffff;
+       REG_UMI_NAND_TCR |=3D HW_CFG_NAND_TCR;
+
+       REG_UMI_NAND_TCR |=3D REG_UMI_NAND_TCR_CS_SWCTRL; /* enable softwar=
e control of CS */
+       REG_UMI_NAND_RCSR |=3D REG_UMI_NAND_RCSR_CS_ASSERTED;     /* keep N=
AND chip select asserted */
+
+       REG_UMI_NAND_TCR &=3D ~REG_UMI_NAND_TCR_WORD16;
+       REG_UMI_MMD_ICR |=3D REG_UMI_MMD_ICR_FLASH_WP;    /* enable writes =
to flash */
+
+       writel(NAND_CMD_RESET, bcm_umi_io_base + REG_NAND_CMD_OFFSET);
+       nand_bcm_umi_wait_till_ready();
+
+#if NAND_ECC_BCH
+       nand_bcm_umi_bch_config_ecc(NAND_ECC_NUM_BYTES);
+#endif
+
+       return 0;
+}
+
+/*************************************************************************=
***
+*
+*  bcm_umi_nand_hwcontrol
+*
+*   Used to turn latch the proper register for access.
+*
+**************************************************************************=
*/
+
+static void bcm_umi_nand_hwcontrol(struct mtd_info *mtd, int cmd,
+                                  unsigned int ctrl)
+{
+       /* TODO: send command to hardware */
+       struct nand_chip *chip =3D mtd->priv;
+       if (ctrl & NAND_CTRL_CHANGE) {
+               if (ctrl & NAND_CLE) {
+                       chip->IO_ADDR_W =3D bcm_umi_io_base + REG_NAND_CMD_=
OFFSET;
+                       goto CMD;
+               }
+               if (ctrl & NAND_ALE) {
+                       chip->IO_ADDR_W =3D
+                           bcm_umi_io_base + REG_NAND_ADDR_OFFSET;
+                       goto CMD;
+               }
+               chip->IO_ADDR_W =3D bcm_umi_io_base + REG_NAND_DATA8_OFFSET=
;
+       }
+
+CMD:
+       /* Send command to chip directly */
+       if (cmd !=3D NAND_CMD_NONE)
+               writeb(cmd, chip->IO_ADDR_W);
+
+}
+
+/*************************************************************************=
***
+*
+*  bcm_umi_nand_get_hw_ecc
+*
+*   Used to get the hardware ECC.
+*
+**************************************************************************=
*/
+
+static int bcm_umi_nand_get_hw_ecc(struct mtd_info *mtd, const u_char *dat=
,
+                                  u_char *ecc_code)
+{
+#if NAND_ECC_BCH
+       uint32_t eccVal;
+
+       if (REG_UMI_BCH_CTRL_STATUS & REG_UMI_BCH_CTRL_STATUS_PAUSE_ECC_DEC=
) {
+               /* Don't calculate the ecc - it's a waste of time on reads =
*/
+       } else {
+               /* wait for ECC to be valid */
+               nand_bcm_umi_bch_poll_write_ecc_calc();
+               /*
+                ** Get the hardware ecc from the 32-bit result registers.
+                ** Read after 512 byte accesses. Format B3B2B1B0
+                ** where B3 =3D ecc3, etc.
+                */
+               eccVal =3D REG_UMI_BCH_WR_ECC_3;
+               ecc_code[0] =3D eccVal & 0xff;    /* ECC12 */
+               eccVal =3D REG_UMI_BCH_WR_ECC_2;
+               ecc_code[1] =3D (eccVal >> 24) & 0xff;    /* ECC11 */
+               ecc_code[2] =3D (eccVal >> 16) & 0xff;    /* ECC10 */
+               ecc_code[3] =3D (eccVal >> 8) & 0xff;     /* ECC9 */
+               ecc_code[4] =3D eccVal & 0xff;    /* ECC8 */
+               eccVal =3D REG_UMI_BCH_WR_ECC_1;
+               ecc_code[5] =3D (eccVal >> 24) & 0xff;    /* ECC7 */
+               ecc_code[6] =3D (eccVal >> 16) & 0xff;    /* ECC6 */
+               ecc_code[7] =3D (eccVal >> 8) & 0xff;     /* ECC5 */
+               ecc_code[8] =3D eccVal & 0xff;    /* ECC4 */
+               eccVal =3D REG_UMI_BCH_WR_ECC_0;
+               ecc_code[9] =3D (eccVal >> 24) & 0xff;    /* ECC3 */
+               ecc_code[10] =3D (eccVal >> 16) & 0xff;   /* ECC2 */
+               ecc_code[11] =3D (eccVal >> 8) & 0xff;    /* ECC1 */
+               ecc_code[12] =3D eccVal & 0xff;   /* ECC0 */
+       }
+#else
+       unsigned long ecc =3D REG_UMI_NAND_ECC_DATA;
+       ecc_code[2] =3D (ecc >> 16) & 0xff;
+       ecc_code[1] =3D (ecc >> 8) & 0xff;
+       ecc_code[0] =3D (ecc >> 0) & 0xff;
+#endif
+       (void)mtd;
+       (void)dat;
+
+       return 0;
+}
+
+/*************************************************************************=
***
+*
+*  bcm_umi_nand_enable_hwecc
+*
+*   Used to turn on hardware ECC.
+*
+**************************************************************************=
*/
+
+static void bcm_umi_nand_enable_hwecc(struct mtd_info *mtd, int mode)
+{
+       (void)mtd;
+       (void)mode;
+#if NAND_ECC_BCH
+       if (mode =3D=3D NAND_ECC_READ)
+               nand_bcm_umi_bch_enable_read_hwecc();
+       else if (mode =3D=3D NAND_ECC_WRITE)
+               nand_bcm_umi_bch_enable_write_hwecc();
+#else
+       nand_bcm_umi_hamming_enable_hwecc();
+#endif
+}
+
+/**
+ * bcm_umi_nand_write_buf - write buffer to chip
+ * @mtd:       MTD device structure
+ * @buf:       data buffer
+ * @len:       number of bytes to write
+ *
+ * Default write function for 8bit buswith
+ */
+static void bcm_umi_nand_write_buf(struct mtd_info *mtd, const u_char * bu=
f,
+                                  int len)
+{
+       if (USE_DIRECT_IO(len)) {
+               /* Do it the old way if the buffer is small or too large. P=
robably quicker than starting and checking dma. */
+               int i;
+               struct nand_chip *this =3D mtd->priv;
+
+               for (i =3D 0; i < len; i++) {
+                       writeb(buf[i], this->IO_ADDR_W);
+               }
+       } else {
+               nand_dma_write(buf, len);
+       }
+}
+
+/**
+ * nand_read_buf - read chip data into buffer
+ * @mtd:       MTD device structure
+ * @buf:       buffer to store date
+ * @len:       number of bytes to read
+ *
+ * Default read function for 8bit buswith
+ */
+
+static void bcm_umi_nand_read_buf(struct mtd_info *mtd, u_char * buf, int =
len)
+{
+#if NAND_ECC_BCH
+       if (len =3D=3D 16) {
+               /* We are reading the OOB */
+               int i =3D 0;
+               if (mtd->writesize =3D=3D 512) {    /* writesize is the pag=
esize */
+                       /* skip CM */
+                       buf[i++] =3D REG_NAND_DATA8;
+                       buf[i++] =3D REG_NAND_DATA8;
+
+                       /* read from 2 to 4 */
+                       nand_bcm_umi_bch_resume_read_ecc_calc();
+
+                       buf[i++] =3D REG_NAND_DATA8;
+                       buf[i++] =3D REG_NAND_DATA8;
+                       buf[i++] =3D REG_NAND_DATA8;
+                       nand_bcm_umi_bch_pause_read_ecc_calc();
+
+                       /* read BI */
+                       buf[i++] =3D REG_NAND_DATA8;
+
+                       /* read from 6 to nand_ecc_bch_total */
+                       nand_bcm_umi_bch_resume_read_ecc_calc();
+
+                       /* Deduct 3 from total since 3 ECC bytes have been =
read already */
+                       for (; i < 16; i++) {
+                               buf[i] =3D REG_NAND_DATA8;
+                       }
+               } else {
+                       /* skip BI */
+                       buf[i++] =3D REG_NAND_DATA8;
+
+                       /* skip CM */
+                       buf[i++] =3D REG_NAND_DATA8;
+                       buf[i++] =3D REG_NAND_DATA8;
+
+                       /* read ECC bytes */
+                       nand_bcm_umi_bch_resume_read_ecc_calc();
+
+                       for (; i < 16; i++) {
+                               buf[i] =3D REG_NAND_DATA8;
+                       }
+               }
+       } else
+#endif
+       {
+#if NAND_ECC_BCH
+               nand_bcm_umi_bch_enable_read_hwecc();
+#endif
+               if (USE_DIRECT_IO(len)) {
+                       int i;
+                       struct nand_chip *this =3D mtd->priv;
+
+                       for (i =3D 0; i < len; i++) {
+                               buf[i] =3D readb(this->IO_ADDR_R);
+                       }
+               } else {
+                       nand_dma_read(buf, len);
+               }
+#if NAND_ECC_BCH
+               nand_bcm_umi_bch_pause_read_ecc_calc();
+#endif
+       }
+}
+
+/**
+ * bcm_umi_nand_verify_buf - Verify chip data against buffer
+ * @mtd:       MTD device structure
+ * @buf:       buffer containing the data to compare
+ * @len:       number of bytes to compare
+ *
+ * Default verify function for 8bit buswith
+ */
+static int bcm_umi_nand_verify_buf(struct mtd_info *mtd, const u_char * bu=
f,
+                                  int len)
+{
+       if (USE_DIRECT_IO(len)) {
+               int i;
+               struct nand_chip *this =3D mtd->priv;
+               for (i =3D 0; i < len; i++) {
+                       if (buf[i] !=3D readb(this->IO_ADDR_R)) {
+                               return -EFAULT;
+                       }
+               }
+       } else {
+               nand_dma_read(NULL, len);
+               if (memcmp(buf, virtPtr, len) !=3D 0) {
+                       return -EFAULT;
+               }
+       }
+       return 0;
+}
+
+#if NAND_ECC_BCH
+static int nand_correct_bch(struct mtd_info *mtd, u_char *dat,
+                           u_char *read_ecc, u_char *calc_ecc)
+{
+       int result;
+
+       result =3D nand_bcm_umi_bch_correct_page(dat);
+
+       /* If the ECC is unprogrammed then we can't correct */
+       if (result !=3D 0) {
+               int i;
+
+               for (i =3D 0; i < NAND_ECC_NUM_BYTES; i++) {
+                       if (read_ecc[i] !=3D 0xff) {
+                               return result;
+                       }
+               }
+               result =3D 0;
+       }
+       return result;
+}
+#endif
+
+#ifdef CONFIG_MTD_PARTITIONS
+const char *part_probes[] =3D { "cmdlinepart", NULL };
+#endif
+
+static int bcm_umi_nand_probe(struct platform_device *pdev)
+{
+       struct nand_chip *this;
+       int err =3D 0;
+
+       printk(gBanner);
+
+       /* Allocate memory for MTD device structure and private data */
+       board_mtd =3D
+           kmalloc(sizeof(struct mtd_info) + sizeof(struct nand_chip),
+                   GFP_KERNEL);
+       if (!board_mtd) {
+               printk(KERN_WARNING
+                      "Unable to allocate NAND MTD device structure.\n");
+               return -ENOMEM;
+       }
+
+       /* map physical adress */
+#ifdef CONFIG_ARCH_BCMRING
+       bcm_umi_io_base =3D ioremap(MM_ADDR_IO_NAND, 0x1000);
+#else
+       bcm_umi_io_base =3D ioremap(0x08000000, 0x1000);
+#endif
+
+       if (!bcm_umi_io_base) {
+               printk("ioremap to access BCM UMI NAND chip failed\n");
+               kfree(board_mtd);
+               return -EIO;
+       }
+
+       /* Get pointer to private data */
+       this =3D (struct nand_chip *)(&board_mtd[1]);
+
+       /* Initialize structures */
+       memset((char *)board_mtd, 0, sizeof(struct mtd_info));
+       memset((char *)this, 0, sizeof(struct nand_chip));
+
+       /* Link the private data with the MTD structure */
+       board_mtd->priv =3D this;
+
+       /* Initialize the NAND hardware.  */
+       if (bcm_umi_nand_inithw() < 0) {
+               printk("BCM UMI NAND chip could not be initialized\n");
+               iounmap(bcm_umi_io_base);
+               kfree(board_mtd);
+               return -EIO;
+       }
+
+       /* Set address of NAND IO lines */
+       this->IO_ADDR_W =3D bcm_umi_io_base + REG_NAND_DATA8_OFFSET;
+       this->IO_ADDR_R =3D bcm_umi_io_base + REG_NAND_DATA8_OFFSET;
+
+       /* Set command delay time, see datasheet for correct value */
+       this->chip_delay =3D 0;
+       /* Assign the device ready function, if available */
+       this->dev_ready =3D nand_dev_ready;
+       this->options =3D 0;
+
+       this->write_buf =3D bcm_umi_nand_write_buf;
+       this->read_buf =3D bcm_umi_nand_read_buf;
+       this->verify_buf =3D bcm_umi_nand_verify_buf;
+
+       this->cmd_ctrl =3D bcm_umi_nand_hwcontrol;
+#ifdef CONFIG_MTD_NAND_BCM_UMI_HWECC
+       this->ecc.mode =3D NAND_ECC_HW;
+       this->ecc.size =3D 512;
+       this->ecc.bytes =3D NAND_ECC_NUM_BYTES;
+
+#if NAND_ECC_BCH
+       this->ecc.correct =3D nand_correct_bch;
+#else
+       this->ecc.correct =3D nand_correct_data512;
+#endif
+
+       this->ecc.calculate =3D bcm_umi_nand_get_hw_ecc;
+       this->ecc.hwctl =3D bcm_umi_nand_enable_hwecc;
+#else
+       this->ecc.mode =3D NAND_ECC_SOFT;
+#endif
+
+       err =3D nand_dma_init();
+       if (err !=3D 0) {
+               return err;
+       }
+
+       /* Figure out the size of the device that we have. We need to do th=
is to figure out which ECC
+        * layout we'll be using.                                          =
                             */
+
+       err =3D nand_scan_ident(board_mtd, 1);
+       if (err) {
+               printk(KERN_ERR "nand_scan failed: %d\n", err);
+               iounmap(bcm_umi_io_base);
+               kfree(board_mtd);
+               return err;
+       }
+
+       /* Now that we know the nand size, we can setup the ECC layout */
+
+#ifdef CONFIG_MTD_NAND_BCM_UMI_HWECC
+       switch (board_mtd->writesize) { /* writesize is the pagesize */
+       case 4096:
+               this->ecc.layout =3D &nand_hw_eccoob_4096;
+               break;
+       case 2048:
+               this->ecc.layout =3D &nand_hw_eccoob_2048;
+               break;
+       case 512:
+               this->ecc.layout =3D &nand_hw_eccoob_512;
+               break;
+       default:
+               {
+                       printk(KERN_ERR "NAND - Unrecognized pagesize: %d\n=
",
+                              board_mtd->writesize);
+                       return -EINVAL;
+               }
+       }
+#endif
+
+       /* Now finish off the scan, now that ecc.layout has been initialize=
d. */
+
+       err =3D nand_scan_tail(board_mtd);
+       if (err) {
+               printk(KERN_ERR "nand_scan failed: %d\n", err);
+               iounmap(bcm_umi_io_base);
+               kfree(board_mtd);
+               return err;
+       }
+
+       /* Register the partitions */
+       {
+               int nr_partitions;
+               struct mtd_partition *partition_info;
+
+               board_mtd->name =3D "bcm_umi-nand";
+               nr_partitions =3D
+                   parse_mtd_partitions(board_mtd, part_probes,
+                                        &partition_info, 0);
+
+               if (nr_partitions <=3D 0) {
+                       printk("BCM UMI NAND: Too few partitions - %d\n",
+                              nr_partitions);
+                       iounmap(bcm_umi_io_base);
+                       kfree(board_mtd);
+                       return -EIO;
+               }
+               add_mtd_partitions(board_mtd, partition_info, nr_partitions=
);
+       }
+
+       /* Return happy */
+       return 0;
+}
+
+static int bcm_umi_nand_remove(struct platform_device *pdev)
+{
+       nand_dma_term();
+
+       /* Release resources, unregister device */
+       nand_release(board_mtd);
+
+       /* unmap physical adress */
+       iounmap(bcm_umi_io_base);
+
+       /* Free the MTD device structure */
+       kfree(board_mtd);
+
+       return 0;
+}
+
+#ifdef CONFIG_PM
+static int bcm_umi_nand_suspend(struct platform_device *pdev,
+                               pm_message_t state)
+{
+       printk(KERN_ERR "MTD NAND suspend is being called\n");
+       return 0;
+}
+
+static int bcm_umi_nand_resume(struct platform_device *pdev)
+{
+       printk(KERN_ERR "MTD NAND resume is being called\n");
+       return 0;
+}
+#else
+#define bcm_umi_nand_suspend   NULL
+#define bcm_umi_nand_resume    NULL
+#endif
+
+static struct platform_driver nand_driver =3D {
+       .driver =3D {
+                  .name =3D "bcm-nand",
+                  .owner =3D THIS_MODULE,
+                  },
+       .probe =3D bcm_umi_nand_probe,
+       .remove =3D bcm_umi_nand_remove,
+       .suspend =3D bcm_umi_nand_suspend,
+       .resume =3D bcm_umi_nand_resume,
+};
+
+static int __init nand_init(void)
+{
+       return platform_driver_register(&nand_driver);
+}
+
+static void __exit nand_exit(void)
+{
+       platform_driver_unregister(&nand_driver);
+}
+
+module_init(nand_init);
+module_exit(nand_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Broadcom");
+MODULE_DESCRIPTION("BCM UMI MTD NAND driver");
diff --git a/drivers/mtd/nand/nand_calculate_ecc512.c b/drivers/mtd/nand/na=
nd_calculate_ecc512.c
new file mode 100644
index 0000000..7ead689
--- /dev/null
+++ b/drivers/mtd/nand/nand_calculate_ecc512.c
@@ -0,0 +1,254 @@
+/*************************************************************************=
****
+* Copyright 2004 - 2008 Broadcom Corporation.  All rights reserved.
+*
+* Unless you and Broadcom execute a separate written software license
+* agreement governing use of this software, this software is licensed to y=
ou
+* under the terms of the GNU General Public License version 2, available a=
t
+* http://www.broadcom.com/licenses/GPLv2.php (the "GPL").
+*
+* Notwithstanding the above, under no circumstances may you combine this
+* software in any way with any other Broadcom software provided under a
+* license other than the GPL, without Broadcom's express prior written
+* consent.
+**************************************************************************=
***/
+
+/*------------------------------------------------------------------------=
---*/
+/* nand ecc calculation - only useful for mips cpu's that have no ECC  */
+/* generation hardware. */
+/*------------------------------------------------------------------------=
---*/
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+
+/*************************************************************************=
****/
+/*                                                                        =
   */
+/* NAME                                                                   =
   */
+/*      nand_calculate_ecc512                                             =
            */
+/* DESCRIPTION                                                            =
   */
+/*             This function generates 3 byte ECC for 512 byte data.      =
          */
+/*      (Software ECC)                                                    =
   */
+/* PARAMETERS                                                             =
   */
+/*      pEcc            the location where ECC should be stored           =
   */
+/*      datapage        given data                                        =
   */
+/* RETURN VALUES                                                          =
   */
+/*             none                                                       =
          */
+/*                                                                        =
   */
+/*************************************************************************=
****/
+#define NAND_PG_SIZE 512
+
+/* For efficiency reasons, process the data as 32-bit words, 4 bytes packe=
d. */
+/* The words are grouped into blocks which helps us calculate parity regio=
ns. */
+/* The block size is set to 8 words so that we can calculate the larger */
+/* parity regions, which starts at P256, which needs 8 words. So for a  */
+/* 512 byte page, we have to loop 16 times, 8 words per block to get 128 w=
ords, */
+/* or 512 bytes. */
+#define NAND_PAGE_WORDS (NAND_PG_SIZE / 4)
+#define BYTES_PER_BLOCK        32
+#define WORDS_PER_BLOCK        (BYTES_PER_BLOCK / 4)
+#define BLOCKS (NAND_PAGE_WORDS / WORDS_PER_BLOCK)
+
+/* Patterns which capture blocks of bytes */
+/* of different sizes, when layed out as */
+/* 32 bit words. This is more efficient  */
+/* than calculating parity on a byte by */
+/* byte basis. */
+#define P16_PATTERN            0xffff0000
+#define P16P_PATTERN           (~P16_PATTERN)
+#define P8_PATTERN             0xff00ff00
+#define P8P_PATTERN            (~P8_PATTERN)
+#define P4_PATTERN             0xf0f0f0f0
+#define P4P_PATTERN            (~P4_PATTERN)
+#define P2_PATTERN             0xcccccccc
+#define P2P_PATTERN            (~P2_PATTERN)
+#define P1_PATTERN             0xaaaaaaaa
+#define P1P_PATTERN            (~P1_PATTERN)
+
+/* These are bit positions within the largeBlockParity bitmap */
+/* for each corresponding pattern. D0 corresponds to the parity */
+/* of the first 32 byte block. D15 corresponds to the parity of */
+/* the last 32 byte block. Combinations of these bits can be */
+/* used to get the parity of each region. */
+/* 0  P256' */
+/* 1  P256   P512' */
+/* 2  P256' */
+/* 3  P256   P512   P1024' */
+/* 4  P256' */
+/* 5  P256   P512' */
+/* 6  P256' */
+/* 7  P256   P512'  P1024 */
+/* ... */
+#define P256_PATTERN           0xaaaa
+#define P512_PATTERN           0xcccc
+#define P1024_PATTERN  0xf0f0
+#define P2048_PATTERN  0xff00
+#define P256P_PATTERN  0x5555
+#define P512P_PATTERN  0x3333
+#define P1024P_PATTERN 0x0f0f
+#define P2048P_PATTERN 0x00ff
+
+/* Positions in the final ECC word */
+#define P4             0x00800000
+#define P4P            0x00400000
+#define P2             0x00200000
+#define P2P            0x00100000
+#define P1             0x00080000
+#define P1P            0x00040000
+#define P2048  0x00020000
+#define P2048P 0x00010000
+#define P1024  0x00008000
+#define P1024P 0x00004000
+#define P512   0x00002000
+#define P512P  0x00001000
+#define P256   0x00000800
+#define P256P  0x00000400
+#define P128   0x00000200
+#define P128P  0x00000100
+#define P64            0x00000080
+#define P64P   0x00000040
+#define P32            0x00000020
+#define P32P   0x00000010
+#define P16            0x00000008
+#define P16P   0x00000004
+#define P8             0x00000002
+#define P8P            0x00000001
+
+struct mtd_info;
+
+const u_char parity_nibble[16] =3D {
+       0,                      /* 0 */
+       1,                      /* 1 */
+       1,                      /* 2 */
+       0,                      /* 3 */
+       1,                      /* 4 */
+       0,                      /* 5 */
+       0,                      /* 6 */
+       1,                      /* 7 */
+       1,                      /* 8 */
+       0,                      /* 9 */
+       0,                      /* 0xa */
+       1,                      /* 0xb */
+       0,                      /* 0xc */
+       1,                      /* 0xd */
+       1,                      /* 0xe */
+       0                       /* 0xf */
+};
+
+typedef struct {
+       uint32_t largeBlockParities;    /* bitmap of parities for blocks 0-=
15 */
+       uint32_t pBlock;        /* parity of current block */
+       uint32_t result;        /* runnning ecc result */
+       uint32_t p16ByteBlockOdd;       /* 16 byte odd block parity  */
+       uint32_t p8ByteBlockOdd;        /* 8 byte odd block parity */
+       uint32_t p4ByteBlockOdd;        /* 4 byte odd block parity */
+       uint32_t p16ByteBlockEven;      /* 16 byte even block parity  */
+       uint32_t p8ByteBlockEven;       /* 8 byte even block parity   */
+       uint32_t p4ByteBlockEven;       /* 4 byte even block parity   */
+       uint32_t pFinal;        /* parity of 512 byte packet */
+       uint32_t *wordp;        /* ptr to aligned start of packet */
+} ECCINFO;
+
+/* Calculate the parity of a word (xor all bits in the word) */
+/* Returns parity 0 or 1. */
+static inline int wordParity(uint32_t word)
+{
+       uint32_t val;
+       val =3D (word >> 16) ^ word;
+       val =3D (val >> 8) ^ val;
+       val =3D (val >> 4) ^ val;
+       return parity_nibble[val & 0xf];
+
+}
+
+/* Calculate the parity of a word and return the bitmask */
+/* if nonzero parity or zero if zero parity. */
+static inline uint32_t calcEccBit(uint32_t word, uint32_t bitmask)
+{
+       return wordParity(word) ? bitmask : 0;
+}
+
+/* Main ecc calculation routine */
+int nand_calculate_ecc512(struct mtd_info *mtd, const u_char *dat,
+                         u_char *ecc_code)
+{
+       int blockidx;           /* 16 blocks of 8 longwords =3D 512 bytes *=
/
+       int wordidx;            /* index within each block 0-7 */
+       uint32_t alignedBuf[NAND_PG_SIZE / sizeof(uint32_t)];
+       ECCINFO ecc;
+
+       memset(&ecc, 0, sizeof(ecc));
+
+       /* Make sure the data is aligned.  */
+       ecc.wordp =3D (uint32_t *) dat;
+       if (((uint32_t) dat % 4) !=3D 0) {
+               memcpy((char *)alignedBuf, dat, NAND_PG_SIZE);
+               ecc.wordp =3D alignedBuf; /* 32-bit operations more efficie=
nt */
+       }
+
+       /* The data needs to be in little-endian order for the ECC calculat=
ions */
+       /* so we have to swap it for big-endian architectures. */
+       for (blockidx =3D 0; blockidx < BLOCKS; blockidx++) {
+               ecc.pBlock =3D 0; /* Reset the parity each block */
+               for (wordidx =3D 0; wordidx < WORDS_PER_BLOCK; wordidx++) {
+                       uint32_t word =3D cpu_to_le32(*ecc.wordp++);
+                       ecc.pBlock ^=3D word;     /* update the running wor=
d parity per block */
+                       ecc.p16ByteBlockEven ^=3D !(wordidx & 4) ? word : 0=
;      /* Every even block of 16 bytes */
+                       ecc.p8ByteBlockEven ^=3D !(wordidx & 2) ? word : 0;=
       /* Every even block of 8 bytes */
+                       ecc.p4ByteBlockEven ^=3D !(wordidx & 1) ? word : 0;=
       /* Every even block of 4 bytes */
+                       ecc.p16ByteBlockOdd ^=3D (wordidx & 4) ? word : 0; =
       /* Every odd block of 16 bytes */
+                       ecc.p8ByteBlockOdd ^=3D (wordidx & 2) ? word : 0; /=
* Every odd block of 8 bytes */
+                       ecc.p4ByteBlockOdd ^=3D (wordidx & 1) ? word : 0; /=
* Every odd block of 4 bytes */
+               }
+               /* pFinal is the total parity over all blocks and all data =
*/
+               ecc.pFinal ^=3D ecc.pBlock;
+
+               /* If the word parity is set for this block, then update */
+               /* a bitmap that shows the parity over all 16 blocks. */
+               if (wordParity(ecc.pBlock)) {
+                       ecc.largeBlockParities |=3D (1 << blockidx);
+               }
+       }
+       /* Calculate the 256/512/1024/2048 bit region parities */
+       ecc.result |=3D calcEccBit(ecc.largeBlockParities & P2048_PATTERN, =
P2048);
+       ecc.result |=3D calcEccBit(ecc.largeBlockParities & P1024_PATTERN, =
P1024);
+       ecc.result |=3D calcEccBit(ecc.largeBlockParities & P512_PATTERN, P=
512);
+       ecc.result |=3D calcEccBit(ecc.largeBlockParities & P256_PATTERN, P=
256);
+
+       ecc.result |=3D
+           calcEccBit(ecc.largeBlockParities & P2048P_PATTERN, P2048P);
+       ecc.result |=3D
+           calcEccBit(ecc.largeBlockParities & P1024P_PATTERN, P1024P);
+       ecc.result |=3D calcEccBit(ecc.largeBlockParities & P512P_PATTERN, =
P512P);
+       ecc.result |=3D calcEccBit(ecc.largeBlockParities & P256P_PATTERN, =
P256P);
+
+       /* Using the 32/64/128 bit region parities */
+       ecc.result |=3D calcEccBit(ecc.p16ByteBlockOdd, P128);
+       ecc.result |=3D calcEccBit(ecc.p8ByteBlockOdd, P64);
+       ecc.result |=3D calcEccBit(ecc.p4ByteBlockOdd, P32);
+
+       ecc.result |=3D calcEccBit(ecc.p16ByteBlockEven, P128P);
+       ecc.result |=3D calcEccBit(ecc.p8ByteBlockEven, P64P);
+       ecc.result |=3D calcEccBit(ecc.p4ByteBlockEven, P32P);
+
+       /* Calculate the column parities */
+       ecc.result |=3D calcEccBit(ecc.pFinal & P16_PATTERN, P16);
+       ecc.result |=3D calcEccBit(ecc.pFinal & P8_PATTERN, P8);
+       ecc.result |=3D calcEccBit(ecc.pFinal & P4_PATTERN, P4);
+       ecc.result |=3D calcEccBit(ecc.pFinal & P2_PATTERN, P2);
+       ecc.result |=3D calcEccBit(ecc.pFinal & P1_PATTERN, P1);
+
+       ecc.result |=3D calcEccBit(ecc.pFinal & P16P_PATTERN, P16P);
+       ecc.result |=3D calcEccBit(ecc.pFinal & P8P_PATTERN, P8P);
+       ecc.result |=3D calcEccBit(ecc.pFinal & P4P_PATTERN, P4P);
+       ecc.result |=3D calcEccBit(ecc.pFinal & P2P_PATTERN, P2P);
+       ecc.result |=3D calcEccBit(ecc.pFinal & P1P_PATTERN, P1P);
+
+       /* Invert the result */
+       ecc.result =3D ~ecc.result;
+
+       /* Fill in the return codes                                      */
+       ecc_code[0] =3D ecc.result & 0xff;
+       ecc_code[1] =3D (ecc.result >> 8) & 0xff;
+       ecc_code[2] =3D (ecc.result >> 16) & 0xff;
+
+       return 0;
+}
diff --git a/drivers/mtd/nand/nand_correct_data512.c b/drivers/mtd/nand/nan=
d_correct_data512.c
new file mode 100644
index 0000000..084a83e
--- /dev/null
+++ b/drivers/mtd/nand/nand_correct_data512.c
@@ -0,0 +1,153 @@
+/*************************************************************************=
****
+* Copyright 2004 - 2008 Broadcom Corporation.  All rights reserved.
+*
+* Unless you and Broadcom execute a separate written software license
+* agreement governing use of this software, this software is licensed to y=
ou
+* under the terms of the GNU General Public License version 2, available a=
t
+* http://www.broadcom.com/licenses/GPLv2.php (the "GPL").
+*
+* Notwithstanding the above, under no circumstances may you combine this
+* software in any way with any other Broadcom software provided under a
+* license other than the GPL, without Broadcom's express prior written
+* consent.
+**************************************************************************=
***/
+
+/*------------------------------------------------------------------------=
---
+ *
+ * nand error control correction routines
+ *------------------------------------------------------------------------=
---*/
+#include <linux/types.h>
+#include <linux/mtd/nand_ecc512.h>
+
+typedef union {
+       unsigned long mylword;
+       unsigned short myword[2];
+       unsigned char mybyte[4];        /* MSB: byte[0] */
+       struct {
+               unsigned int bit31:1;
+               unsigned int bit30:1;
+               unsigned int bit29:1;
+               unsigned int bit28:1;
+               unsigned int bit27:1;
+               unsigned int bit26:1;
+               unsigned int bit25:1;
+               unsigned int bit24:1;
+               unsigned int bit23:1;
+               unsigned int bit22:1;
+               unsigned int bit21:1;
+               unsigned int bit20:1;
+               unsigned int bit19:1;
+               unsigned int bit18:1;
+               unsigned int bit17:1;
+               unsigned int bit16:1;
+               unsigned int bit15:1;
+               unsigned int bit14:1;
+               unsigned int bit13:1;
+               unsigned int bit12:1;
+               unsigned int bit11:1;
+               unsigned int bit10:1;
+               unsigned int bit9:1;
+               unsigned int bit8:1;
+               unsigned int bit7:1;
+               unsigned int bit6:1;
+               unsigned int bit5:1;
+               unsigned int bit4:1;
+               unsigned int bit3:1;
+               unsigned int bit2:1;
+               unsigned int bit1:1;
+               unsigned int bit0:1;
+       } mybits;
+} UnionLW;
+
+typedef union {
+       unsigned char mybyte;
+       struct {
+               unsigned int bit7:1;
+               unsigned int bit6:1;
+               unsigned int bit5:1;
+               unsigned int bit4:1;
+               unsigned int bit3:1;
+               unsigned int bit2:1;
+               unsigned int bit1:1;
+               unsigned int bit0:1;
+       } mybits;
+} UnionB;
+
+/*************************************************************************=
****/
+/*                                                                        =
   */
+/* NAME                                                                   =
   */
+/*      nand_correct_data512                                              =
  */
+/* DESCRIPTION                                                            =
   */
+/*      This function compares two ECCs and indicates if there is an error=
.  */
+/* PARAMETERS                                                             =
   */
+/*      read_ecc           one ECC to be compared                         =
   */
+/*      calc_ecc           the other ECC to be compared                   =
   */
+/*      dat                content of data page                           =
   */
+/* RETURN VALUES                                                          =
   */
+/*      Upon successful completion, compare_ecc returns 0.                =
   */
+/*      Otherwise, corresponding error code is returned.                  =
   */
+/*                                                                        =
   */
+/*************************************************************************=
****/
+int nand_correct_data512(struct mtd_info *mtd, u_char *dat, u_char *read_e=
cc,
+                        u_char *calc_ecc)
+{
+       unsigned short i, j, row, col;
+       UnionLW mylw;
+       unsigned short bitlen =3D 24;     /* e.g. 512 byte pages */
+
+       u_char newval;
+
+       UnionLW orgecc;
+       UnionLW newecc;
+
+       orgecc.mylword =3D 0;
+       newecc.mylword =3D 0;
+
+       /* Hardware register 00 ecc[2] ecc[1] ecc[0],   MSB..LSB */
+       /* OOB form  ecc[0] ecc[1] ecc[2] */
+       /* u_char form ecc[0] ecc[1] ecc[2] */
+       orgecc.mybyte[1] =3D read_ecc[2]; /* MSB */
+       orgecc.mybyte[2] =3D read_ecc[1];
+       orgecc.mybyte[3] =3D read_ecc[0]; /* LSB */
+
+       newecc.mybyte[1] =3D calc_ecc[2];
+       newecc.mybyte[2] =3D calc_ecc[1];
+       newecc.mybyte[3] =3D calc_ecc[0];
+
+       mylw.mylword =3D orgecc.mylword ^ newecc.mylword;
+
+       /* Quick check to avoid for loop below for normal no error case. */
+       if (mylw.mylword =3D=3D 0) {
+               return 0;       /* No error */
+       }
+
+       j =3D 0;
+       for (i =3D 0; i < bitlen; i++) {
+               if ((mylw.mylword >> i) & 1) {
+                       j++;
+               }
+       }
+       if (j =3D=3D 1) {
+               return 2;       /* ECC itself in error */
+       }
+       if (j =3D=3D (bitlen >> 1)) {
+               row =3D mylw.mybits.bit1 +
+                   (mylw.mybits.bit3 << 1) +
+                   (mylw.mybits.bit5 << 2) +
+                   (mylw.mybits.bit7 << 3) +
+                   (mylw.mybits.bit9 << 4) +
+                   (mylw.mybits.bit11 << 5) +
+                   (mylw.mybits.bit13 << 6) +
+                   (mylw.mybits.bit15 << 7) + (mylw.mybits.bit17 << 8);
+
+               col =3D mylw.mybits.bit19 +
+                   (mylw.mybits.bit21 << 1) + (mylw.mybits.bit23 << 2);
+
+               newval =3D dat[row] ^ (1 << col);
+               /* printk("ECC: Replaced at offset 0x%x  old=3D0x%x new=3D0=
x%x\n", row, dat[row], newval); */
+               dat[row] =3D newval;
+
+               return 1;       /* Corrected 1 error */
+       }
+       return -1;              /* 2 or more errors - uncorrectible */
+}
diff --git a/include/linux/mtd/nand_bcm_umi.h b/include/linux/mtd/nand_bcm_=
umi.h
new file mode 100644
index 0000000..ddbbbbf
--- /dev/null
+++ b/include/linux/mtd/nand_bcm_umi.h
@@ -0,0 +1,235 @@
+/*************************************************************************=
****
+* Copyright 2003 - 2009 Broadcom Corporation.  All rights reserved.
+*
+* Unless you and Broadcom execute a separate written software license
+* agreement governing use of this software, this software is licensed to y=
ou
+* under the terms of the GNU General Public License version 2, available a=
t
+* http://www.broadcom.com/licenses/GPLv2.php (the "GPL").
+*
+* Notwithstanding the above, under no circumstances may you combine this
+* software in any way with any other Broadcom software provided under a
+* license other than the GPL, without Broadcom's express prior written
+* consent.
+**************************************************************************=
***/
+#ifndef NAND_BCM_UMI_H
+#define NAND_BCM_UMI_H
+
+/* ---- Include Files ----------------------------------------------------=
 */
+#include <mach/reg_umi.h>
+#include <cfg_global.h>
+#ifdef BOOT0_BUILD
+#include <uart.h>
+#endif
+
+/* ---- Constants and Types ----------------------------------------------=
 */
+#if (CFG_GLOBAL_CHIP_FAMILY =3D=3D CFG_GLOBAL_CHIP_FAMILY_BCMRING)
+#define NAND_ECC_BCH (CFG_GLOBAL_CHIP_REV > 0xA0)
+#else
+#define NAND_ECC_BCH 0
+#endif
+
+/* ---- Variable Externs ------------------------------------------ */
+/* ---- Function Prototypes --------------------------------------- */
+
+static inline int nand_bcm_umi_dev_ready(void)
+{
+       return REG_UMI_NAND_RCSR & REG_UMI_NAND_RCSR_RDY;
+}
+
+static inline void nand_bcm_umi_wait_till_ready(void)
+{
+       while (nand_bcm_umi_dev_ready() =3D=3D 0) {
+               ;
+       }
+}
+
+static inline void nand_bcm_umi_hamming_enable_hwecc(void)
+{
+       REG_UMI_NAND_ECC_CSR &=3D ~(REG_UMI_NAND_ECC_CSR_ECC_ENABLE | REG_U=
MI_NAND_ECC_CSR_256BYTE);      /* disable and reset ECC, 512 byte page */
+       REG_UMI_NAND_ECC_CSR |=3D REG_UMI_NAND_ECC_CSR_ECC_ENABLE;        /=
* enable ECC */
+}
+
+#if NAND_ECC_BCH
+static inline void nand_bcm_umi_bch_enable_read_hwecc(void)
+{
+       /* disable and reset ECC */
+       REG_UMI_BCH_CTRL_STATUS =3D REG_UMI_BCH_CTRL_STATUS_RD_ECC_VALID;
+       /* Turn on ECC */
+       REG_UMI_BCH_CTRL_STATUS =3D REG_UMI_BCH_CTRL_STATUS_ECC_RD_EN;
+}
+
+static inline void nand_bcm_umi_bch_enable_write_hwecc(void)
+{
+       /* disable and reset ECC */
+       REG_UMI_BCH_CTRL_STATUS =3D REG_UMI_BCH_CTRL_STATUS_WR_ECC_VALID;
+       /* Turn on ECC */
+       REG_UMI_BCH_CTRL_STATUS =3D REG_UMI_BCH_CTRL_STATUS_ECC_WR_EN;
+}
+
+static inline void nand_bcm_umi_bch_config_ecc(uint8_t numEccBytes)
+{
+       int nValue;
+       int tValue;
+       int kValue;
+       int numBits =3D numEccBytes * 8;
+#define ECC_BITS_PER_CORRECTABLE_BIT 13
+#define NAND_DATA_ACCESS_SIZE 512
+
+       /* Every correctible bit requires 13 ECC bits */
+       tValue =3D (int)(numBits / ECC_BITS_PER_CORRECTABLE_BIT);
+
+       /* Total data in number of bits for generating and computing BCH EC=
C */
+       nValue =3D (NAND_DATA_ACCESS_SIZE + numEccBytes) * 8;
+
+       /* K parameter is used internally.  K =3D N - (T * 13) */
+       kValue =3D nValue - (tValue * 13);
+
+       /* Write the settings */
+       REG_UMI_BCH_N =3D nValue;
+       REG_UMI_BCH_T =3D tValue;
+       REG_UMI_BCH_K =3D kValue;
+
+       /* disable and reset ECC */
+       REG_UMI_BCH_CTRL_STATUS =3D
+           REG_UMI_BCH_CTRL_STATUS_WR_ECC_VALID |
+           REG_UMI_BCH_CTRL_STATUS_RD_ECC_VALID;
+}
+
+static inline void nand_bcm_umi_bch_pause_read_ecc_calc(void)
+{
+       REG_UMI_BCH_CTRL_STATUS =3D
+           REG_UMI_BCH_CTRL_STATUS_ECC_RD_EN |
+           REG_UMI_BCH_CTRL_STATUS_PAUSE_ECC_DEC;
+}
+
+static inline void nand_bcm_umi_bch_resume_read_ecc_calc(void)
+{
+       REG_UMI_BCH_CTRL_STATUS =3D REG_UMI_BCH_CTRL_STATUS_ECC_RD_EN;
+}
+
+static inline uint32_t nand_bcm_umi_bch_poll_read_ecc_calc(void)
+{
+       uint32_t regVal;
+
+       do {
+               /* wait for ECC to be valid */
+               regVal =3D REG_UMI_BCH_CTRL_STATUS;
+       } while ((regVal & REG_UMI_BCH_CTRL_STATUS_RD_ECC_VALID) =3D=3D 0);
+
+       return regVal;
+}
+
+static inline void nand_bcm_umi_bch_poll_write_ecc_calc(void)
+{
+       /* wait for ECC to be valid */
+       while ((REG_UMI_BCH_CTRL_STATUS & REG_UMI_BCH_CTRL_STATUS_WR_ECC_VA=
LID) =3D=3D 0)
+               ;
+}
+
+/*************************************************************************=
***
+*  nand_bch_ecc_flip_bit - Routine to flip an errored bit
+*
+*  PURPOSE:
+*     This is a helper routine that flips the bit (0 -> 1 or 1 -> 0) of th=
e
+*     errored bit specified
+*
+*  PARAMETERS:
+*     datap - Container that holds the 512 byte data
+*     errorLocation - Location of the bit that needs to be flipped
+*
+*  RETURNS:
+*     None
+**************************************************************************=
**/
+static inline void nand_bcm_umi_bch_ecc_flip_bit(uint8_t *datap,
+                                                int errorLocation)
+{
+       int locWithinAByte =3D (errorLocation & REG_UMI_BCH_ERR_LOC_BYTE) >=
> 0;
+       int locWithinAWord =3D (errorLocation & REG_UMI_BCH_ERR_LOC_WORD) >=
> 3;
+       int locWithinAPage =3D (errorLocation & REG_UMI_BCH_ERR_LOC_PAGE) >=
> 5;
+
+       /* BCH uses big endian, need to change the location bits to little =
endian  */
+       locWithinAWord =3D 3 - locWithinAWord;
+
+       uint8_t errorByte =3D 0;
+       uint8_t byteMask =3D 1 << locWithinAByte;
+
+       errorByte =3D datap[locWithinAPage * sizeof(uint32_t) + locWithinAW=
ord];
+
+#ifdef BOOT0_BUILD
+       puthexs("\nECC Correct Offset: ",
+               locWithinAPage * sizeof(uint32_t) + locWithinAWord);
+       puthexs(" errorByte:", errorByte);
+       puthex8(" Bit: ", locWithinAByte);
+#endif
+
+       if (errorByte & byteMask) {
+               /* bit needs to be cleared */
+               errorByte &=3D ~byteMask;
+       } else {
+               /* bit needs to be set */
+               errorByte |=3D byteMask;
+       }
+
+       /* write back the value with the fixed bit */
+       datap[locWithinAPage * sizeof(uint32_t) + locWithinAWord] =3D error=
Byte;
+}
+
+/*************************************************************************=
***
+*  nand_correct_page_bch - Routine to correct bit errors when reading NAND
+*
+*  PURPOSE:
+*     This routine reads the BCH registers to determine if there are any b=
it
+*     errors during the read of the last 512 bytes of data + ECC bytes.  I=
f
+*     errors exists, the routine fixes it.
+*
+*  PARAMETERS:
+*     datap - Container that holds the 512 byte data
+*
+*  RETURNS:
+*     0 or greater =3D Number of errors corrected (No errors are found or =
errors have been fixed)
+*    -1 =3D Error(s) cannot be fixed
+**************************************************************************=
**/
+static inline int nand_bcm_umi_bch_correct_page(uint8_t *datap)
+{
+       int numErrors;
+       int errorLocation;
+       int idx;
+       uint32_t regValue;
+
+       /* wait for read ECC to be valid */
+       regValue =3D nand_bcm_umi_bch_poll_read_ecc_calc();
+
+       /* read the control status register to determine if there are error=
'ed bits */
+       /* see if errors are correctible */
+       if ((regValue & REG_UMI_BCH_CTRL_STATUS_UNCORR_ERR) > 0) {
+               /* errors cannot be fixed, return -1 */
+               return -1;
+       }
+
+       if ((regValue & REG_UMI_BCH_CTRL_STATUS_CORR_ERR) =3D=3D 0) {
+               /* no errors */
+               return 0;
+       }
+
+       /*
+        * Fix errored bits by doing the following:
+        * 1. Read the number of errors in the control and status register
+        * 2. Read the error location registers that corresponds to the num=
ber
+        *    of errors reported
+        * 3. Invert the bit in the data
+        */
+       numErrors =3D (regValue & REG_UMI_BCH_CTRL_STATUS_NB_CORR_ERROR) >>=
 20;
+
+       for (idx =3D 0; idx < numErrors; idx++) {
+               errorLocation =3D
+                   REG_UMI_BCH_ERR_LOC_ADDR(idx) & REG_UMI_BCH_ERR_LOC_MAS=
K;
+
+               /* Flip bit */
+               nand_bcm_umi_bch_ecc_flip_bit(datap, errorLocation);
+       }
+       /* Errors corrected */
+       return numErrors;
+}
+#endif
+
+#endif /* NAND_BCM_UMI_H */
diff --git a/include/linux/mtd/nand_ecc512.h b/include/linux/mtd/nand_ecc51=
2.h
new file mode 100644
index 0000000..1b6f86c
--- /dev/null
+++ b/include/linux/mtd/nand_ecc512.h
@@ -0,0 +1,26 @@
+/*
+ *  drivers/mtd/nand_ecc512.h
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This file is the header for the ECC algorithm.
+ */
+
+#ifndef __MTD_NAND_ECC512_H__
+#define __MTD_NAND_ECC512_H__
+
+struct mtd_info;
+
+/*
+ * Calculate 3 byte ECC code for 512 byte block
+ */
+int nand_calculate_ecc512(struct mtd_info *mtd, const u_char *dat, u_char =
*ecc_code);
+
+/*
+ * Detect and correct a 2 bit error for 512 byte block
+ */
+int nand_correct_data512(struct mtd_info *mtd, u_char *dat, u_char *read_e=
cc, u_char *calc_ecc);
+
+#endif /* __MTD_NAND_ECC512_H__ */
--
1.6.0.6



Leo Hao Chen
Software Engineer
Broadcom Canada Inc.
