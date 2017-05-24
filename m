Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dDQHQ-0007Yc-8V
 for linux-mtd@lists.infradead.org; Wed, 24 May 2017 07:00:34 +0000
From: Peter Pan <peterpandong@micron.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <arnaud.mouiche@gmail.com>,
 <thomas.petazzoni@free-electrons.com>, <marex@denx.de>,
 <cyrille.pitchen@wedev4u.fr>, <linux-mtd@lists.infradead.org>
CC: <peterpandong@micron.com>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: [PATCH v6 01/15] mtd: nand: Rename nand.h into rawnand.h
Date: Wed, 24 May 2017 15:06:57 +0800
Message-ID: <1495609631-18880-2-git-send-email-peterpandong@micron.com>
In-Reply-To: <1495609631-18880-1-git-send-email-peterpandong@micron.com>
References: <1495609631-18880-1-git-send-email-peterpandong@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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

We are planning to share more code between different NAND based
devices (SPI NAND, OneNAND and raw NANDs), but before doing that
we need to move the existing include/linux/mtd/nand.h file into
include/linux/mtd/rawnand.h so we can later create a nand.h header
containing all common structure and function prototypes.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 Documentation/DocBook/mtdnand.tmpl              | 2 +-
 MAINTAINERS                                     | 2 +-
 arch/arm/mach-davinci/board-da850-evm.c         | 2 +-
 arch/arm/mach-davinci/board-dm355-evm.c         | 2 +-
 arch/arm/mach-davinci/board-dm355-leopard.c     | 2 +-
 arch/arm/mach-davinci/board-dm365-evm.c         | 2 +-
 arch/arm/mach-davinci/board-dm644x-evm.c        | 2 +-
 arch/arm/mach-davinci/board-dm646x-evm.c        | 2 +-
 arch/arm/mach-davinci/board-sffsdr.c            | 2 +-
 arch/arm/mach-dove/dove-db-setup.c              | 2 +-
 arch/arm/mach-ep93xx/snappercl15.c              | 2 +-
 arch/arm/mach-ep93xx/ts72xx.c                   | 2 +-
 arch/arm/mach-imx/mach-qong.c                   | 2 +-
 arch/arm/mach-ixp4xx/ixdp425-setup.c            | 2 +-
 arch/arm/mach-mmp/aspenite.c                    | 2 +-
 arch/arm/mach-omap1/board-fsample.c             | 2 +-
 arch/arm/mach-omap1/board-h2.c                  | 2 +-
 arch/arm/mach-omap1/board-h3.c                  | 2 +-
 arch/arm/mach-omap1/board-nand.c                | 2 +-
 arch/arm/mach-omap1/board-perseus2.c            | 2 +-
 arch/arm/mach-orion5x/db88f5281-setup.c         | 2 +-
 arch/arm/mach-orion5x/kurobox_pro-setup.c       | 2 +-
 arch/arm/mach-orion5x/ts209-setup.c             | 2 +-
 arch/arm/mach-orion5x/ts78xx-setup.c            | 2 +-
 arch/arm/mach-pxa/balloon3.c                    | 2 +-
 arch/arm/mach-pxa/em-x270.c                     | 2 +-
 arch/arm/mach-pxa/eseries.c                     | 2 +-
 arch/arm/mach-pxa/palmtx.c                      | 2 +-
 arch/arm/mach-pxa/tosa.c                        | 2 +-
 arch/arm/mach-s3c24xx/common-smdk.c             | 2 +-
 arch/arm/mach-s3c24xx/mach-anubis.c             | 2 +-
 arch/arm/mach-s3c24xx/mach-at2440evb.c          | 2 +-
 arch/arm/mach-s3c24xx/mach-bast.c               | 2 +-
 arch/arm/mach-s3c24xx/mach-gta02.c              | 2 +-
 arch/arm/mach-s3c24xx/mach-jive.c               | 2 +-
 arch/arm/mach-s3c24xx/mach-mini2440.c           | 2 +-
 arch/arm/mach-s3c24xx/mach-osiris.c             | 2 +-
 arch/arm/mach-s3c24xx/mach-qt2410.c             | 2 +-
 arch/arm/mach-s3c24xx/mach-rx3715.c             | 2 +-
 arch/arm/mach-s3c24xx/mach-vstms.c              | 2 +-
 arch/blackfin/mach-bf537/boards/dnp5370.c       | 2 +-
 arch/blackfin/mach-bf537/boards/stamp.c         | 2 +-
 arch/blackfin/mach-bf561/boards/acvilon.c       | 2 +-
 arch/cris/arch-v32/drivers/mach-a3/nandflash.c  | 2 +-
 arch/cris/arch-v32/drivers/mach-fs/nandflash.c  | 2 +-
 arch/mips/alchemy/devboards/db1200.c            | 2 +-
 arch/mips/alchemy/devboards/db1300.c            | 2 +-
 arch/mips/alchemy/devboards/db1550.c            | 2 +-
 arch/mips/include/asm/mach-jz4740/jz4740_nand.h | 2 +-
 arch/mips/netlogic/xlr/platform-flash.c         | 2 +-
 arch/mips/pnx833x/common/platform.c             | 2 +-
 arch/mips/rb532/devices.c                       | 2 +-
 arch/sh/boards/mach-migor/setup.c               | 2 +-
 drivers/mtd/inftlcore.c                         | 2 +-
 drivers/mtd/nand/ams-delta.c                    | 2 +-
 drivers/mtd/nand/atmel/nand-controller.c        | 2 +-
 drivers/mtd/nand/atmel/pmecc.c                  | 2 +-
 drivers/mtd/nand/au1550nd.c                     | 2 +-
 drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h  | 2 +-
 drivers/mtd/nand/bf5xx_nand.c                   | 2 +-
 drivers/mtd/nand/brcmnand/brcmnand.c            | 2 +-
 drivers/mtd/nand/cafe_nand.c                    | 2 +-
 drivers/mtd/nand/cmx270_nand.c                  | 2 +-
 drivers/mtd/nand/cs553x_nand.c                  | 2 +-
 drivers/mtd/nand/davinci_nand.c                 | 2 +-
 drivers/mtd/nand/denali.h                       | 2 +-
 drivers/mtd/nand/diskonchip.c                   | 2 +-
 drivers/mtd/nand/docg4.c                        | 2 +-
 drivers/mtd/nand/fsl_elbc_nand.c                | 2 +-
 drivers/mtd/nand/fsl_ifc_nand.c                 | 2 +-
 drivers/mtd/nand/fsl_upm.c                      | 2 +-
 drivers/mtd/nand/fsmc_nand.c                    | 2 +-
 drivers/mtd/nand/gpio.c                         | 2 +-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h          | 2 +-
 drivers/mtd/nand/hisi504_nand.c                 | 2 +-
 drivers/mtd/nand/jz4740_nand.c                  | 2 +-
 drivers/mtd/nand/jz4780_nand.c                  | 2 +-
 drivers/mtd/nand/lpc32xx_mlc.c                  | 2 +-
 drivers/mtd/nand/lpc32xx_slc.c                  | 2 +-
 drivers/mtd/nand/mpc5121_nfc.c                  | 2 +-
 drivers/mtd/nand/mtk_nand.c                     | 2 +-
 drivers/mtd/nand/mxc_nand.c                     | 2 +-
 drivers/mtd/nand/nand_amd.c                     | 2 +-
 drivers/mtd/nand/nand_base.c                    | 2 +-
 drivers/mtd/nand/nand_bbt.c                     | 2 +-
 drivers/mtd/nand/nand_bch.c                     | 2 +-
 drivers/mtd/nand/nand_ecc.c                     | 2 +-
 drivers/mtd/nand/nand_hynix.c                   | 2 +-
 drivers/mtd/nand/nand_ids.c                     | 2 +-
 drivers/mtd/nand/nand_macronix.c                | 2 +-
 drivers/mtd/nand/nand_micron.c                  | 2 +-
 drivers/mtd/nand/nand_samsung.c                 | 2 +-
 drivers/mtd/nand/nand_timings.c                 | 2 +-
 drivers/mtd/nand/nand_toshiba.c                 | 2 +-
 drivers/mtd/nand/nandsim.c                      | 2 +-
 drivers/mtd/nand/ndfc.c                         | 2 +-
 drivers/mtd/nand/nuc900_nand.c                  | 2 +-
 drivers/mtd/nand/omap2.c                        | 2 +-
 drivers/mtd/nand/orion_nand.c                   | 2 +-
 drivers/mtd/nand/oxnas_nand.c                   | 2 +-
 drivers/mtd/nand/pasemi_nand.c                  | 2 +-
 drivers/mtd/nand/plat_nand.c                    | 2 +-
 drivers/mtd/nand/pxa3xx_nand.c                  | 2 +-
 drivers/mtd/nand/qcom_nandc.c                   | 2 +-
 drivers/mtd/nand/r852.h                         | 2 +-
 drivers/mtd/nand/s3c2410.c                      | 2 +-
 drivers/mtd/nand/sh_flctl.c                     | 2 +-
 drivers/mtd/nand/sharpsl.c                      | 2 +-
 drivers/mtd/nand/sm_common.c                    | 2 +-
 drivers/mtd/nand/socrates_nand.c                | 2 +-
 drivers/mtd/nand/sunxi_nand.c                   | 2 +-
 drivers/mtd/nand/tango_nand.c                   | 2 +-
 drivers/mtd/nand/tmio_nand.c                    | 2 +-
 drivers/mtd/nand/txx9ndfmc.c                    | 2 +-
 drivers/mtd/nand/vf610_nfc.c                    | 2 +-
 drivers/mtd/nand/xway_nand.c                    | 2 +-
 drivers/mtd/nftlcore.c                          | 2 +-
 drivers/mtd/nftlmount.c                         | 2 +-
 drivers/mtd/ssfdc.c                             | 2 +-
 drivers/mtd/tests/nandbiterrs.c                 | 2 +-
 drivers/staging/mt29f_spinand/mt29f_spinand.c   | 2 +-
 fs/jffs2/wbuf.c                                 | 2 +-
 include/linux/mtd/nand-gpio.h                   | 2 +-
 include/linux/mtd/{nand.h => rawnand.h}         | 8 +++-----
 include/linux/mtd/sh_flctl.h                    | 2 +-
 include/linux/mtd/sharpsl.h                     | 2 +-
 include/linux/platform_data/atmel.h             | 2 +-
 include/linux/platform_data/mtd-davinci.h       | 2 +-
 include/linux/platform_data/mtd-nand-s3c2410.h  | 2 +-
 129 files changed, 131 insertions(+), 133 deletions(-)
 rename include/linux/mtd/{nand.h => rawnand.h} (99%)

