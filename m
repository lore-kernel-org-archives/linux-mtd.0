From: Antoine Tenart <antoine.tenart@free-electrons.com>
To: sebastian.hesselbarth@gmail.com, ezequiel.garcia@free-electrons.com,
 dwmw2@infradead.org, computersforpeace@gmail.com
Subject: [PATCH v3 0/9] ARM: berlin: add nand support
Date: Thu,  5 Mar 2015 12:31:16 +0100
Message-Id: <1425555085-29531-1-git-send-email-antoine.tenart@free-electrons.com>
Cc: thomas.petazzoni@free-electrons.com, boris.brezillon@free-electrons.com,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 linux-kernel@vger.kernel.org, zmxu@marvell.com, linux-mtd@lists.infradead.org,
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
controller. It is based on top of v4.0-rc1 and was tested on the
Marvell Berlin BG2Q DMP board.

The support is added into the existing pxa3xx nand controller. Some
additions were done in order to get this controller working:
- Support for a non mandatory ECC clock has been added.
- The Berlin nand controller needs to poll the status register.
- Sequences of commands are quite different in order to perform write
  operation.

Thanks!

Antoine

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

Antoine Tenart (9):
  mtd: pxa3xx_nand: add a non mandatory ECC clock
  Documentation: bindings: document the clocks for pxa3xx-nand
  mtd: pxa3xx_nand: add a default chunk size
  mtd: pxa3xx_nand: rework timings setup
  mtd: pxa3xx_nand: add support for the Marvell Berlin nand controller
  Documentation: bindings: add the Berlin nand controller compatible
  mtd: nand: let Marvell Berlin SoCs select the pxa3xx driver
  ARM: berlin: add BG2Q node for the nand
  ARM: berlin: enable flash on the BG2Q DMP

 .../devicetree/bindings/mtd/pxa3xx-nand.txt        |   5 +
 arch/arm/boot/dts/berlin2q-marvell-dmp.dts         |  25 ++
 arch/arm/boot/dts/berlin2q.dtsi                    |  13 +
 drivers/mtd/nand/Kconfig                           |   2 +-
 drivers/mtd/nand/pxa3xx_nand.c                     | 349 +++++++++++++++++----
 include/linux/platform_data/mtd-nand-pxa3xx.h      |   2 -
 6 files changed, 332 insertions(+), 64 deletions(-)

-- 
2.3.1
