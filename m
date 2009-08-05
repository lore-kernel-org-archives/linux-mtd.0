Received: from mms1.broadcom.com ([216.31.210.17])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MYZ02-0001Jp-U5
	for linux-mtd@lists.infradead.org; Wed, 05 Aug 2009 05:25:23 +0000
From: "Leo (Hao) Chen" <leochen@broadcom.com>
To: "linux-arm-kernel@lists.arm.linux.org.uk"
	<linux-arm-kernel@lists.arm.linux.org.uk>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Tue, 4 Aug 2009 22:25:30 -0700
Subject: [PATCH v4 22/24] bcmring: add mtd nand driver
Message-ID: <8628FE4E7912BF47A96AE7DD7BAC0AADCB25D07582@SJEXCHCCR02.corp.ad.broadcom.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Cc: "Leo \(Hao\) Chen" <leochen@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Leo Chen <leochen@broadcom.com>
Date: Tue, 4 Aug 2009 16:42:48 -0700
Subject: [PATCH] add bcmring mtd nand driver support

add mtd umi driver for bcmring
add header files, register definition files
add entry in Kconfig and Makefile

Signed-off-by: Leo Chen <leochen@broadcom.com>
---
 arch/arm/mach-bcmring/include/mach/reg_nand.h |   66 ++
 arch/arm/mach-bcmring/include/mach/reg_umi.h  |  237 ++++++++
 drivers/mtd/nand/Kconfig                      |   16 +
 drivers/mtd/nand/Makefile                     |    1 +
 drivers/mtd/nand/bcm_umi_bch.c                |  310 ++++++++++
 drivers/mtd/nand/bcm_umi_hamming.c            |  135 +++++
 drivers/mtd/nand/bcm_umi_nand.c               |  790 +++++++++++++++++++++=
++++
 include/linux/mtd/nand_bcm_umi.h              |  241 ++++++++
 8 files changed, 1796 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-bcmring/include/mach/reg_nand.h
 create mode 100644 arch/arm/mach-bcmring/include/mach/reg_umi.h
 create mode 100644 drivers/mtd/nand/bcm_umi_bch.c
 create mode 100644 drivers/mtd/nand/bcm_umi_hamming.c
 create mode 100644 drivers/mtd/nand/bcm_umi_nand.c
 create mode 100644 include/linux/mtd/nand_bcm_umi.h

diff --git a/arch/arm/mach-bcmring/include/mach/reg_nand.h b/arch/arm/mach-=
bcmring/include/mach/reg_nand.h
new file mode 100644
index 0000000..387376f
--- /dev/null
+++ b/arch/arm/mach-bcmring/include/mach/reg_nand.h
@@ -0,0 +1,66 @@
+/*************************************************************************=
****
+* Copyright 2001 - 2008 Broadcom Corporation.  All rights reserved.
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
+/*
+*
+**************************************************************************=
***
+*
+*  REG_NAND.h
+*
+*  PURPOSE:
+*
+*     This file contains definitions for the nand registers:
+*
+*  NOTES:
+*
+**************************************************************************=
***/
+
+#if !defined(__ASM_ARCH_REG_NAND_H)
+#define __ASM_ARCH_REG_NAND_H
+
+/* ---- Include Files ----------------------------------------------------=
 */
+#include <csp/reg.h>
+#include <mach/reg_umi.h>
+
+/* ---- Constants and Types ----------------------------------------------=
 */
+
+#define HW_NAND_BASE       MM_IO_BASE_NAND     /* NAND Flash */
+
+/* DMA accesses by the bootstrap need hard nonvirtual addresses */
+#define REG_NAND_CMD            __REG16(HW_NAND_BASE + 0)
+#define REG_NAND_ADDR           __REG16(HW_NAND_BASE + 4)
+
+#define REG_NAND_PHYS_DATA16   (HW_NAND_BASE + 8)
+#define REG_NAND_PHYS_DATA8    (HW_NAND_BASE + 8)
+#define REG_NAND_DATA16         __REG16(REG_NAND_PHYS_DATA16)
+#define REG_NAND_DATA8          __REG8(REG_NAND_PHYS_DATA8)
+
+/* use appropriate offset to make sure it start at the 1K boundary */
+#define REG_NAND_PHYS_DATA_DMA   (HW_NAND_BASE + 0x400)
+#define REG_NAND_DATA_DMA         __REG32(REG_NAND_PHYS_DATA_DMA)
+
+/* Linux DMA requires physical address of the data register */
+#define REG_NAND_DATA16_PADDR    HW_IO_VIRT_TO_PHYS(REG_NAND_PHYS_DATA16)
+#define REG_NAND_DATA8_PADDR     HW_IO_VIRT_TO_PHYS(REG_NAND_PHYS_DATA8)
+#define REG_NAND_DATA_PADDR      HW_IO_VIRT_TO_PHYS(REG_NAND_PHYS_DATA_DMA=
)
+
+#define NAND_BUS_16BIT()        (0)
+#define NAND_BUS_8BIT()         (!NAND_BUS_16BIT())
+
+/* Register offsets */
+#define REG_NAND_CMD_OFFSET     (0)
+#define REG_NAND_ADDR_OFFSET    (4)
+#define REG_NAND_DATA8_OFFSET   (8)
+
+#endif
diff --git a/arch/arm/mach-bcmring/include/mach/reg_umi.h b/arch/arm/mach-b=
cmring/include/mach/reg_umi.h
new file mode 100644
index 0000000..06a3554
--- /dev/null
+++ b/arch/arm/mach-bcmring/include/mach/reg_umi.h
@@ -0,0 +1,237 @@
+/*************************************************************************=
****
+* Copyright 2005 - 2008 Broadcom Corporation.  All rights reserved.
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
+/*
+*
+**************************************************************************=
***
+*
+*  REG_UMI.h
+*
+*  PURPOSE:
+*
+*     This file contains definitions for the nand registers:
+*
+*  NOTES:
+*
+**************************************************************************=
***/
+
+#if !defined(__ASM_ARCH_REG_UMI_H)
+#define __ASM_ARCH_REG_UMI_H
+
+/* ---- Include Files ----------------------------------------------------=
 */
+#include <csp/reg.h>
+#include <mach/csp/mm_io.h>
+
+/* ---- Constants and Types ----------------------------------------------=
 */
