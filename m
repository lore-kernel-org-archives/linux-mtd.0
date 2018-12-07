Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVCPf-00010B-Bs
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 09:27:33 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: Vignesh R <vigneshr@ti.com>,
 Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: [RFC PATCH 12/34] mtd: spi-nor: Prepare things for core /
 manufacturer code split
Date: Fri,  7 Dec 2018 10:26:15 +0100
Message-Id: <20181207092637.18687-13-boris.brezillon@bootlin.com>
In-Reply-To: <20181207092637.18687-1-boris.brezillon@bootlin.com>
References: <20181207092637.18687-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

First thing we do is move all SPI NOR controller drivers to a
controllers/ sub-directory so that we only have SPI NOR related source
files under drivers/mtd/spi-nor/. We then rename spi-nor.c into core.c
since we are about to split this file in multiple source files (one per
manufacturer, plus one for the SFDP parsing logic). Finally, we move
some of the spi-nor.c internal definitions in internals.h so that they
can be used by manufacturer drivers.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/spi-nor/Kconfig                   | 108 +-----
 drivers/mtd/spi-nor/Makefile                  |  14 +-
 drivers/mtd/spi-nor/controllers/Kconfig       | 107 ++++++
 drivers/mtd/spi-nor/controllers/Makefile      |  12 +
 .../spi-nor/{ => controllers}/aspeed-smc.c    |   0
 .../spi-nor/{ => controllers}/atmel-quadspi.c |   0
 .../{ => controllers}/cadence-quadspi.c       |   0
 .../spi-nor/{ => controllers}/fsl-quadspi.c   |   0
 .../mtd/spi-nor/{ => controllers}/hisi-sfc.c  |   0
 .../spi-nor/{ => controllers}/intel-spi-pci.c |   0
 .../{ => controllers}/intel-spi-platform.c    |   0
 .../mtd/spi-nor/{ => controllers}/intel-spi.c |   0
 .../mtd/spi-nor/{ => controllers}/intel-spi.h |   0
 .../spi-nor/{ => controllers}/mtk-quadspi.c   |   0
 .../mtd/spi-nor/{ => controllers}/nxp-spifi.c |   0
 .../spi-nor/{ => controllers}/stm32-quadspi.c |   0
 drivers/mtd/spi-nor/{spi-nor.c => core.c}     | 311 +----------------
 drivers/mtd/spi-nor/internals.h               | 321 ++++++++++++++++++
 18 files changed, 446 insertions(+), 427 deletions(-)
 create mode 100644 drivers/mtd/spi-nor/controllers/Kconfig
 create mode 100644 drivers/mtd/spi-nor/controllers/Makefile
 rename drivers/mtd/spi-nor/{ => controllers}/aspeed-smc.c (100%)
 rename drivers/mtd/spi-nor/{ => controllers}/atmel-quadspi.c (100%)
 rename drivers/mtd/spi-nor/{ => controllers}/cadence-quadspi.c (100%)
 rename drivers/mtd/spi-nor/{ => controllers}/fsl-quadspi.c (100%)
 rename drivers/mtd/spi-nor/{ => controllers}/hisi-sfc.c (100%)
 rename drivers/mtd/spi-nor/{ => controllers}/intel-spi-pci.c (100%)
 rename drivers/mtd/spi-nor/{ => controllers}/intel-spi-platform.c (100%)
 rename drivers/mtd/spi-nor/{ => controllers}/intel-spi.c (100%)
 rename drivers/mtd/spi-nor/{ => controllers}/intel-spi.h (100%)
 rename drivers/mtd/spi-nor/{ => controllers}/mtk-quadspi.c (100%)
 rename drivers/mtd/spi-nor/{ => controllers}/nxp-spifi.c (100%)
 rename drivers/mtd/spi-nor/{ => controllers}/stm32-quadspi.c (100%)
 rename drivers/mtd/spi-nor/{spi-nor.c => core.c} (91%)
 create mode 100644 drivers/mtd/spi-nor/internals.h

diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index 6cc9c929ff57..d4f9187100e2 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -7,14 +7,6 @@ menuconfig MTD_SPI_NOR
 
 if MTD_SPI_NOR
 
-config MTD_MT81xx_NOR
-	tristate "Mediatek MT81xx SPI NOR flash controller"
-	depends on HAS_IOMEM
-	help
-	  This enables access to SPI NOR flash, using MT81xx SPI NOR flash
-	  controller. This controller does not support generic SPI BUS, it only
-	  supports SPI NOR Flash.
-
 config MTD_SPI_NOR_USE_4K_SECTORS
 	bool "Use small 4096 B erase sectors"
 	default y
@@ -29,104 +21,6 @@ config MTD_SPI_NOR_USE_4K_SECTORS
 	  Please note that some tools/drivers/filesystems may not work with
 	  4096 B erase size (e.g. UBIFS requires 15 KiB as a minimum).
 
