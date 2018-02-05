Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eioqg-0008W9-P2
 for linux-mtd@lists.infradead.org; Mon, 05 Feb 2018 22:03:40 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Cc: Peter Pan <peterpansjtu@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>
Subject: [PATCH v7 6/7] mtd: nand: move raw NAND related code to the raw/
 subdir
Date: Mon,  5 Feb 2018 23:02:04 +0100
Message-Id: <20180205220205.3528-7-boris.brezillon@bootlin.com>
In-Reply-To: <20180205220205.3528-1-boris.brezillon@bootlin.com>
References: <20180205220205.3528-1-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Boris Brezillon <boris.brezillon@free-electrons.com>

As part of the process of sharing more code between different NAND
based devices, we need to move all raw NAND related code to the raw/
subdirectory.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 Documentation/arm/Samsung-S3C24XX/S3C2412.txt      |   2 +-
 Documentation/driver-api/mtdnand.rst               |   8 +-
 Documentation/gpio/drivers-on-gpio.txt             |   4 +-
 MAINTAINERS                                        |  22 +-
 drivers/mtd/nand/Kconfig                           | 581 +--------------------
 drivers/mtd/nand/Makefile                          |  67 +--
 drivers/mtd/nand/raw/Kconfig                       | 580 ++++++++++++++++++++
 drivers/mtd/nand/raw/Makefile                      |  68 +++
 drivers/mtd/nand/{ => raw}/ams-delta.c             |   0
 drivers/mtd/nand/{ => raw}/atmel/Makefile          |   0
 drivers/mtd/nand/{ => raw}/atmel/nand-controller.c |   0
 drivers/mtd/nand/{ => raw}/atmel/pmecc.c           |   0
 drivers/mtd/nand/{ => raw}/atmel/pmecc.h           |   0
 drivers/mtd/nand/{ => raw}/au1550nd.c              |   0
 drivers/mtd/nand/{ => raw}/bcm47xxnflash/Makefile  |   0
 .../nand/{ => raw}/bcm47xxnflash/bcm47xxnflash.h   |   0
 drivers/mtd/nand/{ => raw}/bcm47xxnflash/main.c    |   0
 .../mtd/nand/{ => raw}/bcm47xxnflash/ops_bcm4706.c |   0
 drivers/mtd/nand/{ => raw}/bf5xx_nand.c            |   0
 drivers/mtd/nand/{ => raw}/brcmnand/Makefile       |   0
 .../mtd/nand/{ => raw}/brcmnand/bcm63138_nand.c    |   0
 drivers/mtd/nand/{ => raw}/brcmnand/bcm6368_nand.c |   0
 drivers/mtd/nand/{ => raw}/brcmnand/brcmnand.c     |   0
 drivers/mtd/nand/{ => raw}/brcmnand/brcmnand.h     |   0
 drivers/mtd/nand/{ => raw}/brcmnand/brcmstb_nand.c |   0
 drivers/mtd/nand/{ => raw}/brcmnand/iproc_nand.c   |   0
 drivers/mtd/nand/{ => raw}/cafe_nand.c             |   0
 drivers/mtd/nand/{ => raw}/cmx270_nand.c           |   0
 drivers/mtd/nand/{ => raw}/cs553x_nand.c           |   0
 drivers/mtd/nand/{ => raw}/davinci_nand.c          |   0
 drivers/mtd/nand/{ => raw}/denali.c                |   0
 drivers/mtd/nand/{ => raw}/denali.h                |   0
 drivers/mtd/nand/{ => raw}/denali_dt.c             |   0
 drivers/mtd/nand/{ => raw}/denali_pci.c            |   0
 drivers/mtd/nand/{ => raw}/diskonchip.c            |   0
 drivers/mtd/nand/{ => raw}/docg4.c                 |   0
 drivers/mtd/nand/{ => raw}/fsl_elbc_nand.c         |   0
 drivers/mtd/nand/{ => raw}/fsl_ifc_nand.c          |   0
 drivers/mtd/nand/{ => raw}/fsl_upm.c               |   0
 drivers/mtd/nand/{ => raw}/fsmc_nand.c             |   0
 drivers/mtd/nand/{ => raw}/gpio.c                  |   0
 drivers/mtd/nand/{ => raw}/gpmi-nand/Makefile      |   0
 drivers/mtd/nand/{ => raw}/gpmi-nand/bch-regs.h    |   0
 drivers/mtd/nand/{ => raw}/gpmi-nand/gpmi-lib.c    |   0
 drivers/mtd/nand/{ => raw}/gpmi-nand/gpmi-nand.c   |   0
 drivers/mtd/nand/{ => raw}/gpmi-nand/gpmi-nand.h   |   0
 drivers/mtd/nand/{ => raw}/gpmi-nand/gpmi-regs.h   |   0
 drivers/mtd/nand/{ => raw}/hisi504_nand.c          |   0
 drivers/mtd/nand/{ => raw}/jz4740_nand.c           |   0
 drivers/mtd/nand/{ => raw}/jz4780_bch.c            |   0
 drivers/mtd/nand/{ => raw}/jz4780_bch.h            |   0
 drivers/mtd/nand/{ => raw}/jz4780_nand.c           |   0
 drivers/mtd/nand/{ => raw}/lpc32xx_mlc.c           |   0
 drivers/mtd/nand/{ => raw}/lpc32xx_slc.c           |   0
 drivers/mtd/nand/{ => raw}/marvell_nand.c          |   0
 drivers/mtd/nand/{ => raw}/mpc5121_nfc.c           |   0
 drivers/mtd/nand/{ => raw}/mtk_ecc.c               |   0
 drivers/mtd/nand/{ => raw}/mtk_ecc.h               |   0
 drivers/mtd/nand/{ => raw}/mtk_nand.c              |   0
 drivers/mtd/nand/{ => raw}/mxc_nand.c              |   0
 drivers/mtd/nand/{ => raw}/nand_amd.c              |   0
 drivers/mtd/nand/{ => raw}/nand_base.c             |   0
 drivers/mtd/nand/{ => raw}/nand_bbt.c              |   0
 drivers/mtd/nand/{ => raw}/nand_bch.c              |   0
 drivers/mtd/nand/{ => raw}/nand_ecc.c              |   0
 drivers/mtd/nand/{ => raw}/nand_hynix.c            |   0
 drivers/mtd/nand/{ => raw}/nand_ids.c              |   0
 drivers/mtd/nand/{ => raw}/nand_macronix.c         |   0
 drivers/mtd/nand/{ => raw}/nand_micron.c           |   0
 drivers/mtd/nand/{ => raw}/nand_samsung.c          |   0
 drivers/mtd/nand/{ => raw}/nand_timings.c          |   0
 drivers/mtd/nand/{ => raw}/nand_toshiba.c          |   0
 drivers/mtd/nand/{ => raw}/nandsim.c               |   0
 drivers/mtd/nand/{ => raw}/ndfc.c                  |   0
 drivers/mtd/nand/{ => raw}/nuc900_nand.c           |   0
 drivers/mtd/nand/{ => raw}/omap2.c                 |   0
 drivers/mtd/nand/{ => raw}/omap_elm.c              |   0
 drivers/mtd/nand/{ => raw}/orion_nand.c            |   0
 drivers/mtd/nand/{ => raw}/oxnas_nand.c            |   0
 drivers/mtd/nand/{ => raw}/pasemi_nand.c           |   0
 drivers/mtd/nand/{ => raw}/plat_nand.c             |   0
 drivers/mtd/nand/{ => raw}/pxa3xx_nand.c           |   0
 drivers/mtd/nand/{ => raw}/qcom_nandc.c            |   0
 drivers/mtd/nand/{ => raw}/r852.c                  |   0
 drivers/mtd/nand/{ => raw}/r852.h                  |   0
 drivers/mtd/nand/{ => raw}/s3c2410.c               |   0
 drivers/mtd/nand/{ => raw}/sh_flctl.c              |   0
 drivers/mtd/nand/{ => raw}/sharpsl.c               |   0
 drivers/mtd/nand/{ => raw}/sm_common.c             |   0
 drivers/mtd/nand/{ => raw}/sm_common.h             |   0
 drivers/mtd/nand/{ => raw}/socrates_nand.c         |   0
 drivers/mtd/nand/{ => raw}/sunxi_nand.c            |   0
 drivers/mtd/nand/{ => raw}/tango_nand.c            |   0
 drivers/mtd/nand/{ => raw}/tmio_nand.c             |   0
 drivers/mtd/nand/{ => raw}/txx9ndfmc.c             |   0
 drivers/mtd/nand/{ => raw}/vf610_nfc.c             |   0
 drivers/mtd/nand/{ => raw}/xway_nand.c             |   0
 drivers/mtd/sm_ftl.c                               |   2 +-
 98 files changed, 669 insertions(+), 665 deletions(-)
 create mode 100644 drivers/mtd/nand/raw/Kconfig
 create mode 100644 drivers/mtd/nand/raw/Makefile
 rename drivers/mtd/nand/{ => raw}/ams-delta.c (100%)
 rename drivers/mtd/nand/{ => raw}/atmel/Makefile (100%)
 rename drivers/mtd/nand/{ => raw}/atmel/nand-controller.c (100%)
 rename drivers/mtd/nand/{ => raw}/atmel/pmecc.c (100%)
 rename drivers/mtd/nand/{ => raw}/atmel/pmecc.h (100%)
 rename drivers/mtd/nand/{ => raw}/au1550nd.c (100%)
 rename drivers/mtd/nand/{ => raw}/bcm47xxnflash/Makefile (100%)
 rename drivers/mtd/nand/{ => raw}/bcm47xxnflash/bcm47xxnflash.h (100%)
 rename drivers/mtd/nand/{ => raw}/bcm47xxnflash/main.c (100%)
 rename drivers/mtd/nand/{ => raw}/bcm47xxnflash/ops_bcm4706.c (100%)
 rename drivers/mtd/nand/{ => raw}/bf5xx_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/brcmnand/Makefile (100%)
 rename drivers/mtd/nand/{ => raw}/brcmnand/bcm63138_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/brcmnand/bcm6368_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/brcmnand/brcmnand.c (100%)
 rename drivers/mtd/nand/{ => raw}/brcmnand/brcmnand.h (100%)
 rename drivers/mtd/nand/{ => raw}/brcmnand/brcmstb_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/brcmnand/iproc_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/cafe_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/cmx270_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/cs553x_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/davinci_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/denali.c (100%)
 rename drivers/mtd/nand/{ => raw}/denali.h (100%)
 rename drivers/mtd/nand/{ => raw}/denali_dt.c (100%)
 rename drivers/mtd/nand/{ => raw}/denali_pci.c (100%)
 rename drivers/mtd/nand/{ => raw}/diskonchip.c (100%)
 rename drivers/mtd/nand/{ => raw}/docg4.c (100%)
 rename drivers/mtd/nand/{ => raw}/fsl_elbc_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/fsl_ifc_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/fsl_upm.c (100%)
 rename drivers/mtd/nand/{ => raw}/fsmc_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/gpio.c (100%)
 rename drivers/mtd/nand/{ => raw}/gpmi-nand/Makefile (100%)
 rename drivers/mtd/nand/{ => raw}/gpmi-nand/bch-regs.h (100%)
 rename drivers/mtd/nand/{ => raw}/gpmi-nand/gpmi-lib.c (100%)
 rename drivers/mtd/nand/{ => raw}/gpmi-nand/gpmi-nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/gpmi-nand/gpmi-nand.h (100%)
 rename drivers/mtd/nand/{ => raw}/gpmi-nand/gpmi-regs.h (100%)
 rename drivers/mtd/nand/{ => raw}/hisi504_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/jz4740_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/jz4780_bch.c (100%)
 rename drivers/mtd/nand/{ => raw}/jz4780_bch.h (100%)
 rename drivers/mtd/nand/{ => raw}/jz4780_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/lpc32xx_mlc.c (100%)
 rename drivers/mtd/nand/{ => raw}/lpc32xx_slc.c (100%)
 rename drivers/mtd/nand/{ => raw}/marvell_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/mpc5121_nfc.c (100%)
 rename drivers/mtd/nand/{ => raw}/mtk_ecc.c (100%)
 rename drivers/mtd/nand/{ => raw}/mtk_ecc.h (100%)
 rename drivers/mtd/nand/{ => raw}/mtk_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/mxc_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/nand_amd.c (100%)
 rename drivers/mtd/nand/{ => raw}/nand_base.c (100%)
 rename drivers/mtd/nand/{ => raw}/nand_bbt.c (100%)
 rename drivers/mtd/nand/{ => raw}/nand_bch.c (100%)
 rename drivers/mtd/nand/{ => raw}/nand_ecc.c (100%)
 rename drivers/mtd/nand/{ => raw}/nand_hynix.c (100%)
 rename drivers/mtd/nand/{ => raw}/nand_ids.c (100%)
 rename drivers/mtd/nand/{ => raw}/nand_macronix.c (100%)
 rename drivers/mtd/nand/{ => raw}/nand_micron.c (100%)
 rename drivers/mtd/nand/{ => raw}/nand_samsung.c (100%)
 rename drivers/mtd/nand/{ => raw}/nand_timings.c (100%)
 rename drivers/mtd/nand/{ => raw}/nand_toshiba.c (100%)
 rename drivers/mtd/nand/{ => raw}/nandsim.c (100%)
 rename drivers/mtd/nand/{ => raw}/ndfc.c (100%)
 rename drivers/mtd/nand/{ => raw}/nuc900_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/omap2.c (100%)
 rename drivers/mtd/nand/{ => raw}/omap_elm.c (100%)
 rename drivers/mtd/nand/{ => raw}/orion_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/oxnas_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/pasemi_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/plat_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/pxa3xx_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/qcom_nandc.c (100%)
 rename drivers/mtd/nand/{ => raw}/r852.c (100%)
 rename drivers/mtd/nand/{ => raw}/r852.h (100%)
 rename drivers/mtd/nand/{ => raw}/s3c2410.c (100%)
 rename drivers/mtd/nand/{ => raw}/sh_flctl.c (100%)
 rename drivers/mtd/nand/{ => raw}/sharpsl.c (100%)
 rename drivers/mtd/nand/{ => raw}/sm_common.c (100%)
 rename drivers/mtd/nand/{ => raw}/sm_common.h (100%)
 rename drivers/mtd/nand/{ => raw}/socrates_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/sunxi_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/tango_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/tmio_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/txx9ndfmc.c (100%)
 rename drivers/mtd/nand/{ => raw}/vf610_nfc.c (100%)
 rename drivers/mtd/nand/{ => raw}/xway_nand.c (100%)