+
+/* Unified Memory Interface Ctrl Register */
+#define HW_UMI_BASE       MM_IO_BASE_UMI
+
+/* Flash bank 0 timing and control register */
+#define REG_UMI_FLASH0_TCR         __REG32(HW_UMI_BASE  + 0x00)
+/* Flash bank 1 timing and control register */
+#define REG_UMI_FLASH1_TCR         __REG32(HW_UMI_BASE  + 0x04)
+/* Flash bank 2 timing and control register */
+#define REG_UMI_FLASH2_TCR         __REG32(HW_UMI_BASE  + 0x08)
+/* MMD interface and control register */
+#define REG_UMI_MMD_ICR            __REG32(HW_UMI_BASE  + 0x0c)
+/* NAND timing and control register */
+#define REG_UMI_NAND_TCR           __REG32(HW_UMI_BASE  + 0x18)
+/* NAND ready/chip select register */
+#define REG_UMI_NAND_RCSR          __REG32(HW_UMI_BASE  + 0x1c)
+/* NAND ECC control & status register */
+#define REG_UMI_NAND_ECC_CSR       __REG32(HW_UMI_BASE  + 0x20)
+/* NAND ECC data register XXB2B1B0 */
+#define REG_UMI_NAND_ECC_DATA      __REG32(HW_UMI_BASE  + 0x24)
+/* BCH ECC Parameter N */
+#define REG_UMI_BCH_N              __REG32(HW_UMI_BASE  + 0x40)
+/* BCH ECC Parameter T */
+#define REG_UMI_BCH_K              __REG32(HW_UMI_BASE  + 0x44)
+/* BCH ECC Parameter K */
+#define REG_UMI_BCH_T              __REG32(HW_UMI_BASE  + 0x48)
+/* BCH ECC Contro Status */
+#define REG_UMI_BCH_CTRL_STATUS    __REG32(HW_UMI_BASE  + 0x4C)
+/* BCH WR ECC 31:0 */
+#define REG_UMI_BCH_WR_ECC_0       __REG32(HW_UMI_BASE  + 0x50)
+/* BCH WR ECC 63:32 */
+#define REG_UMI_BCH_WR_ECC_1       __REG32(HW_UMI_BASE  + 0x54)
+/* BCH WR ECC 95:64 */
+#define REG_UMI_BCH_WR_ECC_2       __REG32(HW_UMI_BASE  + 0x58)
+/* BCH WR ECC 127:96 */
+#define REG_UMI_BCH_WR_ECC_3       __REG32(HW_UMI_BASE  + 0x5c)
+/* BCH WR ECC 155:128 */
+#define REG_UMI_BCH_WR_ECC_4       __REG32(HW_UMI_BASE  + 0x60)
+/* BCH Read Error Location 1,0 */
+#define REG_UMI_BCH_RD_ERR_LOC_1_0 __REG32(HW_UMI_BASE  + 0x64)
+/* BCH Read Error Location 3,2 */
+#define REG_UMI_BCH_RD_ERR_LOC_3_2 __REG32(HW_UMI_BASE  + 0x68)
+/* BCH Read Error Location 5,4 */
+#define REG_UMI_BCH_RD_ERR_LOC_5_4 __REG32(HW_UMI_BASE  + 0x6c)
+/* BCH Read Error Location 7,6 */
+#define REG_UMI_BCH_RD_ERR_LOC_7_6 __REG32(HW_UMI_BASE  + 0x70)
+/* BCH Read Error Location 9,8 */
+#define REG_UMI_BCH_RD_ERR_LOC_9_8 __REG32(HW_UMI_BASE  + 0x74)
+/* BCH Read Error Location 11,10 */
+#define REG_UMI_BCH_RD_ERR_LOC_B_A __REG32(HW_UMI_BASE  + 0x78)
+
+/* REG_UMI_FLASH0/1/2_TCR, REG_UMI_SRAM0/1_TCR bits */
+/* Enable wait pin during burst write or read */
+#define REG_UMI_TCR_WAITEN              0x80000000
+/* Enable mem ctrlr to work iwth ext mem of lower freq than AHB clk */
+#define REG_UMI_TCR_LOWFREQ             0x40000000
+/* 1=3Dsynch write, 0=3Dasync write */
+#define REG_UMI_TCR_MEMTYPE_SYNCWRITE   0x20000000
+/* 1=3Dsynch read, 0=3Dasync read */
+#define REG_UMI_TCR_MEMTYPE_SYNCREAD    0x10000000
+/* 1=3Dpage mode read, 0=3Dnormal mode read */
+#define REG_UMI_TCR_MEMTYPE_PAGEREAD    0x08000000
+/* page size/burst size (wrap only) */
+#define REG_UMI_TCR_MEMTYPE_PGSZ_MASK   0x07000000
+/* 4 word */
+#define REG_UMI_TCR_MEMTYPE_PGSZ_4      0x00000000
+/* 8 word */
+#define REG_UMI_TCR_MEMTYPE_PGSZ_8      0x01000000
+/* 16 word */
+#define REG_UMI_TCR_MEMTYPE_PGSZ_16     0x02000000
+/* 32 word */
+#define REG_UMI_TCR_MEMTYPE_PGSZ_32     0x03000000
+/* 64 word */
+#define REG_UMI_TCR_MEMTYPE_PGSZ_64     0x04000000
+/* 128 word */
+#define REG_UMI_TCR_MEMTYPE_PGSZ_128    0x05000000
+/* 256 word */
+#define REG_UMI_TCR_MEMTYPE_PGSZ_256    0x06000000
+/* 512 word */
+#define REG_UMI_TCR_MEMTYPE_PGSZ_512    0x07000000
+/* Page read access cycle / Burst write latency (n+2 / n+1) */
+#define REG_UMI_TCR_TPRC_TWLC_MASK      0x00f80000
+/* Bus turnaround cycle (n) */
+#define REG_UMI_TCR_TBTA_MASK           0x00070000
+/* Write pulse width cycle (n+1) */
+#define REG_UMI_TCR_TWP_MASK            0x0000f800
+/* Write recovery cycle (n+1) */
+#define REG_UMI_TCR_TWR_MASK            0x00000600
+/* Write address setup cycle (n+1) */
+#define REG_UMI_TCR_TAS_MASK            0x00000180
+/* Output enable delay cycle (n) */
+#define REG_UMI_TCR_TOE_MASK            0x00000060
+/* Read access cycle / Burst read latency (n+2 / n+1) */
+#define REG_UMI_TCR_TRC_TLC_MASK        0x0000001f
+
+/* REG_UMI_MMD_ICR bits */
+/* Flash write protection pin control */
+#define REG_UMI_MMD_ICR_FLASH_WP            0x8000
+/* Extend hold time for sram0, sram1 csn (39 MHz operation) */
+#define REG_UMI_MMD_ICR_XHCS                0x4000
+/* Enable SDRAM 2 interface control */
+#define REG_UMI_MMD_ICR_SDRAM2EN            0x2000
+/* Enable merge of flash banks 0/1 to 512 MBit bank */
+#define REG_UMI_MMD_ICR_INST512             0x1000
+/* Enable merge of flash banks 1/2 to 512 MBit bank */
+#define REG_UMI_MMD_ICR_DATA512             0x0800
+/* Enable SDRAM interface control */
+#define REG_UMI_MMD_ICR_SDRAMEN             0x0400
+/* Polarity of busy state of Burst Wait Signal */
+#define REG_UMI_MMD_ICR_WAITPOL             0x0200
+/* Enable burst clock stopped when not accessing external burst flash/sram=
 */
