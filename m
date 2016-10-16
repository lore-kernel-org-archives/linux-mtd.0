Received: from up.free-electrons.com ([163.172.77.33]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bvmXX-0006Ue-GL
 for linux-mtd@lists.infradead.org; Sun, 16 Oct 2016 14:36:09 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Peter Pan <peterpansjtu@gmail.com>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] mtd: nand: Rename nand.h into rawnand.h
Date: Sun, 16 Oct 2016 16:35:12 +0200
Message-Id: <1476628518-20450-2-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1476628518-20450-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1476628518-20450-1-git-send-email-boris.brezillon@free-electrons.com>
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

We are planning to share more code between different NAND based
devices (SPI NAND, OneNAND and raw NANDs), but before doing that
we need to move the existing include/linux/mtd/nand.h file into
include/linux/mtd/rawnand.h so we can later create a nand.h header
containing all common structure and function prototypes.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 Documentation/DocBook/mtdnand.tmpl              | 2 +-
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
 arch/arm/mach-omap2/gpmc-nand.c                 | 2 +-
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
 drivers/mtd/nand/atmel_nand.c                   | 2 +-
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
 drivers/mtd/nand/nand_base.c                    | 2 +-
 drivers/mtd/nand/nand_bbt.c                     | 2 +-
 drivers/mtd/nand/nand_bch.c                     | 2 +-
 drivers/mtd/nand/nand_ecc.c                     | 2 +-
 drivers/mtd/nand/nand_ids.c                     | 2 +-
 drivers/mtd/nand/nand_timings.c                 | 2 +-
 drivers/mtd/nand/nandsim.c                      | 2 +-
 drivers/mtd/nand/ndfc.c                         | 2 +-
 drivers/mtd/nand/nuc900_nand.c                  | 2 +-
 drivers/mtd/nand/omap2.c                        | 2 +-
 drivers/mtd/nand/orion_nand.c                   | 2 +-
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
 119 files changed, 121 insertions(+), 123 deletions(-)
 rename include/linux/mtd/{nand.h => rawnand.h} (99%)

diff --git a/Documentation/DocBook/mtdnand.tmpl b/Documentation/DocBook/mtdnand.tmpl
index b442921bca54..35ec7155faa3 100644
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
diff --git a/arch/arm/mach-davinci/board-da850-evm.c b/arch/arm/mach-davinci/board-da850-evm.c
index 8e4539f69fdc..02ec0add04e0 100644
--- a/arch/arm/mach-davinci/board-da850-evm.c
+++ b/arch/arm/mach-davinci/board-da850-evm.c
@@ -24,7 +24,7 @@
 #include <linux/input/tps6507x-ts.h>
 #include <linux/mfd/tps6507x.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/physmap.h>
 #include <linux/platform_device.h>
diff --git a/arch/arm/mach-davinci/board-dm355-evm.c b/arch/arm/mach-davinci/board-dm355-evm.c
index 18296a99c4d2..62e7bc3018f0 100644
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
index 284ff27c1b32..be997243447b 100644
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
index 0464999b7137..e75741fb2c1d 100644
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
index 521e40977265..15a2476057e4 100644
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
index f702d4fc8eb8..9b8864c66619 100644
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
index 41c7c9615791..d85accf7f760 100644
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
index bcb678fd2415..8971c3c0f0fe 100644
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
index b2db791b3b38..8b29398f4dc7 100644
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
index 3b39ea353d30..9def3b98945e 100644
--- a/arch/arm/mach-ep93xx/ts72xx.c
+++ b/arch/arm/mach-ep93xx/ts72xx.c
@@ -17,7 +17,7 @@
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/platform_data/rtc-m48t86.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 
 #include <mach/hardware.h>
diff --git a/arch/arm/mach-imx/mach-qong.c b/arch/arm/mach-imx/mach-qong.c
index 8c2cbd693d21..42a700053103 100644
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
index 508c2d7786e2..93b89291c06b 100644
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
index 5db0edf716dd..d2283009a5ff 100644
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
index fad95b74bb65..b93ad58b0a63 100644
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
index 675254ee4b1e..a444b139bff5 100644
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
index e62f9d454f10..a618a49a30b8 100644
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
index 7684f9203474..1bffbb4e050f 100644
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
index 150b57ba42bf..e994a78bdd09 100644
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
diff --git a/arch/arm/mach-omap2/gpmc-nand.c b/arch/arm/mach-omap2/gpmc-nand.c
index f6ac027f3c3b..250ae0173402 100644
--- a/arch/arm/mach-omap2/gpmc-nand.c
+++ b/arch/arm/mach-omap2/gpmc-nand.c
@@ -13,7 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/omap-gpmc.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/platform_data/mtd-nand-omap2.h>
 
 #include <asm/mach/flash.h>