diff --git a/Documentation/arm/Samsung-S3C24XX/S3C2412.txt b/Documentation/arm/Samsung-S3C24XX/S3C2412.txt
index f057876b920b..dc1fd362d3c1 100644
--- a/Documentation/arm/Samsung-S3C24XX/S3C2412.txt
+++ b/Documentation/arm/Samsung-S3C24XX/S3C2412.txt
@@ -46,7 +46,7 @@ NAND
 ----
 
   The NAND hardware is similar to the S3C2440, and is supported by the
-  s3c2410 driver in the drivers/mtd/nand directory.
+  s3c2410 driver in the drivers/mtd/nand/raw directory.
 
 
 USB Host
diff --git a/Documentation/driver-api/mtdnand.rst b/Documentation/driver-api/mtdnand.rst
index 2a5191b6d445..dcd63599f700 100644
--- a/Documentation/driver-api/mtdnand.rst
+++ b/Documentation/driver-api/mtdnand.rst
@@ -967,10 +967,10 @@ API functions which are exported. Each function has a short description
 which is marked with an [XXX] identifier. See the chapter "Documentation
 hints" for an explanation.
 
-.. kernel-doc:: drivers/mtd/nand/nand_base.c
+.. kernel-doc:: drivers/mtd/nand/raw/nand_base.c
    :export:
 
-.. kernel-doc:: drivers/mtd/nand/nand_ecc.c
+.. kernel-doc:: drivers/mtd/nand/raw/nand_ecc.c
    :export:
 
 Internal Functions Provided
@@ -982,10 +982,10 @@ marked with an [XXX] identifier. See the chapter "Documentation hints"
 for an explanation. The functions marked with [DEFAULT] might be
 relevant for a board driver developer.
 
-.. kernel-doc:: drivers/mtd/nand/nand_base.c
+.. kernel-doc:: drivers/mtd/nand/raw/nand_base.c
    :internal:
 
-.. kernel-doc:: drivers/mtd/nand/nand_bbt.c
+.. kernel-doc:: drivers/mtd/nand/raw/nand_bbt.c
    :internal:
 
 Credits
diff --git a/Documentation/gpio/drivers-on-gpio.txt b/Documentation/gpio/drivers-on-gpio.txt
index 9a78d385b92e..7c3e0fed5ed8 100644
--- a/Documentation/gpio/drivers-on-gpio.txt
+++ b/Documentation/gpio/drivers-on-gpio.txt
@@ -79,8 +79,8 @@ hardware descriptions such as device tree or ACPI:
   it from 1-to-0-to-1. If that hardware does not receive its "ping"
   periodically, it will reset the system.
 
-- gpio-nand: drivers/mtd/nand/gpio.c is used to connect a NAND flash chip to
-  a set of simple GPIO lines: RDY, NCE, ALE, CLE, NWP. It interacts with the
+- gpio-nand: drivers/mtd/nand/raw/gpio.c is used to connect a NAND flash chip
+  to a set of simple GPIO lines: RDY, NCE, ALE, CLE, NWP. It interacts with the
   NAND flash MTD subsystem and provides chip access and partition parsing like
   any other NAND driving hardware.
 
diff --git a/MAINTAINERS b/MAINTAINERS
index 48ae3a43ed0f..cd549f847bba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1654,7 +1654,7 @@ F:	drivers/input/keyboard/w90p910_keypad.c
 F:	drivers/input/touchscreen/w90p910_ts.c
 F:	drivers/watchdog/nuc900_wdt.c
 F:	drivers/net/ethernet/nuvoton/w90p910_ether.c
-F:	drivers/mtd/nand/nuc900_nand.c
+F:	drivers/mtd/nand/raw/nuc900_nand.c
 F:	drivers/rtc/rtc-nuc900.c
 F:	drivers/spi/spi-nuc900.c
 F:	drivers/usb/host/ehci-w90x900.c
@@ -2997,7 +2997,7 @@ M:	Kamal Dasu <kdasu.kdev@gmail.com>
 L:	linux-mtd@lists.infradead.org
 L:	bcm-kernel-feedback-list@broadcom.com
 S:	Maintained
-F:	drivers/mtd/nand/brcmnand/
+F:	drivers/mtd/nand/raw/brcmnand/
 
 BROADCOM STB DPFE DRIVER
 M:	Markus Mayer <mmayer@broadcom.com>
@@ -4099,7 +4099,7 @@ DENALI NAND DRIVER
 M:	Masahiro Yamada <yamada.masahiro@socionext.com>
 L:	linux-mtd@lists.infradead.org
 S:	Supported
-F:	drivers/mtd/nand/denali*
+F:	drivers/mtd/nand/raw/denali*
 
 DESIGNWARE USB2 DRD IP DRIVER
 M:	John Youn <johnyoun@synopsys.com>
@@ -5594,7 +5594,7 @@ FREESCALE GPMI NAND DRIVER
 M:	Han Xu <han.xu@nxp.com>
 L:	linux-mtd@lists.infradead.org
 S:	Maintained