-config SPI_ASPEED_SMC
-	tristate "Aspeed flash controllers in SPI mode"
-	depends on ARCH_ASPEED || COMPILE_TEST
-	depends on HAS_IOMEM && OF
-	help
-	  This enables support for the Firmware Memory controller (FMC)
-	  in the Aspeed AST2500/AST2400 SoCs when attached to SPI NOR chips,
-	  and support for the SPI flash memory controller (SPI) for
-	  the host firmware. The implementation only supports SPI NOR.
-
-config SPI_ATMEL_QUADSPI
-	tristate "Atmel Quad SPI Controller"
-	depends on ARCH_AT91 || (ARM && COMPILE_TEST)
-	depends on OF && HAS_IOMEM
-	help
-	  This enables support for the Quad SPI controller in master mode.
-	  This driver does not support generic SPI. The implementation only
-	  supports SPI NOR.
-
-config SPI_CADENCE_QUADSPI
-	tristate "Cadence Quad SPI controller"
-	depends on OF && (ARM || ARM64 || COMPILE_TEST)
-	help
-	  Enable support for the Cadence Quad SPI Flash controller.
-
-	  Cadence QSPI is a specialized controller for connecting an SPI
-	  Flash over 1/2/4-bit wide bus. Enable this option if you have a
-	  device with a Cadence QSPI controller and want to access the
-	  Flash as an MTD device.
-
-config SPI_FSL_QUADSPI
-	tristate "Freescale Quad SPI controller"
-	depends on ARCH_MXC || SOC_LS1021A || ARCH_LAYERSCAPE || COMPILE_TEST
-	depends on HAS_IOMEM
-	help
-	  This enables support for the Quad SPI controller in master mode.
-	  This controller does not support generic SPI. It only supports
-	  SPI NOR.
-
-config SPI_HISI_SFC
-	tristate "Hisilicon SPI-NOR Flash Controller(SFC)"
-	depends on ARCH_HISI || COMPILE_TEST
-	depends on HAS_IOMEM
-	help
-	  This enables support for hisilicon SPI-NOR flash controller.
-
-config SPI_NXP_SPIFI
-	tristate "NXP SPI Flash Interface (SPIFI)"
-	depends on OF && (ARCH_LPC18XX || COMPILE_TEST)
-	depends on HAS_IOMEM
-	help
-	  Enable support for the NXP LPC SPI Flash Interface controller.
-
-	  SPIFI is a specialized controller for connecting serial SPI
-	  Flash. Enable this option if you have a device with a SPIFI
-	  controller and want to access the Flash as a mtd device.
-
-config SPI_INTEL_SPI
-	tristate
-
-config SPI_INTEL_SPI_PCI
-	tristate "Intel PCH/PCU SPI flash PCI driver (DANGEROUS)"
-	depends on X86 && PCI
-	select SPI_INTEL_SPI
-	help
-	  This enables PCI support for the Intel PCH/PCU SPI controller in
-	  master mode. This controller is present in modern Intel hardware
-	  and is used to hold BIOS and other persistent settings. Using
-	  this driver it is possible to upgrade BIOS directly from Linux.
-
-	  Say N here unless you know what you are doing. Overwriting the
-	  SPI flash may render the system unbootable.
-
-	  To compile this driver as a module, choose M here: the module
-	  will be called intel-spi-pci.
-
-config SPI_INTEL_SPI_PLATFORM
-	tristate "Intel PCH/PCU SPI flash platform driver (DANGEROUS)"
-	depends on X86
-	select SPI_INTEL_SPI
-	help
-	  This enables platform support for the Intel PCH/PCU SPI
-	  controller in master mode. This controller is present in modern
-	  Intel hardware and is used to hold BIOS and other persistent
-	  settings. Using this driver it is possible to upgrade BIOS
-	  directly from Linux.
-
-	  Say N here unless you know what you are doing. Overwriting the
-	  SPI flash may render the system unbootable.
-
-	  To compile this driver as a module, choose M here: the module
-	  will be called intel-spi-platform.
-
-config SPI_STM32_QUADSPI
-	tristate "STM32 Quad SPI controller"
-	depends on ARCH_STM32 || COMPILE_TEST
-	help
-	  This enables support for the STM32 Quad SPI controller.
-	  We only connect the NOR to this controller.
+source "drivers/mtd/spi-nor/controllers/Kconfig"
 
 endif # MTD_SPI_NOR
diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index f4c61d282abd..0d6c4967a445 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -1,13 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
+spi-nor-objs			:= core.o
 obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