diff --git a/Documentation/DocBook/mtdnand.tmpl b/Documentation/DocBook/mtdnand.tmpl
index b442921..35ec715 100644
--- a/Documentation/DocBook/mtdnand.tmpl
+++ b/Documentation/DocBook/mtdnand.tmpl
@@ -1239,7 +1239,7 @@ in this page</entry>
      struct member has a short description which is marked with an [XXX] identifier.
      See the chapter "Documentation hints" for an explanation.
      </para>
-!Iinclude/linux/mtd/nand.h
+!Iinclude/linux/mtd/rawnand.h
   </chapter>
 
   <chapter id="pubfunctions">
diff --git a/MAINTAINERS b/MAINTAINERS
index f7d568b..81bb063 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8760,7 +8760,7 @@ T:	git git://git.infradead.org/linux-mtd.git nand/fixes
 T:	git git://git.infradead.org/l2-mtd.git nand/next
 S:	Maintained
 F:	drivers/mtd/nand/
-F:	include/linux/mtd/nand*.h
+F:	include/linux/mtd/*nand*.h
 
 NATSEMI ETHERNET DRIVER (DP8381x)
 S:	Orphan
diff --git a/arch/arm/mach-davinci/board-da850-evm.c b/arch/arm/mach-davinci/board-da850-evm.c
index b5625d0..f544103 100644
--- a/arch/arm/mach-davinci/board-da850-evm.c
+++ b/arch/arm/mach-davinci/board-da850-evm.c
@@ -26,7 +26,7 @@
 #include <linux/input/tps6507x-ts.h>
 #include <linux/mfd/tps6507x.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/physmap.h>
 #include <linux/platform_device.h>
diff --git a/arch/arm/mach-davinci/board-dm355-evm.c b/arch/arm/mach-davinci/board-dm355-evm.c
index 18296a9..62e7bc3 100644
--- a/arch/arm/mach-davinci/board-dm355-evm.c
+++ b/arch/arm/mach-davinci/board-dm355-evm.c
@@ -14,7 +14,7 @@
 #include <linux/platform_device.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/i2c.h>
 #include <linux/gpio.h>
 #include <linux/clk.h>
diff --git a/arch/arm/mach-davinci/board-dm355-leopard.c b/arch/arm/mach-davinci/board-dm355-leopard.c
index 284ff27..be99724 100644
--- a/arch/arm/mach-davinci/board-dm355-leopard.c
+++ b/arch/arm/mach-davinci/board-dm355-leopard.c
@@ -13,7 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/i2c.h>
 #include <linux/gpio.h>
 #include <linux/clk.h>
diff --git a/arch/arm/mach-davinci/board-dm365-evm.c b/arch/arm/mach-davinci/board-dm365-evm.c
index 0464999..e75741f 100644
--- a/arch/arm/mach-davinci/board-dm365-evm.c
+++ b/arch/arm/mach-davinci/board-dm365-evm.c
@@ -23,7 +23,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 #include <linux/slab.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/input.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/eeprom.h>
diff --git a/arch/arm/mach-davinci/board-dm644x-evm.c b/arch/arm/mach-davinci/board-dm644x-evm.c
index 20f1874..1b05660 100644
--- a/arch/arm/mach-davinci/board-dm644x-evm.c
+++ b/arch/arm/mach-davinci/board-dm644x-evm.c
@@ -17,7 +17,7 @@
 #include <linux/i2c/pcf857x.h>
 #include <linux/platform_data/at24.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/physmap.h>
 #include <linux/phy.h>
diff --git a/arch/arm/mach-davinci/board-dm646x-evm.c b/arch/arm/mach-davinci/board-dm646x-evm.c
index cb17682..19d1eb2 100644
--- a/arch/arm/mach-davinci/board-dm646x-evm.c
+++ b/arch/arm/mach-davinci/board-dm646x-evm.c
@@ -29,7 +29,7 @@
 #include <media/i2c/adv7343.h>
 
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/clk.h>
 #include <linux/export.h>
diff --git a/arch/arm/mach-davinci/board-sffsdr.c b/arch/arm/mach-davinci/board-sffsdr.c
index 41c7c96..d85accf 100644
--- a/arch/arm/mach-davinci/board-sffsdr.c
+++ b/arch/arm/mach-davinci/board-sffsdr.c
@@ -28,7 +28,7 @@
 #include <linux/i2c.h>
 #include <linux/platform_data/at24.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 
 #include <asm/mach-types.h>
diff --git a/arch/arm/mach-dove/dove-db-setup.c b/arch/arm/mach-dove/dove-db-setup.c
index bcb678f..8971c3c 100644
--- a/arch/arm/mach-dove/dove-db-setup.c
+++ b/arch/arm/mach-dove/dove-db-setup.c
@@ -13,7 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/irq.h>
 #include <linux/mtd/physmap.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/timer.h>
 #include <linux/ata_platform.h>
 #include <linux/mv643xx_eth.h>
diff --git a/arch/arm/mach-ep93xx/snappercl15.c b/arch/arm/mach-ep93xx/snappercl15.c
index b2db791..8b29398 100644
--- a/arch/arm/mach-ep93xx/snappercl15.c
+++ b/arch/arm/mach-ep93xx/snappercl15.c
@@ -25,7 +25,7 @@
 #include <linux/fb.h>
 
 #include <linux/mtd/partitions.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 
 #include <mach/hardware.h>
 #include <linux/platform_data/video-ep93xx.h>
diff --git a/arch/arm/mach-ep93xx/ts72xx.c b/arch/arm/mach-ep93xx/ts72xx.c
index 55b186e..8745162 100644
--- a/arch/arm/mach-ep93xx/ts72xx.c
+++ b/arch/arm/mach-ep93xx/ts72xx.c
@@ -16,7 +16,7 @@
 #include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 
 #include <mach/hardware.h>
diff --git a/arch/arm/mach-imx/mach-qong.c b/arch/arm/mach-imx/mach-qong.c
index 8c2cbd6..42a7000 100644
--- a/arch/arm/mach-imx/mach-qong.c
+++ b/arch/arm/mach-imx/mach-qong.c
@@ -18,7 +18,7 @@
 #include <linux/memory.h>
 #include <linux/platform_device.h>
 #include <linux/mtd/physmap.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/gpio.h>
 
 #include <asm/mach-types.h>
diff --git a/arch/arm/mach-ixp4xx/ixdp425-setup.c b/arch/arm/mach-ixp4xx/ixdp425-setup.c
index 508c2d7..93b89291 100644
--- a/arch/arm/mach-ixp4xx/ixdp425-setup.c
+++ b/arch/arm/mach-ixp4xx/ixdp425-setup.c
@@ -17,7 +17,7 @@
 #include <linux/i2c-gpio.h>
 #include <linux/io.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/delay.h>
 #include <linux/gpio.h>
diff --git a/arch/arm/mach-mmp/aspenite.c b/arch/arm/mach-mmp/aspenite.c
index 5db0edf..d228300 100644
--- a/arch/arm/mach-mmp/aspenite.c
+++ b/arch/arm/mach-mmp/aspenite.c
@@ -16,7 +16,7 @@
 #include <linux/smc91x.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/interrupt.h>
 #include <linux/platform_data/mv_usb.h>
 
diff --git a/arch/arm/mach-omap1/board-fsample.c b/arch/arm/mach-omap1/board-fsample.c
index fad95b7..b93ad58 100644
--- a/arch/arm/mach-omap1/board-fsample.c
+++ b/arch/arm/mach-omap1/board-fsample.c
@@ -16,7 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/delay.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/physmap.h>
 #include <linux/input.h>
diff --git a/arch/arm/mach-omap1/board-h2.c b/arch/arm/mach-omap1/board-h2.c
index 675254e..a444b13 100644
--- a/arch/arm/mach-omap1/board-h2.c
+++ b/arch/arm/mach-omap1/board-h2.c
@@ -24,7 +24,7 @@
 #include <linux/delay.h>
 #include <linux/i2c.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/physmap.h>
 #include <linux/input.h>
diff --git a/arch/arm/mach-omap1/board-h3.c b/arch/arm/mach-omap1/board-h3.c
index e62f9d4..a618a49 100644
--- a/arch/arm/mach-omap1/board-h3.c
+++ b/arch/arm/mach-omap1/board-h3.c
@@ -23,7 +23,7 @@
 #include <linux/workqueue.h>
 #include <linux/i2c.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/physmap.h>
 #include <linux/input.h>
diff --git a/arch/arm/mach-omap1/board-nand.c b/arch/arm/mach-omap1/board-nand.c
index 7684f92..1bffbb4 100644
--- a/arch/arm/mach-omap1/board-nand.c
+++ b/arch/arm/mach-omap1/board-nand.c
@@ -16,7 +16,7 @@
 #include <linux/kernel.h>
 #include <linux/io.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 
 #include "common.h"
 
diff --git a/arch/arm/mach-omap1/board-perseus2.c b/arch/arm/mach-omap1/board-perseus2.c
index 150b57b..e994a78 100644
--- a/arch/arm/mach-omap1/board-perseus2.c
+++ b/arch/arm/mach-omap1/board-perseus2.c
@@ -16,7 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/delay.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/physmap.h>
 #include <linux/input.h>
diff --git a/arch/arm/mach-orion5x/db88f5281-setup.c b/arch/arm/mach-orion5x/db88f5281-setup.c
index 12f74b4..3f5863d 100644
--- a/arch/arm/mach-orion5x/db88f5281-setup.c
+++ b/arch/arm/mach-orion5x/db88f5281-setup.c
@@ -16,7 +16,7 @@
 #include <linux/pci.h>
 #include <linux/irq.h>
 #include <linux/mtd/physmap.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/timer.h>
 #include <linux/mv643xx_eth.h>
 #include <linux/i2c.h>
diff --git a/arch/arm/mach-orion5x/kurobox_pro-setup.c b/arch/arm/mach-orion5x/kurobox_pro-setup.c
index 9dc3f59..83d43cf 100644
--- a/arch/arm/mach-orion5x/kurobox_pro-setup.c
+++ b/arch/arm/mach-orion5x/kurobox_pro-setup.c
@@ -15,7 +15,7 @@
 #include <linux/irq.h>
 #include <linux/delay.h>
 #include <linux/mtd/physmap.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mv643xx_eth.h>
 #include <linux/i2c.h>
 #include <linux/serial_reg.h>
diff --git a/arch/arm/mach-orion5x/ts209-setup.c b/arch/arm/mach-orion5x/ts209-setup.c
index 7bd671b..0c31551 100644
--- a/arch/arm/mach-orion5x/ts209-setup.c
+++ b/arch/arm/mach-orion5x/ts209-setup.c
@@ -15,7 +15,7 @@
 #include <linux/pci.h>
 #include <linux/irq.h>
 #include <linux/mtd/physmap.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mv643xx_eth.h>
 #include <linux/gpio_keys.h>
 #include <linux/input.h>
diff --git a/arch/arm/mach-orion5x/ts78xx-setup.c b/arch/arm/mach-orion5x/ts78xx-setup.c
index 7ef80a8..9477873 100644
--- a/arch/arm/mach-orion5x/ts78xx-setup.c
+++ b/arch/arm/mach-orion5x/ts78xx-setup.c
@@ -16,7 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/mv643xx_eth.h>
 #include <linux/ata_platform.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/timeriomem-rng.h>
 #include <asm/mach-types.h>
diff --git a/arch/arm/mach-pxa/balloon3.c b/arch/arm/mach-pxa/balloon3.c
index d452a49..33d7ef1 100644
--- a/arch/arm/mach-pxa/balloon3.c
+++ b/arch/arm/mach-pxa/balloon3.c
@@ -29,7 +29,7 @@
 #include <linux/types.h>
 #include <linux/i2c/pcf857x.h>
 #include <linux/i2c/pxa-i2c.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/physmap.h>
 #include <linux/regulator/max1586.h>
 
diff --git a/arch/arm/mach-pxa/em-x270.c b/arch/arm/mach-pxa/em-x270.c
index 811a731..6d28035 100644
--- a/arch/arm/mach-pxa/em-x270.c
+++ b/arch/arm/mach-pxa/em-x270.c
@@ -15,7 +15,7 @@
 
 #include <linux/dm9000.h>
 #include <linux/platform_data/rtc-v3020.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/physmap.h>
 #include <linux/input.h>
diff --git a/arch/arm/mach-pxa/eseries.c b/arch/arm/mach-pxa/eseries.c
index fa9d71d..91f7c3e 100644
--- a/arch/arm/mach-pxa/eseries.c
+++ b/arch/arm/mach-pxa/eseries.c
@@ -20,7 +20,7 @@
 #include <linux/mfd/tc6387xb.h>
 #include <linux/mfd/tc6393xb.h>
 #include <linux/mfd/t7l66xb.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/usb/gpio_vbus.h>
 #include <linux/memblock.h>
diff --git a/arch/arm/mach-pxa/palmtx.c b/arch/arm/mach-pxa/palmtx.c
index 3664697..47e3e38 100644
--- a/arch/arm/mach-pxa/palmtx.c
+++ b/arch/arm/mach-pxa/palmtx.c
@@ -28,7 +28,7 @@
 #include <linux/wm97xx.h>
 #include <linux/power_supply.h>
 #include <linux/usb/gpio_vbus.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/physmap.h>
diff --git a/arch/arm/mach-pxa/tosa.c b/arch/arm/mach-pxa/tosa.c
index 13de660..6a386fd 100644
--- a/arch/arm/mach-pxa/tosa.c
+++ b/arch/arm/mach-pxa/tosa.c
@@ -24,7 +24,7 @@
 #include <linux/mmc/host.h>
 #include <linux/mfd/tc6393xb.h>
 #include <linux/mfd/tmio.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/physmap.h>
 #include <linux/pm.h>
diff --git a/arch/arm/mach-s3c24xx/common-smdk.c b/arch/arm/mach-s3c24xx/common-smdk.c
index 9e0bc46..0e116c9 100644
--- a/arch/arm/mach-s3c24xx/common-smdk.c
+++ b/arch/arm/mach-s3c24xx/common-smdk.c
@@ -23,7 +23,7 @@
 #include <linux/platform_device.h>
 
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/partitions.h>
 #include <linux/io.h>
diff --git a/arch/arm/mach-s3c24xx/mach-anubis.c b/arch/arm/mach-s3c24xx/mach-anubis.c
index 029ef1b..c14cab3 100644
--- a/arch/arm/mach-s3c24xx/mach-anubis.c
+++ b/arch/arm/mach-s3c24xx/mach-anubis.c
@@ -40,7 +40,7 @@
 #include <linux/platform_data/i2c-s3c2410.h>
 
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/partitions.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-at2440evb.c b/arch/arm/mach-s3c24xx/mach-at2440evb.c
index 7b28eb6..ebdbafb 100644
--- a/arch/arm/mach-s3c24xx/mach-at2440evb.c
+++ b/arch/arm/mach-s3c24xx/mach-at2440evb.c
@@ -41,7 +41,7 @@
 #include <linux/platform_data/i2c-s3c2410.h>
 
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/partitions.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-bast.c b/arch/arm/mach-s3c24xx/mach-bast.c
index 5185036..704dc84 100644
--- a/arch/arm/mach-s3c24xx/mach-bast.c
+++ b/arch/arm/mach-s3c24xx/mach-bast.c
@@ -28,7 +28,7 @@
 #include <linux/serial_8250.h>
 
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/partitions.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-gta02.c b/arch/arm/mach-s3c24xx/mach-gta02.c
index b0ed401..afe18ba 100644
--- a/arch/arm/mach-s3c24xx/mach-gta02.c
+++ b/arch/arm/mach-s3c24xx/mach-gta02.c
@@ -50,7 +50,7 @@
 #include <linux/mfd/pcf50633/pmic.h>
 
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/physmap.h>
diff --git a/arch/arm/mach-s3c24xx/mach-jive.c b/arch/arm/mach-s3c24xx/mach-jive.c
index f5b5c49..1782197 100644
--- a/arch/arm/mach-s3c24xx/mach-jive.c
+++ b/arch/arm/mach-s3c24xx/mach-jive.c
@@ -43,7 +43,7 @@
 #include <asm/mach-types.h>
 
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/partitions.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-mini2440.c b/arch/arm/mach-s3c24xx/mach-mini2440.c
index 71af8d2..15140d3 100644
--- a/arch/arm/mach-s3c24xx/mach-mini2440.c
+++ b/arch/arm/mach-s3c24xx/mach-mini2440.c
@@ -49,7 +49,7 @@
 #include <linux/platform_data/usb-s3c2410_udc.h>
 
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/partitions.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-osiris.c b/arch/arm/mach-s3c24xx/mach-osiris.c
index 70b0eb7..a6657e7 100644
--- a/arch/arm/mach-s3c24xx/mach-osiris.c
+++ b/arch/arm/mach-s3c24xx/mach-osiris.c
@@ -36,7 +36,7 @@
 #include <linux/platform_data/i2c-s3c2410.h>
 
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/partitions.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-qt2410.c b/arch/arm/mach-s3c24xx/mach-qt2410.c
index 868c820..84e3a9c 100644
--- a/arch/arm/mach-s3c24xx/mach-qt2410.c
+++ b/arch/arm/mach-s3c24xx/mach-qt2410.c
@@ -36,7 +36,7 @@
 #include <linux/spi/spi_gpio.h>
 #include <linux/io.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/partitions.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-rx3715.c b/arch/arm/mach-s3c24xx/mach-rx3715.c
index a39fb97..b5ba615 100644
--- a/arch/arm/mach-s3c24xx/mach-rx3715.c
+++ b/arch/arm/mach-s3c24xx/mach-rx3715.c
@@ -27,7 +27,7 @@
 #include <linux/serial.h>
 #include <linux/io.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/partitions.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-vstms.c b/arch/arm/mach-s3c24xx/mach-vstms.c
index f5e6322..1adc957 100644
--- a/arch/arm/mach-s3c24xx/mach-vstms.c
+++ b/arch/arm/mach-s3c24xx/mach-vstms.c
@@ -20,7 +20,7 @@
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/partitions.h>
 #include <linux/memblock.h>
diff --git a/arch/blackfin/mach-bf537/boards/dnp5370.c b/arch/blackfin/mach-bf537/boards/dnp5370.c
index e79b3b8..c4a8ffb 100644
--- a/arch/blackfin/mach-bf537/boards/dnp5370.c
+++ b/arch/blackfin/mach-bf537/boards/dnp5370.c
@@ -17,7 +17,7 @@
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/plat-ram.h>
 #include <linux/mtd/physmap.h>
diff --git a/arch/blackfin/mach-bf537/boards/stamp.c b/arch/blackfin/mach-bf537/boards/stamp.c
index eaec7b4..ab3034f 100644
--- a/arch/blackfin/mach-bf537/boards/stamp.c
+++ b/arch/blackfin/mach-bf537/boards/stamp.c
@@ -12,7 +12,7 @@
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/plat-ram.h>
 #include <linux/mtd/physmap.h>
diff --git a/arch/blackfin/mach-bf561/boards/acvilon.c b/arch/blackfin/mach-bf561/boards/acvilon.c
index 37f8f25..696cc9d 100644
--- a/arch/blackfin/mach-bf561/boards/acvilon.c
+++ b/arch/blackfin/mach-bf561/boards/acvilon.c
@@ -38,7 +38,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/physmap.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/plat-ram.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/flash.h>
diff --git a/arch/cris/arch-v32/drivers/mach-a3/nandflash.c b/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
index 3f646c7..925a98e 100644
--- a/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
+++ b/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
@@ -16,7 +16,7 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <arch/memmap.h>
 #include <hwregs/reg_map.h>
diff --git a/arch/cris/arch-v32/drivers/mach-fs/nandflash.c b/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
index a745405..53b56a4 100644
--- a/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
+++ b/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
@@ -16,7 +16,7 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <arch/memmap.h>
 #include <hwregs/reg_map.h>
diff --git a/arch/mips/alchemy/devboards/db1200.c b/arch/mips/alchemy/devboards/db1200.c
index 992442a..8383100 100644
--- a/arch/mips/alchemy/devboards/db1200.c
+++ b/arch/mips/alchemy/devboards/db1200.c
@@ -29,7 +29,7 @@
 #include <linux/leds.h>
 #include <linux/mmc/host.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/platform_device.h>
 #include <linux/serial_8250.h>
diff --git a/arch/mips/alchemy/devboards/db1300.c b/arch/mips/alchemy/devboards/db1300.c
index a5504f5..3e7fbdb 100644
--- a/arch/mips/alchemy/devboards/db1300.c
+++ b/arch/mips/alchemy/devboards/db1300.c
@@ -18,7 +18,7 @@
 #include <linux/mmc/host.h>
 #include <linux/module.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/platform_device.h>
 #include <linux/smsc911x.h>
diff --git a/arch/mips/alchemy/devboards/db1550.c b/arch/mips/alchemy/devboards/db1550.c
index 1c01d6e..421bd57 100644
--- a/arch/mips/alchemy/devboards/db1550.c
+++ b/arch/mips/alchemy/devboards/db1550.c
@@ -12,7 +12,7 @@
 #include <linux/io.h>
 #include <linux/interrupt.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
diff --git a/arch/mips/include/asm/mach-jz4740/jz4740_nand.h b/arch/mips/include/asm/mach-jz4740/jz4740_nand.h
index 7f7b0fc..f381d46 100644
--- a/arch/mips/include/asm/mach-jz4740/jz4740_nand.h
+++ b/arch/mips/include/asm/mach-jz4740/jz4740_nand.h
@@ -16,7 +16,7 @@
 #ifndef __ASM_MACH_JZ4740_JZ4740_NAND_H__
 #define __ASM_MACH_JZ4740_JZ4740_NAND_H__
 
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 
 #define JZ_NAND_NUM_BANKS 4
diff --git a/arch/mips/netlogic/xlr/platform-flash.c b/arch/mips/netlogic/xlr/platform-flash.c
index f03131f..4d1b4c0 100644
--- a/arch/mips/netlogic/xlr/platform-flash.c
+++ b/arch/mips/netlogic/xlr/platform-flash.c
@@ -19,7 +19,7 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/physmap.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 
 #include <asm/netlogic/haldefs.h>
diff --git a/arch/mips/pnx833x/common/platform.c b/arch/mips/pnx833x/common/platform.c
index 7cf4eb5..a7a4e9f 100644
--- a/arch/mips/pnx833x/common/platform.c
+++ b/arch/mips/pnx833x/common/platform.c
@@ -30,7 +30,7 @@
 #include <linux/resource.h>
 #include <linux/serial.h>
 #include <linux/serial_pnx8xxx.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 
 #include <irq.h>
diff --git a/arch/mips/rb532/devices.c b/arch/mips/rb532/devices.c
index 0966adc..32ea3e6 100644
--- a/arch/mips/rb532/devices.c
+++ b/arch/mips/rb532/devices.c
@@ -20,7 +20,7 @@
 #include <linux/ctype.h>
 #include <linux/string.h>
 #include <linux/platform_device.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 #include <linux/gpio.h>
diff --git a/arch/sh/boards/mach-migor/setup.c b/arch/sh/boards/mach-migor/setup.c
index 5de60a7..0bcbe58 100644
--- a/arch/sh/boards/mach-migor/setup.c
+++ b/arch/sh/boards/mach-migor/setup.c
@@ -15,7 +15,7 @@
 #include <linux/mmc/host.h>
 #include <linux/mtd/physmap.h>
 #include <linux/mfd/tmio.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/i2c.h>
 #include <linux/regulator/fixed.h>
 #include <linux/regulator/machine.h>
diff --git a/drivers/mtd/inftlcore.c b/drivers/mtd/inftlcore.c
index 8db740d..57ef1fb 100644
--- a/drivers/mtd/inftlcore.c
+++ b/drivers/mtd/inftlcore.c
@@ -33,7 +33,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/nftl.h>
 #include <linux/mtd/inftl.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/uaccess.h>
 #include <asm/errno.h>
 #include <asm/io.h>
diff --git a/drivers/mtd/nand/ams-delta.c b/drivers/mtd/nand/ams-delta.c
index 5d6c26f..dcec9cf 100644
--- a/drivers/mtd/nand/ams-delta.c
+++ b/drivers/mtd/nand/ams-delta.c
@@ -20,7 +20,7 @@
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/gpio.h>
 #include <linux/platform_data/gpio-omap.h>
diff --git a/drivers/mtd/nand/atmel/nand-controller.c b/drivers/mtd/nand/atmel/nand-controller.c
index 3b24468..9abfc5d 100644
--- a/drivers/mtd/nand/atmel/nand-controller.c
+++ b/drivers/mtd/nand/atmel/nand-controller.c
@@ -58,7 +58,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/mfd/syscon/atmel-matrix.h>
 #include <linux/module.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
diff --git a/drivers/mtd/nand/atmel/pmecc.c b/drivers/mtd/nand/atmel/pmecc.c
index 55a8ee5..27a969a 100644
--- a/drivers/mtd/nand/atmel/pmecc.c
+++ b/drivers/mtd/nand/atmel/pmecc.c
@@ -47,7 +47,7 @@
 #include <linux/genalloc.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
diff --git a/drivers/mtd/nand/au1550nd.c b/drivers/mtd/nand/au1550nd.c
index 9bf6d99..9d4a28f 100644
--- a/drivers/mtd/nand/au1550nd.c
+++ b/drivers/mtd/nand/au1550nd.c
@@ -14,7 +14,7 @@
 #include <linux/module.h>
 #include <linux/interrupt.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/platform_device.h>
 #include <asm/io.h>
diff --git a/drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h b/drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h
index 8ea7571..c883476 100644
--- a/drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h
+++ b/drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h
@@ -6,7 +6,7 @@
 #endif
 
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 
 struct bcm47xxnflash {
 	struct bcma_drv_cc *cc;
diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index 3962f55..5655dca 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -49,7 +49,7 @@
 #include <linux/bitops.h>
 
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/partitions.h>
 
diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index 7419c5c..e0eb51d 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -29,7 +29,7 @@
 #include <linux/bitops.h>
 #include <linux/mm.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
index d40c32d..0541c64 100644
--- a/drivers/mtd/nand/cafe_nand.c
+++ b/drivers/mtd/nand/cafe_nand.c
@@ -13,7 +13,7 @@
 #include <linux/device.h>
 #undef DEBUG
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/rslib.h>
 #include <linux/pci.h>
diff --git a/drivers/mtd/nand/cmx270_nand.c b/drivers/mtd/nand/cmx270_nand.c
index 949b940..1fc435f 100644
--- a/drivers/mtd/nand/cmx270_nand.c
+++ b/drivers/mtd/nand/cmx270_nand.c
@@ -18,7 +18,7 @@
  *   CM-X270 board.
  */
 
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/slab.h>
 #include <linux/gpio.h>