+#define REG_UMI_MMD_ICR_BCLKSTOP            0x0100
+/* Enable the peri1_csn to replace flash1_csn in 512 Mb flash mode */
+#define REG_UMI_MMD_ICR_PERI1EN             0x0080
+/* Enable the peri2_csn to replace sdram_csn */
+#define REG_UMI_MMD_ICR_PERI2EN             0x0040
+/* Enable the peri3_csn to replace sdram2_csn */
+#define REG_UMI_MMD_ICR_PERI3EN             0x0020
+/* Enable sram bank1 for H/W controlled MRS */
+#define REG_UMI_MMD_ICR_MRSB1               0x0010
+/* Enable sram bank0 for H/W controlled MRS */
+#define REG_UMI_MMD_ICR_MRSB0               0x0008
+/* Polarity for assert3ed state of H/W controlled MRS */
+#define REG_UMI_MMD_ICR_MRSPOL              0x0004
+/* 0: S/W controllable ZZ/MRS/CRE/P-Mode pin */
+/* 1: H/W controlled ZZ/MRS/CRE/P-Mode, same timing as CS */
+#define REG_UMI_MMD_ICR_MRSMODE             0x0002
+/* MRS state for S/W controlled mode */
+#define REG_UMI_MMD_ICR_MRSSTATE            0x0001
+
+/* REG_UMI_NAND_TCR bits */
+/* Enable software to control CS */
+#define REG_UMI_NAND_TCR_CS_SWCTRL          0x80000000
+/* 16-bit nand wordsize if set */
+#define REG_UMI_NAND_TCR_WORD16             0x40000000
+/* Bus turnaround cycle (n) */
+#define REG_UMI_NAND_TCR_TBTA_MASK          0x00070000
+/* Write pulse width cycle (n+1) */
+#define REG_UMI_NAND_TCR_TWP_MASK           0x0000f800
+/* Write recovery cycle (n+1) */
+#define REG_UMI_NAND_TCR_TWR_MASK           0x00000600
+/* Write address setup cycle (n+1) */
+#define REG_UMI_NAND_TCR_TAS_MASK           0x00000180
+/* Output enable delay cycle (n) */
+#define REG_UMI_NAND_TCR_TOE_MASK           0x00000060
+/* Read access cycle (n+2) */
+#define REG_UMI_NAND_TCR_TRC_TLC_MASK       0x0000001f
+
+/* REG_UMI_NAND_RCSR bits */
+/* Status: Ready=3D1, Busy=3D0 */
+#define REG_UMI_NAND_RCSR_RDY               0x02
+/* Keep CS asserted during operation */
+#define REG_UMI_NAND_RCSR_CS_ASSERTED       0x01
+
+/* REG_UMI_NAND_ECC_CSR bits */
+/* Interrupt status - read-only */
+#define REG_UMI_NAND_ECC_CSR_NANDINT        0x80000000
+/* Read: Status of ECC done, Write: clear ECC interrupt */
+#define REG_UMI_NAND_ECC_CSR_ECCINT_RAW     0x00800000
+/* Read: Status of R/B, Write: clear R/B interrupt */
+#define REG_UMI_NAND_ECC_CSR_RBINT_RAW      0x00400000
+/* 1 =3D Enable ECC Interrupt */
+#define REG_UMI_NAND_ECC_CSR_ECCINT_ENABLE  0x00008000
+/* 1 =3D Assert interrupt at rising edge of R/B_ */
+#define REG_UMI_NAND_ECC_CSR_RBINT_ENABLE   0x00004000
+/* Calculate ECC by 0=3D512 bytes, 1=3D256 bytes */
+#define REG_UMI_NAND_ECC_CSR_256BYTE        0x00000080
+/* Enable ECC in hardware */
+#define REG_UMI_NAND_ECC_CSR_ECC_ENABLE     0x00000001
+
+/* REG_UMI_BCH_CTRL_STATUS bits */
+/* Shift to Indicate Number of correctable errors detected */
+#define REG_UMI_BCH_CTRL_STATUS_NB_CORR_ERROR_SHIFT 20
+/* Indicate Number of correctable errors detected */
+#define REG_UMI_BCH_CTRL_STATUS_NB_CORR_ERROR 0x00F00000
+/* Indicate Errors detected during read but uncorrectable */
+#define REG_UMI_BCH_CTRL_STATUS_UNCORR_ERR    0x00080000
+/* Indicate Errors detected during read and are correctable */
+#define REG_UMI_BCH_CTRL_STATUS_CORR_ERR      0x00040000
+/* Flag indicates BCH's ECC status of read process are valid */
+#define REG_UMI_BCH_CTRL_STATUS_RD_ECC_VALID  0x00020000
+/* Flag indicates BCH's ECC status of write process are valid */
+#define REG_UMI_BCH_CTRL_STATUS_WR_ECC_VALID  0x00010000
+/* Pause ECC calculation */
+#define REG_UMI_BCH_CTRL_STATUS_PAUSE_ECC_DEC 0x00000010
+/* Enable Interrupt */
+#define REG_UMI_BCH_CTRL_STATUS_INT_EN        0x00000004
+/* Enable ECC during read */
+#define REG_UMI_BCH_CTRL_STATUS_ECC_RD_EN     0x00000002
+/* Enable ECC during write */
+#define REG_UMI_BCH_CTRL_STATUS_ECC_WR_EN     0x00000001
+/* Mask for location */
+#define REG_UMI_BCH_ERR_LOC_MASK              0x00001FFF
+/* location within a byte */
+#define REG_UMI_BCH_ERR_LOC_BYTE              0x00000007
+/* location within a word */
+#define REG_UMI_BCH_ERR_LOC_WORD              0x00000018
+/* location within a page (512 byte) */
+#define REG_UMI_BCH_ERR_LOC_PAGE              0x00001FE0
+#define REG_UMI_BCH_ERR_LOC_ADDR(index)     (__REG32(HW_UMI_BASE + 0x64 + =
(index / 2)*4) >> ((index % 2) * 16))
+#endif
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
index f3a786b..b014b8f 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -40,5 +40,6 @@ obj-$(CONFIG_MTD_NAND_SH_FLCTL)               +=3D sh_flc=
tl.o
 obj-$(CONFIG_MTD_NAND_MXC)             +=3D mxc_nand.o
 obj-$(CONFIG_MTD_NAND_SOCRATES)                +=3D socrates_nand.o
 obj-$(CONFIG_MTD_NAND_TXX9NDFMC)       +=3D txx9ndfmc.o
+obj-$(CONFIG_MTD_NAND_BCM_UMI) +=3D bcm_umi_nand.o

 nand-objs :=3D nand_base.o nand_bbt.o
diff --git a/drivers/mtd/nand/bcm_umi_bch.c b/drivers/mtd/nand/bcm_umi_bch.=
c
new file mode 100644
index 0000000..b6d0dad
--- /dev/null
+++ b/drivers/mtd/nand/bcm_umi_bch.c
@@ -0,0 +1,310 @@
+/*************************************************************************=
****
+* Copyright 2004 - 2009 Broadcom Corporation.  All rights reserved.
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
+/* ---- Include Files ----------------------------------------------------=
 */
+#include <linux/mtd/nand_bcm_umi.h>
+
+/* ---- External Variable Declarations -----------------------------------=
 */
+/* ---- External Function Prototypes -------------------------------------=
 */
+/* ---- Public Variables -------------------------------------------------=
 */
+/* ---- Private Constants and Types --------------------------------------=
 */
+#define NAND_ECC_NUM_BYTES 13
+
+/* ---- Private Function Prototypes --------------------------------------=
 */