-obj-$(CONFIG_SPI_ASPEED_SMC)	+= aspeed-smc.o
-obj-$(CONFIG_SPI_ATMEL_QUADSPI)	+= atmel-quadspi.o
-obj-$(CONFIG_SPI_CADENCE_QUADSPI)	+= cadence-quadspi.o
-obj-$(CONFIG_SPI_FSL_QUADSPI)	+= fsl-quadspi.o
-obj-$(CONFIG_SPI_HISI_SFC)	+= hisi-sfc.o
-obj-$(CONFIG_MTD_MT81xx_NOR)    += mtk-quadspi.o
-obj-$(CONFIG_SPI_NXP_SPIFI)	+= nxp-spifi.o
-obj-$(CONFIG_SPI_INTEL_SPI)	+= intel-spi.o
-obj-$(CONFIG_SPI_INTEL_SPI_PCI)	+= intel-spi-pci.o
-obj-$(CONFIG_SPI_INTEL_SPI_PLATFORM)	+= intel-spi-platform.o
-obj-$(CONFIG_SPI_STM32_QUADSPI)	+= stm32-quadspi.o
+
+obj-$(CONFIG_MTD_SPI_NOR)	+= controllers/
diff --git a/drivers/mtd/spi-nor/controllers/Kconfig b/drivers/mtd/spi-nor/controllers/Kconfig
new file mode 100644
index 000000000000..6356cbf465a4
--- /dev/null
+++ b/drivers/mtd/spi-nor/controllers/Kconfig
@@ -0,0 +1,107 @@
+config MTD_MT81xx_NOR
+	tristate "Mediatek MT81xx SPI NOR flash controller"
+	depends on HAS_IOMEM
+	help
+	  This enables access to SPI NOR flash, using MT81xx SPI NOR flash
+	  controller. This controller does not support generic SPI BUS, it only
+	  supports SPI NOR Flash.
+
+config SPI_ASPEED_SMC
+	tristate "Aspeed flash controllers in SPI mode"
+	depends on ARCH_ASPEED || COMPILE_TEST
+	depends on HAS_IOMEM && OF
+	help
+	  This enables support for the Firmware Memory controller (FMC)
+	  in the Aspeed AST2500/AST2400 SoCs when attached to SPI NOR chips,
+	  and support for the SPI flash memory controller (SPI) for
+	  the host firmware. The implementation only supports SPI NOR.
+
+config SPI_ATMEL_QUADSPI
+	tristate "Atmel Quad SPI Controller"
+	depends on ARCH_AT91 || (ARM && COMPILE_TEST)
+	depends on OF && HAS_IOMEM
+	help
+	  This enables support for the Quad SPI controller in master mode.
+	  This driver does not support generic SPI. The implementation only
+	  supports SPI NOR.
+
+config SPI_CADENCE_QUADSPI
+	tristate "Cadence Quad SPI controller"
+	depends on OF && (ARM || ARM64 || COMPILE_TEST)
+	help
+	  Enable support for the Cadence Quad SPI Flash controller.
+
+	  Cadence QSPI is a specialized controller for connecting an SPI
+	  Flash over 1/2/4-bit wide bus. Enable this option if you have a
+	  device with a Cadence QSPI controller and want to access the
+	  Flash as an MTD device.
+
+config SPI_FSL_QUADSPI
+	tristate "Freescale Quad SPI controller"
+	depends on ARCH_MXC || SOC_LS1021A || ARCH_LAYERSCAPE || COMPILE_TEST
+	depends on HAS_IOMEM
+	help
+	  This enables support for the Quad SPI controller in master mode.
+	  This controller does not support generic SPI. It only supports
+	  SPI NOR.
+
+config SPI_HISI_SFC
+	tristate "Hisilicon SPI-NOR Flash Controller(SFC)"
+	depends on ARCH_HISI || COMPILE_TEST
+	depends on HAS_IOMEM
+	help
+	  This enables support for hisilicon SPI-NOR flash controller.
+
+config SPI_NXP_SPIFI
+	tristate "NXP SPI Flash Interface (SPIFI)"
+	depends on OF && (ARCH_LPC18XX || COMPILE_TEST)
+	depends on HAS_IOMEM
+	help
+	  Enable support for the NXP LPC SPI Flash Interface controller.
+
+	  SPIFI is a specialized controller for connecting serial SPI
+	  Flash. Enable this option if you have a device with a SPIFI
+	  controller and want to access the Flash as a mtd device.
+
+config SPI_INTEL_SPI
+	tristate
+
+config SPI_INTEL_SPI_PCI
+	tristate "Intel PCH/PCU SPI flash PCI driver (DANGEROUS)"
+	depends on X86 && PCI
+	select SPI_INTEL_SPI
+	help
+	  This enables PCI support for the Intel PCH/PCU SPI controller in
+	  master mode. This controller is present in modern Intel hardware
+	  and is used to hold BIOS and other persistent settings. Using
+	  this driver it is possible to upgrade BIOS directly from Linux.
+
+	  Say N here unless you know what you are doing. Overwriting the
+	  SPI flash may render the system unbootable.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called intel-spi-pci.
+
+config SPI_INTEL_SPI_PLATFORM
+	tristate "Intel PCH/PCU SPI flash platform driver (DANGEROUS)"
+	depends on X86
+	select SPI_INTEL_SPI
+	help
+	  This enables platform support for the Intel PCH/PCU SPI
+	  controller in master mode. This controller is present in modern
+	  Intel hardware and is used to hold BIOS and other persistent
+	  settings. Using this driver it is possible to upgrade BIOS
+	  directly from Linux.
+
+	  Say N here unless you know what you are doing. Overwriting the
+	  SPI flash may render the system unbootable.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called intel-spi-platform.
+
+config SPI_STM32_QUADSPI
+	tristate "STM32 Quad SPI controller"
+	depends on ARCH_STM32 || COMPILE_TEST
+	help
+	  This enables support for the STM32 Quad SPI controller.
+	  We only connect the NOR to this controller.
diff --git a/drivers/mtd/spi-nor/controllers/Makefile b/drivers/mtd/spi-nor/controllers/Makefile
new file mode 100644
index 000000000000..0cb3384a32ac
--- /dev/null
+++ b/drivers/mtd/spi-nor/controllers/Makefile
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_SPI_ASPEED_SMC)	+= aspeed-smc.o
+obj-$(CONFIG_SPI_ATMEL_QUADSPI)	+= atmel-quadspi.o
+obj-$(CONFIG_SPI_CADENCE_QUADSPI)	+= cadence-quadspi.o
+obj-$(CONFIG_SPI_FSL_QUADSPI)	+= fsl-quadspi.o
+obj-$(CONFIG_SPI_HISI_SFC)	+= hisi-sfc.o
+obj-$(CONFIG_MTD_MT81xx_NOR)    += mtk-quadspi.o
+obj-$(CONFIG_SPI_NXP_SPIFI)	+= nxp-spifi.o
+obj-$(CONFIG_SPI_INTEL_SPI)	+= intel-spi.o
+obj-$(CONFIG_SPI_INTEL_SPI_PCI)	+= intel-spi-pci.o
+obj-$(CONFIG_SPI_INTEL_SPI_PLATFORM)	+= intel-spi-platform.o
+obj-$(CONFIG_SPI_STM32_QUADSPI)	+= stm32-quadspi.o
diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
similarity index 100%
rename from drivers/mtd/spi-nor/aspeed-smc.c
rename to drivers/mtd/spi-nor/controllers/aspeed-smc.c
diff --git a/drivers/mtd/spi-nor/atmel-quadspi.c b/drivers/mtd/spi-nor/controllers/atmel-quadspi.c
similarity index 100%
rename from drivers/mtd/spi-nor/atmel-quadspi.c
rename to drivers/mtd/spi-nor/controllers/atmel-quadspi.c
diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/controllers/cadence-quadspi.c
similarity index 100%
rename from drivers/mtd/spi-nor/cadence-quadspi.c
rename to drivers/mtd/spi-nor/controllers/cadence-quadspi.c
diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/controllers/fsl-quadspi.c
similarity index 100%
rename from drivers/mtd/spi-nor/fsl-quadspi.c
rename to drivers/mtd/spi-nor/controllers/fsl-quadspi.c
diff --git a/drivers/mtd/spi-nor/hisi-sfc.c b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
similarity index 100%
rename from drivers/mtd/spi-nor/hisi-sfc.c
rename to drivers/mtd/spi-nor/controllers/hisi-sfc.c
diff --git a/drivers/mtd/spi-nor/intel-spi-pci.c b/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
similarity index 100%
rename from drivers/mtd/spi-nor/intel-spi-pci.c
rename to drivers/mtd/spi-nor/controllers/intel-spi-pci.c
diff --git a/drivers/mtd/spi-nor/intel-spi-platform.c b/drivers/mtd/spi-nor/controllers/intel-spi-platform.c
similarity index 100%
rename from drivers/mtd/spi-nor/intel-spi-platform.c
rename to drivers/mtd/spi-nor/controllers/intel-spi-platform.c
diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/controllers/intel-spi.c
similarity index 100%
rename from drivers/mtd/spi-nor/intel-spi.c
rename to drivers/mtd/spi-nor/controllers/intel-spi.c
diff --git a/drivers/mtd/spi-nor/intel-spi.h b/drivers/mtd/spi-nor/controllers/intel-spi.h
similarity index 100%
rename from drivers/mtd/spi-nor/intel-spi.h
rename to drivers/mtd/spi-nor/controllers/intel-spi.h
diff --git a/drivers/mtd/spi-nor/mtk-quadspi.c b/drivers/mtd/spi-nor/controllers/mtk-quadspi.c
similarity index 100%
rename from drivers/mtd/spi-nor/mtk-quadspi.c
rename to drivers/mtd/spi-nor/controllers/mtk-quadspi.c
diff --git a/drivers/mtd/spi-nor/nxp-spifi.c b/drivers/mtd/spi-nor/controllers/nxp-spifi.c
similarity index 100%
rename from drivers/mtd/spi-nor/nxp-spifi.c
rename to drivers/mtd/spi-nor/controllers/nxp-spifi.c
diff --git a/drivers/mtd/spi-nor/stm32-quadspi.c b/drivers/mtd/spi-nor/controllers/stm32-quadspi.c
similarity index 100%
rename from drivers/mtd/spi-nor/stm32-quadspi.c
rename to drivers/mtd/spi-nor/controllers/stm32-quadspi.c
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/core.c
similarity index 91%
rename from drivers/mtd/spi-nor/spi-nor.c
rename to drivers/mtd/spi-nor/core.c
index 34d3d632e53b..f8b7c8fbe960 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -22,6 +22,8 @@
 #include <linux/spi/flash.h>
 #include <linux/mtd/spi-nor.h>
 