diff --git a/drivers/mtd/nand/cs553x_nand.c b/drivers/mtd/nand/cs553x_nand.c
index 594b286..d488775 100644
--- a/drivers/mtd/nand/cs553x_nand.c
+++ b/drivers/mtd/nand/cs553x_nand.c
@@ -24,7 +24,7 @@
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/partitions.h>
 
diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index 7b26e53..ccc8c43 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -29,7 +29,7 @@
 #include <linux/err.h>
 #include <linux/clk.h>
 #include <linux/io.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/slab.h>
 #include <linux/of_device.h>
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index ec00485..a539360 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -21,7 +21,7 @@
 #define __DENALI_H__
 
 #include <linux/bitops.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 
 #define DEVICE_RESET				0x0
 #define     DEVICE_RESET__BANK0				0x0001
diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
index a023ab9..c3aa53c 100644
--- a/drivers/mtd/nand/diskonchip.c
+++ b/drivers/mtd/nand/diskonchip.c
@@ -27,7 +27,7 @@
 #include <linux/io.h>
 
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/doc2000.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/inftl.h>
diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c
index 7af2a3c..e038130 100644
--- a/drivers/mtd/nand/docg4.c
+++ b/drivers/mtd/nand/docg4.c
@@ -41,7 +41,7 @@
 #include <linux/bitops.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/bch.h>
 #include <linux/bitrev.h>
 #include <linux/jiffies.h>
diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index 113f76e..7d8453e 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -34,7 +34,7 @@
 #include <linux/interrupt.h>
 
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/partitions.h>
 
diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index d1570f5..b9b8534 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -26,7 +26,7 @@
 #include <linux/of_address.h>
 #include <linux/slab.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/fsl_ifc.h>
diff --git a/drivers/mtd/nand/fsl_upm.c b/drivers/mtd/nand/fsl_upm.c
index d85fa25..a88e2cf 100644
--- a/drivers/mtd/nand/fsl_upm.c
+++ b/drivers/mtd/nand/fsl_upm.c
@@ -14,7 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/delay.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/mtd.h>
diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index de57554..bab7064 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -28,7 +28,7 @@
 #include <linux/sched.h>
 #include <linux/types.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index 85294f1..fd36489 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -26,7 +26,7 @@
 #include <linux/gpio.h>
 #include <linux/io.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/nand-gpio.h>
 #include <linux/of.h>
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
index e88a45a..f3181a4 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
@@ -17,7 +17,7 @@
 #ifndef __DRIVERS_MTD_NAND_GPMI_NAND_H
 #define __DRIVERS_MTD_NAND_GPMI_NAND_H
 
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/platform_device.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
diff --git a/drivers/mtd/nand/hisi504_nand.c b/drivers/mtd/nand/hisi504_nand.c
index e40364e..d09df18 100644
--- a/drivers/mtd/nand/hisi504_nand.c
+++ b/drivers/mtd/nand/hisi504_nand.c
@@ -26,7 +26,7 @@
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/dma-mapping.h>
 #include <linux/platform_device.h>
 #include <linux/mtd/partitions.h>
