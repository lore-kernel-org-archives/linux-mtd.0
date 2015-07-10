From: Roger Quadros <rogerq@ti.com>
To: <tony@atomide.com>, <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <bcousson@baylibre.com>
CC: <ezequiel@vanguardiasur.com.ar>, <linux-mtd@lists.infradead.org>,
 <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Roger Quadros <rogerq@ti.com>
Subject: [PATCH 00/12] ARM: omap: mtd: nand: Support GPMC NAND on non-OMAP
 platforms
Date: Fri, 10 Jul 2015 15:23:27 +0300
Message-ID: <1436531019-18088-1-git-send-email-rogerq@ti.com>
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

Hi,

The OMAP GPMC IP is being used on non-OMAP platforms as well
and this series aims at cleaning up device tree implementation
for GPMC NAND so that it can be used on non-OMAP platforms.

NAND is now treated as any other generic GPMC child and has to
have its own compatible-id and address+interrupt resource.

Tested NAND on following boards
- dra7-evm
- am437x-gp-evm
- beagleboard C4

--
cheers,
-roger

Roger Quadros (12):
  ARM: OMAP2+: gpmc: Add platform data
  ARM: OMAP2+: gpmc: Add gpmc timings and settings to platform data
  mtd: nand: omap: Move IRQ handling from GPMC to NAND driver
  mtd: nand: omap: Move gpmc_update_nand_reg to nand driver
  mtd: nand: omap: Move NAND write protect code from GPMC to NAND driver
  mtd: nand: omap: Copy platform data parameters to omap_nand_info data
  mtd: nand: omap: Clean up device tree support
  mtd: nand: omap: Update DT binding documentation
  memory: omap-gpmc: use module_platform_driver()
  memory: omap-gpmc: Prevent mapping into 1st 16MB
  ARM: dts: OMAP2+: Fix NAND device nodes
  ARM: dts: omap3: Fix gpmc memory resource size

 .../devicetree/bindings/mtd/gpmc-nand.txt          |  16 +-
 arch/arm/boot/dts/am335x-baltos-ir5221.dts         |   9 +-
 arch/arm/boot/dts/am335x-chilisom.dtsi             |   8 +-
 arch/arm/boot/dts/am335x-evm.dts                   |   8 +-
 arch/arm/boot/dts/am335x-igep0033.dtsi             |   8 +-
 arch/arm/boot/dts/am437x-gp-evm.dts                |   8 +-
 arch/arm/boot/dts/am43x-epos-evm.dts               |   8 +-
 arch/arm/boot/dts/dm8168-evm.dts                   |   8 +-
 arch/arm/boot/dts/dra7-evm.dts                     |   8 +-
 arch/arm/boot/dts/dra72-evm.dts                    |   8 +-
 arch/arm/boot/dts/logicpd-torpedo-som.dtsi         |   9 +-
 arch/arm/boot/dts/omap3-beagle.dts                 |   7 +-
 arch/arm/boot/dts/omap3-cm-t3x.dtsi                |   8 +-
 arch/arm/boot/dts/omap3-devkit8000.dts             |   9 +-
 arch/arm/boot/dts/omap3-evm-37xx.dts               |  10 +-
 arch/arm/boot/dts/omap3-gta04.dtsi                 |   8 +-
 arch/arm/boot/dts/omap3-igep.dtsi                  |   5 +-
 arch/arm/boot/dts/omap3-igep0020-common.dtsi       |   5 +-
 arch/arm/boot/dts/omap3-igep0030-common.dtsi       |   6 +
 arch/arm/boot/dts/omap3-ldp.dts                    |  10 +-
 arch/arm/boot/dts/omap3-lilly-a83x.dtsi            |   8 +-
 arch/arm/boot/dts/omap3-lilly-dbb056.dts           |   7 +-
 arch/arm/boot/dts/omap3-pandora-common.dtsi        |   8 +-
 arch/arm/boot/dts/omap3-tao3530.dtsi               |   8 +-
 arch/arm/boot/dts/omap3.dtsi                       |   2 +-
 arch/arm/boot/dts/omap3430-sdp.dts                 |   8 +-
 arch/arm/mach-omap2/gpmc-nand.c                    |  19 +-
 drivers/memory/omap-gpmc.c                         | 427 +++------------------
 drivers/mtd/nand/omap2.c                           | 380 ++++++++++++++----
 include/linux/omap-gpmc.h                          | 148 +------
 include/linux/platform_data/gpmc-omap.h            | 169 ++++++++
 include/linux/platform_data/mtd-nand-omap2.h       |  10 +-
 32 files changed, 705 insertions(+), 655 deletions(-)
 create mode 100644 include/linux/platform_data/gpmc-omap.h

-- 
2.1.4