+#include "internals.h"
+
 /* Define max times to check status register before we give up. */
 
 /*
@@ -36,267 +38,8 @@
  */
 #define CHIP_ERASE_2MB_READY_WAIT_JIFFIES	(40UL * HZ)
 
-#define SPI_NOR_MAX_ID_LEN	6
 #define SPI_NOR_MAX_ADDR_WIDTH	4
 
-struct spi_nor_read_command {
-	u8			num_mode_clocks;
-	u8			num_wait_states;
-	u8			opcode;
-	enum spi_nor_protocol	proto;
-};
-
-struct spi_nor_pp_command {
-	u8			opcode;
-	enum spi_nor_protocol	proto;
-};
-
-enum spi_nor_read_command_index {
-	SNOR_CMD_READ,
-	SNOR_CMD_READ_FAST,
-	SNOR_CMD_READ_1_1_1_DTR,
-
-	/* Dual SPI */
-	SNOR_CMD_READ_1_1_2,
-	SNOR_CMD_READ_1_2_2,
-	SNOR_CMD_READ_2_2_2,
-	SNOR_CMD_READ_1_2_2_DTR,
-
-	/* Quad SPI */
-	SNOR_CMD_READ_1_1_4,
-	SNOR_CMD_READ_1_4_4,
-	SNOR_CMD_READ_4_4_4,
-	SNOR_CMD_READ_1_4_4_DTR,
-
-	/* Octo SPI */
-	SNOR_CMD_READ_1_1_8,
-	SNOR_CMD_READ_1_8_8,
-	SNOR_CMD_READ_8_8_8,
-	SNOR_CMD_READ_1_8_8_DTR,
-
-	SNOR_CMD_READ_MAX
-};
-
-enum spi_nor_pp_command_index {
-	SNOR_CMD_PP,
-
-	/* Quad SPI */
-	SNOR_CMD_PP_1_1_4,
-	SNOR_CMD_PP_1_4_4,
-	SNOR_CMD_PP_4_4_4,
-
-	/* Octo SPI */
-	SNOR_CMD_PP_1_1_8,
-	SNOR_CMD_PP_1_8_8,
-	SNOR_CMD_PP_8_8_8,
-
-	SNOR_CMD_PP_MAX
-};
-
-struct spi_nor_flash_parameter {
-	u64				size;
-	u32				page_size;
-
-	struct spi_nor_hwcaps		hwcaps;
-	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX];
-	struct spi_nor_pp_command	page_programs[SNOR_CMD_PP_MAX];
-
-	int (*quad_enable)(struct spi_nor *nor);
-};
-
-struct sfdp_parameter_header {
-	u8		id_lsb;
-	u8		minor;
-	u8		major;
-	u8		length; /* in double words */
-	u8		parameter_table_pointer[3]; /* byte address */
-	u8		id_msb;
-};
-
-#define SFDP_PARAM_HEADER_ID(p)	(((p)->id_msb << 8) | (p)->id_lsb)
-#define SFDP_PARAM_HEADER_PTP(p) \
-	(((p)->parameter_table_pointer[2] << 16) | \
-	 ((p)->parameter_table_pointer[1] <<  8) | \
-	 ((p)->parameter_table_pointer[0] <<  0))
-
-#define SFDP_BFPT_ID		0xff00	/* Basic Flash Parameter Table */
-#define SFDP_SECTOR_MAP_ID	0xff81	/* Sector Map Table */
-
-#define SFDP_SIGNATURE		0x50444653U
-#define SFDP_JESD216_MAJOR	1
-#define SFDP_JESD216_MINOR	0
-#define SFDP_JESD216A_MINOR	5
-#define SFDP_JESD216B_MINOR	6
-
-struct sfdp_header {
-	u32		signature; /* Ox50444653U <=> "SFDP" */
-	u8		minor;
-	u8		major;
-	u8		nph; /* 0-base number of parameter headers */
-	u8		unused;
-
-	/* Basic Flash Parameter Table. */
-	struct sfdp_parameter_header	bfpt_header;
-};
-
-/* Basic Flash Parameter Table */
-
-/*
- * JESD216 rev B defines a Basic Flash Parameter Table of 16 DWORDs.
- * They are indexed from 1 but C arrays are indexed from 0.
- */
-#define BFPT_DWORD(i)		((i) - 1)
-#define BFPT_DWORD_MAX		16
-
-/* The first version of JESB216 defined only 9 DWORDs. */
-#define BFPT_DWORD_MAX_JESD216			9
-
-/* 1st DWORD. */
-#define BFPT_DWORD1_FAST_READ_1_1_2		BIT(16)
-#define BFPT_DWORD1_ADDRESS_BYTES_MASK		GENMASK(18, 17)
-#define BFPT_DWORD1_ADDRESS_BYTES_3_ONLY	(0x0UL << 17)
-#define BFPT_DWORD1_ADDRESS_BYTES_3_OR_4	(0x1UL << 17)
-#define BFPT_DWORD1_ADDRESS_BYTES_4_ONLY	(0x2UL << 17)
-#define BFPT_DWORD1_DTR				BIT(19)
-#define BFPT_DWORD1_FAST_READ_1_2_2		BIT(20)
-#define BFPT_DWORD1_FAST_READ_1_4_4		BIT(21)
-#define BFPT_DWORD1_FAST_READ_1_1_4		BIT(22)
-
-/* 5th DWORD. */
-#define BFPT_DWORD5_FAST_READ_2_2_2		BIT(0)
-#define BFPT_DWORD5_FAST_READ_4_4_4		BIT(4)
-
-/* 11th DWORD. */
-#define BFPT_DWORD11_PAGE_SIZE_SHIFT		4
-#define BFPT_DWORD11_PAGE_SIZE_MASK		GENMASK(7, 4)
-
-/* 15th DWORD. */
-
-/*
- * (from JESD216 rev B)
- * Quad Enable Requirements (QER):
- * - 000b: Device does not have a QE bit. Device detects 1-1-4 and 1-4-4
- *         reads based on instruction. DQ3/HOLD# functions are hold during
- *         instruction phase.
- * - 001b: QE is bit 1 of status register 2. It is set via Write Status with
- *         two data bytes where bit 1 of the second byte is one.
- *         [...]
- *         Writing only one byte to the status register has the side-effect of
- *         clearing status register 2, including the QE bit. The 100b code is
- *         used if writing one byte to the status register does not modify
- *         status register 2.
- * - 010b: QE is bit 6 of status register 1. It is set via Write Status with
- *         one data byte where bit 6 is one.
- *         [...]
- * - 011b: QE is bit 7 of status register 2. It is set via Write status
- *         register 2 instruction 3Eh with one data byte where bit 7 is one.
- *         [...]
- *         The status register 2 is read using instruction 3Fh.
- * - 100b: QE is bit 1 of status register 2. It is set via Write Status with
- *         two data bytes where bit 1 of the second byte is one.
- *         [...]
- *         In contrast to the 001b code, writing one byte to the status
- *         register does not modify status register 2.
- * - 101b: QE is bit 1 of status register 2. Status register 1 is read using
- *         Read Status instruction 05h. Status register2 is read using
- *         instruction 35h. QE is set via Writ Status instruction 01h with
- *         two data bytes where bit 1 of the second byte is one.
- *         [...]
- */
-#define BFPT_DWORD15_QER_MASK			GENMASK(22, 20)
-#define BFPT_DWORD15_QER_NONE			(0x0UL << 20) /* Micron */
-#define BFPT_DWORD15_QER_SR2_BIT1_BUGGY		(0x1UL << 20)
-#define BFPT_DWORD15_QER_SR1_BIT6		(0x2UL << 20) /* Macronix */
-#define BFPT_DWORD15_QER_SR2_BIT7		(0x3UL << 20)
-#define BFPT_DWORD15_QER_SR2_BIT1_NO_RD		(0x4UL << 20)
-#define BFPT_DWORD15_QER_SR2_BIT1		(0x5UL << 20) /* Spansion */
-
-struct sfdp_bfpt {
-	u32	dwords[BFPT_DWORD_MAX];
-};
-
-/**
- * struct spi_nor_fixups - SPI NOR fixup hooks
- * @post_bfpt: called after the BFPT table has been parsed
- * @post_sfdp: called after SFDP has been parsed (is also called for SPI NORs
- *	       that do not support RDSFDP). Typically used to tweak various
- *	       parameters that could not be extracted by other means (i.e.
- *	       when information provided by the SFDP/flash_info tables are
- *	       incomplete or wrong).
- *
- * Those hooks can be used to tweak the SPI NOR configuration when the SFDP
- * table is broken or not available.
- */
-struct spi_nor_fixups {
-	int (*post_bfpt)(struct spi_nor *nor,
-			 const struct sfdp_parameter_header *bfpt_header,
-			 const struct sfdp_bfpt *bfpt,
-			 struct spi_nor_flash_parameter *params);
-	int (*post_sfdp)(struct spi_nor *nor,
-			 struct spi_nor_flash_parameter *params);
-};
-
-struct flash_info {
-	char		*name;
-
-	/*
-	 * This array stores the ID bytes.
-	 * The first three bytes are the JEDIC ID.
-	 * JEDEC ID zero means "no ID" (mostly older chips).
-	 */
-	u8		id[SPI_NOR_MAX_ID_LEN];
-	u8		id_len;
-
-	/* The size listed here is what works with SPINOR_OP_SE, which isn't
-	 * necessarily called a "sector" by the vendor.
-	 */
-	unsigned	sector_size;
-	u16		n_sectors;
-
-	u16		page_size;
-	u16		addr_width;
-
-	u16		flags;
-#define SECT_4K			BIT(0)	/* SPINOR_OP_BE_4K works uniformly */
-#define SPI_NOR_NO_ERASE	BIT(1)	/* No erase command needed */
-#define SST_WRITE		BIT(2)	/* use SST byte programming */
-#define SPI_NOR_NO_FR		BIT(3)	/* Can't do fastread */
-#define SECT_4K_PMC		BIT(4)	/* SPINOR_OP_BE_4K_PMC works uniformly */
-#define SPI_NOR_DUAL_READ	BIT(5)	/* Flash supports Dual Read */
-#define SPI_NOR_QUAD_READ	BIT(6)	/* Flash supports Quad Read */
-#define USE_FSR			BIT(7)	/* use flag status register */
-#define SPI_NOR_HAS_LOCK	BIT(8)	/* Flash supports lock/unlock via SR */
-#define SPI_NOR_HAS_TB		BIT(9)	/*
-					 * Flash SR has Top/Bottom (TB) protect
-					 * bit. Must be used with
-					 * SPI_NOR_HAS_LOCK.
-					 */
-#define SPI_NOR_XSR_RDY		BIT(10)	/*
-					 * S3AN flashes have specific opcode to
-					 * read the status register.
-					 * Flags SPI_NOR_XSR_RDY and SPI_S3AN
-					 * use the same bit as one implies the
-					 * other, but we will get rid of
-					 * SPI_S3AN soon.
-					 */
-#define	SPI_S3AN		BIT(10)	/*
-					 * Xilinx Spartan 3AN In-System Flash
-					 * (MFR cannot be used for probing
-					 * because it has the same value as
-					 * ATMEL flashes)
-					 */
-#define SPI_NOR_4B_OPCODES	BIT(11)	/*
-					 * Use dedicated 4byte address op codes
-					 * to support memory size above 128Mib.
-					 */
-#define NO_CHIP_ERASE		BIT(12) /* Chip does not support chip erase */
-#define SPI_NOR_SKIP_SFDP	BIT(13)	/* Skip parsing of SFDP tables */
-#define USE_CLSR		BIT(14)	/* use CLSR command */
-
-	/* Part specific fixup hooks. */
-	const struct spi_nor_fixups *fixups;
-};
-
 #define JEDEC_MFR(info)	((info)->id[0])
 
 /*
@@ -1617,56 +1360,6 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
 	return 0;
 }
 
-/* Used when the "_ext_id" is two bytes at most */
-#define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
-		.id = {							\
-			((_jedec_id) >> 16) & 0xff,			\
-			((_jedec_id) >> 8) & 0xff,			\
-			(_jedec_id) & 0xff,				\
-			((_ext_id) >> 8) & 0xff,			\
-			(_ext_id) & 0xff,				\
-			},						\
-		.id_len = (!(_jedec_id) ? 0 : (3 + ((_ext_id) ? 2 : 0))),	\
-		.sector_size = (_sector_size),				\
-		.n_sectors = (_n_sectors),				\
-		.page_size = 256,					\
-		.flags = (_flags),
-
-#define INFO6(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
-		.id = {							\
-			((_jedec_id) >> 16) & 0xff,			\
-			((_jedec_id) >> 8) & 0xff,			\
-			(_jedec_id) & 0xff,				\
-			((_ext_id) >> 16) & 0xff,			\
-			((_ext_id) >> 8) & 0xff,			\
-			(_ext_id) & 0xff,				\
-			},						\
-		.id_len = 6,						\
-		.sector_size = (_sector_size),				\
-		.n_sectors = (_n_sectors),				\
-		.page_size = 256,					\
-		.flags = (_flags),
-
-#define CAT25_INFO(_sector_size, _n_sectors, _page_size, _addr_width, _flags)	\
-		.sector_size = (_sector_size),				\
-		.n_sectors = (_n_sectors),				\
-		.page_size = (_page_size),				\
-		.addr_width = (_addr_width),				\
-		.flags = (_flags),
-
-#define S3AN_INFO(_jedec_id, _n_sectors, _page_size)			\
-		.id = {							\
-			((_jedec_id) >> 16) & 0xff,			\
-			((_jedec_id) >> 8) & 0xff,			\
-			(_jedec_id) & 0xff				\
-			},						\
-		.id_len = 3,						\
-		.sector_size = (8*_page_size),				\
-		.n_sectors = (_n_sectors),				\
-		.page_size = _page_size,				\
-		.addr_width = 3,					\
-		.flags = SPI_NOR_NO_FR | SPI_S3AN,
-
 static int gd25q256_post_sfdp_fixups(struct spi_nor *nor,
 				     struct spi_nor_flash_parameter *params)
 {
diff --git a/drivers/mtd/spi-nor/internals.h b/drivers/mtd/spi-nor/internals.h
new file mode 100644
index 000000000000..cc06fed99f49
--- /dev/null
+++ b/drivers/mtd/spi-nor/internals.h
@@ -0,0 +1,321 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2005, Intec Automation Inc.
+ * Copyright (C) 2014, Freescale Semiconductor, Inc.
+ */
+
+#ifndef __LINUX_MTD_SPI_NOR_INTERNALS_H
+#define __LINUX_MTD_SPI_NOR_INTERNALS_H
+
+#define SPI_NOR_MAX_ID_LEN      6
+
+struct spi_nor_read_command {
+	u8			num_mode_clocks;
+	u8			num_wait_states;
+	u8			opcode;
+	enum spi_nor_protocol	proto;
+};
+
+struct spi_nor_pp_command {
+	u8			opcode;
+	enum spi_nor_protocol	proto;
+};
+
+enum spi_nor_read_command_index {
+	SNOR_CMD_READ,
+	SNOR_CMD_READ_FAST,
+	SNOR_CMD_READ_1_1_1_DTR,
+
+	/* Dual SPI */
+	SNOR_CMD_READ_1_1_2,
+	SNOR_CMD_READ_1_2_2,
+	SNOR_CMD_READ_2_2_2,
+	SNOR_CMD_READ_1_2_2_DTR,
+
+	/* Quad SPI */
+	SNOR_CMD_READ_1_1_4,
+	SNOR_CMD_READ_1_4_4,
+	SNOR_CMD_READ_4_4_4,
+	SNOR_CMD_READ_1_4_4_DTR,
+
+	/* Octo SPI */
+	SNOR_CMD_READ_1_1_8,
+	SNOR_CMD_READ_1_8_8,
+	SNOR_CMD_READ_8_8_8,
+	SNOR_CMD_READ_1_8_8_DTR,
+
+	SNOR_CMD_READ_MAX
+};
+
+enum spi_nor_pp_command_index {
+	SNOR_CMD_PP,
+
+	/* Quad SPI */
+	SNOR_CMD_PP_1_1_4,
+	SNOR_CMD_PP_1_4_4,
+	SNOR_CMD_PP_4_4_4,
+
+	/* Octo SPI */
+	SNOR_CMD_PP_1_1_8,
+	SNOR_CMD_PP_1_8_8,
+	SNOR_CMD_PP_8_8_8,
+
+	SNOR_CMD_PP_MAX
+};
+
+struct spi_nor_flash_parameter {
+	u64				size;
+	u32				page_size;
+
+	struct spi_nor_hwcaps		hwcaps;
+	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX];
+	struct spi_nor_pp_command	page_programs[SNOR_CMD_PP_MAX];
+
+	int (*quad_enable)(struct spi_nor *nor);
+};
+
+struct sfdp_parameter_header {
+	u8		id_lsb;
+	u8		minor;
+	u8		major;
+	u8		length; /* in double words */
+	u8		parameter_table_pointer[3]; /* byte address */
+	u8		id_msb;
+};
+
+#define SFDP_PARAM_HEADER_ID(p)	(((p)->id_msb << 8) | (p)->id_lsb)
+#define SFDP_PARAM_HEADER_PTP(p) \
+	(((p)->parameter_table_pointer[2] << 16) | \
+	 ((p)->parameter_table_pointer[1] <<  8) | \
+	 ((p)->parameter_table_pointer[0] <<  0))
+
+#define SFDP_BFPT_ID		0xff00	/* Basic Flash Parameter Table */
+#define SFDP_SECTOR_MAP_ID	0xff81	/* Sector Map Table */
+
+#define SFDP_SIGNATURE		0x50444653U
+#define SFDP_JESD216_MAJOR	1
+#define SFDP_JESD216_MINOR	0
+#define SFDP_JESD216A_MINOR	5
+#define SFDP_JESD216B_MINOR	6
+
+struct sfdp_header {
+	u32		signature; /* Ox50444653U <=> "SFDP" */
+	u8		minor;
+	u8		major;
+	u8		nph; /* 0-base number of parameter headers */
+	u8		unused;
+
+	/* Basic Flash Parameter Table. */
+	struct sfdp_parameter_header	bfpt_header;
+};
+
+/* Basic Flash Parameter Table */
+
+/*
+ * JESD216 rev B defines a Basic Flash Parameter Table of 16 DWORDs.
+ * They are indexed from 1 but C arrays are indexed from 0.
+ */
+#define BFPT_DWORD(i)		((i) - 1)
+#define BFPT_DWORD_MAX		16
+
+/* The first version of JESB216 defined only 9 DWORDs. */
+#define BFPT_DWORD_MAX_JESD216			9
+
+/* 1st DWORD. */
+#define BFPT_DWORD1_FAST_READ_1_1_2		BIT(16)
+#define BFPT_DWORD1_ADDRESS_BYTES_MASK		GENMASK(18, 17)
+
+#define BFPT_DWORD1_ADDRESS_BYTES_3_ONLY	(0x0UL << 17)
+#define BFPT_DWORD1_ADDRESS_BYTES_3_OR_4	(0x1UL << 17)
+#define BFPT_DWORD1_ADDRESS_BYTES_4_ONLY	(0x2UL << 17)
+#define BFPT_DWORD1_DTR				BIT(19)
+#define BFPT_DWORD1_FAST_READ_1_2_2		BIT(20)
+#define BFPT_DWORD1_FAST_READ_1_4_4		BIT(21)
+#define BFPT_DWORD1_FAST_READ_1_1_4		BIT(22)
+
+/* 5th DWORD. */
+#define BFPT_DWORD5_FAST_READ_2_2_2		BIT(0)
+#define BFPT_DWORD5_FAST_READ_4_4_4		BIT(4)
+
+/* 11th DWORD. */
+#define BFPT_DWORD11_PAGE_SIZE_SHIFT		4
+#define BFPT_DWORD11_PAGE_SIZE_MASK		GENMASK(7, 4)
+
+/* 15th DWORD. */
+
+/*
+ * (from JESD216 rev B)
+ * Quad Enable Requirements (QER):
+ * - 000b: Device does not have a QE bit. Device detects 1-1-4 and 1-4-4
+ *         reads based on instruction. DQ3/HOLD# functions are hold during
+ *         instruction phase.
+ * - 001b: QE is bit 1 of status register 2. It is set via Write Status with
+ *         two data bytes where bit 1 of the second byte is one.
+ *         [...]
+ *         Writing only one byte to the status register has the side-effect of
+ *         clearing status register 2, including the QE bit. The 100b code is
+ *         used if writing one byte to the status register does not modify
+ *         status register 2.
+ * - 010b: QE is bit 6 of status register 1. It is set via Write Status with
+ *         one data byte where bit 6 is one.
+ *         [...]
+ * - 011b: QE is bit 7 of status register 2. It is set via Write status
+ *         register 2 instruction 3Eh with one data byte where bit 7 is one.
+ *         [...]
+ *         The status register 2 is read using instruction 3Fh.
+ * - 100b: QE is bit 1 of status register 2. It is set via Write Status with
+ *         two data bytes where bit 1 of the second byte is one.
+ *         [...]
+ *         In contrast to the 001b code, writing one byte to the status
+ *         register does not modify status register 2.
+ * - 101b: QE is bit 1 of status register 2. Status register 1 is read using
+ *         Read Status instruction 05h. Status register2 is read using
+ *         instruction 35h. QE is set via Writ Status instruction 01h with
+ *         two data bytes where bit 1 of the second byte is one.
+ *         [...]
+ */
+#define BFPT_DWORD15_QER_MASK			GENMASK(22, 20)
+#define BFPT_DWORD15_QER_NONE			(0x0UL << 20) /* Micron */
+#define BFPT_DWORD15_QER_SR2_BIT1_BUGGY		(0x1UL << 20)
+#define BFPT_DWORD15_QER_SR1_BIT6		(0x2UL << 20) /* Macronix */
+#define BFPT_DWORD15_QER_SR2_BIT7		(0x3UL << 20)
+#define BFPT_DWORD15_QER_SR2_BIT1_NO_RD		(0x4UL << 20)
+#define BFPT_DWORD15_QER_SR2_BIT1		(0x5UL << 20) /* Spansion */
+
+struct sfdp_bfpt {
+	u32	dwords[BFPT_DWORD_MAX];
+};
+
+/**
+ * struct spi_nor_fixups - SPI NOR fixup hooks
+ * @post_bfpt: called after the BFPT table has been parsed
+ * @post_sfdp: called after SFDP has been parsed (is also called for SPI NORs
+ *	       that do not support RDSFDP). Typically used to tweak various
+ *	       parameters that could not be extracted by other means (i.e.
+ *	       when information provided by the SFDP/flash_info tables are
+ *	       incomplete or wrong).
+ *
+ * Those hooks can be used to tweak the SPI NOR configuration when the SFDP
+ * table is broken or not available.
+ */
+struct spi_nor_fixups {
+	int (*post_bfpt)(struct spi_nor *nor,
+			 const struct sfdp_parameter_header *bfpt_header,
+			 const struct sfdp_bfpt *bfpt,
+			 struct spi_nor_flash_parameter *params);
+	int (*post_sfdp)(struct spi_nor *nor,
+			 struct spi_nor_flash_parameter *params);
+};
+
+struct flash_info {
+	char		*name;
+
+	/*
+	 * This array stores the ID bytes.
+	 * The first three bytes are the JEDIC ID.
+	 * JEDEC ID zero means "no ID" (mostly older chips).
+	 */
+	u8		id[SPI_NOR_MAX_ID_LEN];
+	u8		id_len;
+
+	/* The size listed here is what works with SPINOR_OP_SE, which isn't
+	 * necessarily called a "sector" by the vendor.
+	 */
+	unsigned	sector_size;
+	u16		n_sectors;
+
+	u16		page_size;
+	u16		addr_width;
+
+	u16		flags;
+#define SECT_4K			BIT(0)	/* SPINOR_OP_BE_4K works uniformly */
+#define SPI_NOR_NO_ERASE	BIT(1)	/* No erase command needed */
+#define SST_WRITE		BIT(2)	/* use SST byte programming */
+#define SPI_NOR_NO_FR		BIT(3)	/* Can't do fastread */
+#define SECT_4K_PMC		BIT(4)	/* SPINOR_OP_BE_4K_PMC works uniformly */
+#define SPI_NOR_DUAL_READ	BIT(5)	/* Flash supports Dual Read */
+#define SPI_NOR_QUAD_READ	BIT(6)	/* Flash supports Quad Read */
+#define USE_FSR			BIT(7)	/* use flag status register */
+#define SPI_NOR_HAS_LOCK	BIT(8)	/* Flash supports lock/unlock via SR */
+#define SPI_NOR_HAS_TB		BIT(9)	/*
+					 * Flash SR has Top/Bottom (TB) protect
+					 * bit. Must be used with
+					 * SPI_NOR_HAS_LOCK.
+					 */
+#define SPI_NOR_XSR_RDY		BIT(10)	/*
+					 * S3AN flashes have specific opcode to
+					 * read the status register.
+					 * Flags SPI_NOR_XSR_RDY and SPI_S3AN
+					 * use the same bit as one implies the
+					 * other, but we will get rid of
+					 * SPI_S3AN soon.
+					 */
+#define	SPI_S3AN		BIT(10)	/*
+					 * Xilinx Spartan 3AN In-System Flash
+					 * (MFR cannot be used for probing
+					 * because it has the same value as
+					 * ATMEL flashes)
+					 */
+#define SPI_NOR_4B_OPCODES	BIT(11)	/*
+					 * Use dedicated 4byte address op codes
+					 * to support memory size above 128Mib.
+					 */
+#define NO_CHIP_ERASE		BIT(12) /* Chip does not support chip erase */
+#define SPI_NOR_SKIP_SFDP	BIT(13)	/* Skip parsing of SFDP tables */
+#define USE_CLSR		BIT(14)	/* use CLSR command */
+
+	/* Part specific fixup hooks. */
+	const struct spi_nor_fixups *fixups;
+};
+
+/* Used when the "_ext_id" is two bytes at most */
+#define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
+		.id = {							\
+			((_jedec_id) >> 16) & 0xff,			\
+			((_jedec_id) >> 8) & 0xff,			\
+			(_jedec_id) & 0xff,				\
+			((_ext_id) >> 8) & 0xff,			\
+			(_ext_id) & 0xff,				\
+			},						\
+		.id_len = (!(_jedec_id) ? 0 : (3 + ((_ext_id) ? 2 : 0))),	\
+		.sector_size = (_sector_size),				\
+		.n_sectors = (_n_sectors),				\
+		.page_size = 256,					\
+		.flags = (_flags),
+
+#define INFO6(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
+		.id = {							\
+			((_jedec_id) >> 16) & 0xff,			\
+			((_jedec_id) >> 8) & 0xff,			\
+			(_jedec_id) & 0xff,				\
+			((_ext_id) >> 16) & 0xff,			\
+			((_ext_id) >> 8) & 0xff,			\
+			(_ext_id) & 0xff,				\
+			},						\
+		.id_len = 6,						\
+		.sector_size = (_sector_size),				\
+		.n_sectors = (_n_sectors),				\
+		.page_size = 256,					\
+		.flags = (_flags),
+
+#define CAT25_INFO(_sector_size, _n_sectors, _page_size, _addr_width, _flags)	\
+		.sector_size = (_sector_size),				\
+		.n_sectors = (_n_sectors),				\
+		.page_size = (_page_size),				\
+		.addr_width = (_addr_width),				\
+		.flags = (_flags),
+
+#define S3AN_INFO(_jedec_id, _n_sectors, _page_size)			\
+		.id = {							\
+			((_jedec_id) >> 16) & 0xff,			\
+			((_jedec_id) >> 8) & 0xff,			\
+			(_jedec_id) & 0xff				\
+			},						\
+		.id_len = 3,						\
+		.sector_size = (8*_page_size),				\
+		.n_sectors = (_n_sectors),				\
+		.page_size = _page_size,				\
+		.addr_width = 3,					\
+		.flags = SPI_NOR_NO_FR | SPI_S3AN,
+
+#endif /* __LINUX_MTD_SPI_NOR_INTERNALS_H */
-- 
2.17.1