+static void bcm_umi_bch_write_oobEcc(struct mtd_info *mtd, u_char * oobp);
+static int bcm_umi_bch_correct(u_char *dat, u_char *read_ecc);
+static int bcm_umi_bch_read_page_hwecc(struct mtd_info *mtd,
+                                      struct nand_chip *chip, uint8_t *buf=
);
+static void bcm_umi_bch_write_page_hwecc(struct mtd_info *mtd,
+                                        struct nand_chip *chip,
+                                        const uint8_t *buf);
+
+/* ---- Private Variables ------------------------------------------------=
 */
+
+/*
+** nand_hw_eccoob
+** New oob placement block for use with hardware ecc generation.
+*/
+static struct nand_ecclayout nand_hw_eccoob_512 =3D {
+       /* Reserve 5 for BI indicator */
+       .oobfree =3D {
+                   {.offset =3D 0,
+                    .length =3D 2}
+                   }
+};
+
+/*
+** We treat the OOB for a 2K page as if it were 4 512 byte oobs,
+** except the BI is at byte 0.
+*/
+static struct nand_ecclayout nand_hw_eccoob_2048 =3D {
+       /* Reserve 0 as BI indicator */
+       .oobfree =3D {
+                   {.offset =3D 1,
+                    .length =3D 2}
+                   }
+};
+
+/* We treat the OOB for a 4K page as if it were 8 512 byte oobs,
+ * except the BI is at byte 0. */
+static struct nand_ecclayout nand_hw_eccoob_4096 =3D {
+       /* Reserve 0 as BI indicator */
+       .oobfree =3D {
+                   {.offset =3D 1,
+                    .length =3D 2}
+                   }
+};
+
+/* ---- Private Functions ------------------------------------------------=
 */