diff --git a/drivers/mtd/nand/jz4740_nand.c b/drivers/mtd/nand/jz4740_nand.c
index 5551c36..e813ec1 100644
--- a/drivers/mtd/nand/jz4740_nand.c
+++ b/drivers/mtd/nand/jz4740_nand.c
@@ -20,7 +20,7 @@
 #include <linux/slab.h>
 
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 
 #include <linux/gpio.h>
diff --git a/drivers/mtd/nand/jz4780_nand.c b/drivers/mtd/nand/jz4780_nand.c
index 8bc835f..e69f6ae 100644
--- a/drivers/mtd/nand/jz4780_nand.c
+++ b/drivers/mtd/nand/jz4780_nand.c
@@ -20,7 +20,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 
 #include <linux/jz4780-nemc.h>
diff --git a/drivers/mtd/nand/lpc32xx_mlc.c b/drivers/mtd/nand/lpc32xx_mlc.c
index 846a66c..bffa01c 100644
--- a/drivers/mtd/nand/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/lpc32xx_mlc.c
@@ -27,7 +27,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/clk.h>
 #include <linux/err.h>
diff --git a/drivers/mtd/nand/lpc32xx_slc.c b/drivers/mtd/nand/lpc32xx_slc.c
index a0669a3..7c8402f 100644
--- a/drivers/mtd/nand/lpc32xx_slc.c
+++ b/drivers/mtd/nand/lpc32xx_slc.c
@@ -23,7 +23,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/clk.h>
 #include <linux/err.h>