-F:	drivers/mtd/nand/gpmi-nand/*
+F:	drivers/mtd/nand/raw/gpmi-nand/*
 
 FREESCALE I2C CPM DRIVER
 M:	Jochen Friedrich <jochen@scram.de>
@@ -6899,7 +6899,7 @@ INGENIC JZ4780 NAND DRIVER
 M:	Harvey Hunt <harveyhuntnexus@gmail.com>
 L:	linux-mtd@lists.infradead.org
 S:	Maintained
-F:	drivers/mtd/nand/jz4780_*
+F:	drivers/mtd/nand/raw/jz4780_*
 
 INOTIFY
 M:	Jan Kara <jack@suse.cz>
@@ -8406,7 +8406,7 @@ MARVELL NAND CONTROLLER DRIVER
 M:	Miquel Raynal <miquel.raynal@free-electrons.com>
 L:	linux-mtd@lists.infradead.org
 S:	Maintained
-F:	drivers/mtd/nand/marvell_nand.c
+F:	drivers/mtd/nand/raw/marvell_nand.c
 F:	Documentation/devicetree/bindings/mtd/marvell-nand.txt
 
 MARVELL SOC MMC/SD/SDIO CONTROLLER DRIVER
@@ -9050,7 +9050,7 @@ M:	Wenyou Yang <wenyou.yang@microchip.com>
 M:	Josh Wu <rainyfeeling@outlook.com>
 L:	linux-mtd@lists.infradead.org
 S:	Supported
-F:	drivers/mtd/nand/atmel/*
+F:	drivers/mtd/nand/raw/atmel/*
 F:	Documentation/devicetree/bindings/mtd/atmel-nand.txt
 
 MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER
@@ -11170,7 +11170,7 @@ PXA3xx NAND FLASH DRIVER
 M:	Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
 L:	linux-mtd@lists.infradead.org
 S:	Maintained
-F:	drivers/mtd/nand/pxa3xx_nand.c
+F:	drivers/mtd/nand/raw/pxa3xx_nand.c
 
 QAT DRIVER
 M:	Giovanni Cabiddu <giovanni.cabiddu@intel.com>
@@ -11654,8 +11654,8 @@ F:	drivers/memstick/host/r592.*
 RICOH SMARTMEDIA/XD DRIVER
 M:	Maxim Levitsky <maximlevitsky@gmail.com>
 S:	Maintained
-F:	drivers/mtd/nand/r852.c
-F:	drivers/mtd/nand/r852.h
+F:	drivers/mtd/nand/raw/r852.c
+F:	drivers/mtd/nand/raw/r852.h
 
 RISC-V ARCHITECTURE
 M:	Palmer Dabbelt <palmer@sifive.com>
@@ -14363,7 +14363,7 @@ VF610 NAND DRIVER
 M:	Stefan Agner <stefan@agner.ch>
 L:	linux-mtd@lists.infradead.org
 S:	Supported
-F:	drivers/mtd/nand/vf610_nfc.c
+F:	drivers/mtd/nand/raw/vf610_nfc.c
 
 VFAT/FAT/MSDOS FILESYSTEM
 M:	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index e6b8c59f2c0d..6d5373471809 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -1,580 +1 @@
-config MTD_NAND_ECC
-	tristate
-
-config MTD_NAND_ECC_SMC
-	bool "NAND ECC Smart Media byte order"
-	depends on MTD_NAND_ECC
-	default n
-	help
-	  Software ECC according to the Smart Media Specification.
-	  The original Linux implementation had byte 0 and 1 swapped.
-
-
-menuconfig MTD_NAND
-	tristate "NAND Device Support"
-	depends on MTD
-	select MTD_NAND_ECC
-	help
-	  This enables support for accessing all type of NAND flash
-	  devices. For further information see
-	  <http://www.linux-mtd.infradead.org/doc/nand.html>.
-
-if MTD_NAND
-
-config MTD_NAND_BCH
-	tristate
-	select BCH
-	depends on MTD_NAND_ECC_BCH
-	default MTD_NAND
-
-config MTD_NAND_ECC_BCH
-	bool "Support software BCH ECC"
-	default n
-	help
-	  This enables support for software BCH error correction. Binary BCH
-	  codes are more powerful and cpu intensive than traditional Hamming
-	  ECC codes. They are used with NAND devices requiring more than 1 bit
-	  of error correction.
-
-config MTD_SM_COMMON
-	tristate
-	default n
-
-config MTD_NAND_DENALI
-	tristate
-
-config MTD_NAND_DENALI_PCI
-        tristate "Support Denali NAND controller on Intel Moorestown"
-	select MTD_NAND_DENALI
-	depends on HAS_DMA && PCI
-        help
-          Enable the driver for NAND flash on Intel Moorestown, using the
-          Denali NAND controller core.
-
-config MTD_NAND_DENALI_DT
-	tristate "Support Denali NAND controller as a DT device"
-	select MTD_NAND_DENALI
-	depends on HAS_DMA && HAVE_CLK && OF
-	help
-	  Enable the driver for NAND flash on platforms using a Denali NAND
-	  controller as a DT device.
-
-config MTD_NAND_GPIO
-	tristate "GPIO assisted NAND Flash driver"
-	depends on GPIOLIB || COMPILE_TEST
-	depends on HAS_IOMEM
-	help
-	  This enables a NAND flash driver where control signals are
-	  connected to GPIO pins, and commands and data are communicated
-	  via a memory mapped interface.
-
-config MTD_NAND_AMS_DELTA
-	tristate "NAND Flash device on Amstrad E3"
-	depends on MACH_AMS_DELTA
-	default y
-	help
-	  Support for NAND flash on Amstrad E3 (Delta).
-
-config MTD_NAND_OMAP2
-	tristate "NAND Flash device on OMAP2, OMAP3, OMAP4 and Keystone"
-	depends on (ARCH_OMAP2PLUS || ARCH_KEYSTONE)
-	help
-          Support for NAND flash on Texas Instruments OMAP2, OMAP3, OMAP4
-	  and Keystone platforms.
-
-config MTD_NAND_OMAP_BCH
-	depends on MTD_NAND_OMAP2
-	bool "Support hardware based BCH error correction"
-	default n
-	select BCH
-	help
-	  This config enables the ELM hardware engine, which can be used to
-	  locate and correct errors when using BCH ECC scheme. This offloads
-	  the cpu from doing ECC error searching and correction. However some
-	  legacy OMAP families like OMAP2xxx, OMAP3xxx do not have ELM engine
-	  so this is optional for them.
-
-config MTD_NAND_OMAP_BCH_BUILD
-	def_tristate MTD_NAND_OMAP2 && MTD_NAND_OMAP_BCH
-
-config MTD_NAND_RICOH
-	tristate "Ricoh xD card reader"
-	default n
-	depends on PCI
-	select MTD_SM_COMMON
-	help
-	  Enable support for Ricoh R5C852 xD card reader
-	  You also need to enable ether
-	  NAND SSFDC (SmartMedia) read only translation layer' or new
-	  expermental, readwrite
-	  'SmartMedia/xD new translation layer'
-
-config MTD_NAND_AU1550
-	tristate "Au1550/1200 NAND support"
-	depends on MIPS_ALCHEMY
-	help
-	  This enables the driver for the NAND flash controller on the
-	  AMD/Alchemy 1550 SOC.
-
-config MTD_NAND_BF5XX
-	tristate "Blackfin on-chip NAND Flash Controller driver"
-	depends on BF54x || BF52x
-	help
-	  This enables the Blackfin on-chip NAND flash controller
-
-	  No board specific support is done by this driver, each board
-	  must advertise a platform_device for the driver to attach.
-
-	  This driver can also be built as a module. If so, the module
-	  will be called bf5xx-nand.
-
-config MTD_NAND_BF5XX_HWECC
-	bool "BF5XX NAND Hardware ECC"
-	default y
-	depends on MTD_NAND_BF5XX
-	help
-	  Enable the use of the BF5XX's internal ECC generator when
-	  using NAND.
-
-config MTD_NAND_BF5XX_BOOTROM_ECC
-	bool "Use Blackfin BootROM ECC Layout"
-	default n
-	depends on MTD_NAND_BF5XX_HWECC
-	help
-	  If you wish to modify NAND pages and allow the Blackfin on-chip
-	  BootROM to boot from them, say Y here.  This is only necessary
-	  if you are booting U-Boot out of NAND and you wish to update
-	  U-Boot from Linux' userspace.  Otherwise, you should say N here.
-
-	  If unsure, say N.
-
-config MTD_NAND_S3C2410
-	tristate "NAND Flash support for Samsung S3C SoCs"
-	depends on ARCH_S3C24XX || ARCH_S3C64XX
-	help
-	  This enables the NAND flash controller on the S3C24xx and S3C64xx
-	  SoCs
-
-	  No board specific support is done by this driver, each board
-	  must advertise a platform_device for the driver to attach.
-
-config MTD_NAND_S3C2410_DEBUG
-	bool "Samsung S3C NAND driver debug"
-	depends on MTD_NAND_S3C2410
-	help
-	  Enable debugging of the S3C NAND driver
-
-config MTD_NAND_NDFC
-	tristate "NDFC NanD Flash Controller"
-	depends on 4xx
-	select MTD_NAND_ECC_SMC
-	help
-	 NDFC Nand Flash Controllers are integrated in IBM/AMCC's 4xx SoCs
-
-config MTD_NAND_S3C2410_CLKSTOP
-	bool "Samsung S3C NAND IDLE clock stop"
-	depends on MTD_NAND_S3C2410
-	default n
-	help
-	  Stop the clock to the NAND controller when there is no chip
-	  selected to save power. This will mean there is a small delay
-	  when the is NAND chip selected or released, but will save
-	  approximately 5mA of power when there is nothing happening.
-
-config MTD_NAND_TANGO
-	tristate "NAND Flash support for Tango chips"
-	depends on ARCH_TANGO || COMPILE_TEST
-	depends on HAS_DMA
-	help
-	  Enables the NAND Flash controller on Tango chips.
-
-config MTD_NAND_DISKONCHIP
-	tristate "DiskOnChip 2000, Millennium and Millennium Plus (NAND reimplementation)"
-	depends on HAS_IOMEM
-	select REED_SOLOMON
-	select REED_SOLOMON_DEC16
-	help
-	  This is a reimplementation of M-Systems DiskOnChip 2000,
-	  Millennium and Millennium Plus as a standard NAND device driver,
-	  as opposed to the earlier self-contained MTD device drivers.
-	  This should enable, among other things, proper JFFS2 operation on
-	  these devices.
-
-config MTD_NAND_DISKONCHIP_PROBE_ADVANCED
-        bool "Advanced detection options for DiskOnChip"
-        depends on MTD_NAND_DISKONCHIP
-        help
-          This option allows you to specify nonstandard address at which to
-          probe for a DiskOnChip, or to change the detection options.  You
-          are unlikely to need any of this unless you are using LinuxBIOS.
-          Say 'N'.
-
-config MTD_NAND_DISKONCHIP_PROBE_ADDRESS
-        hex "Physical address of DiskOnChip" if MTD_NAND_DISKONCHIP_PROBE_ADVANCED
-        depends on MTD_NAND_DISKONCHIP
-        default "0"
-        ---help---
-        By default, the probe for DiskOnChip devices will look for a
-        DiskOnChip at every multiple of 0x2000 between 0xC8000 and 0xEE000.
-        This option allows you to specify a single address at which to probe
-        for the device, which is useful if you have other devices in that
-        range which get upset when they are probed.
-
-        (Note that on PowerPC, the normal probe will only check at
-        0xE4000000.)
-
-        Normally, you should leave this set to zero, to allow the probe at
-        the normal addresses.
-
-config MTD_NAND_DISKONCHIP_PROBE_HIGH
-        bool "Probe high addresses"
-        depends on MTD_NAND_DISKONCHIP_PROBE_ADVANCED
-        help
-          By default, the probe for DiskOnChip devices will look for a
-          DiskOnChip at every multiple of 0x2000 between 0xC8000 and 0xEE000.
-          This option changes to make it probe between 0xFFFC8000 and
-          0xFFFEE000.  Unless you are using LinuxBIOS, this is unlikely to be
-          useful to you.  Say 'N'.
-
-config MTD_NAND_DISKONCHIP_BBTWRITE
-	bool "Allow BBT writes on DiskOnChip Millennium and 2000TSOP"
-	depends on MTD_NAND_DISKONCHIP
-	help
-	  On DiskOnChip devices shipped with the INFTL filesystem (Millennium
-	  and 2000 TSOP/Alon), Linux reserves some space at the end of the
-	  device for the Bad Block Table (BBT).  If you have existing INFTL
-	  data on your device (created by non-Linux tools such as M-Systems'
-	  DOS drivers), your data might overlap the area Linux wants to use for
-	  the BBT.  If this is a concern for you, leave this option disabled and
-	  Linux will not write BBT data into this area.
-	  The downside of leaving this option disabled is that if bad blocks
-	  are detected by Linux, they will not be recorded in the BBT, which
-	  could cause future problems.
-	  Once you enable this option, new filesystems (INFTL or others, created
-	  in Linux or other operating systems) will not use the reserved area.
-	  The only reason not to enable this option is to prevent damage to
-	  preexisting filesystems.
-	  Even if you leave this disabled, you can enable BBT writes at module
-	  load time (assuming you build diskonchip as a module) with the module
-	  parameter "inftl_bbt_write=1".
-
-config MTD_NAND_DOCG4
-	tristate "Support for DiskOnChip G4"
-	depends on HAS_IOMEM
-	select BCH
-	select BITREVERSE
-	help
-	  Support for diskonchip G4 nand flash, found in various smartphones and
-	  PDAs, among them the Palm Treo680, HTC Prophet and Wizard, Toshiba
-	  Portege G900, Asus P526, and O2 XDA Zinc.
-
-	  With this driver you will be able to use UBI and create a ubifs on the
-	  device, so you may wish to consider enabling UBI and UBIFS as well.
-
-	  These devices ship with the Mys/Sandisk SAFTL formatting, for which
-	  there is currently no mtd parser, so you may want to use command line
-	  partitioning to segregate write-protected blocks. On the Treo680, the
-	  first five erase blocks (256KiB each) are write-protected, followed
-	  by the block containing the saftl partition table.  This is probably
-	  typical.
-
-config MTD_NAND_SHARPSL
-	tristate "Support for NAND Flash on Sharp SL Series (C7xx + others)"
-	depends on ARCH_PXA
-
-config MTD_NAND_CAFE
-	tristate "NAND support for OLPC CAFÉ chip"
-	depends on PCI
-	select REED_SOLOMON
-	select REED_SOLOMON_DEC16
-	help
-	  Use NAND flash attached to the CAFÉ chip designed for the OLPC
-	  laptop.
-
-config MTD_NAND_CS553X
-	tristate "NAND support for CS5535/CS5536 (AMD Geode companion chip)"
-	depends on X86_32
-	depends on !UML && HAS_IOMEM
-	help
-	  The CS553x companion chips for the AMD Geode processor
-	  include NAND flash controllers with built-in hardware ECC
-	  capabilities; enabling this option will allow you to use
-	  these. The driver will check the MSRs to verify that the
-	  controller is enabled for NAND, and currently requires that
-	  the controller be in MMIO mode.
-
-	  If you say "m", the module will be called cs553x_nand.
-
-config MTD_NAND_ATMEL
-	tristate "Support for NAND Flash / SmartMedia on AT91"
-	depends on ARCH_AT91
-	select MFD_ATMEL_SMC
-	help
-	  Enables support for NAND Flash / Smart Media Card interface
-	  on Atmel AT91 processors.
-
-config MTD_NAND_PXA3xx
-	tristate "NAND support on PXA3xx and Armada 370/XP"
-	depends on !MTD_NAND_MARVELL
-	depends on PXA3xx || ARCH_MMP || PLAT_ORION || ARCH_MVEBU
-	help
-
-	  This enables the driver for the NAND flash device found on
-	  PXA3xx processors (NFCv1) and also on 32-bit Armada
-	  platforms (XP, 370, 375, 38x, 39x) and 64-bit Armada
-	  platforms (7K, 8K) (NFCv2).
-
-config MTD_NAND_MARVELL
-	tristate "NAND controller support on Marvell boards"
-	depends on PXA3xx || ARCH_MMP || PLAT_ORION || ARCH_MVEBU || \
-		   COMPILE_TEST
-	depends on HAS_IOMEM
-	help
-	  This enables the NAND flash controller driver for Marvell boards,
-	  including:
-	  - PXA3xx processors (NFCv1)
-	  - 32-bit Armada platforms (XP, 37x, 38x, 39x) (NFCv2)
-	  - 64-bit Aramda platforms (7k, 8k) (NFCv2)
-
-config MTD_NAND_SLC_LPC32XX
-	tristate "NXP LPC32xx SLC Controller"
-	depends on ARCH_LPC32XX
-	help
-	  Enables support for NXP's LPC32XX SLC (i.e. for Single Level Cell
-	  chips) NAND controller. This is the default for the PHYTEC 3250
-	  reference board which contains a NAND256R3A2CZA6 chip.
-
-	  Please check the actual NAND chip connected and its support
-	  by the SLC NAND controller.
-
-config MTD_NAND_MLC_LPC32XX
-	tristate "NXP LPC32xx MLC Controller"
-	depends on ARCH_LPC32XX
-	help
-	  Uses the LPC32XX MLC (i.e. for Multi Level Cell chips) NAND
-	  controller. This is the default for the WORK92105 controller
-	  board.
-
-	  Please check the actual NAND chip connected and its support
-	  by the MLC NAND controller.
-
-config MTD_NAND_CM_X270
-	tristate "Support for NAND Flash on CM-X270 modules"
-	depends on MACH_ARMCORE
-
-config MTD_NAND_PASEMI
-	tristate "NAND support for PA Semi PWRficient"
-	depends on PPC_PASEMI
-	help
-	  Enables support for NAND Flash interface on PA Semi PWRficient
-	  based boards
-
-config MTD_NAND_TMIO
-	tristate "NAND Flash device on Toshiba Mobile IO Controller"
-	depends on MFD_TMIO
-	help
-	  Support for NAND flash connected to a Toshiba Mobile IO
-	  Controller in some PDAs, including the Sharp SL6000x.
-
-config MTD_NAND_NANDSIM
-	tristate "Support for NAND Flash Simulator"
-	help
-	  The simulator may simulate various NAND flash chips for the
-	  MTD nand layer.
-
-config MTD_NAND_GPMI_NAND
-        tristate "GPMI NAND Flash Controller driver"
-        depends on MTD_NAND && MXS_DMA
-        help
-	 Enables NAND Flash support for IMX23, IMX28 or IMX6.
-	 The GPMI controller is very powerful, with the help of BCH
-	 module, it can do the hardware ECC. The GPMI supports several
-	 NAND flashs at the same time.
-
-config MTD_NAND_BRCMNAND
-	tristate "Broadcom STB NAND controller"
-	depends on ARM || ARM64 || MIPS
-	help
-	  Enables the Broadcom NAND controller driver. The controller was
-	  originally designed for Set-Top Box but is used on various BCM7xxx,
-	  BCM3xxx, BCM63xxx, iProc/Cygnus and more.
-
-config MTD_NAND_BCM47XXNFLASH
-	tristate "Support for NAND flash on BCM4706 BCMA bus"
-	depends on BCMA_NFLASH
-	help
-	  BCMA bus can have various flash memories attached, they are
-	  registered by bcma as platform devices. This enables driver for
-	  NAND flash memories. For now only BCM4706 is supported.
-
-config MTD_NAND_PLATFORM
-	tristate "Support for generic platform NAND driver"
-	depends on HAS_IOMEM
-	help
-	  This implements a generic NAND driver for on-SOC platform
-	  devices. You will need to provide platform-specific functions
-	  via platform_data.
-
-config MTD_NAND_ORION
-	tristate "NAND Flash support for Marvell Orion SoC"
-	depends on PLAT_ORION
-	help
-	  This enables the NAND flash controller on Orion machines.
-
-	  No board specific support is done by this driver, each board
-	  must advertise a platform_device for the driver to attach.
-
-config MTD_NAND_OXNAS
-	tristate "NAND Flash support for Oxford Semiconductor SoC"
-	depends on ARCH_OXNAS || COMPILE_TEST
-	depends on HAS_IOMEM
-	help
-	  This enables the NAND flash controller on Oxford Semiconductor SoCs.
-
-config MTD_NAND_FSL_ELBC
-	tristate "NAND support for Freescale eLBC controllers"
-	depends on FSL_SOC
-	select FSL_LBC
-	help
-	  Various Freescale chips, including the 8313, include a NAND Flash
-	  Controller Module with built-in hardware ECC capabilities.
-	  Enabling this option will enable you to use this to control
-	  external NAND devices.
-
-config MTD_NAND_FSL_IFC
-	tristate "NAND support for Freescale IFC controller"
-	depends on FSL_SOC || ARCH_LAYERSCAPE || SOC_LS1021A
-	select FSL_IFC
-	select MEMORY
-	help
-	  Various Freescale chips e.g P1010, include a NAND Flash machine
-	  with built-in hardware ECC capabilities.
-	  Enabling this option will enable you to use this to control
-	  external NAND devices.
-
-config MTD_NAND_FSL_UPM
-	tristate "Support for NAND on Freescale UPM"
-	depends on PPC_83xx || PPC_85xx
-	select FSL_LBC
-	help
-	  Enables support for NAND Flash chips wired onto Freescale PowerPC
-	  processor localbus with User-Programmable Machine support.
-
-config MTD_NAND_MPC5121_NFC
-	tristate "MPC5121 built-in NAND Flash Controller support"
-	depends on PPC_MPC512x
-	help
-	  This enables the driver for the NAND flash controller on the
-	  MPC5121 SoC.
-
-config MTD_NAND_VF610_NFC
-	tristate "Support for Freescale NFC for VF610/MPC5125"
-	depends on (SOC_VF610 || COMPILE_TEST)
-	depends on HAS_IOMEM
-	help
-	  Enables support for NAND Flash Controller on some Freescale
-	  processors like the VF610, MPC5125, MCF54418 or Kinetis K70.
-	  The driver supports a maximum 2k page size. With 2k pages and
-	  64 bytes or more of OOB, hardware ECC with up to 32-bit error
-	  correction is supported. Hardware ECC is only enabled through
-	  device tree.
-
-config MTD_NAND_MXC
-	tristate "MXC NAND support"
-	depends on ARCH_MXC
-	help
-	  This enables the driver for the NAND flash controller on the
-	  MXC processors.
-
-config MTD_NAND_SH_FLCTL
-	tristate "Support for NAND on Renesas SuperH FLCTL"
-	depends on SUPERH || COMPILE_TEST
-	depends on HAS_IOMEM
-	depends on HAS_DMA
-	help
-	  Several Renesas SuperH CPU has FLCTL. This option enables support
-	  for NAND Flash using FLCTL.
-
-config MTD_NAND_DAVINCI
-        tristate "Support NAND on DaVinci/Keystone SoC"
-        depends on ARCH_DAVINCI || (ARCH_KEYSTONE && TI_AEMIF)
-        help
-	  Enable the driver for NAND flash chips on Texas Instruments
-	  DaVinci/Keystone processors.
-
-config MTD_NAND_TXX9NDFMC
-	tristate "NAND Flash support for TXx9 SoC"
-	depends on SOC_TX4938 || SOC_TX4939
-	help
-	  This enables the NAND flash controller on the TXx9 SoCs.
-
-config MTD_NAND_SOCRATES
-	tristate "Support for NAND on Socrates board"
-	depends on SOCRATES
-	help
-	  Enables support for NAND Flash chips wired onto Socrates board.
-
-config MTD_NAND_NUC900
-	tristate "Support for NAND on Nuvoton NUC9xx/w90p910 evaluation boards."
-	depends on ARCH_W90X900
-	help
-	  This enables the driver for the NAND Flash on evaluation board based
-	  on w90p910 / NUC9xx.
-
-config MTD_NAND_JZ4740
-	tristate "Support for JZ4740 SoC NAND controller"
-	depends on MACH_JZ4740
-	help
-		Enables support for NAND Flash on JZ4740 SoC based boards.
-
-config MTD_NAND_JZ4780
-	tristate "Support for NAND on JZ4780 SoC"
-	depends on MACH_JZ4780 && JZ4780_NEMC
-	help
-	  Enables support for NAND Flash connected to the NEMC on JZ4780 SoC
-	  based boards, using the BCH controller for hardware error correction.
-
-config MTD_NAND_FSMC
-	tristate "Support for NAND on ST Micros FSMC"
-	depends on OF
-	depends on PLAT_SPEAR || ARCH_NOMADIK || ARCH_U8500 || MACH_U300
-	help
-	  Enables support for NAND Flash chips on the ST Microelectronics
-	  Flexible Static Memory Controller (FSMC)
-
-config MTD_NAND_XWAY
-	bool "Support for NAND on Lantiq XWAY SoC"
-	depends on LANTIQ && SOC_TYPE_XWAY
-	help
-	  Enables support for NAND Flash chips on Lantiq XWAY SoCs. NAND is attached
-	  to the External Bus Unit (EBU).
-
-config MTD_NAND_SUNXI
-	tristate "Support for NAND on Allwinner SoCs"
-	depends on ARCH_SUNXI
-	help
-	  Enables support for NAND Flash chips on Allwinner SoCs.
-
-config MTD_NAND_HISI504
-	tristate "Support for NAND controller on Hisilicon SoC Hip04"
-	depends on ARCH_HISI || COMPILE_TEST
-	depends on HAS_DMA
-	help
-	  Enables support for NAND controller on Hisilicon SoC Hip04.
-
-config MTD_NAND_QCOM
-	tristate "Support for NAND on QCOM SoCs"
-	depends on ARCH_QCOM
-	help
-	  Enables support for NAND flash chips on SoCs containing the EBI2 NAND
-	  controller. This controller is found on IPQ806x SoC.
-
-config MTD_NAND_MTK
-	tristate "Support for NAND controller on MTK SoCs"
-	depends on ARCH_MEDIATEK || COMPILE_TEST
-	depends on HAS_DMA
-	help
-	  Enables support for NAND controller on MTK SoCs.
-	  This controller is found on mt27xx, mt81xx, mt65xx SoCs.
-
-endif # MTD_NAND
+source "drivers/mtd/nand/raw/Kconfig"
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index 4e0982476267..32af7168c5ba 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -1,68 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-$(CONFIG_MTD_NAND)			+= nand.o
-obj-$(CONFIG_MTD_NAND_ECC)		+= nand_ecc.o
-obj-$(CONFIG_MTD_NAND_BCH)		+= nand_bch.o
-obj-$(CONFIG_MTD_SM_COMMON) 		+= sm_common.o
-
-obj-$(CONFIG_MTD_NAND_CAFE)		+= cafe_nand.o
-obj-$(CONFIG_MTD_NAND_AMS_DELTA)	+= ams-delta.o
-obj-$(CONFIG_MTD_NAND_DENALI)		+= denali.o
-obj-$(CONFIG_MTD_NAND_DENALI_PCI)	+= denali_pci.o
-obj-$(CONFIG_MTD_NAND_DENALI_DT)	+= denali_dt.o
-obj-$(CONFIG_MTD_NAND_AU1550)		+= au1550nd.o
-obj-$(CONFIG_MTD_NAND_BF5XX)		+= bf5xx_nand.o
-obj-$(CONFIG_MTD_NAND_S3C2410)		+= s3c2410.o
-obj-$(CONFIG_MTD_NAND_TANGO)		+= tango_nand.o
-obj-$(CONFIG_MTD_NAND_DAVINCI)		+= davinci_nand.o
-obj-$(CONFIG_MTD_NAND_DISKONCHIP)	+= diskonchip.o
-obj-$(CONFIG_MTD_NAND_DOCG4)		+= docg4.o
-obj-$(CONFIG_MTD_NAND_FSMC)		+= fsmc_nand.o
-obj-$(CONFIG_MTD_NAND_SHARPSL)		+= sharpsl.o
-obj-$(CONFIG_MTD_NAND_NANDSIM)		+= nandsim.o
-obj-$(CONFIG_MTD_NAND_CS553X)		+= cs553x_nand.o
-obj-$(CONFIG_MTD_NAND_NDFC)		+= ndfc.o
-obj-$(CONFIG_MTD_NAND_ATMEL)		+= atmel/
-obj-$(CONFIG_MTD_NAND_GPIO)		+= gpio.o
-omap2_nand-objs := omap2.o
-obj-$(CONFIG_MTD_NAND_OMAP2) 		+= omap2_nand.o
-obj-$(CONFIG_MTD_NAND_OMAP_BCH_BUILD)	+= omap_elm.o
-obj-$(CONFIG_MTD_NAND_CM_X270)		+= cmx270_nand.o
-obj-$(CONFIG_MTD_NAND_PXA3xx)		+= pxa3xx_nand.o
-obj-$(CONFIG_MTD_NAND_MARVELL)		+= marvell_nand.o
-obj-$(CONFIG_MTD_NAND_TMIO)		+= tmio_nand.o
-obj-$(CONFIG_MTD_NAND_PLATFORM)		+= plat_nand.o
-obj-$(CONFIG_MTD_NAND_PASEMI)		+= pasemi_nand.o
-obj-$(CONFIG_MTD_NAND_ORION)		+= orion_nand.o
-obj-$(CONFIG_MTD_NAND_OXNAS)		+= oxnas_nand.o
-obj-$(CONFIG_MTD_NAND_FSL_ELBC)		+= fsl_elbc_nand.o
-obj-$(CONFIG_MTD_NAND_FSL_IFC)		+= fsl_ifc_nand.o
-obj-$(CONFIG_MTD_NAND_FSL_UPM)		+= fsl_upm.o
-obj-$(CONFIG_MTD_NAND_SLC_LPC32XX)      += lpc32xx_slc.o
-obj-$(CONFIG_MTD_NAND_MLC_LPC32XX)      += lpc32xx_mlc.o
-obj-$(CONFIG_MTD_NAND_SH_FLCTL)		+= sh_flctl.o
-obj-$(CONFIG_MTD_NAND_MXC)		+= mxc_nand.o
-obj-$(CONFIG_MTD_NAND_SOCRATES)		+= socrates_nand.o
-obj-$(CONFIG_MTD_NAND_TXX9NDFMC)	+= txx9ndfmc.o
-obj-$(CONFIG_MTD_NAND_NUC900)		+= nuc900_nand.o
-obj-$(CONFIG_MTD_NAND_MPC5121_NFC)	+= mpc5121_nfc.o
-obj-$(CONFIG_MTD_NAND_VF610_NFC)	+= vf610_nfc.o
-obj-$(CONFIG_MTD_NAND_RICOH)		+= r852.o
-obj-$(CONFIG_MTD_NAND_JZ4740)		+= jz4740_nand.o
-obj-$(CONFIG_MTD_NAND_JZ4780)		+= jz4780_nand.o jz4780_bch.o
-obj-$(CONFIG_MTD_NAND_GPMI_NAND)	+= gpmi-nand/
-obj-$(CONFIG_MTD_NAND_XWAY)		+= xway_nand.o
-obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH)	+= bcm47xxnflash/
-obj-$(CONFIG_MTD_NAND_SUNXI)		+= sunxi_nand.o
-obj-$(CONFIG_MTD_NAND_HISI504)	        += hisi504_nand.o
-obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= brcmnand/
-obj-$(CONFIG_MTD_NAND_QCOM)		+= qcom_nandc.o
-obj-$(CONFIG_MTD_NAND_MTK)		+= mtk_ecc.o mtk_nand.o
-
-nand-objs := nand_base.o nand_bbt.o nand_timings.o nand_ids.o
-nand-objs += nand_amd.o
-nand-objs += nand_hynix.o
-nand-objs += nand_macronix.o
-nand-objs += nand_micron.o
-nand-objs += nand_samsung.o
-nand-objs += nand_toshiba.o
+obj-y	+= raw/
diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
new file mode 100644
index 000000000000..e6b8c59f2c0d
--- /dev/null
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -0,0 +1,580 @@
+config MTD_NAND_ECC
+	tristate
+
+config MTD_NAND_ECC_SMC
+	bool "NAND ECC Smart Media byte order"
+	depends on MTD_NAND_ECC
+	default n
+	help
+	  Software ECC according to the Smart Media Specification.
+	  The original Linux implementation had byte 0 and 1 swapped.
+
+
+menuconfig MTD_NAND
+	tristate "NAND Device Support"
+	depends on MTD
+	select MTD_NAND_ECC
+	help
+	  This enables support for accessing all type of NAND flash
+	  devices. For further information see
+	  <http://www.linux-mtd.infradead.org/doc/nand.html>.
+
+if MTD_NAND
+
+config MTD_NAND_BCH
+	tristate
+	select BCH
+	depends on MTD_NAND_ECC_BCH
+	default MTD_NAND
+
+config MTD_NAND_ECC_BCH
+	bool "Support software BCH ECC"
+	default n
+	help
+	  This enables support for software BCH error correction. Binary BCH
+	  codes are more powerful and cpu intensive than traditional Hamming
+	  ECC codes. They are used with NAND devices requiring more than 1 bit
+	  of error correction.
+
+config MTD_SM_COMMON
+	tristate
+	default n
+
+config MTD_NAND_DENALI
+	tristate
+
+config MTD_NAND_DENALI_PCI
+        tristate "Support Denali NAND controller on Intel Moorestown"
+	select MTD_NAND_DENALI
+	depends on HAS_DMA && PCI
+        help
+          Enable the driver for NAND flash on Intel Moorestown, using the
+          Denali NAND controller core.
+
+config MTD_NAND_DENALI_DT
+	tristate "Support Denali NAND controller as a DT device"
+	select MTD_NAND_DENALI
+	depends on HAS_DMA && HAVE_CLK && OF
+	help
+	  Enable the driver for NAND flash on platforms using a Denali NAND
+	  controller as a DT device.
+
+config MTD_NAND_GPIO
+	tristate "GPIO assisted NAND Flash driver"
+	depends on GPIOLIB || COMPILE_TEST
+	depends on HAS_IOMEM
+	help
+	  This enables a NAND flash driver where control signals are
+	  connected to GPIO pins, and commands and data are communicated
+	  via a memory mapped interface.
+
+config MTD_NAND_AMS_DELTA
+	tristate "NAND Flash device on Amstrad E3"
+	depends on MACH_AMS_DELTA
+	default y
+	help
+	  Support for NAND flash on Amstrad E3 (Delta).
+
+config MTD_NAND_OMAP2
+	tristate "NAND Flash device on OMAP2, OMAP3, OMAP4 and Keystone"
+	depends on (ARCH_OMAP2PLUS || ARCH_KEYSTONE)
+	help
+          Support for NAND flash on Texas Instruments OMAP2, OMAP3, OMAP4
+	  and Keystone platforms.
+
+config MTD_NAND_OMAP_BCH
+	depends on MTD_NAND_OMAP2
+	bool "Support hardware based BCH error correction"
+	default n
+	select BCH
+	help
+	  This config enables the ELM hardware engine, which can be used to
+	  locate and correct errors when using BCH ECC scheme. This offloads
+	  the cpu from doing ECC error searching and correction. However some
+	  legacy OMAP families like OMAP2xxx, OMAP3xxx do not have ELM engine
+	  so this is optional for them.
+
+config MTD_NAND_OMAP_BCH_BUILD
+	def_tristate MTD_NAND_OMAP2 && MTD_NAND_OMAP_BCH
+
+config MTD_NAND_RICOH
+	tristate "Ricoh xD card reader"
+	default n
+	depends on PCI
+	select MTD_SM_COMMON
+	help
+	  Enable support for Ricoh R5C852 xD card reader
+	  You also need to enable ether
+	  NAND SSFDC (SmartMedia) read only translation layer' or new
+	  expermental, readwrite
+	  'SmartMedia/xD new translation layer'
+
+config MTD_NAND_AU1550
+	tristate "Au1550/1200 NAND support"
+	depends on MIPS_ALCHEMY
+	help
+	  This enables the driver for the NAND flash controller on the
+	  AMD/Alchemy 1550 SOC.
+
+config MTD_NAND_BF5XX
+	tristate "Blackfin on-chip NAND Flash Controller driver"
+	depends on BF54x || BF52x
+	help
+	  This enables the Blackfin on-chip NAND flash controller
+
+	  No board specific support is done by this driver, each board
+	  must advertise a platform_device for the driver to attach.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called bf5xx-nand.
+
+config MTD_NAND_BF5XX_HWECC
+	bool "BF5XX NAND Hardware ECC"
+	default y
+	depends on MTD_NAND_BF5XX
+	help
+	  Enable the use of the BF5XX's internal ECC generator when
+	  using NAND.
+
+config MTD_NAND_BF5XX_BOOTROM_ECC
+	bool "Use Blackfin BootROM ECC Layout"
+	default n
+	depends on MTD_NAND_BF5XX_HWECC
+	help
+	  If you wish to modify NAND pages and allow the Blackfin on-chip
+	  BootROM to boot from them, say Y here.  This is only necessary
+	  if you are booting U-Boot out of NAND and you wish to update
+	  U-Boot from Linux' userspace.  Otherwise, you should say N here.
+
+	  If unsure, say N.
+
+config MTD_NAND_S3C2410
+	tristate "NAND Flash support for Samsung S3C SoCs"
+	depends on ARCH_S3C24XX || ARCH_S3C64XX
+	help
+	  This enables the NAND flash controller on the S3C24xx and S3C64xx
+	  SoCs
+
+	  No board specific support is done by this driver, each board
+	  must advertise a platform_device for the driver to attach.
+
+config MTD_NAND_S3C2410_DEBUG
+	bool "Samsung S3C NAND driver debug"
+	depends on MTD_NAND_S3C2410
+	help
+	  Enable debugging of the S3C NAND driver
+
+config MTD_NAND_NDFC
+	tristate "NDFC NanD Flash Controller"
+	depends on 4xx
+	select MTD_NAND_ECC_SMC
+	help
+	 NDFC Nand Flash Controllers are integrated in IBM/AMCC's 4xx SoCs
+
+config MTD_NAND_S3C2410_CLKSTOP
+	bool "Samsung S3C NAND IDLE clock stop"
+	depends on MTD_NAND_S3C2410
+	default n
+	help
+	  Stop the clock to the NAND controller when there is no chip
+	  selected to save power. This will mean there is a small delay
+	  when the is NAND chip selected or released, but will save
+	  approximately 5mA of power when there is nothing happening.
+
+config MTD_NAND_TANGO
+	tristate "NAND Flash support for Tango chips"
+	depends on ARCH_TANGO || COMPILE_TEST
+	depends on HAS_DMA
+	help
+	  Enables the NAND Flash controller on Tango chips.
+
+config MTD_NAND_DISKONCHIP
+	tristate "DiskOnChip 2000, Millennium and Millennium Plus (NAND reimplementation)"
+	depends on HAS_IOMEM
+	select REED_SOLOMON
+	select REED_SOLOMON_DEC16
+	help
+	  This is a reimplementation of M-Systems DiskOnChip 2000,
+	  Millennium and Millennium Plus as a standard NAND device driver,
+	  as opposed to the earlier self-contained MTD device drivers.
+	  This should enable, among other things, proper JFFS2 operation on
+	  these devices.
+
+config MTD_NAND_DISKONCHIP_PROBE_ADVANCED
+        bool "Advanced detection options for DiskOnChip"
+        depends on MTD_NAND_DISKONCHIP
+        help
+          This option allows you to specify nonstandard address at which to
+          probe for a DiskOnChip, or to change the detection options.  You
+          are unlikely to need any of this unless you are using LinuxBIOS.
+          Say 'N'.
+
+config MTD_NAND_DISKONCHIP_PROBE_ADDRESS
+        hex "Physical address of DiskOnChip" if MTD_NAND_DISKONCHIP_PROBE_ADVANCED
+        depends on MTD_NAND_DISKONCHIP
+        default "0"
+        ---help---
+        By default, the probe for DiskOnChip devices will look for a
+        DiskOnChip at every multiple of 0x2000 between 0xC8000 and 0xEE000.
+        This option allows you to specify a single address at which to probe
+        for the device, which is useful if you have other devices in that
+        range which get upset when they are probed.
+
+        (Note that on PowerPC, the normal probe will only check at
+        0xE4000000.)
+
+        Normally, you should leave this set to zero, to allow the probe at
+        the normal addresses.
+
+config MTD_NAND_DISKONCHIP_PROBE_HIGH
+        bool "Probe high addresses"
+        depends on MTD_NAND_DISKONCHIP_PROBE_ADVANCED
+        help
+          By default, the probe for DiskOnChip devices will look for a
+          DiskOnChip at every multiple of 0x2000 between 0xC8000 and 0xEE000.
+          This option changes to make it probe between 0xFFFC8000 and
+          0xFFFEE000.  Unless you are using LinuxBIOS, this is unlikely to be
+          useful to you.  Say 'N'.
+
+config MTD_NAND_DISKONCHIP_BBTWRITE
+	bool "Allow BBT writes on DiskOnChip Millennium and 2000TSOP"
+	depends on MTD_NAND_DISKONCHIP
+	help
+	  On DiskOnChip devices shipped with the INFTL filesystem (Millennium
+	  and 2000 TSOP/Alon), Linux reserves some space at the end of the
+	  device for the Bad Block Table (BBT).  If you have existing INFTL
+	  data on your device (created by non-Linux tools such as M-Systems'
+	  DOS drivers), your data might overlap the area Linux wants to use for
+	  the BBT.  If this is a concern for you, leave this option disabled and
+	  Linux will not write BBT data into this area.
+	  The downside of leaving this option disabled is that if bad blocks
+	  are detected by Linux, they will not be recorded in the BBT, which
+	  could cause future problems.
+	  Once you enable this option, new filesystems (INFTL or others, created
+	  in Linux or other operating systems) will not use the reserved area.
+	  The only reason not to enable this option is to prevent damage to
+	  preexisting filesystems.
+	  Even if you leave this disabled, you can enable BBT writes at module
+	  load time (assuming you build diskonchip as a module) with the module
+	  parameter "inftl_bbt_write=1".
+
+config MTD_NAND_DOCG4
+	tristate "Support for DiskOnChip G4"
+	depends on HAS_IOMEM
+	select BCH
+	select BITREVERSE
+	help
+	  Support for diskonchip G4 nand flash, found in various smartphones and
+	  PDAs, among them the Palm Treo680, HTC Prophet and Wizard, Toshiba
+	  Portege G900, Asus P526, and O2 XDA Zinc.
+
+	  With this driver you will be able to use UBI and create a ubifs on the
+	  device, so you may wish to consider enabling UBI and UBIFS as well.
+
+	  These devices ship with the Mys/Sandisk SAFTL formatting, for which
+	  there is currently no mtd parser, so you may want to use command line
+	  partitioning to segregate write-protected blocks. On the Treo680, the
+	  first five erase blocks (256KiB each) are write-protected, followed
+	  by the block containing the saftl partition table.  This is probably
+	  typical.
+
+config MTD_NAND_SHARPSL
+	tristate "Support for NAND Flash on Sharp SL Series (C7xx + others)"
+	depends on ARCH_PXA
+
+config MTD_NAND_CAFE
+	tristate "NAND support for OLPC CAFÉ chip"
+	depends on PCI
+	select REED_SOLOMON
+	select REED_SOLOMON_DEC16
+	help
+	  Use NAND flash attached to the CAFÉ chip designed for the OLPC
+	  laptop.
+
+config MTD_NAND_CS553X
+	tristate "NAND support for CS5535/CS5536 (AMD Geode companion chip)"
+	depends on X86_32
+	depends on !UML && HAS_IOMEM
+	help
+	  The CS553x companion chips for the AMD Geode processor
+	  include NAND flash controllers with built-in hardware ECC
+	  capabilities; enabling this option will allow you to use
+	  these. The driver will check the MSRs to verify that the
+	  controller is enabled for NAND, and currently requires that
+	  the controller be in MMIO mode.
+
+	  If you say "m", the module will be called cs553x_nand.
+
+config MTD_NAND_ATMEL
+	tristate "Support for NAND Flash / SmartMedia on AT91"
+	depends on ARCH_AT91
+	select MFD_ATMEL_SMC
+	help
+	  Enables support for NAND Flash / Smart Media Card interface
+	  on Atmel AT91 processors.
+
+config MTD_NAND_PXA3xx
+	tristate "NAND support on PXA3xx and Armada 370/XP"
+	depends on !MTD_NAND_MARVELL
+	depends on PXA3xx || ARCH_MMP || PLAT_ORION || ARCH_MVEBU
+	help
+
+	  This enables the driver for the NAND flash device found on
+	  PXA3xx processors (NFCv1) and also on 32-bit Armada
+	  platforms (XP, 370, 375, 38x, 39x) and 64-bit Armada
+	  platforms (7K, 8K) (NFCv2).
+
+config MTD_NAND_MARVELL
+	tristate "NAND controller support on Marvell boards"
+	depends on PXA3xx || ARCH_MMP || PLAT_ORION || ARCH_MVEBU || \
+		   COMPILE_TEST
+	depends on HAS_IOMEM
+	help
+	  This enables the NAND flash controller driver for Marvell boards,
+	  including:
+	  - PXA3xx processors (NFCv1)
+	  - 32-bit Armada platforms (XP, 37x, 38x, 39x) (NFCv2)
+	  - 64-bit Aramda platforms (7k, 8k) (NFCv2)
+
+config MTD_NAND_SLC_LPC32XX
+	tristate "NXP LPC32xx SLC Controller"
+	depends on ARCH_LPC32XX
+	help
+	  Enables support for NXP's LPC32XX SLC (i.e. for Single Level Cell
+	  chips) NAND controller. This is the default for the PHYTEC 3250
+	  reference board which contains a NAND256R3A2CZA6 chip.
+
+	  Please check the actual NAND chip connected and its support
+	  by the SLC NAND controller.
+
+config MTD_NAND_MLC_LPC32XX
+	tristate "NXP LPC32xx MLC Controller"
+	depends on ARCH_LPC32XX
+	help
+	  Uses the LPC32XX MLC (i.e. for Multi Level Cell chips) NAND
+	  controller. This is the default for the WORK92105 controller
+	  board.
+
+	  Please check the actual NAND chip connected and its support
+	  by the MLC NAND controller.
+
+config MTD_NAND_CM_X270
+	tristate "Support for NAND Flash on CM-X270 modules"
+	depends on MACH_ARMCORE
+
+config MTD_NAND_PASEMI
+	tristate "NAND support for PA Semi PWRficient"
+	depends on PPC_PASEMI
+	help
+	  Enables support for NAND Flash interface on PA Semi PWRficient
+	  based boards
+
+config MTD_NAND_TMIO
+	tristate "NAND Flash device on Toshiba Mobile IO Controller"
+	depends on MFD_TMIO
+	help
+	  Support for NAND flash connected to a Toshiba Mobile IO
+	  Controller in some PDAs, including the Sharp SL6000x.
+
+config MTD_NAND_NANDSIM
+	tristate "Support for NAND Flash Simulator"
+	help
+	  The simulator may simulate various NAND flash chips for the
+	  MTD nand layer.
+
+config MTD_NAND_GPMI_NAND
+        tristate "GPMI NAND Flash Controller driver"
+        depends on MTD_NAND && MXS_DMA
+        help
+	 Enables NAND Flash support for IMX23, IMX28 or IMX6.
+	 The GPMI controller is very powerful, with the help of BCH
+	 module, it can do the hardware ECC. The GPMI supports several
+	 NAND flashs at the same time.
+
+config MTD_NAND_BRCMNAND
+	tristate "Broadcom STB NAND controller"
+	depends on ARM || ARM64 || MIPS
+	help
+	  Enables the Broadcom NAND controller driver. The controller was
+	  originally designed for Set-Top Box but is used on various BCM7xxx,
+	  BCM3xxx, BCM63xxx, iProc/Cygnus and more.
+
+config MTD_NAND_BCM47XXNFLASH
+	tristate "Support for NAND flash on BCM4706 BCMA bus"
+	depends on BCMA_NFLASH
+	help
+	  BCMA bus can have various flash memories attached, they are
+	  registered by bcma as platform devices. This enables driver for
+	  NAND flash memories. For now only BCM4706 is supported.
+
+config MTD_NAND_PLATFORM
+	tristate "Support for generic platform NAND driver"
+	depends on HAS_IOMEM
+	help
+	  This implements a generic NAND driver for on-SOC platform
+	  devices. You will need to provide platform-specific functions
+	  via platform_data.
+
+config MTD_NAND_ORION
+	tristate "NAND Flash support for Marvell Orion SoC"
+	depends on PLAT_ORION
+	help
+	  This enables the NAND flash controller on Orion machines.
+
+	  No board specific support is done by this driver, each board
+	  must advertise a platform_device for the driver to attach.
+
+config MTD_NAND_OXNAS
+	tristate "NAND Flash support for Oxford Semiconductor SoC"
+	depends on ARCH_OXNAS || COMPILE_TEST
+	depends on HAS_IOMEM
+	help
+	  This enables the NAND flash controller on Oxford Semiconductor SoCs.
+
+config MTD_NAND_FSL_ELBC
+	tristate "NAND support for Freescale eLBC controllers"
+	depends on FSL_SOC
+	select FSL_LBC
+	help
+	  Various Freescale chips, including the 8313, include a NAND Flash
+	  Controller Module with built-in hardware ECC capabilities.
+	  Enabling this option will enable you to use this to control
+	  external NAND devices.
+
+config MTD_NAND_FSL_IFC
+	tristate "NAND support for Freescale IFC controller"
+	depends on FSL_SOC || ARCH_LAYERSCAPE || SOC_LS1021A
+	select FSL_IFC
+	select MEMORY
+	help
+	  Various Freescale chips e.g P1010, include a NAND Flash machine
+	  with built-in hardware ECC capabilities.
+	  Enabling this option will enable you to use this to control
+	  external NAND devices.
+
+config MTD_NAND_FSL_UPM
+	tristate "Support for NAND on Freescale UPM"
+	depends on PPC_83xx || PPC_85xx
+	select FSL_LBC
+	help
+	  Enables support for NAND Flash chips wired onto Freescale PowerPC
+	  processor localbus with User-Programmable Machine support.
+
+config MTD_NAND_MPC5121_NFC
+	tristate "MPC5121 built-in NAND Flash Controller support"
+	depends on PPC_MPC512x
+	help
+	  This enables the driver for the NAND flash controller on the
+	  MPC5121 SoC.
+
+config MTD_NAND_VF610_NFC
+	tristate "Support for Freescale NFC for VF610/MPC5125"
+	depends on (SOC_VF610 || COMPILE_TEST)
+	depends on HAS_IOMEM
+	help
+	  Enables support for NAND Flash Controller on some Freescale
+	  processors like the VF610, MPC5125, MCF54418 or Kinetis K70.
+	  The driver supports a maximum 2k page size. With 2k pages and
+	  64 bytes or more of OOB, hardware ECC with up to 32-bit error
+	  correction is supported. Hardware ECC is only enabled through
+	  device tree.
+
+config MTD_NAND_MXC
+	tristate "MXC NAND support"
+	depends on ARCH_MXC
+	help
+	  This enables the driver for the NAND flash controller on the
+	  MXC processors.
+
+config MTD_NAND_SH_FLCTL
+	tristate "Support for NAND on Renesas SuperH FLCTL"
+	depends on SUPERH || COMPILE_TEST
+	depends on HAS_IOMEM
+	depends on HAS_DMA
+	help
+	  Several Renesas SuperH CPU has FLCTL. This option enables support
+	  for NAND Flash using FLCTL.
+
+config MTD_NAND_DAVINCI
+        tristate "Support NAND on DaVinci/Keystone SoC"
+        depends on ARCH_DAVINCI || (ARCH_KEYSTONE && TI_AEMIF)
+        help
+	  Enable the driver for NAND flash chips on Texas Instruments
+	  DaVinci/Keystone processors.
+
+config MTD_NAND_TXX9NDFMC
+	tristate "NAND Flash support for TXx9 SoC"
+	depends on SOC_TX4938 || SOC_TX4939
+	help
+	  This enables the NAND flash controller on the TXx9 SoCs.
+
+config MTD_NAND_SOCRATES
+	tristate "Support for NAND on Socrates board"
+	depends on SOCRATES
+	help
+	  Enables support for NAND Flash chips wired onto Socrates board.
+
+config MTD_NAND_NUC900
+	tristate "Support for NAND on Nuvoton NUC9xx/w90p910 evaluation boards."
+	depends on ARCH_W90X900
+	help
+	  This enables the driver for the NAND Flash on evaluation board based
+	  on w90p910 / NUC9xx.
+
+config MTD_NAND_JZ4740
+	tristate "Support for JZ4740 SoC NAND controller"
+	depends on MACH_JZ4740
+	help
+		Enables support for NAND Flash on JZ4740 SoC based boards.
+
+config MTD_NAND_JZ4780
+	tristate "Support for NAND on JZ4780 SoC"
+	depends on MACH_JZ4780 && JZ4780_NEMC
+	help
+	  Enables support for NAND Flash connected to the NEMC on JZ4780 SoC
+	  based boards, using the BCH controller for hardware error correction.
+
+config MTD_NAND_FSMC
+	tristate "Support for NAND on ST Micros FSMC"
+	depends on OF
+	depends on PLAT_SPEAR || ARCH_NOMADIK || ARCH_U8500 || MACH_U300
+	help
+	  Enables support for NAND Flash chips on the ST Microelectronics
+	  Flexible Static Memory Controller (FSMC)
+
+config MTD_NAND_XWAY
+	bool "Support for NAND on Lantiq XWAY SoC"
+	depends on LANTIQ && SOC_TYPE_XWAY
+	help
+	  Enables support for NAND Flash chips on Lantiq XWAY SoCs. NAND is attached
+	  to the External Bus Unit (EBU).
+
+config MTD_NAND_SUNXI
+	tristate "Support for NAND on Allwinner SoCs"
+	depends on ARCH_SUNXI
+	help
+	  Enables support for NAND Flash chips on Allwinner SoCs.
+
+config MTD_NAND_HISI504
+	tristate "Support for NAND controller on Hisilicon SoC Hip04"
+	depends on ARCH_HISI || COMPILE_TEST
+	depends on HAS_DMA
+	help
+	  Enables support for NAND controller on Hisilicon SoC Hip04.
+
+config MTD_NAND_QCOM
+	tristate "Support for NAND on QCOM SoCs"
+	depends on ARCH_QCOM
+	help
+	  Enables support for NAND flash chips on SoCs containing the EBI2 NAND
+	  controller. This controller is found on IPQ806x SoC.
+
+config MTD_NAND_MTK
+	tristate "Support for NAND controller on MTK SoCs"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on HAS_DMA
+	help
+	  Enables support for NAND controller on MTK SoCs.
+	  This controller is found on mt27xx, mt81xx, mt65xx SoCs.
+
+endif # MTD_NAND
diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
new file mode 100644
index 000000000000..4e0982476267
--- /dev/null
+++ b/drivers/mtd/nand/raw/Makefile
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_MTD_NAND)			+= nand.o
+obj-$(CONFIG_MTD_NAND_ECC)		+= nand_ecc.o
+obj-$(CONFIG_MTD_NAND_BCH)		+= nand_bch.o
+obj-$(CONFIG_MTD_SM_COMMON) 		+= sm_common.o
+
+obj-$(CONFIG_MTD_NAND_CAFE)		+= cafe_nand.o
+obj-$(CONFIG_MTD_NAND_AMS_DELTA)	+= ams-delta.o
+obj-$(CONFIG_MTD_NAND_DENALI)		+= denali.o
+obj-$(CONFIG_MTD_NAND_DENALI_PCI)	+= denali_pci.o
+obj-$(CONFIG_MTD_NAND_DENALI_DT)	+= denali_dt.o
+obj-$(CONFIG_MTD_NAND_AU1550)		+= au1550nd.o
+obj-$(CONFIG_MTD_NAND_BF5XX)		+= bf5xx_nand.o
+obj-$(CONFIG_MTD_NAND_S3C2410)		+= s3c2410.o
+obj-$(CONFIG_MTD_NAND_TANGO)		+= tango_nand.o
+obj-$(CONFIG_MTD_NAND_DAVINCI)		+= davinci_nand.o
+obj-$(CONFIG_MTD_NAND_DISKONCHIP)	+= diskonchip.o
+obj-$(CONFIG_MTD_NAND_DOCG4)		+= docg4.o
+obj-$(CONFIG_MTD_NAND_FSMC)		+= fsmc_nand.o
+obj-$(CONFIG_MTD_NAND_SHARPSL)		+= sharpsl.o
+obj-$(CONFIG_MTD_NAND_NANDSIM)		+= nandsim.o
+obj-$(CONFIG_MTD_NAND_CS553X)		+= cs553x_nand.o
+obj-$(CONFIG_MTD_NAND_NDFC)		+= ndfc.o
+obj-$(CONFIG_MTD_NAND_ATMEL)		+= atmel/
+obj-$(CONFIG_MTD_NAND_GPIO)		+= gpio.o
+omap2_nand-objs := omap2.o
+obj-$(CONFIG_MTD_NAND_OMAP2) 		+= omap2_nand.o
+obj-$(CONFIG_MTD_NAND_OMAP_BCH_BUILD)	+= omap_elm.o
+obj-$(CONFIG_MTD_NAND_CM_X270)		+= cmx270_nand.o
+obj-$(CONFIG_MTD_NAND_PXA3xx)		+= pxa3xx_nand.o
+obj-$(CONFIG_MTD_NAND_MARVELL)		+= marvell_nand.o
+obj-$(CONFIG_MTD_NAND_TMIO)		+= tmio_nand.o
+obj-$(CONFIG_MTD_NAND_PLATFORM)		+= plat_nand.o
+obj-$(CONFIG_MTD_NAND_PASEMI)		+= pasemi_nand.o
+obj-$(CONFIG_MTD_NAND_ORION)		+= orion_nand.o
+obj-$(CONFIG_MTD_NAND_OXNAS)		+= oxnas_nand.o
+obj-$(CONFIG_MTD_NAND_FSL_ELBC)		+= fsl_elbc_nand.o
+obj-$(CONFIG_MTD_NAND_FSL_IFC)		+= fsl_ifc_nand.o
+obj-$(CONFIG_MTD_NAND_FSL_UPM)		+= fsl_upm.o
+obj-$(CONFIG_MTD_NAND_SLC_LPC32XX)      += lpc32xx_slc.o
+obj-$(CONFIG_MTD_NAND_MLC_LPC32XX)      += lpc32xx_mlc.o
+obj-$(CONFIG_MTD_NAND_SH_FLCTL)		+= sh_flctl.o
+obj-$(CONFIG_MTD_NAND_MXC)		+= mxc_nand.o
+obj-$(CONFIG_MTD_NAND_SOCRATES)		+= socrates_nand.o
+obj-$(CONFIG_MTD_NAND_TXX9NDFMC)	+= txx9ndfmc.o
+obj-$(CONFIG_MTD_NAND_NUC900)		+= nuc900_nand.o
+obj-$(CONFIG_MTD_NAND_MPC5121_NFC)	+= mpc5121_nfc.o
+obj-$(CONFIG_MTD_NAND_VF610_NFC)	+= vf610_nfc.o
+obj-$(CONFIG_MTD_NAND_RICOH)		+= r852.o
+obj-$(CONFIG_MTD_NAND_JZ4740)		+= jz4740_nand.o
+obj-$(CONFIG_MTD_NAND_JZ4780)		+= jz4780_nand.o jz4780_bch.o
+obj-$(CONFIG_MTD_NAND_GPMI_NAND)	+= gpmi-nand/
+obj-$(CONFIG_MTD_NAND_XWAY)		+= xway_nand.o
+obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH)	+= bcm47xxnflash/
+obj-$(CONFIG_MTD_NAND_SUNXI)		+= sunxi_nand.o
+obj-$(CONFIG_MTD_NAND_HISI504)	        += hisi504_nand.o
+obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= brcmnand/
+obj-$(CONFIG_MTD_NAND_QCOM)		+= qcom_nandc.o
+obj-$(CONFIG_MTD_NAND_MTK)		+= mtk_ecc.o mtk_nand.o
+
+nand-objs := nand_base.o nand_bbt.o nand_timings.o nand_ids.o
+nand-objs += nand_amd.o
+nand-objs += nand_hynix.o
+nand-objs += nand_macronix.o
+nand-objs += nand_micron.o
+nand-objs += nand_samsung.o
+nand-objs += nand_toshiba.o
diff --git a/drivers/mtd/nand/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
similarity index 100%
rename from drivers/mtd/nand/ams-delta.c
rename to drivers/mtd/nand/raw/ams-delta.c
diff --git a/drivers/mtd/nand/atmel/Makefile b/drivers/mtd/nand/raw/atmel/Makefile
similarity index 100%
rename from drivers/mtd/nand/atmel/Makefile
rename to drivers/mtd/nand/raw/atmel/Makefile
diff --git a/drivers/mtd/nand/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
similarity index 100%
rename from drivers/mtd/nand/atmel/nand-controller.c
rename to drivers/mtd/nand/raw/atmel/nand-controller.c
diff --git a/drivers/mtd/nand/atmel/pmecc.c b/drivers/mtd/nand/raw/atmel/pmecc.c
similarity index 100%
rename from drivers/mtd/nand/atmel/pmecc.c
rename to drivers/mtd/nand/raw/atmel/pmecc.c
diff --git a/drivers/mtd/nand/atmel/pmecc.h b/drivers/mtd/nand/raw/atmel/pmecc.h
similarity index 100%
rename from drivers/mtd/nand/atmel/pmecc.h
rename to drivers/mtd/nand/raw/atmel/pmecc.h
diff --git a/drivers/mtd/nand/au1550nd.c b/drivers/mtd/nand/raw/au1550nd.c
similarity index 100%
rename from drivers/mtd/nand/au1550nd.c
rename to drivers/mtd/nand/raw/au1550nd.c
diff --git a/drivers/mtd/nand/bcm47xxnflash/Makefile b/drivers/mtd/nand/raw/bcm47xxnflash/Makefile
similarity index 100%
rename from drivers/mtd/nand/bcm47xxnflash/Makefile
rename to drivers/mtd/nand/raw/bcm47xxnflash/Makefile
diff --git a/drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h b/drivers/mtd/nand/raw/bcm47xxnflash/bcm47xxnflash.h
similarity index 100%
rename from drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h
rename to drivers/mtd/nand/raw/bcm47xxnflash/bcm47xxnflash.h
diff --git a/drivers/mtd/nand/bcm47xxnflash/main.c b/drivers/mtd/nand/raw/bcm47xxnflash/main.c
similarity index 100%
rename from drivers/mtd/nand/bcm47xxnflash/main.c
rename to drivers/mtd/nand/raw/bcm47xxnflash/main.c
diff --git a/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c b/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
similarity index 100%
rename from drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
rename to drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/raw/bf5xx_nand.c
similarity index 100%
rename from drivers/mtd/nand/bf5xx_nand.c
rename to drivers/mtd/nand/raw/bf5xx_nand.c
diff --git a/drivers/mtd/nand/brcmnand/Makefile b/drivers/mtd/nand/raw/brcmnand/Makefile
similarity index 100%
rename from drivers/mtd/nand/brcmnand/Makefile
rename to drivers/mtd/nand/raw/brcmnand/Makefile
diff --git a/drivers/mtd/nand/brcmnand/bcm63138_nand.c b/drivers/mtd/nand/raw/brcmnand/bcm63138_nand.c
similarity index 100%
rename from drivers/mtd/nand/brcmnand/bcm63138_nand.c
rename to drivers/mtd/nand/raw/brcmnand/bcm63138_nand.c
diff --git a/drivers/mtd/nand/brcmnand/bcm6368_nand.c b/drivers/mtd/nand/raw/brcmnand/bcm6368_nand.c
similarity index 100%
rename from drivers/mtd/nand/brcmnand/bcm6368_nand.c
rename to drivers/mtd/nand/raw/brcmnand/bcm6368_nand.c
diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
similarity index 100%
rename from drivers/mtd/nand/brcmnand/brcmnand.c
rename to drivers/mtd/nand/raw/brcmnand/brcmnand.c
diff --git a/drivers/mtd/nand/brcmnand/brcmnand.h b/drivers/mtd/nand/raw/brcmnand/brcmnand.h
similarity index 100%
rename from drivers/mtd/nand/brcmnand/brcmnand.h
rename to drivers/mtd/nand/raw/brcmnand/brcmnand.h
diff --git a/drivers/mtd/nand/brcmnand/brcmstb_nand.c b/drivers/mtd/nand/raw/brcmnand/brcmstb_nand.c
similarity index 100%
rename from drivers/mtd/nand/brcmnand/brcmstb_nand.c
rename to drivers/mtd/nand/raw/brcmnand/brcmstb_nand.c
diff --git a/drivers/mtd/nand/brcmnand/iproc_nand.c b/drivers/mtd/nand/raw/brcmnand/iproc_nand.c
similarity index 100%
rename from drivers/mtd/nand/brcmnand/iproc_nand.c
rename to drivers/mtd/nand/raw/brcmnand/iproc_nand.c
diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
similarity index 100%
rename from drivers/mtd/nand/cafe_nand.c
rename to drivers/mtd/nand/raw/cafe_nand.c
diff --git a/drivers/mtd/nand/cmx270_nand.c b/drivers/mtd/nand/raw/cmx270_nand.c
similarity index 100%
rename from drivers/mtd/nand/cmx270_nand.c
rename to drivers/mtd/nand/raw/cmx270_nand.c
diff --git a/drivers/mtd/nand/cs553x_nand.c b/drivers/mtd/nand/raw/cs553x_nand.c
similarity index 100%
rename from drivers/mtd/nand/cs553x_nand.c
rename to drivers/mtd/nand/raw/cs553x_nand.c
diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
similarity index 100%
rename from drivers/mtd/nand/davinci_nand.c
rename to drivers/mtd/nand/raw/davinci_nand.c
diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/raw/denali.c
similarity index 100%
rename from drivers/mtd/nand/denali.c
rename to drivers/mtd/nand/raw/denali.c
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/raw/denali.h
similarity index 100%
rename from drivers/mtd/nand/denali.h
rename to drivers/mtd/nand/raw/denali.h
diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/raw/denali_dt.c
similarity index 100%
rename from drivers/mtd/nand/denali_dt.c
rename to drivers/mtd/nand/raw/denali_dt.c
diff --git a/drivers/mtd/nand/denali_pci.c b/drivers/mtd/nand/raw/denali_pci.c
similarity index 100%
rename from drivers/mtd/nand/denali_pci.c
rename to drivers/mtd/nand/raw/denali_pci.c
diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/raw/diskonchip.c
similarity index 100%
rename from drivers/mtd/nand/diskonchip.c
rename to drivers/mtd/nand/raw/diskonchip.c
diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/raw/docg4.c
similarity index 100%
rename from drivers/mtd/nand/docg4.c
rename to drivers/mtd/nand/raw/docg4.c
diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/raw/fsl_elbc_nand.c
similarity index 100%
rename from drivers/mtd/nand/fsl_elbc_nand.c
rename to drivers/mtd/nand/raw/fsl_elbc_nand.c
diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
similarity index 100%
rename from drivers/mtd/nand/fsl_ifc_nand.c
rename to drivers/mtd/nand/raw/fsl_ifc_nand.c
diff --git a/drivers/mtd/nand/fsl_upm.c b/drivers/mtd/nand/raw/fsl_upm.c
similarity index 100%
rename from drivers/mtd/nand/fsl_upm.c
rename to drivers/mtd/nand/raw/fsl_upm.c
diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
similarity index 100%
rename from drivers/mtd/nand/fsmc_nand.c
rename to drivers/mtd/nand/raw/fsmc_nand.c
diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/raw/gpio.c
similarity index 100%
rename from drivers/mtd/nand/gpio.c
rename to drivers/mtd/nand/raw/gpio.c
diff --git a/drivers/mtd/nand/gpmi-nand/Makefile b/drivers/mtd/nand/raw/gpmi-nand/Makefile
similarity index 100%
rename from drivers/mtd/nand/gpmi-nand/Makefile
rename to drivers/mtd/nand/raw/gpmi-nand/Makefile
diff --git a/drivers/mtd/nand/gpmi-nand/bch-regs.h b/drivers/mtd/nand/raw/gpmi-nand/bch-regs.h
similarity index 100%
rename from drivers/mtd/nand/gpmi-nand/bch-regs.h
rename to drivers/mtd/nand/raw/gpmi-nand/bch-regs.h
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
similarity index 100%
rename from drivers/mtd/nand/gpmi-nand/gpmi-lib.c
rename to drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
similarity index 100%
rename from drivers/mtd/nand/gpmi-nand/gpmi-nand.c
rename to drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
similarity index 100%
rename from drivers/mtd/nand/gpmi-nand/gpmi-nand.h
rename to drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-regs.h b/drivers/mtd/nand/raw/gpmi-nand/gpmi-regs.h
similarity index 100%
rename from drivers/mtd/nand/gpmi-nand/gpmi-regs.h
rename to drivers/mtd/nand/raw/gpmi-nand/gpmi-regs.h
diff --git a/drivers/mtd/nand/hisi504_nand.c b/drivers/mtd/nand/raw/hisi504_nand.c
similarity index 100%
rename from drivers/mtd/nand/hisi504_nand.c
rename to drivers/mtd/nand/raw/hisi504_nand.c
diff --git a/drivers/mtd/nand/jz4740_nand.c b/drivers/mtd/nand/raw/jz4740_nand.c
similarity index 100%
rename from drivers/mtd/nand/jz4740_nand.c
rename to drivers/mtd/nand/raw/jz4740_nand.c
diff --git a/drivers/mtd/nand/jz4780_bch.c b/drivers/mtd/nand/raw/jz4780_bch.c
similarity index 100%
rename from drivers/mtd/nand/jz4780_bch.c
rename to drivers/mtd/nand/raw/jz4780_bch.c
diff --git a/drivers/mtd/nand/jz4780_bch.h b/drivers/mtd/nand/raw/jz4780_bch.h
similarity index 100%
rename from drivers/mtd/nand/jz4780_bch.h
rename to drivers/mtd/nand/raw/jz4780_bch.h
diff --git a/drivers/mtd/nand/jz4780_nand.c b/drivers/mtd/nand/raw/jz4780_nand.c
similarity index 100%
rename from drivers/mtd/nand/jz4780_nand.c
rename to drivers/mtd/nand/raw/jz4780_nand.c
diff --git a/drivers/mtd/nand/lpc32xx_mlc.c b/drivers/mtd/nand/raw/lpc32xx_mlc.c
similarity index 100%
rename from drivers/mtd/nand/lpc32xx_mlc.c
rename to drivers/mtd/nand/raw/lpc32xx_mlc.c
diff --git a/drivers/mtd/nand/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
similarity index 100%
rename from drivers/mtd/nand/lpc32xx_slc.c
rename to drivers/mtd/nand/raw/lpc32xx_slc.c
diff --git a/drivers/mtd/nand/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
similarity index 100%
rename from drivers/mtd/nand/marvell_nand.c
rename to drivers/mtd/nand/raw/marvell_nand.c
diff --git a/drivers/mtd/nand/mpc5121_nfc.c b/drivers/mtd/nand/raw/mpc5121_nfc.c
similarity index 100%
rename from drivers/mtd/nand/mpc5121_nfc.c
rename to drivers/mtd/nand/raw/mpc5121_nfc.c
diff --git a/drivers/mtd/nand/mtk_ecc.c b/drivers/mtd/nand/raw/mtk_ecc.c
similarity index 100%
rename from drivers/mtd/nand/mtk_ecc.c
rename to drivers/mtd/nand/raw/mtk_ecc.c
diff --git a/drivers/mtd/nand/mtk_ecc.h b/drivers/mtd/nand/raw/mtk_ecc.h
similarity index 100%
rename from drivers/mtd/nand/mtk_ecc.h
rename to drivers/mtd/nand/raw/mtk_ecc.h
diff --git a/drivers/mtd/nand/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
similarity index 100%
rename from drivers/mtd/nand/mtk_nand.c
rename to drivers/mtd/nand/raw/mtk_nand.c
diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
similarity index 100%
rename from drivers/mtd/nand/mxc_nand.c
rename to drivers/mtd/nand/raw/mxc_nand.c
diff --git a/drivers/mtd/nand/nand_amd.c b/drivers/mtd/nand/raw/nand_amd.c
similarity index 100%
rename from drivers/mtd/nand/nand_amd.c
rename to drivers/mtd/nand/raw/nand_amd.c
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
similarity index 100%
rename from drivers/mtd/nand/nand_base.c
rename to drivers/mtd/nand/raw/nand_base.c
diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
similarity index 100%
rename from drivers/mtd/nand/nand_bbt.c
rename to drivers/mtd/nand/raw/nand_bbt.c
diff --git a/drivers/mtd/nand/nand_bch.c b/drivers/mtd/nand/raw/nand_bch.c
similarity index 100%
rename from drivers/mtd/nand/nand_bch.c
rename to drivers/mtd/nand/raw/nand_bch.c
diff --git a/drivers/mtd/nand/nand_ecc.c b/drivers/mtd/nand/raw/nand_ecc.c
similarity index 100%
rename from drivers/mtd/nand/nand_ecc.c
rename to drivers/mtd/nand/raw/nand_ecc.c
diff --git a/drivers/mtd/nand/nand_hynix.c b/drivers/mtd/nand/raw/nand_hynix.c
similarity index 100%
rename from drivers/mtd/nand/nand_hynix.c
rename to drivers/mtd/nand/raw/nand_hynix.c
diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/raw/nand_ids.c
similarity index 100%
rename from drivers/mtd/nand/nand_ids.c
rename to drivers/mtd/nand/raw/nand_ids.c
diff --git a/drivers/mtd/nand/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
similarity index 100%
rename from drivers/mtd/nand/nand_macronix.c
rename to drivers/mtd/nand/raw/nand_macronix.c
diff --git a/drivers/mtd/nand/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
similarity index 100%
rename from drivers/mtd/nand/nand_micron.c
rename to drivers/mtd/nand/raw/nand_micron.c
diff --git a/drivers/mtd/nand/nand_samsung.c b/drivers/mtd/nand/raw/nand_samsung.c
similarity index 100%
rename from drivers/mtd/nand/nand_samsung.c
rename to drivers/mtd/nand/raw/nand_samsung.c
diff --git a/drivers/mtd/nand/nand_timings.c b/drivers/mtd/nand/raw/nand_timings.c
similarity index 100%
rename from drivers/mtd/nand/nand_timings.c
rename to drivers/mtd/nand/raw/nand_timings.c
diff --git a/drivers/mtd/nand/nand_toshiba.c b/drivers/mtd/nand/raw/nand_toshiba.c
similarity index 100%
rename from drivers/mtd/nand/nand_toshiba.c
rename to drivers/mtd/nand/raw/nand_toshiba.c
diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
similarity index 100%
rename from drivers/mtd/nand/nandsim.c
rename to drivers/mtd/nand/raw/nandsim.c
diff --git a/drivers/mtd/nand/ndfc.c b/drivers/mtd/nand/raw/ndfc.c
similarity index 100%
rename from drivers/mtd/nand/ndfc.c
rename to drivers/mtd/nand/raw/ndfc.c
diff --git a/drivers/mtd/nand/nuc900_nand.c b/drivers/mtd/nand/raw/nuc900_nand.c
similarity index 100%
rename from drivers/mtd/nand/nuc900_nand.c
rename to drivers/mtd/nand/raw/nuc900_nand.c
diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/raw/omap2.c
similarity index 100%
rename from drivers/mtd/nand/omap2.c
rename to drivers/mtd/nand/raw/omap2.c
diff --git a/drivers/mtd/nand/omap_elm.c b/drivers/mtd/nand/raw/omap_elm.c
similarity index 100%
rename from drivers/mtd/nand/omap_elm.c
rename to drivers/mtd/nand/raw/omap_elm.c
diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/raw/orion_nand.c
similarity index 100%
rename from drivers/mtd/nand/orion_nand.c
rename to drivers/mtd/nand/raw/orion_nand.c
diff --git a/drivers/mtd/nand/oxnas_nand.c b/drivers/mtd/nand/raw/oxnas_nand.c
similarity index 100%
rename from drivers/mtd/nand/oxnas_nand.c
rename to drivers/mtd/nand/raw/oxnas_nand.c
diff --git a/drivers/mtd/nand/pasemi_nand.c b/drivers/mtd/nand/raw/pasemi_nand.c
similarity index 100%
rename from drivers/mtd/nand/pasemi_nand.c
rename to drivers/mtd/nand/raw/pasemi_nand.c
diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/raw/plat_nand.c
similarity index 100%
rename from drivers/mtd/nand/plat_nand.c
rename to drivers/mtd/nand/raw/plat_nand.c
diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/raw/pxa3xx_nand.c
similarity index 100%
rename from drivers/mtd/nand/pxa3xx_nand.c
rename to drivers/mtd/nand/raw/pxa3xx_nand.c
diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
similarity index 100%
rename from drivers/mtd/nand/qcom_nandc.c
rename to drivers/mtd/nand/raw/qcom_nandc.c
diff --git a/drivers/mtd/nand/r852.c b/drivers/mtd/nand/raw/r852.c
similarity index 100%
rename from drivers/mtd/nand/r852.c
rename to drivers/mtd/nand/raw/r852.c
diff --git a/drivers/mtd/nand/r852.h b/drivers/mtd/nand/raw/r852.h
similarity index 100%
rename from drivers/mtd/nand/r852.h
rename to drivers/mtd/nand/raw/r852.h
diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/raw/s3c2410.c
similarity index 100%
rename from drivers/mtd/nand/s3c2410.c
rename to drivers/mtd/nand/raw/s3c2410.c
diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/raw/sh_flctl.c
similarity index 100%
rename from drivers/mtd/nand/sh_flctl.c
rename to drivers/mtd/nand/raw/sh_flctl.c
diff --git a/drivers/mtd/nand/sharpsl.c b/drivers/mtd/nand/raw/sharpsl.c
similarity index 100%
rename from drivers/mtd/nand/sharpsl.c
rename to drivers/mtd/nand/raw/sharpsl.c
diff --git a/drivers/mtd/nand/sm_common.c b/drivers/mtd/nand/raw/sm_common.c
similarity index 100%
rename from drivers/mtd/nand/sm_common.c
rename to drivers/mtd/nand/raw/sm_common.c
diff --git a/drivers/mtd/nand/sm_common.h b/drivers/mtd/nand/raw/sm_common.h
similarity index 100%
rename from drivers/mtd/nand/sm_common.h
rename to drivers/mtd/nand/raw/sm_common.h
diff --git a/drivers/mtd/nand/socrates_nand.c b/drivers/mtd/nand/raw/socrates_nand.c
similarity index 100%
rename from drivers/mtd/nand/socrates_nand.c
rename to drivers/mtd/nand/raw/socrates_nand.c
diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
similarity index 100%
rename from drivers/mtd/nand/sunxi_nand.c
rename to drivers/mtd/nand/raw/sunxi_nand.c
diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/raw/tango_nand.c
similarity index 100%
rename from drivers/mtd/nand/tango_nand.c
rename to drivers/mtd/nand/raw/tango_nand.c
diff --git a/drivers/mtd/nand/tmio_nand.c b/drivers/mtd/nand/raw/tmio_nand.c
similarity index 100%
rename from drivers/mtd/nand/tmio_nand.c
rename to drivers/mtd/nand/raw/tmio_nand.c
diff --git a/drivers/mtd/nand/txx9ndfmc.c b/drivers/mtd/nand/raw/txx9ndfmc.c
similarity index 100%
rename from drivers/mtd/nand/txx9ndfmc.c
rename to drivers/mtd/nand/raw/txx9ndfmc.c
diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
similarity index 100%
rename from drivers/mtd/nand/vf610_nfc.c
rename to drivers/mtd/nand/raw/vf610_nfc.c
diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/raw/xway_nand.c
similarity index 100%
rename from drivers/mtd/nand/xway_nand.c
rename to drivers/mtd/nand/raw/xway_nand.c
diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index 4237c7cebf02..fa176f5937bb 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -17,7 +17,7 @@
 #include <linux/bitops.h>
 #include <linux/slab.h>
 #include <linux/mtd/nand_ecc.h>
-#include "nand/sm_common.h"
+#include "nand/raw/sm_common.h"
 #include "sm_ftl.h"
 
 
-- 
2.14.1