+
+static void bcm_umi_bch_write_oobEcc(struct mtd_info *mtd, u_char * oobp)
+{
+       uint32_t eccVal;
+
+       /* wait for ECC to be valid */
+       nand_bcm_umi_bch_poll_write_ecc_calc();
+
+       /*
+        ** Get the hardware ecc from the 32-bit result registers.
+        ** Read after 512 byte accesses. Format B3B2B1B0
+        ** where B3 =3D ecc3, etc.
+        */
+       /* writesize is the pagesize */
+       if (mtd->writesize =3D=3D 512) {
+               /* Skip CM in oob[0,1] */
+
+               /* Write ECC in oob[2,3,4] */
+               eccVal =3D REG_UMI_BCH_WR_ECC_3;
+               oobp[2] =3D eccVal & 0xff;        /* ECC12 */
+               eccVal =3D REG_UMI_BCH_WR_ECC_2;
+               oobp[3] =3D (eccVal >> 24) & 0xff;        /* ECC11 */
+               oobp[4] =3D (eccVal >> 16) & 0xff;        /* ECC10 */
+
+               /* Skip BI in oob[5] */
+
+               /* Write ECC in oob[6-15] */
+               oobp[6] =3D (eccVal >> 8) & 0xff; /* ECC9 */
+               oobp[7] =3D eccVal & 0xff;        /* ECC8 */
+               eccVal =3D REG_UMI_BCH_WR_ECC_1;
+               oobp[8] =3D (eccVal >> 24) & 0xff;        /* ECC7 */
+               oobp[9] =3D (eccVal >> 16) & 0xff;        /* ECC6 */
+               oobp[10] =3D (eccVal >> 8) & 0xff;        /* ECC5 */
+               oobp[11] =3D eccVal & 0xff;       /* ECC4 */
+               eccVal =3D REG_UMI_BCH_WR_ECC_0;
+               oobp[12] =3D (eccVal >> 24) & 0xff;       /* ECC3 */
+               oobp[13] =3D (eccVal >> 16) & 0xff;       /* ECC2 */
+               oobp[14] =3D (eccVal >> 8) & 0xff;        /* ECC1 */
+               oobp[15] =3D eccVal & 0xff;       /* ECC0 */
+       } else {
+               /* Skip BI in oob[0] */
+               /* Skip CM in oob[1,2] */
+
+               /* Write ECC in oob[3-15] */
+               eccVal =3D REG_UMI_BCH_WR_ECC_3;
+               oobp[3] =3D eccVal & 0xff;        /* ECC12 */
+               eccVal =3D REG_UMI_BCH_WR_ECC_2;
+               oobp[4] =3D (eccVal >> 24) & 0xff;        /* ECC11 */
+               oobp[5] =3D (eccVal >> 16) & 0xff;        /* ECC10 */
+               oobp[6] =3D (eccVal >> 8) & 0xff; /* ECC9 */
+               oobp[7] =3D eccVal & 0xff;        /* ECC8 */
+               eccVal =3D REG_UMI_BCH_WR_ECC_1;
+               oobp[8] =3D (eccVal >> 24) & 0xff;        /* ECC7 */
+               oobp[9] =3D (eccVal >> 16) & 0xff;        /* ECC6 */
+               oobp[10] =3D (eccVal >> 8) & 0xff;        /* ECC5 */
+               oobp[11] =3D eccVal & 0xff;       /* ECC4 */
+               eccVal =3D REG_UMI_BCH_WR_ECC_0;
+               oobp[12] =3D (eccVal >> 24) & 0xff;       /* ECC3 */
+               oobp[13] =3D (eccVal >> 16) & 0xff;       /* ECC2 */
+               oobp[14] =3D (eccVal >> 8) & 0xff;        /* ECC1 */
+               oobp[15] =3D eccVal & 0xff;       /* ECC0 */
+       }
+}
+
+static void bcm_umi_bch_read_oobEcc(struct mtd_info *mtd, u_char * eccCalc=
)
+{
+       /* We are reading the OOB */
+       int eccPos =3D 0;
+
+       /* ECC is already paused when this function is called */
+
+       if (mtd->writesize =3D=3D 512) {    /* writesize is the pagesize */
+               /* skip CM */
+               REG_NAND_DATA8;
+               REG_NAND_DATA8;
+
+               /* read from 2 to 4 */
+               nand_bcm_umi_bch_resume_read_ecc_calc();
+
+               eccCalc[eccPos++] =3D REG_NAND_DATA8;
+               eccCalc[eccPos++] =3D REG_NAND_DATA8;
+               eccCalc[eccPos++] =3D REG_NAND_DATA8;
+               nand_bcm_umi_bch_pause_read_ecc_calc();
+
+               /* read BI */
+               REG_NAND_DATA8;
+
+               /* read from 6 to nand_ecc_bch_total */
+               nand_bcm_umi_bch_resume_read_ecc_calc();
+
+               /* Deduct 3 from total since 3 ECC bytes have
+                * been read already */
+               for (; eccPos < NAND_ECC_NUM_BYTES; eccPos++)
+                       eccCalc[eccPos] =3D REG_NAND_DATA8;
+       } else {
+               /* skip BI */
+               REG_NAND_DATA8;
+
+               /* skip CM */
+               REG_NAND_DATA8;
+               REG_NAND_DATA8;
+
+               /* read ECC bytes */
+               nand_bcm_umi_bch_resume_read_ecc_calc();
+
+               for (; eccPos < NAND_ECC_NUM_BYTES; eccPos++)
+                       eccCalc[eccPos] =3D REG_NAND_DATA8;
+       }
+}
+
+static int bcm_umi_bch_correct(u_char *dat, u_char *read_ecc)
+{
+       int result;
+
+       result =3D nand_bcm_umi_bch_correct_page(dat);
+
+       /* If the ECC is unprogrammed then we can't correct */
+       if (result !=3D 0) {
+               int i;
+
+               for (i =3D 0; i < NAND_ECC_NUM_BYTES; i++)
+                       if (read_ecc[i] !=3D 0xff)
+                               return result;
+               result =3D 0;
+       }
+       return result;
+}
+
+/* =3D=3D=3D=3D Public Functions =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
+
+/*************************************************************************=
***
+*
+*  bcm_umi_bch_read_page_hwecc - hardware ecc based page read function
+*  @mtd:       mtd info structure
+*  @chip:      nand chip info structure
+*  @buf:       buffer to store read data
+*
+**************************************************************************=
*/
+static int bcm_umi_bch_read_page_hwecc(struct mtd_info *mtd,
+                                      struct nand_chip *chip, uint8_t *buf=
)
+{
+       int sectorIdx =3D 0;
+       int eccsize =3D chip->ecc.size;
+       int eccsteps =3D chip->ecc.steps;
+       uint8_t *datap =3D buf;
+       uint8_t *oobp =3D chip->oob_poi;
+       uint8_t eccCalc[NAND_ECC_NUM_BYTES];
+       int sectorOobSize =3D mtd->oobsize / eccsteps;
+       int stat;
+
+       for (sectorIdx =3D 0; sectorIdx < eccsteps;
+            sectorIdx++, datap +=3D eccsize, oobp +=3D sectorOobSize) {
+               if (sectorIdx > 0) {
+                       /* Seek to page location within sector */
+                       chip->cmdfunc(mtd, NAND_CMD_RNDOUT, sectorIdx * ecc=
size,
+                                     -1);
+               }
+
+               /* Enable hardware ECC before reading the buf */
+               nand_bcm_umi_bch_enable_read_hwecc();
+
+               /* Read in data */
+               bcm_umi_nand_read_buf(mtd, datap, eccsize);
+
+               /* Pause hardware ECC after reading the buf */
+               nand_bcm_umi_bch_pause_read_ecc_calc();
+
+               /* Read the OOB ECC */
+               chip->cmdfunc(mtd, NAND_CMD_RNDOUT,
+                             mtd->writesize + sectorIdx * sectorOobSize, -=
1);
+               bcm_umi_bch_read_oobEcc(mtd, eccCalc);
+
+               /* Correct any ECC detected errors */
+               stat =3D bcm_umi_bch_correct(datap, eccCalc);
+
+               /* Update Stats */
+               if (stat < 0) {
+#if defined(NAND_BCM_UMI_DEBUG)
+                       printk(KERN_WARNING
+                              "%s uncorrectable_error_detected sectorIdx=
=3D%d\n",
+                              __func__, sectorIdx);
+                       printk(KERN_WARNING
+                              "%s data %02x %02x %02x %02x %02x
+                                        %02x %02x %02x\n",
+                              __func__, datap[0], datap[1], datap[2], data=
p[3],
+                              datap[4], datap[5], datap[6], datap[7]);
+                       printk(KERN_WARNING
+                              "%s oob  %02x %02x %02x %02x %02x
+                                        %02x %02x %02x\n",
+                              __func__, oobp[0], oobp[1], oobp[2], oobp[3]=
,
+                              oobp[4], oobp[5], oobp[6], oobp[7]);
+                       printk(KERN_WARNING
+                              "%s oob  %02x %02x %02x %02x %02x
+                                        %02x %02x %02x\n",
+                              __func__, oobp[8], oobp[9], oobp[10], oobp[1=
1],
+                              oobp[12], oobp[13], oobp[14], oobp[15]);
+#endif
+                       mtd->ecc_stats.failed++;
+               } else {
+#if defined(NAND_BCM_UMI_DEBUG)
+                       if (stat > 0) {
+                               printk(KERN_INFO
+                                      "%s %d correctable_errors detected\n=
",
+                                      __func__, stat);
+                       }
+#endif
+                       mtd->ecc_stats.corrected +=3D stat;
+               }
+       }
+       return 0;
+}
+
+/*************************************************************************=
***
+*
+*  bcm_umi_bch_write_page_hwecc - hardware ecc based page write function
+*  @mtd:       mtd info structure
+*  @chip:      nand chip info structure
+*  @buf:       data buffer
+*
+**************************************************************************=
*/
+static void bcm_umi_bch_write_page_hwecc(struct mtd_info *mtd,
+                                        struct nand_chip *chip,
+                                        const uint8_t *buf)
+{
+       int sectorIdx =3D 0;
+       int eccsize =3D chip->ecc.size;
+       int eccsteps =3D chip->ecc.steps;
+       const uint8_t *datap =3D buf;
+       uint8_t *oobp =3D chip->oob_poi;
+       int sectorOobSize =3D mtd->oobsize / eccsteps;
+
+       for (sectorIdx =3D 0; sectorIdx < eccsteps;
+            sectorIdx++, datap +=3D eccsize, oobp +=3D sectorOobSize) {
+               /* Enable hardware ECC before writing the buf */
+               nand_bcm_umi_bch_enable_write_hwecc();
+               bcm_umi_nand_write_buf(mtd, datap, eccsize);
+               bcm_umi_bch_write_oobEcc(mtd, oobp);
+       }
+
+       bcm_umi_nand_write_buf(mtd, chip->oob_poi, mtd->oobsize);
+}
diff --git a/drivers/mtd/nand/bcm_umi_hamming.c b/drivers/mtd/nand/bcm_umi_=
hamming.c
new file mode 100644
index 0000000..eb14b71
--- /dev/null
+++ b/drivers/mtd/nand/bcm_umi_hamming.c
@@ -0,0 +1,135 @@
+/*************************************************************************=
****
+* Copyright 2004 - 2009 Broadcom Corporation.  All rights reserved.
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
+/* ---- Include Files ----------------------------------------------------=
 */
+#include <linux/mtd/nand_ecc512.h>
+/* ---- External Variable Declarations -----------------------------------=
 */
+/* ---- External Function Prototypes -------------------------------------=
 */
+/* ---- Public Variables -------------------------------------------------=
 */
+/* ---- Private Constants and Types --------------------------------------=
 */
+#define NAND_ECC_NUM_BYTES 3
+
+/* ---- Private Function Prototypes --------------------------------------=
 */
+static int bcm_umi_hamming_get_hw_ecc(struct mtd_info *mtd, const u_char *=
dat,
+                                     u_char *ecc_code);
+static void bcm_umi_hamming_enable_hwecc(struct mtd_info *mtd, int mode);
+
+/* ---- Private Variables ------------------------------------------------=
 */