diff --git a/arch/arm/mach-orion5x/db88f5281-setup.c b/arch/arm/mach-orion5x/db88f5281-setup.c
index 12f74b46e2ff..3f5863de766a 100644
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
index 9dc3f59bed9c..83d43cff4bd7 100644
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
index 7bd671b2854c..0c315515dd2d 100644
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
index 8d597267d0c4..4632e674e9c5 100644
--- a/arch/arm/mach-orion5x/ts78xx-setup.c
+++ b/arch/arm/mach-orion5x/ts78xx-setup.c
@@ -17,7 +17,7 @@
 #include <linux/mv643xx_eth.h>
 #include <linux/ata_platform.h>
 #include <linux/platform_data/rtc-m48t86.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/timeriomem-rng.h>
 #include <asm/mach-types.h>
diff --git a/arch/arm/mach-pxa/balloon3.c b/arch/arm/mach-pxa/balloon3.c
index 8a3c409294bf..38afb6fa1dcf 100644
--- a/arch/arm/mach-pxa/balloon3.c
+++ b/arch/arm/mach-pxa/balloon3.c
@@ -28,7 +28,7 @@
 #include <linux/types.h>
 #include <linux/i2c/pcf857x.h>
 #include <linux/i2c/pxa-i2c.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/physmap.h>
 #include <linux/regulator/max1586.h>
 
diff --git a/arch/arm/mach-pxa/em-x270.c b/arch/arm/mach-pxa/em-x270.c
index 03354c21e1f2..a6c5f5b96e47 100644
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
index fa9d71d194f0..91f7c3e40065 100644
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
index 36646975b5d2..47e3e38e9bec 100644
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
index 13de6602966f..6a386fd6363e 100644
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
index e9fbcc91c5c0..a39d9667eb14 100644
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
index d03df0df01fa..357f24e3fd80 100644
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
index 9ae170fef2a7..8cb1c26e5809 100644
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
index ed07cf392d4b..c895050afe07 100644
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
index 27ae6877550f..21de3ceb98a1 100644
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
index 7d99fe8f6157..1e95d1528860 100644
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
index ec60bd4a1646..38dc7e21deb1 100644
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
index 2f6fdc326835..0cf4f222f222 100644
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
index 984516e8307a..86d7ffd8c511 100644
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
index cf55196f89ca..b6fdd088987a 100644
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
index b4460d5f7011..67adb4c5f327 100644
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
index e79b3b810c39..c4a8ffb15417 100644
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
index eaec7b4832a2..ab3034fd1c5b 100644
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
index 37f8f25a1347..696cc9d7820a 100644
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
index 3f646c787e58..925a98eb6d68 100644
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
index a74540514bdb..53b56a429dde 100644
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
index 992442a03d8b..83831002c832 100644
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
index d3c087f59f1a..06c18a80a129 100644
--- a/arch/mips/alchemy/devboards/db1300.c
+++ b/arch/mips/alchemy/devboards/db1300.c
@@ -17,7 +17,7 @@
 #include <linux/mmc/host.h>
 #include <linux/module.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/platform_device.h>
 #include <linux/smsc911x.h>
diff --git a/arch/mips/alchemy/devboards/db1550.c b/arch/mips/alchemy/devboards/db1550.c
index 1c01d6eadb08..421bd5793f7e 100644
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
index 7f7b0fc554da..f381d465e768 100644
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
index f03131fec41d..4d1b4c003376 100644
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
index 7cf4eb50fc72..a7a4e9f5146d 100644
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
index 0966adccf520..32ea3e6731d6 100644
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
index 5de60a77eaa1..0bcbe58b11e9 100644
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
index b66b541877f0..6373ccba8bb8 100644
--- a/drivers/mtd/inftlcore.c
+++ b/drivers/mtd/inftlcore.c
@@ -33,7 +33,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/nftl.h>
 #include <linux/mtd/inftl.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <asm/uaccess.h>
 #include <asm/errno.h>
 #include <asm/io.h>
diff --git a/drivers/mtd/nand/ams-delta.c b/drivers/mtd/nand/ams-delta.c
index 78e12cc8bac2..0972493b6cd2 100644
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
diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 68b9160108c9..fbb7e5da2541 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -37,7 +37,7 @@
 #include <linux/of_device.h>
 #include <linux/of_gpio.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 
 #include <linux/delay.h>
diff --git a/drivers/mtd/nand/au1550nd.c b/drivers/mtd/nand/au1550nd.c
index 9bf6d9915694..9d4a28fa6b73 100644
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
index 8ea75710a854..c8834767ab6d 100644
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
index 3962f55bd034..5655dca6ce43 100644
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
index 9d2424bfdbf5..98453816a0a2 100644
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
index 0b0c93702abb..93880171740a 100644
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
index 49133783ca53..2efe6a56557f 100644
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
index a65e4e0f57a1..8fafb4b4488d 100644
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
index 27fa8b87cd5f..29034e378b5b 100644
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
index e7ab4866a5da..37618b532317 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -20,7 +20,7 @@
 #ifndef __DENALI_H__
 #define __DENALI_H__
 
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 
 #define DEVICE_RESET				0x0
 #define     DEVICE_RESET__BANK0				0x0001
diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
index a023ab9e9cbf..c3aa53caab5c 100644
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
index 7af2a3cd949e..e038130b7206 100644
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
index 113f76e59937..7d8453eb4d0f 100644
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
index 0a177b1bfe3e..bcf7f0b8abf9 100644
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
index d85fa2555b68..a88e2cf66e0f 100644
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
index d4f454a4b35e..5c08694aa153 100644
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
index 6317f6836022..21b19efe1ac7 100644
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
index 4e49a1f5fa27..d7625cad6493 100644
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
index 9432546f4cd4..a287d73bb17e 100644
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
index 5551c36adbdf..e813ec11ee84 100644
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
index a39bb70175ee..2f725bd83de8 100644
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
index 852388171f20..b212bb0fd902 100644
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
index 8d3edc34958e..018d783d37cd 100644
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
index 7eacb2f545f5..2a1fa86fd123 100644
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
index 5223a2182ee4..95f32ca88823 100644
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
index d7f724b24fd7..58a960540369 100644
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
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index e5718e5ecf92..286abd768454 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -38,7 +38,7 @@
 #include <linux/mm.h>
 #include <linux/types.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/nand_bch.h>
 #include <linux/interrupt.h>
diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 7695efea65f2..2915b6739bf8 100644
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
index 44763f87eae4..505441c9373b 100644
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
index d1770b066396..7613a0388044 100644
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
diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index 2af9869a115e..80550dbf9467 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -7,7 +7,7 @@
  *
  */
 #include <linux/module.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/sizes.h>
 
 #define LP_OPTIONS NAND_SAMSUNG_LP_OPTIONS
diff --git a/drivers/mtd/nand/nand_timings.c b/drivers/mtd/nand/nand_timings.c
index 13a587407be3..5cf237268284 100644
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
diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 1eb934414eb5..9c16635b5338 100644
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
index 28e6118362f7..d8a806894937 100644
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
index 8f64011d32ef..7bb4d2ea9342 100644
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
index 5513bfd9cdc9..5283898e9589 100644
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
index 40a7c4a2cf0d..e68c4231e8b7 100644
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
diff --git a/drivers/mtd/nand/pasemi_nand.c b/drivers/mtd/nand/pasemi_nand.c
index 5de7591b0510..372b9736ac02 100644
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
index 415a53a0deeb..d5c3c894c60d 100644
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
index b121bf4ed73a..4feec4ea3082 100644
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
index 57d483ac5765..a77c66f4d8bc 100644
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
index d042ddb71a8b..8713c57f6207 100644
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
index d459c19d78de..6ce9f867a123 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -41,7 +41,7 @@
 #include <linux/cpufreq.h>
 
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/partitions.h>
 
diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index 442ce619b3b6..492705fb23f2 100644
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
index 064ca1757589..737efe83cd36 100644
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
index 5939dff253c2..c378705c6e2b 100644
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
index 888fd314c62a..f5a3e7252b82 100644
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
index 8b8470c4e6d0..ccccc7ab9023 100644
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
diff --git a/drivers/mtd/nand/tmio_nand.c b/drivers/mtd/nand/tmio_nand.c
index 08b30549ec0a..e599ada12cd0 100644
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
index 0a14fda2e41b..b567d212fe7d 100644
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
index 3ad514c44dcb..c497b157d56a 100644
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
index 1f2948c0c458..3e7353e76264 100644
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
index 46f27de018c3..2a1dd0049a45 100644
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
index a5dfbfbebfca..184c8fbfe465 100644
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
index 41b13d1cdcc4..95f0bf95f095 100644
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
index f26dec896afa..5f03b8c885a9 100644
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
index e389009fca42..f7f6edf2dda1 100644
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
index b25d28a21212..48d9522e209c 100644
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
index 51534e50f7fc..be4f45d89be2 100644
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
index c5d3d5024fc8..fecfd05a585a 100644
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
@@ -1189,4 +1187,4 @@ int nand_reset(struct nand_chip *chip);
 /* Free resources held by the NAND device */
 void nand_cleanup(struct nand_chip *chip);
 
-#endif /* __LINUX_MTD_NAND_H */
+#endif /* __LINUX_MTD_RAWNAND_H */
diff --git a/include/linux/mtd/sh_flctl.h b/include/linux/mtd/sh_flctl.h
index 2251add65fa7..c759d403cbc0 100644
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
index 65e91d0fa981..72a79c7d0e08 100644
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
index 3c8825b67298..d9d886fbc259 100644
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
index 1cf555aef896..f1a2cf655bdb 100644
--- a/include/linux/platform_data/mtd-davinci.h
+++ b/include/linux/platform_data/mtd-davinci.h
@@ -28,7 +28,7 @@
 #ifndef __ARCH_ARM_DAVINCI_NAND_H
 #define __ARCH_ARM_DAVINCI_NAND_H
 
-#include <linux/mtd/nand.h>
+#include <linux/mtd/rawnand.h>
 
 #define NANDFCR_OFFSET		0x60
 #define NANDFSR_OFFSET		0x64
-- 
2.7.4