diff --git a/drivers/mtd/nand/mpc5121_nfc.c b/drivers/mtd/nand/mpc5121_nfc.c
index 6d6eaed..55f1d4a 100644
--- a/drivers/mtd/nand/mpc5121_nfc.c
+++ b/drivers/mtd/nand/mpc5121_nfc.c
@@ -33,7 +33,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
diff --git a/drivers/mtd/nand/mtk_nand.c b/drivers/mtd/nand/mtk_nand.c
index 6c517c6..3f4a98b 100644
--- a/drivers/mtd/nand/mtk_nand.c
+++ b/drivers/mtd/nand/mtk_nand.c
@@ -19,7 +19,7 @@
 #include <linux/interrupt.h>
 #include <linux/delay.h>
 #include <linux/clk.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/mtd.h>
 #include <linux/module.h>
 #include <linux/iopoll.h>
diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 61ca020..42bff4a 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -22,7 +22,7 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/interrupt.h>
 #include <linux/device.h>
diff --git a/drivers/mtd/nand/nand_amd.c b/drivers/mtd/nand/nand_amd.c
index 170403a..22f060f 100644
--- a/drivers/mtd/nand/nand_amd.c
+++ b/drivers/mtd/nand/nand_amd.c
@@ -15,7 +15,7 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 
 static void amd_nand_decode_id(struct nand_chip *chip)
 {
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 54a1dfa..730165b 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -39,7 +39,7 @@
 #include <linux/nmi.h>
 #include <linux/types.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/nand_bch.h>
 #include <linux/interrupt.h>
diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 7695efe..2915b67 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -61,7 +61,7 @@
 #include <linux/types.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/bbm.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/vmalloc.h>
diff --git a/drivers/mtd/nand/nand_bch.c b/drivers/mtd/nand/nand_bch.c
index 44763f8..505441c 100644
--- a/drivers/mtd/nand/nand_bch.c
+++ b/drivers/mtd/nand/nand_bch.c
@@ -25,7 +25,7 @@
 #include <linux/slab.h>
 #include <linux/bitops.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/nand_bch.h>
 #include <linux/bch.h>
 
diff --git a/drivers/mtd/nand/nand_ecc.c b/drivers/mtd/nand/nand_ecc.c
index d1770b0..7613a03 100644
--- a/drivers/mtd/nand/nand_ecc.c
+++ b/drivers/mtd/nand/nand_ecc.c
@@ -43,7 +43,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <asm/byteorder.h>
 #else
diff --git a/drivers/mtd/nand/nand_hynix.c b/drivers/mtd/nand/nand_hynix.c
index b12dc73..b735cc8 100644
--- a/drivers/mtd/nand/nand_hynix.c
+++ b/drivers/mtd/nand/nand_hynix.c
@@ -15,7 +15,7 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
 
diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index 9d5ca0e..3e87adc 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -7,7 +7,7 @@
  *
  */
 #include <linux/module.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/sizes.h>
 
 #define LP_OPTIONS 0
diff --git a/drivers/mtd/nand/nand_macronix.c b/drivers/mtd/nand/nand_macronix.c
index 84855c3..d290ff2 100644
--- a/drivers/mtd/nand/nand_macronix.c
+++ b/drivers/mtd/nand/nand_macronix.c
@@ -15,7 +15,7 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 
 static int macronix_nand_init(struct nand_chip *chip)
 {
diff --git a/drivers/mtd/nand/nand_micron.c b/drivers/mtd/nand/nand_micron.c
index 0987f32..02c4c1f 100644
--- a/drivers/mtd/nand/nand_micron.c
+++ b/drivers/mtd/nand/nand_micron.c
@@ -15,7 +15,7 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 
 /*
  * Special Micron status bit that indicates when the block has been
diff --git a/drivers/mtd/nand/nand_samsung.c b/drivers/mtd/nand/nand_samsung.c
index 9cfc403..ca17b44 100644
--- a/drivers/mtd/nand/nand_samsung.c
+++ b/drivers/mtd/nand/nand_samsung.c
@@ -15,7 +15,7 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 
 static void samsung_nand_decode_id(struct nand_chip *chip)
 {
diff --git a/drivers/mtd/nand/nand_timings.c b/drivers/mtd/nand/nand_timings.c
index f06312d..90228b9 100644
--- a/drivers/mtd/nand/nand_timings.c
+++ b/drivers/mtd/nand/nand_timings.c
@@ -11,7 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/err.h>
 #include <linux/export.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 
 static const struct nand_data_interface onfi_sdr_timings[] = {
 	/* Mode 0 */
diff --git a/drivers/mtd/nand/nand_toshiba.c b/drivers/mtd/nand/nand_toshiba.c
index fa787ba..57df857 100644
--- a/drivers/mtd/nand/nand_toshiba.c
+++ b/drivers/mtd/nand/nand_toshiba.c
@@ -15,7 +15,7 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 
 static void toshiba_nand_decode_id(struct nand_chip *chip)
 {
diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 03a0d05..5ba4635 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -33,7 +33,7 @@
 #include <linux/errno.h>
 #include <linux/string.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/nand_bch.h>
 #include <linux/mtd/partitions.h>
 #include <linux/delay.h>
diff --git a/drivers/mtd/nand/ndfc.c b/drivers/mtd/nand/ndfc.c
index 28e6118..d8a8068 100644
--- a/drivers/mtd/nand/ndfc.c
+++ b/drivers/mtd/nand/ndfc.c
@@ -22,7 +22,7 @@
  *
  */
 #include <linux/module.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/ndfc.h>
diff --git a/drivers/mtd/nand/nuc900_nand.c b/drivers/mtd/nand/nuc900_nand.c
index 8f64011..7bb4d2e 100644
--- a/drivers/mtd/nand/nuc900_nand.c
+++ b/drivers/mtd/nand/nuc900_nand.c
@@ -19,7 +19,7 @@
 #include <linux/err.h>
 
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 
 #define REG_FMICSR   	0x00
diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 084934a..54540c8 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -18,7 +18,7 @@
 #include <linux/jiffies.h>
 #include <linux/sched.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/omap-dma.h>
 #include <linux/io.h>
diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
index f8e463a..ae4c0be 100644
--- a/drivers/mtd/nand/orion_nand.c
+++ b/drivers/mtd/nand/orion_nand.c
@@ -15,7 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/of.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/clk.h>
 #include <linux/err.h>
diff --git a/drivers/mtd/nand/oxnas_nand.c b/drivers/mtd/nand/oxnas_nand.c
index 1b207aa..f14eec3 100644
--- a/drivers/mtd/nand/oxnas_nand.c
+++ b/drivers/mtd/nand/oxnas_nand.c
@@ -21,7 +21,7 @@
 #include <linux/clk.h>
 #include <linux/reset.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/of.h>
 
diff --git a/drivers/mtd/nand/pasemi_nand.c b/drivers/mtd/nand/pasemi_nand.c
index 074b8b0..a47a7e4 100644
--- a/drivers/mtd/nand/pasemi_nand.c
+++ b/drivers/mtd/nand/pasemi_nand.c
@@ -25,7 +25,7 @@
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index 791de3e..925a132 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -15,7 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 
 struct plat_nand_data {
diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 649ba82..fc4d35e 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -21,7 +21,7 @@
 #include <linux/delay.h>
 #include <linux/clk.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index 57d483a..a77c66f 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -17,7 +17,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
 #include <linux/module.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
diff --git a/drivers/mtd/nand/r852.h b/drivers/mtd/nand/r852.h
index d042ddb..8713c57 100644
--- a/drivers/mtd/nand/r852.h
+++ b/drivers/mtd/nand/r852.h
@@ -10,7 +10,7 @@
 #include <linux/pci.h>
 #include <linux/completion.h>
 #include <linux/workqueue.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/spinlock.h>
 
 
diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index f0b030d..0b2314b 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -43,7 +43,7 @@
 #include <linux/of_device.h>
 
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/partitions.h>
 
diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index 442ce61..492705f 100644
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@ -38,7 +38,7 @@
 #include <linux/string.h>
 
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/sh_flctl.h>
 
diff --git a/drivers/mtd/nand/sharpsl.c b/drivers/mtd/nand/sharpsl.c
index 064ca17..737efe8 100644
--- a/drivers/mtd/nand/sharpsl.c
+++ b/drivers/mtd/nand/sharpsl.c
@@ -17,7 +17,7 @@
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/sharpsl.h>
diff --git a/drivers/mtd/nand/sm_common.c b/drivers/mtd/nand/sm_common.c
index 5939dff..c378705 100644
--- a/drivers/mtd/nand/sm_common.c
+++ b/drivers/mtd/nand/sm_common.c
@@ -7,7 +7,7 @@
  * published by the Free Software Foundation.
  */
 #include <linux/kernel.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/module.h>
 #include <linux/sizes.h>
 #include "sm_common.h"
diff --git a/drivers/mtd/nand/socrates_nand.c b/drivers/mtd/nand/socrates_nand.c
index 72369bd..575997d 100644
--- a/drivers/mtd/nand/socrates_nand.c
+++ b/drivers/mtd/nand/socrates_nand.c
@@ -13,7 +13,7 @@
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
index 118a26f..214a9c7 100644
--- a/drivers/mtd/nand/sunxi_nand.c
+++ b/drivers/mtd/nand/sunxi_nand.c
@@ -31,7 +31,7 @@
 #include <linux/of_device.h>
 #include <linux/of_gpio.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nand.c
index 05b6e10..906fe0f 100644
--- a/drivers/mtd/nand/tango_nand.c
+++ b/drivers/mtd/nand/tango_nand.c
@@ -11,7 +11,7 @@
 #include <linux/clk.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
 #include <linux/platform_device.h>
diff --git a/drivers/mtd/nand/tmio_nand.c b/drivers/mtd/nand/tmio_nand.c
index fc5e773..c9dd682 100644
--- a/drivers/mtd/nand/tmio_nand.c
+++ b/drivers/mtd/nand/tmio_nand.c
@@ -34,7 +34,7 @@
 #include <linux/interrupt.h>
 #include <linux/ioport.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/partitions.h>
 #include <linux/slab.h>
diff --git a/drivers/mtd/nand/txx9ndfmc.c b/drivers/mtd/nand/txx9ndfmc.c
index 0a14fda..b567d21 100644
--- a/drivers/mtd/nand/txx9ndfmc.c
+++ b/drivers/mtd/nand/txx9ndfmc.c
@@ -16,7 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/delay.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/partitions.h>
 #include <linux/io.h>
diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc.c
index 3ea4bb1..1bc4b08 100644
--- a/drivers/mtd/nand/vf610_nfc.c
+++ b/drivers/mtd/nand/vf610_nfc.c
@@ -31,7 +31,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/of_device.h>
 #include <linux/pinctrl/consumer.h>
diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
index ddee400..9926b4e 100644
--- a/drivers/mtd/nand/xway_nand.c
+++ b/drivers/mtd/nand/xway_nand.c
@@ -7,7 +7,7 @@
  *  Copyright © 2016 Hauke Mehrtens <hauke@hauke-m.de>
  */
 
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/of_gpio.h>
 #include <linux/of_platform.h>
 
diff --git a/drivers/mtd/nftlcore.c b/drivers/mtd/nftlcore.c
index e211613..1f1a611 100644
--- a/drivers/mtd/nftlcore.c
+++ b/drivers/mtd/nftlcore.c
@@ -34,7 +34,7 @@
 
 #include <linux/kmod.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/nftl.h>
 #include <linux/mtd/blktrans.h>
 
diff --git a/drivers/mtd/nftlmount.c b/drivers/mtd/nftlmount.c
index a5dfbfb..184c8fb 100644
--- a/drivers/mtd/nftlmount.c
+++ b/drivers/mtd/nftlmount.c
@@ -25,7 +25,7 @@
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/nftl.h>
 
 #define SECTORSIZE 512
diff --git a/drivers/mtd/ssfdc.c b/drivers/mtd/ssfdc.c
index 41b13d1..95f0bf9 100644
--- a/drivers/mtd/ssfdc.c
+++ b/drivers/mtd/ssfdc.c
@@ -16,7 +16,7 @@
 #include <linux/slab.h>
 #include <linux/hdreg.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/blktrans.h>
 
 struct ssfdcr_record {
diff --git a/drivers/mtd/tests/nandbiterrs.c b/drivers/mtd/tests/nandbiterrs.c
index f26dec8..5f03b8c 100644
--- a/drivers/mtd/tests/nandbiterrs.c
+++ b/drivers/mtd/tests/nandbiterrs.c
@@ -47,7 +47,7 @@
 #include <linux/moduleparam.h>
 #include <linux/mtd/mtd.h>
 #include <linux/err.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/slab.h>
 #include "mtd_test.h"
 
diff --git a/drivers/staging/mt29f_spinand/mt29f_spinand.c b/drivers/staging/mt29f_spinand/mt29f_spinand.c
index e389009..f7f6edf 100644
--- a/drivers/staging/mt29f_spinand/mt29f_spinand.c
+++ b/drivers/staging/mt29f_spinand/mt29f_spinand.c
@@ -18,7 +18,7 @@
 #include <linux/delay.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/spi/spi.h>
 
 #include "mt29f_spinand.h"
diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index b25d28a..48d9522 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -17,7 +17,7 @@
 #include <linux/slab.h>
 #include <linux/mtd/mtd.h>
 #include <linux/crc32.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/jiffies.h>
 #include <linux/sched.h>
 #include <linux/writeback.h>
diff --git a/include/linux/mtd/nand-gpio.h b/include/linux/mtd/nand-gpio.h
index 51534e5..be4f45d 100644
--- a/include/linux/mtd/nand-gpio.h
+++ b/include/linux/mtd/nand-gpio.h
@@ -1,7 +1,7 @@
 #ifndef __LINUX_MTD_NAND_GPIO_H
 #define __LINUX_MTD_NAND_GPIO_H
 
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 
 struct gpio_nand_platdata {
 	int	gpio_nce;
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/rawnand.h
similarity index 99%
rename from include/linux/mtd/nand.h
rename to include/linux/mtd/rawnand.h
index f019916..fc6ed95 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1,6 +1,4 @@
 /*
- *  linux/include/linux/mtd/nand.h
- *
  *  Copyright © 2000-2010 David Woodhouse <dwmw2@infradead.org>
  *                        Steven J. Hill <sjhill@realitydiluted.com>
  *		          Thomas Gleixner <tglx@linutronix.de>
@@ -15,8 +13,8 @@
  * Changelog:
  *	See git changelog.
  */
-#ifndef __LINUX_MTD_NAND_H
-#define __LINUX_MTD_NAND_H
+#ifndef __LINUX_MTD_RAWNAND_H
+#define __LINUX_MTD_RAWNAND_H
 
 #include <linux/wait.h>
 #include <linux/spinlock.h>
@@ -1277,4 +1275,4 @@ int nand_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 
 /* Default extended ID decoding function */
 void nand_decode_ext_id(struct nand_chip *chip);
-#endif /* __LINUX_MTD_NAND_H */
+#endif /* __LINUX_MTD_RAWNAND_H */
diff --git a/include/linux/mtd/sh_flctl.h b/include/linux/mtd/sh_flctl.h
index 2251add..c759d40 100644
--- a/include/linux/mtd/sh_flctl.h
+++ b/include/linux/mtd/sh_flctl.h
@@ -22,7 +22,7 @@
 
 #include <linux/completion.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/pm_qos.h>
 
diff --git a/include/linux/mtd/sharpsl.h b/include/linux/mtd/sharpsl.h
index 65e91d0..72a79c7 100644
--- a/include/linux/mtd/sharpsl.h
+++ b/include/linux/mtd/sharpsl.h
@@ -8,7 +8,7 @@
  * published by the Free Software Foundation.
  */
 
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/partitions.h>
 
diff --git a/include/linux/platform_data/atmel.h b/include/linux/platform_data/atmel.h
index 3c8825b..d9d886f 100644
--- a/include/linux/platform_data/atmel.h
+++ b/include/linux/platform_data/atmel.h
@@ -7,7 +7,7 @@
 #ifndef __ATMEL_H__
 #define __ATMEL_H__
 
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/serial.h>
 
diff --git a/include/linux/platform_data/mtd-davinci.h b/include/linux/platform_data/mtd-davinci.h
index 1cf555a..f1a2cf6 100644
--- a/include/linux/platform_data/mtd-davinci.h
+++ b/include/linux/platform_data/mtd-davinci.h
@@ -28,7 +28,7 @@
 #ifndef __ARCH_ARM_DAVINCI_NAND_H
 #define __ARCH_ARM_DAVINCI_NAND_H
 
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 
 #define NANDFCR_OFFSET		0x60
 #define NANDFSR_OFFSET		0x64
diff --git a/include/linux/platform_data/mtd-nand-s3c2410.h b/include/linux/platform_data/mtd-nand-s3c2410.h
index f016590..f8c553f 100644
--- a/include/linux/platform_data/mtd-nand-s3c2410.h
+++ b/include/linux/platform_data/mtd-nand-s3c2410.h
@@ -12,7 +12,7 @@
 #ifndef __MTD_NAND_S3C2410_H
 #define __MTD_NAND_S3C2410_H
 
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 
 /**
  * struct s3c2410_nand_set - define a set of one or more nand chips
-- 
1.9.1