+
+/*
+** nand_hw_eccoob
+** New oob placement block for use with hardware ecc generation.
+*/
+static struct nand_ecclayout nand_hw_eccoob_512 =3D {
+       .eccbytes =3D 3,
+       .eccpos =3D {6, 7, 8},
+       /*
+        ** Reserve 0/1 and 10/11 as BI indicators for 16-bit flash
+        ** Reserve 5 for 8-bit BI
+        ** 6/7/8 are for ecc so this is all that's left
+        */
+       .oobfree =3D {
+                   {.offset =3D 2, .length =3D 3},
+                   {.offset =3D 9, .length =3D 1},
+                   {.offset =3D 12, .length =3D 4}
+                        }
+};
+
+/*
+ * We treat the OOB for a 2K page as if it were 4 512 byte oobs,
+ * except that the ECC offset if 8 rather than 6.
+ */
+static struct nand_ecclayout nand_hw_eccoob_2048 =3D {
+       .eccbytes =3D 12,
+       .eccpos =3D {8, 9, 10, 24, 25, 26, 40, 41, 42, 56, 57, 58},
+       /*
+        ** Reserve 0/1 as BI indicators for 8/16-bit flash
+        ** 8/9/10 are for ecc so this is all that's left
+        */
+       .oobfree =3D {
+                   {.offset =3D 2, .length =3D 6},
+                   {.offset =3D 11, .length =3D 13},
+                   {.offset =3D 27, .length =3D 13},
+                   {.offset =3D 43, .length =3D 13},
+                   {.offset =3D 59, .length =3D 5}
+                        }
+};
+
+/*
+ * We treat the OOB for a 4K page as if it were 8 512 byte oobs,
+ * except that the ECC offset if 8 rather than 6.
+ */
+static struct nand_ecclayout nand_hw_eccoob_4096 =3D {
+       .eccbytes =3D 24,
+       .eccpos =3D
+           {8, 9, 10, 24, 25, 26, 40, 41, 42, 56, 57, 58, 72, 73, 74, 88, =
89,
+            90, 104, 105, 106, 120, 121, 122},
+       /*
+        ** Reserve 0/1 as BI indicators for 8/16-bit flash
+        ** 8/9/10 are for ecc so this is all that's left
+        */
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
+       /* { .offset =3D 123,    .length =3D 5 }}
+        * It turns out nand_ecclayout only has space for 8 entries */
+};
+
+/* ---- Private Functions ------------------------------------------------=
 */
+
+/*************************************************************************=
***
+*
+*  bcm_umi_hamming_get_hw_ecc
+*
+*   Used to get the hardware ECC.
+*
+**************************************************************************=
*/
+
+static int bcm_umi_hamming_get_hw_ecc(struct mtd_info *mtd, const u_char *=
dat,
+                                     u_char *ecc_code)
+{
+       unsigned long ecc =3D REG_UMI_NAND_ECC_DATA;
+       ecc_code[2] =3D (ecc >> 16) & 0xff;
+       ecc_code[1] =3D (ecc >> 8) & 0xff;
+       ecc_code[0] =3D (ecc >> 0) & 0xff;
+
+       (void)mtd;
+       (void)dat;
+
+       return 0;
+}
+
+/*************************************************************************=
***
+*
+*  bcm_umi_hamming_enable_hwecc
+*
+*   Used to turn on hardware ECC.
+*
+**************************************************************************=
*/
+
+static void bcm_umi_hamming_enable_hwecc(struct mtd_info *mtd, int mode)
+{
+       (void)mtd;
+       (void)mode;
+       nand_bcm_umi_hamming_enable_hwecc();
+}
+
+/* =3D=3D=3D=3D Public Functions =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
diff --git a/drivers/mtd/nand/bcm_umi_nand.c b/drivers/mtd/nand/bcm_umi_nan=
d.c
new file mode 100644
index 0000000..38fdef2
--- /dev/null
+++ b/drivers/mtd/nand/bcm_umi_nand.c
@@ -0,0 +1,790 @@
+/*************************************************************************=
****
+* Copyright 2004 - 2009 Broadcom Corporation.  All rights reserved.
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
+/* ---- Include Files ----------------------------------------------------=
 */
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
+#include <linux/io.h>
+
+#include <linux/platform_device.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/partitions.h>
+
+#include <asm/mach-types.h>
+#include <asm/system.h>
+
+#include <mach/reg_nand.h>
+#include <mach/reg_umi.h>
+
+#include <linux/mtd/nand_bcm_umi.h>
+
+#if !defined(CONFIG_ARCH_BCM116X)
+#include <mach/memory_settings.h>
+#endif
+
+#define USE_DMA 1
+#include <mach/dma.h>
+#include <linux/dma-mapping.h>
+#include <linux/completion.h>
+
+#define USE_HWECC 1
+
+/* ---- External Variable Declarations -----------------------------------=
 */
+/* ---- External Function Prototypes -------------------------------------=
 */
+/* ---- Public Variables -------------------------------------------------=
 */
+/* ---- Private Constants and Types --------------------------------------=
 */
