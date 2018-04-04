Received: from mail-am5eur03on061e.outbound.protection.outlook.com
 ([2a01:111:f400:fe08::61e]
 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f3fKe-00063L-5E
 for linux-mtd@lists.infradead.org; Wed, 04 Apr 2018 10:08:00 +0000
From: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, cyrille.pitchen@wedev4u.fr,
 computersforpeace@gmail.com, han.xu@nxp.com, festevam@gmail.com,
 marek.vasut@gmail.com, frieder.schrempf@exceet.de, suresh.gupta@nxp.com,
 Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
Subject: [RFC PATCH 4/4] mtd: spi-nor: Add NXP FlexSPI driver
Date: Wed,  4 Apr 2018 15:36:11 +0530
Message-Id: <1522836371-2828-5-git-send-email-yogeshnarayan.gaur@nxp.com>
In-Reply-To: <1522836371-2828-1-git-send-email-yogeshnarayan.gaur@nxp.com>
References: <1522836371-2828-1-git-send-email-yogeshnarayan.gaur@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

- Add NXP FlexSPI driver

(0) What is the FlexSPI controller?
 The FlexSPI(Flex Serial Peripheral Interface) acts as an interface to
 external serial flash devices, maximum 4, each with up to 8
 bidirectional data lines.
 Chipselect for each flash can be selected as per address assigned in
 controller specific registers.

(1) The FlexSPI controller is driven by the LUT(Look-up Table) registers.
 The LUT registers are a look-up-table for sequences of instructions.
 A valid sequence consists of four LUT registers.

(2) The definition of the LUT register shows below:
 ---------------------------------------------------
 | INSTR1 | PAD1 | OPRND1 | INSTR0 | PAD0 | OPRND0 |
 ---------------------------------------------------

 There are several types of INSTRx, such as:
 CMD     : the SPI NOR command.
 ADDR    : the address for the SPI NOR command.
 DUMMY   : the dummy cycles needed by the SPI NOR command.
 ....

 There are several types of PADx, such as:
 PAD1    : use a singe I/O line.
 PAD2    : use two I/O lines.
 PAD4    : use quad I/O lines.
 PAD8    : use octal I/O lines.
 ....

(3) LUTs are being created at run-time based on the commands passed from
 the spi-nor framework.

(4) Mode [single, dual, quad or octal] bit information derived from device
 tree by parsing spi-rx-bus-width and spi-tx-bus-width property.

(5) Tested this driver with the mtd_debug utility on NXP LX2160
 emulator platform.

- Add config option entry in 'spi-nor/Kconfig' required for FlexSPI driver.

- Add entry in the 'spi-nor/Makefile'.

- Add a maintainer entry for NXP FLEX SPI driver.

Signed-off-by: Han Xu <han.xu@nxp.com>
Signed-off-by: Suresh Gupta <suresh.gupta@nxp.com>
Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
---
 MAINTAINERS                       |    7 +
 drivers/mtd/spi-nor/Kconfig       |    7 +
 drivers/mtd/spi-nor/Makefile      |    1 +
 drivers/mtd/spi-nor/nxp-flexspi.c | 1508 +++++++++++++++++++++++++++++++++++++
 4 files changed, 1523 insertions(+)
 create mode 100644 drivers/mtd/spi-nor/nxp-flexspi.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 3bdc260..670e85e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9921,6 +9921,13 @@ F:	Documentation/ABI/stable/sysfs-bus-nvmem
 F:	include/linux/nvmem-consumer.h
 F:	include/linux/nvmem-provider.h
 
+NXP FLEX SPI DRIVER
+M:	Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
+M:	Suresh Gupta <suresh.gupta@nxp.com>
+L:	linux-mtd@lists.infradead.org
+S:	Maintained
+F:	drivers/mtd/spi-nor/nxp-flexspi.c
+
 NXP TDA998X DRM DRIVER
 M:	Russell King <linux@armlinux.org.uk>
 S:	Supported
diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index 89da88e..ad0711f 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -129,4 +129,11 @@ config SPI_STM32_QUADSPI
 	  This enables support for the STM32 Quad SPI controller.
 	  We only connect the NOR to this controller.
 
+config	SPI_NXP_FLEXSPI
+	 tristate "NXP Flex SPI controller"
+	 help
+	   This enables support for the Flex SPI controller in master mode.
+	   For now, we only support NOR flashes as slave devices for this
+	   controller.
+
 endif # MTD_SPI_NOR
diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index f4c61d2..1016810 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -11,3 +11,4 @@ obj-$(CONFIG_SPI_INTEL_SPI)	+= intel-spi.o
 obj-$(CONFIG_SPI_INTEL_SPI_PCI)	+= intel-spi-pci.o
 obj-$(CONFIG_SPI_INTEL_SPI_PLATFORM)	+= intel-spi-platform.o
 obj-$(CONFIG_SPI_STM32_QUADSPI)	+= stm32-quadspi.o
+obj-$(CONFIG_SPI_NXP_FLEXSPI)	+= nxp-flexspi.o
diff --git a/drivers/mtd/spi-nor/nxp-flexspi.c b/drivers/mtd/spi-nor/nxp-flexspi.c
new file mode 100644
index 0000000..dad94a6
--- /dev/null
+++ b/drivers/mtd/spi-nor/nxp-flexspi.c
@@ -0,0 +1,1508 @@
+/*
+ * NXP FSPI(FlexSPI controller) driver.
+ *
+ * Copyright 2018 NXP
+ * Author: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/interrupt.h>
+#include <linux/errno.h>
+#include <linux/platform_device.h>
+#include <linux/err.h>
+#include <linux/of_device.h>
+#include <linux/jiffies.h>
+#include <linux/completion.h>
+#include <linux/mtd/spi-nor.h>
+#include <linux/mutex.h>
+#include <linux/spi/spi.h>
+
+/* The registers */
+#define FSPI_MCR0			0x00
+#define FSPI_MCR0_AHB_TIMEOUT_SHIFT	24
+#define FSPI_MCR0_AHB_TIMEOUT_MASK	(0xFF << FSPI_MCR0_AHB_TIMEOUT_SHIFT)
+#define FSPI_MCR0_IP_TIMEOUT_SHIFT	16
+#define FSPI_MCR0_IP_TIMEOUT_MASK	(0xFF << FSPI_MCR0_IP_TIMEOUT_SHIFT)
+#define FSPI_MCR0_LEARN_EN_SHIFT	15
+#define FSPI_MCR0_LEARN_EN_MASK		(1 << FSPI_MCR0_LEARN_EN_SHIFT)
+#define FSPI_MCR0_SCRFRUN_EN_SHIFT	14
+#define FSPI_MCR0_SCRFRUN_EN_MASK	(1 << FSPI_MCR0_SCRFRUN_EN_SHIFT)
+#define FSPI_MCR0_OCTCOMB_EN_SHIFT	13
+#define FSPI_MCR0_OCTCOMB_EN_MASK	(1 << FSPI_MCR0_OCTCOMB_EN_SHIFT)
+#define FSPI_MCR0_DOZE_EN_SHIFT		12
+#define FSPI_MCR0_DOZE_EN_MASK		(1 << FSPI_MCR0_DOZE_EN_SHIFT)
+#define FSPI_MCR0_HSEN_SHIFT		11
+#define FSPI_MCR0_HSEN_MASK		(1 << FSPI_MCR0_HSEN_SHIFT)
+#define FSPI_MCR0_SERCLKDIV_SHIFT	8
+#define FSPI_MCR0_SERCLKDIV_MASK	(7 << FSPI_MCR0_SERCLKDIV_SHIFT)
+#define FSPI_MCR0_ATDF_EN_SHIFT		7
+#define FSPI_MCR0_ATDF_EN_MASK		(1 << FSPI_MCR0_ATDF_EN_SHIFT)
+#define FSPI_MCR0_ARDF_EN_SHIFT		6
+#define FSPI_MCR0_ARDF_EN_MASK		(1 << FSPI_MCR0_ARDF_EN_SHIFT)
+#define FSPI_MCR0_RXCLKSRC_SHIFT	4
+#define FSPI_MCR0_RXCLKSRC_MASK		(3 << FSPI_MCR0_RXCLKSRC_SHIFT)
+#define FSPI_MCR0_END_CFG_SHIFT		2
+#define FSPI_MCR0_END_CFG_MASK		(3 << FSPI_MCR0_END_CFG_SHIFT)
+#define FSPI_MCR0_MDIS_SHIFT		1
+#define FSPI_MCR0_MDIS_MASK		(1 << FSPI_MCR0_MDIS_SHIFT)
+#define FSPI_MCR0_SWRST_SHIFT		0
+#define FSPI_MCR0_SWRST_MASK		(1 << FSPI_MCR0_SWRST_SHIFT)
+
+#define FSPI_MCR1			0x04
+#define FSPI_MCR1_SEQ_TIMEOUT_SHIFT	16
+#define FSPI_MCR1_SEQ_TIMEOUT_MASK	\
+	(0xFFFF << FSPI_MCR1_SEQ_TIMEOUT_SHIFT)
+#define FSPI_MCR1_AHB_TIMEOUT_SHIFT	0
+#define FSPI_MCR1_AHB_TIMEOUT_MASK	\
+	(0xFFFF << FSPI_MCR1_AHB_TIMEOUT_SHIFT)
+
+#define FSPI_MCR2			0x08
+#define FSPI_MCR2_IDLE_WAIT_SHIFT	24
+#define FSPI_MCR2_IDLE_WAIT_MASK	(0xFF << FSPI_MCR2_IDLE_WAIT_SHIFT)
+#define FSPI_MCR2_SAMEFLASH_SHIFT	15
+#define FSPI_MCR2_SAMEFLASH_MASK	(1 << FSPI_MCR2_SAMEFLASH_SHIFT)
+#define FSPI_MCR2_CLRLRPHS_SHIFT	14
+#define FSPI_MCR2_CLRLRPHS_MASK		(1 << FSPI_MCR2_CLRLRPHS_SHIFT)
+#define FSPI_MCR2_ABRDATSZ_SHIFT	8
+#define FSPI_MCR2_ABRDATSZ_MASK		(1 << FSPI_MCR2_ABRDATSZ_SHIFT)
+#define FSPI_MCR2_ABRLEARN_SHIFT	7
+#define FSPI_MCR2_ABRLEARN_MASK		(1 << FSPI_MCR2_ABRLEARN_SHIFT)
+#define FSPI_MCR2_ABR_READ_SHIFT	6
+#define FSPI_MCR2_ABR_READ_MASK		(1 << FSPI_MCR2_ABR_READ_SHIFT)
+#define FSPI_MCR2_ABRWRITE_SHIFT	5
+#define FSPI_MCR2_ABRWRITE_MASK		(1 << FSPI_MCR2_ABRWRITE_SHIFT)
+#define FSPI_MCR2_ABRDUMMY_SHIFT	4
+#define FSPI_MCR2_ABRDUMMY_MASK		(1 << FSPI_MCR2_ABRDUMMY_SHIFT)
+#define FSPI_MCR2_ABR_MODE_SHIFT	3
+#define FSPI_MCR2_ABR_MODE_MASK		(1 << FSPI_MCR2_ABR_MODE_SHIFT)
+#define FSPI_MCR2_ABRCADDR_SHIFT	2
+#define FSPI_MCR2_ABRCADDR_MASK		(1 << FSPI_MCR2_ABRCADDR_SHIFT)
+#define FSPI_MCR2_ABRRADDR_SHIFT	1
+#define FSPI_MCR2_ABRRADDR_MASK		(1 << FSPI_MCR2_ABRRADDR_SHIFT)
+#define FSPI_MCR2_ABR_CMD_SHIFT		0
+#define FSPI_MCR2_ABR_CMD_MASK		(1 << FSPI_MCR2_ABR_CMD_SHIFT)
+
+#define FSPI_AHBCR			0x0c
+#define FSPI_AHBCR_RDADDROPT_SHIFT	6
+#define FSPI_AHBCR_RDADDROPT_MASK	(1 << FSPI_AHBCR_RDADDROPT_SHIFT)
+#define FSPI_AHBCR_PREF_EN_SHIFT	5
+#define FSPI_AHBCR_PREF_EN_MASK		(1 << FSPI_AHBCR_PREF_EN_SHIFT)
+#define FSPI_AHBCR_BUFF_EN_SHIFT	4
+#define FSPI_AHBCR_BUFF_EN_MASK		(1 << FSPI_AHBCR_BUFF_EN_SHIFT)
+#define FSPI_AHBCR_CACH_EN_SHIFT	3
+#define FSPI_AHBCR_CACH_EN_MASK		(1 << FSPI_AHBCR_CACH_EN_SHIFT)
+#define FSPI_AHBCR_CLRTXBUF_SHIFT	2
+#define FSPI_AHBCR_CLRTXBUF_MASK	(1 << FSPI_AHBCR_CLRTXBUF_SHIFT)
+#define FSPI_AHBCR_CLRRXBUF_SHIFT	1
+#define FSPI_AHBCR_CLRRXBUF_MASK	(1 << FSPI_AHBCR_CLRRXBUF_SHIFT)
+#define FSPI_AHBCR_PAR_EN_SHIFT		0
+#define FSPI_AHBCR_PAR_EN_MASK		(1 << FSPI_AHBCR_PAR_EN_SHIFT)
+
+#define FSPI_INTEN			0x10
+#define FSPI_INTEN_SCLKSBWR_SHIFT	9
+#define FSPI_INTEN_SCLKSBWR_MASK	(1 << FSPI_INTEN_SCLKSBWR_SHIFT)
+#define FSPI_INTEN_SCLKSBRD_SHIFT	8
+#define FSPI_INTEN_SCLKSBRD_MASK	(1 << FSPI_INTEN_SCLKSBRD_SHIFT)
+#define FSPI_INTEN_DATALRNFL_SHIFT	7
+#define FSPI_INTEN_DATALRNFL_MASK	(1 << FSPI_INTEN_DATALRNFL_SHIFT)
+#define FSPI_INTEN_IPTXWE_SHIFT		6
+#define FSPI_INTEN_IPTXWE_MASK		(1 << FSPI_INTEN_IPTXWE_SHIFT)
+#define FSPI_INTEN_IPRXWA_SHIFT		5
+#define FSPI_INTEN_IPRXWA_MASK		(1 << FSPI_INTEN_IPRXWA_SHIFT)
+#define FSPI_INTEN_AHBCMDERR_SHIFT	4
+#define FSPI_INTEN_AHBCMDERR_MASK	(1 << FSPI_INTEN_AHBCMDERR_SHIFT)
+#define FSPI_INTEN_IPCMDERR_SHIFT	3
+#define FSPI_INTEN_IPCMDERR_MASK	(1 << FSPI_INTEN_IPCMDERR_SHIFT)
+#define FSPI_INTEN_AHBCMDGE_SHIFT	2
+#define FSPI_INTEN_AHBCMDGE_MASK	(1 << FSPI_INTEN_AHBCMDGE_SHIFT)
+#define FSPI_INTEN_IPCMDGE_SHIFT	1
+#define FSPI_INTEN_IPCMDGE_MASK		(1 << FSPI_INTEN_IPCMDGE_SHIFT)
+#define FSPI_INTEN_IPCMDDONE_SHIFT	0
+#define FSPI_INTEN_IPCMDDONE_MASK	(1 << FSPI_INTEN_IPCMDDONE_SHIFT)
+
+#define FSPI_INTR			0x14
+#define FSPI_INTR_SCLKSBWR_SHIFT	9
+#define FSPI_INTR_SCLKSBWR_MASK		(1 << FSPI_INTR_SCLKSBWR_SHIFT)
+#define FSPI_INTR_SCLKSBRD_SHIFT	8
+#define FSPI_INTR_SCLKSBRD_MASK		(1 << FSPI_INTR_SCLKSBRD_SHIFT)
+#define FSPI_INTR_DATALRNFL_SHIFT	7
+#define FSPI_INTR_DATALRNFL_MASK	(1 << FSPI_INTR_DATALRNFL_SHIFT)
+#define FSPI_INTR_IPTXWE_SHIFT		6
+#define FSPI_INTR_IPTXWE_MASK		(1 << FSPI_INTR_IPTXWE_SHIFT)
+#define FSPI_INTR_IPRXWA_SHIFT		5
+#define FSPI_INTR_IPRXWA_MASK		(1 << FSPI_INTR_IPRXWA_SHIFT)
+#define FSPI_INTR_AHBCMDERR_SHIFT	4
+#define FSPI_INTR_AHBCMDERR_MASK	(1 << FSPI_INTR_AHBCMDERR_SHIFT)
+#define FSPI_INTR_IPCMDERR_SHIFT	3
+#define FSPI_INTR_IPCMDERR_MASK		(1 << FSPI_INTR_IPCMDERR_SHIFT)
+#define FSPI_INTR_AHBCMDGE_SHIFT	2
+#define FSPI_INTR_AHBCMDGE_MASK		(1 << FSPI_INTR_AHBCMDGE_SHIFT)
+#define FSPI_INTR_IPCMDGE_SHIFT		1
+#define FSPI_INTR_IPCMDGE_MASK		(1 << FSPI_INTR_IPCMDGE_SHIFT)
+#define FSPI_INTR_IPCMDDONE_SHIFT	0
+#define FSPI_INTR_IPCMDDONE_MASK	(1 << FSPI_INTR_IPCMDDONE_SHIFT)
+
+#define FSPI_LUTKEY			0x18
+#define FSPI_LUTKEY_VALUE		0x5AF05AF0
+
+#define FSPI_LCKCR			0x1C
+#define FSPI_LCKER_LOCK			0x1
+#define FSPI_LCKER_UNLOCK		0x2
+
+#define FSPI_BUFXCR_INVALID_MSTRID	0xe
+#define FSPI_AHBRX_BUF0CR0		0x20
+#define FSPI_AHBRX_BUF1CR0		0x24
+#define FSPI_AHBRX_BUF2CR0		0x28
+#define FSPI_AHBRX_BUF3CR0		0x2C
+#define FSPI_AHBRX_BUF4CR0		0x30
+#define FSPI_AHBRX_BUF5CR0		0x34
+#define FSPI_AHBRX_BUF6CR0		0x38
+#define FSPI_AHBRX_BUF7CR0		0x3C
+#define FSPI_AHBRXBUF0CR7_PREF_SHIFT	31
+#define FSPI_AHBRXBUF0CR7_PREF_MASK	(1 << FSPI_AHBRXBUF0CR7_PREF_SHIFT)
+
+#define FSPI_AHBRX_BUF0CR1		0x40
+#define FSPI_AHBRX_BUF1CR1		0x44
+#define FSPI_AHBRX_BUF2CR1		0x48
+#define FSPI_AHBRX_BUF3CR1		0x4C
+#define FSPI_AHBRX_BUF4CR1		0x50
+#define FSPI_AHBRX_BUF5CR1		0x54
+#define FSPI_AHBRX_BUF6CR1		0x58
+#define FSPI_AHBRX_BUF7CR1		0x5C
+#define FSPI_BUFXCR1_MSID_SHIFT		0
+#define FSPI_BUFXCR1_MSID_MASK		(0xF << FSPI_BUFXCR1_MSID_SHIFT)
+#define FSPI_BUFXCR1_PRIO_SHIFT		8
+#define FSPI_BUFXCR1_PRIO_MASK		(0x7 << FSPI_BUFXCR1_PRIO_SHIFT)
+
+#define FSPI_FLSHA1CR0			0x60
+#define FSPI_FLSHA2CR0			0x64
+#define FSPI_FLSHB1CR0			0x68
+#define FSPI_FLSHB2CR0			0x6C
+#define FSPI_FLSHXCR0_SZ_SHIFT		10
+#define FSPI_FLSHXCR0_SZ_MASK		(0x3FFFFF << FSPI_FLSHXCR0_SZ_SHIFT)
+
+#define FSPI_FLSHA1CR1			0x70
+#define FSPI_FLSHA2CR1			0x74
+#define FSPI_FLSHB1CR1			0x78
+#define FSPI_FLSHB2CR1			0x7C
+#define FSPI_FLSHXCR1_CSINTR_SHIFT	16
+#define FSPI_FLSHXCR1_CSINTR_MASK	\
+		(0xFFFF << FSPI_FLSHXCR1_CSINTR_SHIFT)
+#define FSPI_FLSHXCR1_CAS_SHIFT		11
+#define FSPI_FLSHXCR1_CAS_MASK		(0xF << FSPI_FLSHXCR1_CAS_SHIFT)
+#define FSPI_FLSHXCR1_WA_SHIFT		10
+#define FSPI_FLSHXCR1_WA_MASK		(1 << FSPI_FLSHXCR1_WA_SHIFT)
+#define FSPI_FLSHXCR1_TCSH_SHIFT	5
+#define FSPI_FLSHXCR1_TCSH_MASK		(0x1F << FSPI_FLSHXCR1_TCSH_SHIFT)
+#define FSPI_FLSHXCR1_TCSS_SHIFT	0
+#define FSPI_FLSHXCR1_TCSS_MASK		(0x1F << FSPI_FLSHXCR1_TCSS_SHIFT)
+
+#define FSPI_FLSHA1CR2			0x80
+#define FSPI_FLSHA2CR2			0x84
+#define FSPI_FLSHB1CR2			0x88
+#define FSPI_FLSHB2CR2			0x8C
+#define FSPI_FLSHXCR2_CLRINSP_SHIFT	24
+#define FSPI_FLSHXCR2_CLRINSP_MASK	(1 << FSPI_FLSHXCR2_CLRINSP_SHIFT)
+#define FSPI_FLSHXCR2_AWRWAIT_SHIFT	16
+#define FSPI_FLSHXCR2_AWRWAIT_MASK	(0xFF << FSPI_FLSHXCR2_AWRWAIT_SHIFT)
+#define FSPI_FLSHXCR2_AWRSEQN_SHIFT	13
+#define FSPI_FLSHXCR2_AWRSEQN_MASK	(0x7 << FSPI_FLSHXCR2_AWRSEQN_SHIFT)
+#define FSPI_FLSHXCR2_AWRSEQI_SHIFT	8
+#define FSPI_FLSHXCR2_AWRSEQI_MASK	(0xF << FSPI_FLSHXCR2_AWRSEQI_SHIFT)
+#define FSPI_FLSHXCR2_ARDSEQN_SHIFT	5
+#define FSPI_FLSHXCR2_ARDSEQN_MASK	(0x7 << FSPI_FLSHXCR2_ARDSEQN_SHIFT)
+#define FSPI_FLSHXCR2_ARDSEQI_SHIFT	0
+#define FSPI_FLSHXCR2_ARDSEQI_MASK	(0xF << FSPI_FLSHXCR2_ARDSEQI_SHIFT)
+
+#define FSPI_IPCR0			0xA0
+
+#define FSPI_IPCR1			0xA4
+#define FSPI_IPCR1_IPAREN_SHIFT		31
+#define FSPI_IPCR1_IPAREN_MASK		(1 << FSPI_IPCR1_IPAREN_SHIFT)
+#define FSPI_IPCR1_SEQNUM_SHIFT		24
+#define FSPI_IPCR1_SEQNUM_MASK		(0xF << FSPI_IPCR1_SEQNUM_SHIFT)
+#define FSPI_IPCR1_SEQID_SHIFT		16
+#define FSPI_IPCR1_SEQID_MASK		(0xF << FSPI_IPCR1_SEQID_SHIFT)
+#define FSPI_IPCR1_IDATSZ_SHIFT		0
+#define FSPI_IPCR1_IDATSZ_MASK		(0xFFFF << FSPI_IPCR1_IDATSZ_SHIFT)
+
+#define FSPI_IPCMD			0xB0
+#define FSPI_IPCMD_TRG_SHIFT		0
+#define FSPI_IPCMD_TRG_MASK		(1 << FSPI_IPCMD_TRG_SHIFT)
+
+#define FSPI_DLPR			0xB4
+
+#define FSPI_IPRXFCR			0xB8
+#define FSPI_IPRXFCR_CLR_SHIFT		0
+#define FSPI_IPRXFCR_CLR_MASK		(1 << FSPI_IPRXFCR_CLR_SHIFT)
+#define FSPI_IPRXFCR_DMA_EN_SHIFT	1
+#define FSPI_IPRXFCR_DMA_EN_MASK	(1 << FSPI_IPRXFCR_DMA_EN_SHIFT)
+#define FSPI_IPRXFCR_WMRK_SHIFT		2
+#define FSPI_IPRXFCR_WMRK_MASK		(0x1F << FSPI_IPRXFCR_WMRK_SHIFT)
+
+#define FSPI_IPTXFCR			0xBC
+#define FSPI_IPTXFCR_CLR_SHIFT		0
+#define FSPI_IPTXFCR_CLR_MASK		(1 << FSPI_IPTXFCR_CLR_SHIFT)
+#define FSPI_IPTXFCR_DMA_EN_SHIFT	1
+#define FSPI_IPTXFCR_DMA_EN_MASK	(1 << FSPI_IPTXFCR_DMA_EN_SHIFT)
+#define FSPI_IPTXFCR_WMRK_SHIFT		2
+#define FSPI_IPTXFCR_WMRK_MASK		(0x1F << FSPI_IPTXFCR_WMRK_SHIFT)
+
+#define FSPI_DLLACR			0xC0
+#define FSPI_DLLACR_OVRDEN_SHIFT	8
+#define FSPI_DLLACR_OVRDEN_MASK		(1 << FSPI_DLLACR_OVRDEN_SHIFT)
+
+#define FSPI_DLLBCR			0xC4
+#define FSPI_DLLBCR_OVRDEN_SHIFT	8
+#define FSPI_DLLBCR_OVRDEN_MASK		(1 << FSPI_DLLBCR_OVRDEN_SHIFT)
+
+#define FSPI_STS0			0xE0
+#define FSPI_STS0_DLPHA_SHIFT		9
+#define FSPI_STS0_DLPHA_MASK		(0x1F << FSPI_STS0_DLPHA_SHIFT)
+#define FSPI_STS0_DLPHB_SHIFT		4
+#define FSPI_STS0_DLPHB_MASK		(0x1F << FSPI_STS0_DLPHB_SHIFT)
+#define FSPI_STS0_CMD_SRC_SHIFT		2
+#define FSPI_STS0_CMD_SRC_MASK		(3 << FSPI_STS0_CMD_SRC_SHIFT)
+#define FSPI_STS0_ARB_IDLE_SHIFT	1
+#define FSPI_STS0_ARB_IDLE_MASK		(1 << FSPI_STS0_ARB_IDLE_SHIFT)
+#define FSPI_STS0_SEQ_IDLE_SHIFT	0
+#define FSPI_STS0_SEQ_IDLE_MASK		(1 << FSPI_STS0_SEQ_IDLE_SHIFT)
+
+#define FSPI_STS1			0xE4
+#define FSPI_STS1_IP_ERRCD_SHIFT	24
+#define FSPI_STS1_IP_ERRCD_MASK		(0xF << FSPI_STS1_IP_ERRCD_SHIFT)
+#define FSPI_STS1_IP_ERRID_SHIFT	16
+#define FSPI_STS1_IP_ERRID_MASK		(0xF << FSPI_STS1_IP_ERRID_SHIFT)
+#define FSPI_STS1_AHB_ERRCD_SHIFT	8
+#define FSPI_STS1_AHB_ERRCD_MASK	(0xF << FSPI_STS1_AHB_ERRCD_SHIFT)
+#define FSPI_STS1_AHB_ERRID_SHIFT	0
+#define FSPI_STS1_AHB_ERRID_MASK	(0xF << FSPI_STS1_AHB_ERRID_SHIFT)
+
+#define FSPI_AHBSPNST			0xEC
+#define FSPI_AHBSPNST_DATLFT_SHIFT	16
+#define FSPI_AHBSPNST_DATLFT_MASK	\
+		(0xFFFF << FSPI_AHBSPNST_DATLFT_SHIFT)
+#define FSPI_AHBSPNST_BUFID_SHIFT	1
+#define FSPI_AHBSPNST_BUFID_MASK	(7 << FSPI_AHBSPNST_BUFID_SHIFT)
+#define FSPI_AHBSPNST_ACTIVE_SHIFT	0
+#define FSPI_AHBSPNST_ACTIVE_MASK	(1 << FSPI_AHBSPNST_ACTIVE_SHIFT)
+
+#define FSPI_IPRXFSTS			0xF0
+#define FSPI_IPRXFSTS_RDCNTR_SHIFT	16
+#define FSPI_IPRXFSTS_RDCNTR_MASK	\
+		(0xFFFF << FSPI_IPRXFSTS_RDCNTR_SHIFT)
+#define FSPI_IPRXFSTS_FILL_SHIFT	0
+#define FSPI_IPRXFSTS_FILL_MASK		(0xFF << FSPI_IPRXFSTS_FILL_SHIFT)
+
+#define FSPI_IPTXFSTS			0xF4
+#define FSPI_IPTXFSTS_WRCNTR_SHIFT	16
+#define FSPI_IPTXFSTS_WRCNTR_MASK	\
+		(0xFFFF << FSPI_IPTXFSTS_WRCNTR_SHIFT)
+#define FSPI_IPTXFSTS_FILL_SHIFT	0
+#define FSPI_IPTXFSTS_FILL_MASK		(0xFF << FSPI_IPTXFSTS_FILL_SHIFT)
+
+#define FSPI_RFDR			0x100
+#define FSPI_TFDR			0x180
+
+#define FSPI_LUT_BASE			0x200
+
+/* register map end */
+
+/*
+ * The definition of the LUT register shows below:
+ *
+ *  ---------------------------------------------------
+ *  | INSTR1 | PAD1 | OPRND1 | INSTR0 | PAD0 | OPRND0 |
+ *  ---------------------------------------------------
+ */
+#define PAD_SHIFT		8
+#define INSTR_SHIFT		10
+#define OPRND_SHIFT		16
+
+/* Macros for constructing the LUT register. */
+#define LUT_DEF(idx, ins, pad, opr)			  \
+	((((ins) << INSTR_SHIFT) | ((pad) << PAD_SHIFT) | \
+	(opr)) << (((idx) % 2) * OPRND_SHIFT))
+
+/*
+ * Calculate number of required PAD bits for LUT register.
+ *
+ * The pad stands for the lines number of IO[0:7].
+ * For example, Octal read need eight IO lines, so this Macro
+ * returns 3 i.e. use eight (2^3) IO lines for read.
+ */
+#define LUT_PAD(x) (fls(x) - 1)
+
+/* Instruction set for the LUT register. */
+#define LUT_STOP		0x00
+#define LUT_CMD			0x01
+#define LUT_ADDR		0x02
+#define LUT_CADDR_SDR		0x03
+#define LUT_MODE		0x04
+#define LUT_MODE2		0x05
+#define LUT_MODE4		0x06
+#define LUT_MODE8		0x07
+#define LUT_NXP_WRITE		0x08
+#define LUT_NXP_READ		0x09
+#define LUT_LEARN_SDR		0x0A
+#define LUT_DATSZ_SDR		0x0B
+#define LUT_DUMMY		0x0C
+#define LUT_DUMMY_RWDS_SDR	0x0D
+#define LUT_JMP_ON_CS		0x1F
+#define LUT_CMD_DDR		0x21
+#define LUT_ADDR_DDR		0x22
+#define LUT_CADDR_DDR		0x23
+#define LUT_MODE_DDR		0x24
+#define LUT_MODE2_DDR		0x25
+#define LUT_MODE4_DDR		0x26
+#define LUT_MODE8_DDR		0x27
+#define LUT_WRITE_DDR		0x28
+#define LUT_READ_DDR		0x29
+#define LUT_LEARN_DDR		0x2A
+#define LUT_DATSZ_DDR		0x2B
+#define LUT_DUMMY_DDR		0x2C
+#define LUT_DUMMY_RWDS_DDR	0x2D
+
+/* Oprands for the LUT register. */
+#define ADDR24BIT		0x18
+#define ADDR32BIT		0x20
+
+/* other macros for LUT register. */
+#define FSPI_LUT(x)		(FSPI_LUT_BASE + (x) * 4)
+#define FSPI_LUT_NUM		128
+
+/* SEQID -- we can have 32 seqids at most.
+ * LUT0 programmed by bootloader
+ * LUT1 programmed for IP register access cmds
+ * LUT2 programmed for AHB read, required for READ from devmem interface
+ * LUT3 programmed for AHB write, required for WRITE from devmem interface
+ * TODO Add support of AHB write
+ */
+#define SEQID_LUT0_BOOTLOADER		0
+#define SEQID_LUT1_IPCMD		1
+#define SEQID_LUT2_AHBREAD		2
+#define SEQID_LUT3_AHBWRITE		3
+
+#define FSPI_MIN_IOMAP		SZ_4M
+
+enum nxp_fspi_devtype {
+	NXP_FSPI_LX2160A,
+};
+
+struct nxp_fspi_devtype_data {
+	enum nxp_fspi_devtype devtype;
+	int rxfifo;
+	int txfifo;
+	int ahb_buf_size;
+	int driver_data;
+};
+
+static const struct nxp_fspi_devtype_data lx2160a_data = {
+	.devtype	= NXP_FSPI_LX2160A,
+	.rxfifo		= 512, /* 64 * 64bits  */
+	.txfifo		= 1024, /* 128 * 64bits */
+	.ahb_buf_size	= 2048, /* 256 * 64bits */
+	.driver_data	= 0,
+};
+
+#define NXP_FSPI_MAX_CHIP	4
+
+/* enum fspi_mem_data_dir - describes the direction of a FSPI memory data
+ *			    transfer from FSPI controller prespective.
+ * FSPI_MEM_NO_DATA	- no data transfer initiated
+ * FSPI_MEM_DATA_IN	- data coming from the SPI memory
+ * FSPI_MEM_DATA_OUT	- data sent to the SPI memory
+ */
+enum fspi_mem_data_dir {
+	FSPI_MEM_NO_DATA,
+	FSPI_MEM_DATA_IN,
+	FSPI_MEM_DATA_OUT,
+};
+
+/* enum fspi_cmd_mode	- describes the mode of the running command
+ * FSPI_CMD_MODE_IP	- data transfer using IP register access
+ * FSPI_CMD_MODE_AHB	- data transfer via AMBA AHB bus directly
+ */
+enum fspi_cmd_mode {
+	FSPI_CMD_MODE_IP,
+	FSPI_CMD_MODE_AHB,
+};
+
+/* struct nxp_fspi_mem_op - describes the FSPI memory operation
+ * cmd.opcode: operation opcode
+ * cmd.pad: number of IO lines used to transmit the command
+ * addr.addrlen: FSPI working in 3/4-byte mode. Can be zero if the operation
+ *		 does not need to send an address
+ * addr.pad: number of IO lines used to transmit the address cycles
+ * dummy.ncycles: number of dummy cycles to send after an opcode or address.
+ *		 Can be zero if the operation does not require dummy cycles
+ * dummy.pad: number of IO lines used to transmit the dummy bytes
+ * data.dir: direction of the transfer
+ * data.nbytes: number of data bytes to send. Can be zero for nxp_fspi_write,
+ *	        actual transfer size provided when CMD is triggered.
+ * data.pad: number of IO lines used to transmit the data bytes
+ * mode: mode of the running command, default is IP register access mode
+ */
+struct nxp_fspi_mem_op {
+	struct {
+		u8 opcode;
+		u8 pad;
+	} cmd;
+
+	struct {
+		u8 addrlen;
+		u8 pad;
+	} addr;
+
+	struct {
+		u8 ncycles;
+		u8 pad;
+	} dummy;
+
+	struct {
+		enum fspi_mem_data_dir dir;
+		unsigned int nbytes;
+		u8 pad;
+	} data;
+
+	enum fspi_cmd_mode mode;
+};
+
+struct nxp_fspi {
+	struct mtd_info mtd[NXP_FSPI_MAX_CHIP];
+	struct spi_nor nor[NXP_FSPI_MAX_CHIP];
+	void __iomem *iobase;
+	void __iomem *ahb_addr;
+	u32 memmap_phy;
+	u32 memmap_offs;
+	u32 memmap_len;
+	struct device *dev;
+	struct completion c;
+	struct nxp_fspi_devtype_data *devtype_data;
+	u32 nor_size;
+	u32 nor_num;
+	unsigned int chip_base_addr; /* We may support two chips. */
+	bool has_second_chip;
+	bool big_endian;
+	struct mutex lock;
+};
+
+/*
+ * R/W functions for big- or little-endian registers:
+ * The FlexSPI controller's endian is independent of the CPU core's endian.
+ * So far, although the CPU core is little-endian but the FlexSPI have two
+ * versions for big-endian and little-endian.
+ */
+static void fspi_writel(struct nxp_fspi *fspi, u32 val, void __iomem *addr)
+{
+	if (fspi->big_endian)
+		iowrite32be(val, addr);
+	else
+		iowrite32(val, addr);
+}
+
+static u32 fspi_readl(struct nxp_fspi *fspi, void __iomem *addr)
+{
+	if (fspi->big_endian)
+		return ioread32be(addr);
+	else
+		return ioread32(addr);
+}
+
+static inline void nxp_fspi_unlock_lut(struct nxp_fspi *fspi)
+{
+	fspi_writel(fspi, FSPI_LUTKEY_VALUE, fspi->iobase + FSPI_LUTKEY);
+	fspi_writel(fspi, FSPI_LCKER_UNLOCK, fspi->iobase + FSPI_LCKCR);
+}
+
+static inline void nxp_fspi_lock_lut(struct nxp_fspi *fspi)
+{
+	fspi_writel(fspi, FSPI_LUTKEY_VALUE, fspi->iobase + FSPI_LUTKEY);
+	fspi_writel(fspi, FSPI_LCKER_LOCK, fspi->iobase + FSPI_LCKCR);
+}
+
+static irqreturn_t nxp_fspi_irq_handler(int irq, void *dev_id)
+{
+	struct nxp_fspi *fspi = dev_id;
+	u32 reg;
+
+	reg = fspi_readl(fspi, fspi->iobase + FSPI_INTR);
+	fspi_writel(fspi, FSPI_INTR_IPCMDDONE_MASK, fspi->iobase + FSPI_INTR);
+	if (reg & FSPI_INTR_IPCMDDONE_MASK)
+		complete(&fspi->c);
+
+	return IRQ_HANDLED;
+}
+
+/*
+ * Prepare LUT values for requested CMD using struct nxp_fspi_mem_op
+ * LUT prepared in format:
+ *  ---------------------------------------------------
+ *  | INSTR1 | PAD1 | OPRND1 | INSTR0 | PAD0 | OPRND0 |
+ *  ---------------------------------------------------
+ * values from struct nxp_fspi_mem_op are saved for different
+ * operands like CMD, ADDR, DUMMY and DATA in above format based
+ * on provided input value.
+ * For case of AHB (XIP) operation, use different LUT seqid,
+ * as read/write can also be triggered using devmem interface.
+ */
+static void nxp_fspi_prepare_lut(struct spi_nor *nor,
+				 struct nxp_fspi_mem_op *op)
+{
+	struct nxp_fspi *fspi = nor->priv;
+	void __iomem *base = fspi->iobase;
+	u32 lut_base;
+	u32 lutval[4] = {};
+	int lutidx = 0, i;
+
+	lutval[lutidx / 2] |= LUT_DEF(lutidx,
+				      LUT_CMD,
+				      LUT_PAD(op->cmd.pad),
+				      op->cmd.opcode);
+	lutidx++;
+
+	if (op->addr.addrlen) {
+		lutval[lutidx / 2] |= LUT_DEF(lutidx,
+					      LUT_ADDR,
+					      LUT_PAD(op->addr.pad),
+					      op->addr.addrlen);
+		lutidx++;
+	}
+
+	if (op->dummy.ncycles) {
+		lutval[lutidx / 2] |= LUT_DEF(lutidx,
+					      LUT_DUMMY,
+					      LUT_PAD(op->dummy.pad),
+					      op->dummy.ncycles);
+		lutidx++;
+	}
+
+	if (op->data.dir) {
+		lutval[lutidx / 2] |= LUT_DEF(lutidx,
+					      op->data.dir == FSPI_MEM_DATA_IN ?
+					      LUT_NXP_READ : LUT_NXP_WRITE,
+					      LUT_PAD(op->data.pad),
+					      op->data.nbytes);
+		lutidx++;
+	}
+
+	lutval[lutidx / 2] |= LUT_DEF(lutidx, LUT_STOP, 0, 0);
+	lutidx++;
+
+	dev_dbg(fspi->dev, "cmd:%x lut:[%x, %x, %x, %x]\n", op->cmd.opcode,
+			lutval[0], lutval[1], lutval[2], lutval[3]);
+
+	/* Assign dynamic LUT seq number
+	 * For IP register op->mode is FSPI_CMD_MODE_IP
+	 * For AHB Read,
+	 *   op->mode is FSPI_CMD_MODE_AHB & op->data.dir is FSPI_MEM_DATA_IN
+	 * For AHB Write,
+	 *   op->mode is FSPI_CMD_MODE_AHB & op->data.dir is FSPI_MEM_DATA_OUT
+	 */
+	if (op->mode == FSPI_CMD_MODE_IP)
+		lut_base = SEQID_LUT1_IPCMD * 4;
+	else { /* op->mode == FSPI_CMD_MODE_AHB */
+		if (op->data.dir == FSPI_MEM_DATA_IN)
+			lut_base = SEQID_LUT2_AHBREAD * 4;
+		else
+			lut_base = SEQID_LUT3_AHBWRITE * 4;
+	}
+
+	/* Write values in LUT register. */
+	nxp_fspi_unlock_lut(fspi);
+	for (i = 0; i < ARRAY_SIZE(lutval); i++)
+		fspi_writel(fspi, lutval[i], base + FSPI_LUT(lut_base + i));
+	nxp_fspi_lock_lut(fspi);
+}
+
+static int
+nxp_fspi_runcmd(struct nxp_fspi *fspi, u8 cmd, unsigned int addr, int len)
+{
+	int seqnum = 0;
+	u32 reg;
+	int err;
+	int iprxfcr = 0;
+	void __iomem *base = fspi->iobase;
+
+	iprxfcr = fspi_readl(fspi, base + FSPI_IPRXFCR);
+	/* invalid RXFIFO first */
+	iprxfcr &= ~FSPI_IPRXFCR_DMA_EN_MASK;
+	iprxfcr = iprxfcr | FSPI_IPRXFCR_CLR_MASK;
+	fspi_writel(fspi, iprxfcr, base + FSPI_IPRXFCR);
+
+	init_completion(&fspi->c);
+	dev_dbg(fspi->dev, "to 0x%.8x:0x%.8x, len:%d, cmd:%.2x\n",
+			fspi->chip_base_addr, addr, len, cmd);
+
+	/* write address */
+	fspi_writel(fspi, fspi->chip_base_addr + addr, base + FSPI_IPCR0);
+
+	fspi_writel(fspi, (seqnum << FSPI_IPCR1_SEQNUM_SHIFT) |
+	       (SEQID_LUT1_IPCMD << FSPI_IPCR1_SEQID_SHIFT) | len,
+	       base + FSPI_IPCR1);
+
+	/* wait till controller is idle */
+	do {
+		reg = fspi_readl(fspi, base + FSPI_STS0);
+		if ((reg & FSPI_STS0_ARB_IDLE_MASK) &&
+		    (reg & FSPI_STS0_SEQ_IDLE_MASK))
+			break;
+		udelay(1);
+		dev_dbg(fspi->dev, "The controller is busy, 0x%x\n", reg);
+	} while (1);
+
+	/* trigger the LUT now */
+	fspi_writel(fspi, FSPI_IPCMD_TRG_MASK, base + FSPI_IPCMD);
+
+	/* Wait for the interrupt. */
+	if (!wait_for_completion_timeout(&fspi->c, msecs_to_jiffies(1000))) {
+		dev_err(fspi->dev,
+			"cmd 0x%.2x timeout, addr@%.8x, Status0:0x%.8x, Status1:0x%.8x\n",
+			cmd, addr, fspi_readl(fspi, base + FSPI_STS0),
+			fspi_readl(fspi, base + FSPI_STS1));
+		err = -ETIMEDOUT;
+	} else {
+		err = 0;
+		dev_dbg(fspi->dev, "FSPI Intr done,INTR:<0x%.8x>\n",
+			 fspi_readl(fspi, base + FSPI_INTR));
+	}
+
+	return err;
+}
+
+/* Read out the data from the FSPI_RBDR buffer registers. */
+static void nxp_fspi_read_data(struct nxp_fspi *fspi, int len, u8 *rxbuf)
+{
+	int i = 0, j = 0, tmp_size = 0;
+	int size;
+	u32 tmp = 0;
+	void __iomem *base = fspi->iobase;
+
+	while (len > 0) {
+
+		size = len / 8;
+
+		for (i = 0; i < size; ++i) {
+			/* Wait for RXFIFO available*/
+			while (!(fspi_readl(fspi, base + FSPI_INTR)
+				 & FSPI_INTR_IPRXWA_MASK))
+				;
+
+			j = 0;
+			tmp_size = 8;
+			while (tmp_size > 0) {
+				tmp = 0;
+				tmp = fspi_readl(fspi,
+						 base + FSPI_RFDR + j * 4);
+				memcpy(rxbuf, &tmp, 4);
+				tmp_size -= 4;
+				j++;
+				rxbuf += 4;
+			}
+
+			/* move the FIFO pointer */
+			fspi_writel(fspi, FSPI_INTR_IPRXWA_MASK,
+				    base + FSPI_INTR);
+			len -= 8;
+		}
+
+		size = len % 8;
+
+		j = 0;
+		if (size) {
+			/* Wait for RXFIFO available*/
+			while (!(fspi_readl(fspi, base + FSPI_INTR)
+				 & FSPI_INTR_IPRXWA_MASK))
+				;
+
+			while (len > 0) {
+				tmp = 0;
+				size = (len < 4) ? len : 4;
+				tmp = fspi_readl(fspi,
+						 base + FSPI_RFDR + j * 4);
+				memcpy(rxbuf, &tmp, size);
+				len -= size;
+				j++;
+				rxbuf += size;
+			}
+		}
+
+		/* invalid the RXFIFO */
+		fspi_writel(fspi, FSPI_IPRXFCR_CLR_MASK, base + FSPI_IPRXFCR);
+
+		fspi_writel(fspi, FSPI_INTR_IPRXWA_MASK, base + FSPI_INTR);
+	}
+}
+
+static inline void nxp_fspi_invalid(struct nxp_fspi *fspi)
+{
+	u32 reg;
+	void __iomem *base = fspi->iobase;
+
+	reg = fspi_readl(fspi, base + FSPI_MCR0);
+	fspi_writel(fspi, reg | FSPI_MCR0_SWRST_MASK, base + FSPI_MCR0);
+
+	/*
+	 * The minimum delay : 1 AHB + 2 SFCK clocks.
+	 * Delay 1 us is enough.
+	 */
+	while (fspi_readl(fspi, base + FSPI_MCR0) & FSPI_MCR0_SWRST_MASK)
+		;
+}
+
+static ssize_t nxp_fspi_nor_write(struct nxp_fspi *fspi,
+				  struct spi_nor *nor, u8 opcode,
+				  unsigned int to, u32 *txbuf,
+				  unsigned int count)
+{
+	int ret, i, j;
+	int size, tmp_size;
+	u32 data = 0;
+	void __iomem *base = fspi->iobase;
+
+	dev_dbg(fspi->dev, "nor write to 0x%.8x:0x%.8x, len : %d\n",
+		fspi->chip_base_addr, to, count);
+
+	/* clear the TX FIFO. */
+	fspi_writel(fspi, FSPI_IPTXFCR_CLR_MASK, base + FSPI_IPTXFCR);
+
+	size = count / 8;
+	for (i = 0; i < size; i++) {
+		/* Wait for TXFIFO empty*/
+		while (!(fspi_readl(fspi,
+				    base + FSPI_INTR) & FSPI_INTR_IPTXWE_MASK))
+			;
+		j = 0;
+		tmp_size = 8;
+		while (tmp_size > 0) {
+			data = 0;
+			memcpy(&data, txbuf, 4);
+			fspi_writel(fspi, data, base + FSPI_TFDR + j * 4);
+			tmp_size -= 4;
+			j++;
+			txbuf += 1;
+		}
+
+		fspi_writel(fspi, FSPI_INTR_IPTXWE_MASK, base + FSPI_INTR);
+	}
+
+	size = count % 8;
+	if (size) {
+		/* Wait for TXFIFO empty*/
+		while (!(fspi_readl(fspi,
+				    base + FSPI_INTR) & FSPI_INTR_IPTXWE_MASK))
+			;
+
+		j = 0;
+		tmp_size = 0;
+		while (size > 0) {
+			data = 0;
+			tmp_size = (size < 4) ? size : 4;
+			memcpy(&data, txbuf, tmp_size);
+			fspi_writel(fspi, data, base + FSPI_TFDR + j * 4);
+			size -= tmp_size;
+			j++;
+			txbuf += 1;
+		}
+
+		fspi_writel(fspi, FSPI_INTR_IPTXWE_MASK, base + FSPI_INTR);
+	}
+
+	/* Trigger it */
+	ret = nxp_fspi_runcmd(fspi, opcode, to, count);
+
+	if (ret == 0)
+		return count;
+
+	return ret;
+}
+
+static void nxp_fspi_set_map_addr(struct nxp_fspi *fspi)
+{
+	int nor_size = fspi->nor_size >> 10;
+	void __iomem *base = fspi->iobase;
+
+	/* Supporting same flash device as slaves on different chip-select
+	 * TODO, Reset SAMEDEVICEEN bit in mcr2, when we add support for
+	 * different flashes.
+	 * For case when SAMEDEVICEEN bit in mcr2 is set, then settings
+	 * done for FLSHA2CRx/FLSHB1CRx/FLSHB2CRx will be ignored.
+	 */
+	fspi_writel(fspi, nor_size, base + FSPI_FLSHA1CR0);
+	fspi_writel(fspi, nor_size * 2, base + FSPI_FLSHA2CR0);
+	fspi_writel(fspi, nor_size * 3, base + FSPI_FLSHB1CR0);
+	fspi_writel(fspi, nor_size * 4, base + FSPI_FLSHB2CR0);
+}
+
+/* Clear only decision making fields of struct nxp_fspi_mem_op.
+ * Not used memset to clear whole structure as clearing of fields required
+ * to be done for every CMD and it would be performance hit.
+ */
+static inline void nxp_clr_fspi_mem_data(struct nxp_fspi_mem_op *op)
+{
+	op->cmd.opcode = 0;
+	op->addr.addrlen = 0;
+	op->dummy.ncycles = 0;
+	op->data.dir = FSPI_MEM_NO_DATA;
+	op->mode = FSPI_CMD_MODE_IP;
+}
+
+static void nxp_fspi_init_ahb_read(struct nxp_fspi *fspi)
+{
+	void __iomem *base = fspi->iobase;
+	int i = 0;
+
+	/* AHB configuration for access buffer 0~7. */
+	for (i = 0; i < 7; i++)
+		fspi_writel(fspi, 0, base + FSPI_AHBRX_BUF0CR0 + 4 * i);
+
+	/*
+	 * Set ADATSZ with the maximum AHB buffer size to improve the read
+	 * performance.
+	 */
+	fspi_writel(fspi, (fspi->devtype_data->ahb_buf_size / 8 |
+		FSPI_AHBRXBUF0CR7_PREF_MASK), base + FSPI_AHBRX_BUF7CR0);
+
+	/* prefetch and no start address alignment limitation */
+	fspi_writel(fspi, FSPI_AHBCR_PREF_EN_MASK | FSPI_AHBCR_RDADDROPT_MASK,
+	       base + FSPI_AHBCR);
+
+	/* Set dynamic LUT entry as lut sequence for AHB Read . */
+	fspi_writel(fspi, SEQID_LUT2_AHBREAD, base + FSPI_FLSHA1CR2);
+}
+
+/* Prepare LUT for AHB read - required for read from devmem interface */
+static void nxp_fspi_prep_ahb_read(struct nxp_fspi *fspi)
+{
+	struct nxp_fspi_mem_op op;
+	struct spi_nor *nor = fspi->nor;
+	enum spi_nor_protocol protocol = nor->read_proto;
+
+	nxp_clr_fspi_mem_data(&op);
+	op.cmd.opcode = nor->read_opcode;
+	op.cmd.pad = spi_nor_get_protocol_inst_nbits(protocol);
+
+	op.addr.addrlen = (nor->addr_width == 3) ? ADDR24BIT : ADDR32BIT;
+	op.addr.pad = spi_nor_get_protocol_addr_nbits(protocol);
+
+	op.dummy.ncycles = nor->read_dummy;
+	op.dummy.pad = spi_nor_get_protocol_data_nbits(protocol);
+
+	op.data.dir = FSPI_MEM_DATA_IN;
+	op.data.pad = spi_nor_get_protocol_data_nbits(protocol);
+	/* Read data size provided when AHB read trigger. */
+	op.data.nbytes = 0;
+
+	op.mode = FSPI_CMD_MODE_AHB;
+
+	nxp_fspi_prepare_lut(nor, &op);
+}
+
+/* We use this function to do some basic init for spi_nor_scan(). */
+static int nxp_fspi_nor_setup(struct nxp_fspi *fspi)
+{
+	void __iomem *base = fspi->iobase;
+	u32 reg;
+
+	/* Reset the module */
+	fspi_writel(fspi, FSPI_MCR0_SWRST_MASK, base + FSPI_MCR0);
+	do {
+		udelay(1);
+	} while (FSPI_MCR0_SWRST_MASK & fspi_readl(fspi, base + FSPI_MCR0));
+
+	/* Disable the module */
+	fspi_writel(fspi, FSPI_MCR0_MDIS_MASK, base + FSPI_MCR0);
+
+	/* Reset the DLL register to default value */
+	fspi_writel(fspi, FSPI_DLLACR_OVRDEN_MASK, base + FSPI_DLLACR);
+	fspi_writel(fspi, FSPI_DLLBCR_OVRDEN_MASK, base + FSPI_DLLBCR);
+
+	/* enable module */
+	fspi_writel(fspi,
+		    FSPI_MCR0_AHB_TIMEOUT_MASK | FSPI_MCR0_IP_TIMEOUT_MASK,
+		    base + FSPI_MCR0);
+
+	/* Read the register value */
+	reg = fspi_readl(fspi, base + FSPI_MCR0);
+
+	/* enable the interrupt */
+	fspi_writel(fspi, FSPI_INTEN_IPCMDDONE_MASK, base + FSPI_INTEN);
+
+	/* Init for AHB read */
+	nxp_fspi_init_ahb_read(fspi);
+
+	return 0;
+}
+
+static int nxp_fspi_nor_setup_last(struct nxp_fspi *fspi)
+{
+	/* Prepare LUT for AHB read - required for read from devmem interface */
+	nxp_fspi_prep_ahb_read(fspi);
+
+	/* TODO Add support for AHB write. */
+	return 0;
+}
+
+static void nxp_fspi_set_base_addr(struct nxp_fspi *fspi,
+				   struct spi_nor *nor)
+{
+	fspi->chip_base_addr = fspi->nor_size * (nor - fspi->nor);
+}
+
+static int nxp_fspi_read_reg(struct spi_nor *nor, u8 opcode,
+			     u8 *buf, int len)
+{
+	int ret;
+	struct nxp_fspi *fspi = nor->priv;
+	struct nxp_fspi_mem_op op;
+	enum spi_nor_protocol protocol = nor->reg_proto;
+
+	nxp_clr_fspi_mem_data(&op);
+	/*
+	 * Fill required entry of struct nxp_fspi_mem_op to prepare
+	 * LUT for requested cmd.
+	 */
+	op.cmd.opcode = opcode;
+	op.cmd.pad = spi_nor_get_protocol_inst_nbits(protocol);
+
+	op.data.dir = FSPI_MEM_DATA_IN;
+	op.data.pad = spi_nor_get_protocol_data_nbits(protocol);
+	/* Data size provided when FSPI cmd trigger. */
+	op.data.nbytes = 0;
+
+	/* Addrlen and Dummy info not required for READ_REG cmds */
+	nxp_fspi_prepare_lut(nor, &op);
+
+	ret = nxp_fspi_runcmd(fspi, opcode, 0, len);
+	if (ret)
+		return ret;
+
+	nxp_fspi_read_data(fspi, len, buf);
+	return 0;
+}
+
+static int nxp_fspi_write_reg(struct spi_nor *nor, u8 opcode,
+			      u8 *buf, int len)
+{
+	struct nxp_fspi *fspi = nor->priv;
+	int ret;
+	struct nxp_fspi_mem_op op;
+	enum spi_nor_protocol protocol = nor->reg_proto;
+
+	nxp_clr_fspi_mem_data(&op);
+	/*
+	 * Fill required entry of struct nxp_fspi_mem_op to prepare
+	 * LUT for requested cmd.
+	 */
+	op.cmd.opcode = opcode;
+	op.cmd.pad = spi_nor_get_protocol_inst_nbits(protocol);
+
+	if (!buf) {
+		/* Addrlen, Dummy and Data info not required for WRITE_REG */
+		nxp_fspi_prepare_lut(nor, &op);
+		ret = nxp_fspi_runcmd(fspi, opcode, 0, 1);
+		if (ret)
+			return ret;
+
+		if (opcode == SPINOR_OP_CHIP_ERASE)
+			nxp_fspi_invalid(fspi);
+
+	} else if (len > 0) {
+		/* Addrlen and Dummy not requ with BUF as non-null */
+		op.data.dir = FSPI_MEM_DATA_OUT;
+		op.data.pad = spi_nor_get_protocol_data_nbits(protocol);
+		/* Data size provided when FSPI cmd trigger. */
+		op.data.nbytes = 0;
+
+		nxp_fspi_prepare_lut(nor, &op);
+		ret = nxp_fspi_nor_write(fspi, nor, opcode, 0,
+					(u32 *)buf, len);
+	} else {
+		dev_err(fspi->dev, "invalid cmd %d\n", opcode);
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static ssize_t nxp_fspi_write(struct spi_nor *nor, loff_t to,
+			      size_t len, const u_char *buf)
+{
+	struct nxp_fspi *fspi = nor->priv;
+	ssize_t ret = 0;
+	struct nxp_fspi_mem_op op;
+	enum spi_nor_protocol protocol = nor->write_proto;
+
+	nxp_clr_fspi_mem_data(&op);
+	/*
+	 * Fill required entry of struct nxp_fspi_mem_op to prepare
+	 * LUT for requested cmd.
+	 */
+	op.cmd.opcode = nor->program_opcode;
+	op.cmd.pad = spi_nor_get_protocol_inst_nbits(protocol);
+
+	op.addr.addrlen = (nor->addr_width == 3) ? ADDR24BIT : ADDR32BIT;
+	op.addr.pad = spi_nor_get_protocol_addr_nbits(protocol);
+
+	op.data.dir = FSPI_MEM_DATA_OUT;
+	op.data.pad = spi_nor_get_protocol_data_nbits(protocol);
+	/* Data size provided when FSPI cmd trigger. */
+	op.data.nbytes = 0;
+
+	/* Dummy info not required for WRITE cmd */
+	nxp_fspi_prepare_lut(nor, &op);
+
+	ret = nxp_fspi_nor_write(fspi, nor, nor->program_opcode, to,
+				 (u32 *)buf, len);
+
+	/* invalid the data in the AHB buffer. */
+	nxp_fspi_invalid(fspi);
+	return ret;
+}
+
+static ssize_t nxp_fspi_read(struct spi_nor *nor, loff_t from,
+			     size_t len, u_char *buf)
+{
+	struct nxp_fspi *fspi = nor->priv;
+	struct nxp_fspi_mem_op op;
+	enum spi_nor_protocol protocol = nor->read_proto;
+
+	nxp_clr_fspi_mem_data(&op);
+	/*
+	 * Fill required entry of struct nxp_fspi_mem_op to prepare
+	 * LUT for requested cmd.
+	 */
+	op.cmd.opcode = nor->read_opcode;
+	op.cmd.pad = spi_nor_get_protocol_inst_nbits(protocol);
+
+	op.addr.addrlen = (nor->addr_width == 3) ? ADDR24BIT : ADDR32BIT;
+	op.addr.pad = spi_nor_get_protocol_addr_nbits(protocol);
+
+	op.dummy.ncycles = nor->read_dummy;
+	op.dummy.pad = spi_nor_get_protocol_data_nbits(protocol);
+
+	op.data.dir = FSPI_MEM_DATA_IN;
+	op.data.pad = spi_nor_get_protocol_data_nbits(protocol);
+	/* Read data size provided when AHB read trigger. */
+	op.data.nbytes = 0;
+
+	op.mode = FSPI_CMD_MODE_AHB;
+
+	nxp_fspi_prepare_lut(nor, &op);
+
+	/* if necessary, ioremap buffer before AHB read, */
+	if (!fspi->ahb_addr) {
+		fspi->memmap_offs = fspi->chip_base_addr + from;
+		fspi->memmap_len = len > FSPI_MIN_IOMAP ?
+			len : FSPI_MIN_IOMAP;
+
+		fspi->ahb_addr = ioremap_nocache(
+				fspi->memmap_phy + fspi->memmap_offs,
+				fspi->memmap_len);
+		if (!fspi->ahb_addr) {
+			dev_err(fspi->dev, "ioremap failed\n");
+			return -ENOMEM;
+		}
+	/* ioremap if the data requested is out of range */
+	} else if (fspi->chip_base_addr + from < fspi->memmap_offs
+			|| fspi->chip_base_addr + from + len >
+			fspi->memmap_offs + fspi->memmap_len) {
+		iounmap(fspi->ahb_addr);
+
+		fspi->memmap_offs = fspi->chip_base_addr + from;
+		fspi->memmap_len = len > FSPI_MIN_IOMAP ?
+			len : FSPI_MIN_IOMAP;
+		fspi->ahb_addr = ioremap_nocache(
+				fspi->memmap_phy + fspi->memmap_offs,
+				fspi->memmap_len);
+		if (!fspi->ahb_addr) {
+			dev_err(fspi->dev, "ioremap failed\n");
+			return -ENOMEM;
+		}
+	}
+
+	dev_dbg(fspi->dev, "cmd [%x],read from %p, len:%zd\n",
+		nor->read_opcode, fspi->ahb_addr + fspi->chip_base_addr
+		+ from - fspi->memmap_offs, len);
+
+	/* Read out the data directly from the AHB buffer.*/
+	memcpy_toio(buf, fspi->ahb_addr + fspi->chip_base_addr
+		    + from - fspi->memmap_offs, len);
+
+	return len;
+}
+
+static int nxp_fspi_erase(struct spi_nor *nor, loff_t offs)
+{
+	struct nxp_fspi *fspi = nor->priv;
+	int ret;
+	struct nxp_fspi_mem_op op;
+
+	nxp_clr_fspi_mem_data(&op);
+
+	/*
+	 * Fill required entry of struct nxp_fspi_mem_op to prepare
+	 * LUT for requested cmd.
+	 * Erase operation works on single pad.
+	 */
+	op.cmd.opcode = nor->erase_opcode;
+	op.cmd.pad = 1;
+
+	op.addr.addrlen = (nor->addr_width == 3) ? ADDR24BIT : ADDR32BIT;
+	op.addr.pad = 1;
+
+	/* Dummy and Data info not required for Erase cmd */
+	nxp_fspi_prepare_lut(nor, &op);
+
+	dev_dbg(nor->dev, "%dKiB at 0x%08x:0x%08x\n",
+		nor->mtd.erasesize / 1024, fspi->chip_base_addr, (u32)offs);
+
+	ret = nxp_fspi_runcmd(fspi, nor->erase_opcode, offs, 0);
+	if (ret)
+		return ret;
+
+	nxp_fspi_invalid(fspi);
+	return 0;
+}
+
+/* Set fspi nor device base address and take fspi lock. */
+static int nxp_fspi_prep(struct spi_nor *nor, enum spi_nor_ops ops)
+{
+	struct nxp_fspi *fspi = nor->priv;
+
+	mutex_lock(&fspi->lock);
+
+	nxp_fspi_set_base_addr(fspi, nor);
+	return 0;
+}
+
+/* Release the fspi lock. */
+static void nxp_fspi_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
+{
+	struct nxp_fspi *fspi = nor->priv;
+
+	mutex_unlock(&fspi->lock);
+}
+
+static const struct of_device_id nxp_fspi_dt_ids[] = {
+	{ .compatible = "nxp,lx2160a-fspi", .data = &lx2160a_data, },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, nxp_fspi_dt_ids);
+
+/* Set hwcaps param based on slave device node entry */
+static void nxp_fspi_set_hwcaps_param(struct device *dev,
+				      struct device_node *np,
+				      struct spi_nor_hwcaps *hwcaps)
+{
+	int value = 0, mode = 0;
+
+	/*
+	 * If spi-rx-bus-width and spi-tx-bus-width not defined assign
+	 * default hardware capabilities for READ as
+	 * SNOR_HWCAPS_READ_1_1_8 as FlexSPI controller supports OCTAL Read.
+	 */
+	if (!of_property_read_u32(np, "spi-rx-bus-width", &value)) {
+		switch (value) {
+		case 1:
+			break;
+		case 2:
+			mode |= SPI_RX_DUAL;
+			break;
+		case 4:
+			mode |= SPI_RX_QUAD;
+			break;
+		case 8:
+			mode |= SPI_RX_OCTAL;
+			break;
+		default:
+			dev_err(dev, "spi-rx-bus-width %d not supported\n",
+				value);
+			break;
+		}
+	} else {
+		hwcaps->mask |= SNOR_HWCAPS_READ_1_1_8;
+	}
+
+	if (!of_property_read_u32(np, "spi-tx-bus-width", &value)) {
+		switch (value) {
+		case 1:
+			break;
+		case 2:
+			mode |= SPI_TX_DUAL;
+			break;
+		case 4:
+			mode |= SPI_TX_QUAD;
+			break;
+		case 8:
+			mode |= SPI_TX_OCTAL;
+			break;
+		default:
+			dev_err(dev, "spi-tx-bus-width %d not supported\n",
+				value);
+			break;
+		}
+	}
+
+	if (mode & SPI_RX_OCTAL) {
+		hwcaps->mask |= SNOR_HWCAPS_READ_1_1_8;
+
+		if (mode & SPI_TX_OCTAL)
+			hwcaps->mask |= (SNOR_HWCAPS_READ_1_8_8 |
+					 SNOR_HWCAPS_PP_1_1_8 |
+					 SNOR_HWCAPS_PP_1_8_8);
+	} else if (mode & SPI_RX_QUAD) {
+		hwcaps->mask |= SNOR_HWCAPS_READ_1_1_4;
+
+		if (mode & SPI_TX_QUAD)
+			hwcaps->mask |= (SNOR_HWCAPS_READ_1_4_4 |
+					 SNOR_HWCAPS_PP_1_1_4 |
+					 SNOR_HWCAPS_PP_1_4_4);
+	} else if (mode & SPI_RX_DUAL) {
+		hwcaps->mask |= SNOR_HWCAPS_READ_1_1_2;
+
+		if (mode & SPI_TX_DUAL)
+			hwcaps->mask |= SNOR_HWCAPS_READ_1_2_2;
+	}
+}
+
+static int nxp_fspi_probe(struct platform_device *pdev)
+{
+	struct spi_nor_hwcaps hwcaps;
+	struct device_node *np = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
+	struct nxp_fspi *fspi;
+	struct resource *res;
+	struct spi_nor *nor;
+	struct mtd_info *mtd;
+	int ret, i = 0, value, mode;
+
+	const struct of_device_id *of_id =
+			of_match_device(nxp_fspi_dt_ids, &pdev->dev);
+
+	fspi = devm_kzalloc(dev, sizeof(*fspi), GFP_KERNEL);
+	if (!fspi)
+		return -ENOMEM;
+
+	fspi->nor_num = of_get_child_count(dev->of_node);
+	if (!fspi->nor_num || fspi->nor_num > 4)
+		return -ENODEV;
+
+	fspi->dev = dev;
+	fspi->devtype_data = (struct nxp_fspi_devtype_data *)of_id->data;
+	platform_set_drvdata(pdev, fspi);
+
+	/* find the resources */
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "FSPI");
+	if (!res) {
+		dev_err(dev, "FSPI get IORESOURCE_MEM failed\n");
+		return -ENODEV;
+	}
+
+	fspi->iobase = devm_ioremap_resource(dev, res);
+	if (IS_ERR(fspi->iobase))
+		return PTR_ERR(fspi->iobase);
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+					"FSPI-memory");
+	if (!res) {
+		dev_err(dev, "FSPI-memory get IORESOURCE_MEM failed\n");
+		return -ENODEV;
+	}
+
+	if (!devm_request_mem_region(dev, res->start, resource_size(res),
+				     res->name)) {
+		dev_err(dev, "can't request region for resource %pR\n", res);
+		return -EBUSY;
+	}
+
+	fspi->memmap_phy = res->start;
+
+	/* find the irq */
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0) {
+		dev_err(dev, "failed to get the irq: %d\n", ret);
+		goto irq_failed;
+	}
+
+	ret = devm_request_irq(dev, ret,
+			nxp_fspi_irq_handler, 0, pdev->name, fspi);
+	if (ret) {
+		dev_err(dev, "failed to request irq: %d\n", ret);
+		goto irq_failed;
+	}
+
+	ret = nxp_fspi_nor_setup(fspi);
+	if (ret)
+		goto irq_failed;
+
+	if (of_get_property(np, "nxp,fspi-has-second-chip", NULL))
+		fspi->has_second_chip = true;
+
+	if (of_property_read_bool(np, "big-endian"), NULL)
+		fspi->big_endian = true;
+
+	mutex_init(&fspi->lock);
+
+	/* iterate the subnodes. */
+	for_each_available_child_of_node(dev->of_node, np) {
+		/* Reset hwcaps mask to minimal caps for the slave node. */
+		hwcaps.mask = SNOR_HWCAPS_READ |
+			      SNOR_HWCAPS_READ_FAST |
+			      SNOR_HWCAPS_PP;
+		value = 0;
+		mode = 0;
+
+		/* If 'has_second_chip' is not true then selected flash are
+		 * A0, B0 etc
+		 * has_second_chip defined then flashes are - A0, A1 ; B0, B1
+		 */
+		if (!fspi->has_second_chip)
+			i *= 2;
+
+		nor = &fspi->nor[i];
+		mtd = &nor->mtd;
+
+		nor->dev = dev;
+		spi_nor_set_flash_node(nor, np);
+		nor->priv = fspi;
+
+		if (fspi->nor_num > 1 && !mtd->name) {
+			int flash_index;
+
+			ret = of_property_read_u32(np, "reg", &flash_index);
+			if (!ret) {
+				mtd->name = devm_kasprintf(dev, GFP_KERNEL,
+							   "%s-%d",
+							   dev_name(dev),
+							   flash_index);
+				if (!mtd->name) {
+					ret = -ENOMEM;
+					goto mutex_failed;
+				}
+			} else {
+				dev_warn(dev, "reg property is missing\n");
+			}
+		}
+
+		/* fill the hooks */
+		nor->read_reg = nxp_fspi_read_reg;
+		nor->write_reg = nxp_fspi_write_reg;
+		nor->read = nxp_fspi_read;
+		nor->write = nxp_fspi_write;
+		nor->erase = nxp_fspi_erase;
+
+		nor->prepare = nxp_fspi_prep;
+		nor->unprepare = nxp_fspi_unprep;
+
+		/* set the chip address for early read cmds: READID, SFDP */
+		nxp_fspi_set_base_addr(fspi, nor);
+
+		/* set hwcaps param based on slave device node entry */
+		nxp_fspi_set_hwcaps_param(dev, np, &hwcaps);
+
+		ret = spi_nor_scan(nor, NULL, &hwcaps);
+		if (ret)
+			goto mutex_failed;
+
+		ret = mtd_device_register(mtd, NULL, 0);
+		if (ret)
+			goto mutex_failed;
+
+		/* Set the correct NOR size now. */
+		if (fspi->nor_size == 0) {
+			fspi->nor_size = mtd->size;
+
+			/* Map the SPI NOR to accessiable address */
+			nxp_fspi_set_map_addr(fspi);
+		}
+
+		/*
+		 * The TX FIFO is 64 bytes in the Vybrid, but the Page Program
+		 * may writes 265 bytes per time. The write is working in the
+		 * unit of the TX FIFO, not in the unit of the SPI NOR's page
+		 * size.
+		 *
+		 * So shrink the spi_nor->page_size if it is larger then the
+		 * TX FIFO.
+		 */
+		if (nor->page_size > fspi->devtype_data->txfifo)
+			nor->page_size = fspi->devtype_data->txfifo;
+
+		i++;
+	}
+
+	/* finish the rest init. */
+	ret = nxp_fspi_nor_setup_last(fspi);
+	if (ret)
+		goto last_init_failed;
+
+	return 0;
+
+last_init_failed:
+	for (i = 0; i < fspi->nor_num; i++) {
+		/* skip the holes */
+		if (!fspi->has_second_chip)
+			i *= 2;
+		mtd_device_unregister(&fspi->mtd[i]);
+	}
+mutex_failed:
+	mutex_destroy(&fspi->lock);
+irq_failed:
+	dev_err(dev, "NXP FSPI probe failed\n");
+	return ret;
+}
+
+static int nxp_fspi_remove(struct platform_device *pdev)
+{
+	struct nxp_fspi *fspi = platform_get_drvdata(pdev);
+	int i;
+
+	for (i = 0; i < fspi->nor_num; i++) {
+		/* skip the holes */
+		if (!fspi->has_second_chip)
+			i *= 2;
+		mtd_device_unregister(&fspi->nor[i].mtd);
+	}
+
+	/* disable the hardware */
+	fspi_writel(fspi, FSPI_MCR0_MDIS_MASK, fspi->iobase + FSPI_MCR0);
+
+	mutex_destroy(&fspi->lock);
+
+	if (fspi->ahb_addr)
+		iounmap(fspi->ahb_addr);
+
+	return 0;
+}
+
+static int nxp_fspi_suspend(struct platform_device *pdev, pm_message_t state)
+{
+	return 0;
+}
+
+static int nxp_fspi_resume(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static struct platform_driver nxp_fspi_driver = {
+	.driver = {
+		.name	= "nxp-fspi",
+		.of_match_table = nxp_fspi_dt_ids,
+	},
+	.probe          = nxp_fspi_probe,
+	.remove		= nxp_fspi_remove,
+	.suspend	= nxp_fspi_suspend,
+	.resume		= nxp_fspi_resume,
+};
+module_platform_driver(nxp_fspi_driver);
+
+MODULE_DESCRIPTION("NXP FSPI Controller Driver");
+MODULE_AUTHOR("NXP Semiconductor");
+MODULE_LICENSE("GPL v2");
-- 
1.9.1
