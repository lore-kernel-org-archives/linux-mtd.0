From: Antoine Tenart <antoine.tenart@free-electrons.com>
To: sebastian.hesselbarth@gmail.com, ezequiel.garcia@free-electrons.com,
 dwmw2@infradead.org, computersforpeace@gmail.com
Subject: [PATCH v5 00/12] ARM: berlin: add nand support
Date: Mon, 11 May 2015 16:58:49 +0200
Message-Id: <1431356341-31640-1-git-send-email-antoine.tenart@free-electrons.com>
Cc: zmxu@marvell.com, boris.brezillon@free-electrons.com,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 jszhang@marvell.com, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

This series introduces the support for the Marvell Berlin nand
controller. It was tested on the Marvell Berlin BG2Q DMP board.

The support is added into the existing pxa3xx nand controller. Some
additions were done in order to get this controller working:
- Support for a non mandatory ECC clock has been added.
- The Berlin nand controller needs to poll the status register.
- Sequences of commands are quite different in order to perform write
  operation.

Since v3, this series had a lots of changes. The pxa3xx nand driver
was using its own flash table and had its own timings setup. I made
the required modifications to use the nand framework to perform these
steps. This worked nicely until we found out some boards use non-onfi
nands. To handle this case, I had to reintroduce the timing table in
the pxa3xx driver. In this case, the flash detection is done by the
framework, and the flash used *has to* be supported by the framework,
but its timing definitions remains inside the pxa3xx driver.

This should be tested on old platform using this driver, with non-onfi
devices and theirs definitions may have to be added in the nand_ids
table.

Another solution would have been to configure the timings in the
device tree, but this wouldn't have work for devices using board
files.

Antoine

Changes since v4:
	- split the timings rework patch into 3 patches
	- took care of timings issues

Changes since v3:
        - Reworked the nand flash detection
        - Reworked the timings setup

Changes since v2:
        - Reworked the timings setup
        - Added a explanation in the default chunk size commit
        - Ensured commit 4/10 was useless and removed it
        - Fixed typos, cosmetic

Changes since v1:
        - Added a fallback to NULL when looking for the 'nfc' clock
        - Added the clocks in the bindings documentation
        - Reworked the DT
        - Removed non needed RNDOUT command
        - Used the standard RESET command
        - Fixed the flash type matching order
        - Remove all non tested flash types (only one left)
        - Added a check to explicitly not support nand chips with small pages
        - Remove useless checks for clocks in the probing function
        - Various clean up

Antoine Tenart (12):
  mtd: pxa3xx_nand: add a non mandatory ECC clock
  Documentation: bindings: document the clocks for pxa3xx-nand
  mtd: pxa3xx_nand: add a default chunk size
  mtd: pxa3xx_nand: add helpers to setup the timings
  mtd: pxa3xx_nand: rework flash detection and timing setup
  mtd: pxa3xx_nand: clean up the pxa3xx timings
  mtd: nand: add Samsung K9GBG08U0A-M to nand_ids table
  mtd: pxa3xx_nand: add support for the Marvell Berlin nand controller
  Documentation: bindings: add the Berlin nand controller compatible
  mtd: nand: let Marvell Berlin SoCs select the pxa3xx driver
  ARM: berlin: add BG2Q node for the nand
  ARM: berlin: enable flash on the BG2Q DMP

 .../devicetree/bindings/mtd/pxa3xx-nand.txt        |   5 +
 arch/arm/boot/dts/berlin2q-marvell-dmp.dts         |  25 ++
 arch/arm/boot/dts/berlin2q.dtsi                    |  13 +
 drivers/mtd/nand/Kconfig                           |   4 +-
 drivers/mtd/nand/nand_ids.c                        |   4 +
 drivers/mtd/nand/pxa3xx_nand.c                     | 440 +++++++++++++++------
 include/linux/platform_data/mtd-nand-pxa3xx.h      |  11 +-
 7 files changed, 374 insertions(+), 128 deletions(-)

-- 
2.4.0