+static char gBanner[] __initdata =3D KERN_INFO "BCM UMI MTD NAND Driver: 1=
.00\n";
+
+#ifdef CONFIG_MTD_PARTITIONS
+static char *part_probes[] =3D { "cmdlinepart", NULL };
+#endif
+
+#if NAND_ECC_BCH
+static uint8_t scan_ff_pattern[] =3D { 0xff };
+
+static struct nand_bbt_descr largepage_bbt =3D {
+       .options =3D 0,
+       .offs =3D 0,
+       .len =3D 1,
+       .pattern =3D scan_ff_pattern
+};
+#endif
+
+/*
+** Preallocate a buffer to avoid having to do this every dma operation.
+** This is the size of the preallocated coherent DMA buffer.
+*/
+#if USE_DMA
+#define DMA_MIN_BUFLEN         512
+#define DMA_MAX_BUFLEN         PAGE_SIZE
+#define USE_DIRECT_IO(len)     (((len) < DMA_MIN_BUFLEN) || \
+       ((len) > DMA_MAX_BUFLEN))
+
+#if defined(CONFIG_ARCH_BCMRING)
+/*
+ * The current NAND data space goes from 0x80001900 to 0x80001FFF,
+ * which is only 0x700 =3D 1792 bytes long. This is too small for 2K, 4K p=
age
+ * size NAND flash. Need to break the DMA down to multiple 1Ks.
+ *
+ * Need to make sure REG_NAND_DATA_PADDR + DMA_MAX_LEN < 0x80002000
+ */
+#define DMA_MAX_LEN             1024
+#endif
+
+#if defined(CONFIG_ARCH_BCM116X)
+
+#define NAND_DMA_CHAN   3
+
+/* Global config is common for both directions. */
+#define DMA_CFG                                 \
+    (REG_DMA_CHAN_CFG_TC_INT_ENABLE            \
+    | REG_DMA_CHAN_CFG_ERROR_INT_ENABLE         \
+    | REG_DMA_CHAN_CFG_FLOW_CTL_MEM_TO_MEM_DMA  \
+    | REG_DMA_CHAN_CFG_ENABLE)
+
+/* Common transfer widths in bits (typically 8, 16, or 32) */
+#define DMA_WIDTH(dstwidth, srcwidth)                        \
+    (REG_DMA_CHAN_CTL_DEST_WIDTH_##dstwidth       \
+    | REG_DMA_CHAN_CTL_SRC_WIDTH_##srcwidth)
+
+/* Common burst sizes - typically 4 */
+#define DMA_BURST(width)                        \
+    (REG_DMA_CHAN_CTL_DEST_BURST_SIZE_##width  \
+    | REG_DMA_CHAN_CTL_SRC_BURST_SIZE_##width)
+
+/* DMA settings for copying from NAND to SDRAM */
+#define DMA_CTRL_NAND_TO_SDRAM(dstwidth, srcwidth, bytes)    \
+    (REG_DMA_CHAN_CTL_TC_INT_ENABLE            \
+    | REG_DMA_CHAN_CTL_DEST_INCR                \
+    | DMA_BURST(4)                              \
+    | DMA_WIDTH(dstwidth, srcwidth)             \
+    | (bytes * 8 / srcwidth))
+
+/* DMA settings for copying from SDRAM to NAND */
+#define DMA_CTRL_SDRAM_TO_NAND(dstwidth, srcwidth, bytes)    \
+    (REG_DMA_CHAN_CTL_TC_INT_ENABLE            \
+    | REG_DMA_CHAN_CTL_SRC_INCR                 \
+    | DMA_BURST(4)                              \
+    | DMA_WIDTH(dstwidth, srcwidth)             \
+    | (bytes * 8 / srcwidth))
+
+#endif /* CONFIG_ARCH_BCM116X */
+
+#else /* !USE_DMA */
+#define DMA_MIN_BUFLEN          0
+#define DMA_MAX_BUFLEN          0
+#define USE_DIRECT_IO(len)      1
+#endif
+/* ---- Private Function Prototypes --------------------------------------=
 */
+static void bcm_umi_nand_read_buf(struct mtd_info *mtd, u_char * buf, int =
len);
+static void bcm_umi_nand_write_buf(struct mtd_info *mtd, const u_char * bu=
f,
+                                  int len);
+
+/* ---- Private Variables ------------------------------------------------=
 */
+static struct mtd_info *board_mtd;
+static void __iomem *bcm_umi_io_base;
+static void *virtPtr;
+static dma_addr_t physPtr;
+static struct completion nand_comp;
+
+/* ---- Private Functions ------------------------------------------------=
 */
+#if NAND_ECC_BCH
+#include "bcm_umi_bch.c"
+#else
+#include "bcm_umi_hamming.c"
+#endif
+
+#if USE_DMA
+
+#if defined(CONFIG_ARCH_BCM116X)
+static irqreturn_t nand_dma_isr(void *dev_id)
+{
+       complete(&nand_comp);
+       return IRQ_HANDLED;
+}
+
+#elif defined(CONFIG_ARCH_BCMRING)
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
+#endif
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
+#if defined(CONFIG_ARCH_BCM116X)
+
+       dma_request_irq(NAND_DMA_CHAN, nand_dma_isr, NULL);
+       dma_enable_irq(NAND_DMA_CHAN);
+       dma_request_chan(NAND_DMA_CHAN, "nand");
+
+#elif defined(CONFIG_ARCH_BCMRING)
+
+       int rc;
+
+       rc =3D dma_set_device_handler(DMA_DEVICE_NAND_MEM_TO_MEM,
+               nand_dma_handler, NULL);
+       if (rc !=3D 0) {
+               printk(KERN_ERR "dma_set_device_handler failed: %d\n", rc);
+               return rc;
+       }
+#else
+#error "Unrecognized DMA platform"
+#endif
+
+       virtPtr =3D
+           dma_alloc_coherent(NULL, DMA_MAX_BUFLEN, &physPtr, GFP_KERNEL);
+       if (virtPtr =3D=3D NULL) {
+               printk(KERN_ERR "NAND - Failed to allocate memory for DMA b=
uffer\n");
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
+#if defined(CONFIG_ARCH_BCM116X)
+       dma_free_chan(NAND_DMA_CHAN);
+       dma_free_irq(NAND_DMA_CHAN);
+#elif defined(CONFIG_ARCH_BCMRING)
+       /* Nothing to do */
+#else
+#error "Unrecognized DMA platform"
+#endif
+
+       if (virtPtr !=3D NULL)
+               dma_free_coherent(NULL, DMA_MAX_BUFLEN, virtPtr, physPtr);
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
+#if defined(CONFIG_ARCH_BCM116X)
+       int dmactrl;
+
+       init_completion(&nand_comp);
+       dmactrl =3D DMA_CTRL_NAND_TO_SDRAM(32, 8, len);
+       dma_init_chan(NAND_DMA_CHAN);
+       dma_setup_chan(NAND_DMA_CHAN,
+                      REG_NAND_DATA8_PADDR, (int)physPtr, 0, dmactrl, DMA_=
CFG);
+       wait_for_completion(&nand_comp);
+       if (buf !=3D NULL)
+               memcpy(buf, virtPtr, len);
+
+#elif defined(CONFIG_ARCH_BCMRING)
+       int offset =3D 0;
+       int tmp_len =3D 0;
+       int len_left =3D len;
+       DMA_Handle_t hndl;
+
+       if (virtPtr =3D=3D NULL)
+               panic("nand_dma_read: virtPtr =3D=3D NULL\n");
+
+       if ((void *)physPtr =3D=3D NULL)
+               panic("nand_dma_read: physPtr =3D=3D NULL\n");
+
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
+       if (buf !=3D NULL)
+               memcpy(buf, virtPtr, len);
+
+#else
+#error "Unrecognized DMA platform"
+#endif
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
+#if defined(CONFIG_ARCH_BCM116X)
+       int dmactrl;
+
+       memcpy(virtPtr, buf, len);
+       init_completion(&nand_comp);
+
+       dmactrl =3D DMA_CTRL_SDRAM_TO_NAND(8, 32, len);
+       dma_init_chan(NAND_DMA_CHAN);
+       dma_setup_chan(NAND_DMA_CHAN,
+                      (int)physPtr, REG_NAND_DATA8_PADDR, 0, dmactrl, DMA_=
CFG);
+       wait_for_completion(&nand_comp);
+
+#elif defined(CONFIG_ARCH_BCMRING)
+       int offset =3D 0;
+       int tmp_len =3D 0;
+       int len_left =3D len;
+       DMA_Handle_t hndl;
+
+       if (buf =3D=3D NULL)
+               panic("nand_dma_write: buf =3D=3D NULL\n");
+
+       if (virtPtr =3D=3D NULL)
+               panic("nand_dma_write: virtPtr =3D=3D NULL\n");
+
+       if ((void *)physPtr =3D=3D NULL)
+               panic("nand_dma_write: physPtr =3D=3D NULL\n");
+
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
+#else
+#error "Unrecognized DMA platform"
+#endif
+}
+
+#endif
+
+/*************************************************************************=
***
+*
+*  nand_dev_ready
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
+#if defined(CONFIG_ARCH_BCM116X)
+/*
+ * waiten =3D 0
+ * lowfreq =3D 0
+ * memtype async r/w, no page mode =3D 000
+ * pgsz =3D 000
+ * tprc_twlc =3D 00000   Page read access cycle/Burst write latency (n+2/n=
+1)
+ * tbta =3D 001                  Bus turnaround cycle (n)
+ * twp =3D 00100                 Write pulse width cycle (n+1)
+ * twr =3D 00                            Write recovery cycle (n+1)
+ * tas =3D 00                            Write address setup cycle (n+1)
+ * toe =3D 00                            Output enable delay cycle (n)
+ * trc_tlc =3D 00011     Read access cycle / Burst read latency (n+2 / n+1=
)
+ */
+       REG_UMI_FLASH0_TCR =3D 0x00012003;
+#endif
+
+       REG_UMI_NAND_TCR &=3D ~0x7ffff;
+#if defined(CONFIG_ARCH_BCM116X)
+/*
+ * tbta =3D 001            Bus turnaround cycle (n)
+ * twp =3D 00100           Write pulse width cycle (n+1)
+ * twr =3D 00              Write recovery cycle (n+1)
+ * tas =3D 00              Write address setup cycle (n+1)
+ * toe =3D 00              Output enable delay cycle (n)
+ * trc_tlc =3D 00011       Read access cycle / Burst read latency (n+2 / n=
+1)
+ */
+       REG_UMI_NAND_TCR |=3D 0x72003;
+#else
+       REG_UMI_NAND_TCR |=3D HW_CFG_NAND_TCR;
+#endif
+
+#if !defined(CONFIG_MTD_NAND_BCM_UMI_HWCS)
+       /* enable software control of CS */
+       REG_UMI_NAND_TCR |=3D REG_UMI_NAND_TCR_CS_SWCTRL;
+#endif
+       /* keep NAND chip select asserted */
+       REG_UMI_NAND_RCSR |=3D REG_UMI_NAND_RCSR_CS_ASSERTED;
+
+       REG_UMI_NAND_TCR &=3D ~REG_UMI_NAND_TCR_WORD16;
+       /* enable writes to flash */
+       REG_UMI_MMD_ICR |=3D REG_UMI_MMD_ICR_FLASH_WP;
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
+       /* send command to hardware */
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
+}
+
+/*************************************************************************=
***
+*
+*  bcm_umi_nand_write_buf - write buffer to chip
+*  @mtd:       MTD device structure
+*  @buf:       data buffer
+*  @len:       number of bytes to write
+*
+**************************************************************************=
*/
+static void bcm_umi_nand_write_buf(struct mtd_info *mtd, const u_char * bu=
f,
+                                  int len)
+{
+       if (USE_DIRECT_IO(len)) {
+               /* Do it the old way if the buffer is small or too large.
+                * Probably quicker than starting and checking dma. */
+               int i;
+               struct nand_chip *this =3D mtd->priv;
+
+               for (i =3D 0; i < len; i++)
+                       writeb(buf[i], this->IO_ADDR_W);
+       }
+#if USE_DMA
+       else
+               nand_dma_write(buf, len);
+#endif
+}
+
+/*************************************************************************=
***
+*
+*  nand_read_buf - read chip data into buffer
+*  @mtd:       MTD device structure
+*  @buf:       buffer to store data
+*  @len:       number of bytes to read
+*
+**************************************************************************=
*/
+
+static void bcm_umi_nand_read_buf(struct mtd_info *mtd, u_char * buf, int =
len)
+{
+       if (USE_DIRECT_IO(len)) {
+               int i;
+               struct nand_chip *this =3D mtd->priv;
+
+               for (i =3D 0; i < len; i++)
+                       buf[i] =3D readb(this->IO_ADDR_R);
+       }
+#if USE_DMA
+       else
+               nand_dma_read(buf, len);
+#endif
+}
+
+/*************************************************************************=
***
+*
+*  bcm_umi_nand_verify_buf - Verify chip data against buffer
+*  @mtd:       MTD device structure
+*  @buf:       buffer containing the data to compare
+*  @len:       number of bytes to compare
+*
+**************************************************************************=
*/
+static uint8_t readbackbuf[NAND_MAX_PAGESIZE];
+static int bcm_umi_nand_verify_buf(struct mtd_info *mtd, const u_char * bu=
f,
+                                  int len)
+{
+       /*
+        * Try to readback page with ECC correction. This is necessary
+        * for MLC parts which may have permanently stuck bits.
+        */
+       struct nand_chip *chip =3D mtd->priv;
+       int ret =3D chip->ecc.read_page(mtd, chip, readbackbuf);
+       if (ret < 0)
+               return -EFAULT;
+       else {
+               if (memcmp(readbackbuf, buf, len) =3D=3D 0)
+                       return 0;
+               return -EFAULT;
+       }
+
+       return 0;
+}
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
+               printk(KERN_ERR "BCM UMI NAND chip could not be initialized=
\n");
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
+#if USE_HWECC
+       this->ecc.mode =3D NAND_ECC_HW;
+       this->ecc.size =3D 512;
+       this->ecc.bytes =3D NAND_ECC_NUM_BYTES;
+
+#if NAND_ECC_BCH
+       this->ecc.read_page =3D bcm_umi_bch_read_page_hwecc;
+       this->ecc.write_page =3D bcm_umi_bch_write_page_hwecc;
+#else
+       this->ecc.correct =3D nand_correct_data512;
+       this->ecc.calculate =3D bcm_umi_hamming_get_hw_ecc;
+       this->ecc.hwctl =3D bcm_umi_hamming_enable_hwecc;
+#endif
+#else
+       this->ecc.mode =3D NAND_ECC_SOFT;
+#endif
+
+#if USE_DMA
+       err =3D nand_dma_init();
+       if (err !=3D 0)
+               return err;
+#endif
+
+       /* Figure out the size of the device that we have. We need to do th=
is to
+        * figure out which ECC layout we'll be using. */
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
+#if USE_HWECC
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
+#if NAND_ECC_BCH
+       if (board_mtd->writesize > 512) {
+               if (this->options & NAND_USE_FLASH_BBT)
+                       largepage_bbt.options =3D NAND_BBT_SCAN2NDPAGE;
+
+               this->badblock_pattern =3D &largepage_bbt;
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
+                       printk(KERN_ERR "BCM UMI NAND: Too few partitions -=
 %d\n",
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
+#if USE_DMA
+       nand_dma_term();
+#endif
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
diff --git a/include/linux/mtd/nand_bcm_umi.h b/include/linux/mtd/nand_bcm_=
umi.h
new file mode 100644
index 0000000..0912297
--- /dev/null
+++ b/include/linux/mtd/nand_bcm_umi.h
@@ -0,0 +1,241 @@
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
+       while (nand_bcm_umi_dev_ready() =3D=3D 0)
+               ;
+}
+
+static inline void nand_bcm_umi_hamming_enable_hwecc(void)
+{
+       /* disable and reset ECC, 512 byte page */
+       REG_UMI_NAND_ECC_CSR &=3D ~(REG_UMI_NAND_ECC_CSR_ECC_ENABLE |
+               REG_UMI_NAND_ECC_CSR_256BYTE);
+       /* enable ECC */
+       REG_UMI_NAND_ECC_CSR |=3D REG_UMI_NAND_ECC_CSR_ECC_ENABLE;
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
+       while ((REG_UMI_BCH_CTRL_STATUS &
+               REG_UMI_BCH_CTRL_STATUS_WR_ECC_VALID) =3D=3D 0)
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
+       uint8_t errorByte =3D 0;
+       uint8_t byteMask =3D 1 << locWithinAByte;
+
+       /* BCH uses big endian, need to change the location bits
+        * to little endian */
+       locWithinAWord =3D 3 - locWithinAWord;
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
+*     0 or greater =3D Number of errors corrected
+*     (No errors are found or errors have been fixed)
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
+       /* read the control status register to determine
+        * if there are error'ed bits */
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
--
1.6.0.6
