From: Antoine Tenart <antoine.tenart@free-electrons.com>
To: sebastian.hesselbarth@gmail.com, ezequiel.garcia@free-electrons.com,
 dwmw2@infradead.org, computersforpeace@gmail.com
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>,
 boris.brezillon@free-electrons.com, zmxu@marvell.com, jszhang@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] ARM: berlin: nand support
Date: Tue,  7 Jul 2015 17:27:20 +0200
Message-Id: <1436282847-21137-1-git-send-email-antoine.tenart@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This series was part of a bigger one[1], which was split into smaller
ones as asked by Ezequiel[2]. When we take this into account, this is
v7. In addition, there was not comment for more than 1 month (since
June, 3rd). So I'd like this series to go forward quickly.

The support is added into the existing pxa3xx nand controller. Some
additions were done in order to get this controller working:
- Support for a non mandatory ECC clock has been added.
- The Berlin nand controller needs to poll the status register.
- Sequences of commands are quite different in order to perform write
  operation.

Based on [3].

Since v1:
	- Rebased on top of 4.2-rc1
	- Fixed the documentation as suggested by Robert Jarzmik

[1] https://lkml.org/lkml/2015/5/11/495
[2] https://lkml.org/lkml/2015/5/16/309
[3] https://lkml.org/lkml/2015/7/7/542

Thanks!

Antoine Tenart (7):
  mtd: pxa3xx_nand: add a non mandatory ECC clock
  Documentation: bindings: document the clocks for pxa3xx-nand
  mtd: pxa3xx_nand: add support for the Marvell Berlin nand controller
  Documentation: bindings: add the Berlin nand controller compatible
  mtd: nand: let Marvell Berlin SoCs select the pxa3xx driver
  ARM: berlin: add BG2Q node for the nand
  ARM: berlin: enable flash on the BG2Q DMP

 .../devicetree/bindings/mtd/pxa3xx-nand.txt        |   5 +
 arch/arm/boot/dts/berlin2q-marvell-dmp.dts         |  25 +++
 arch/arm/boot/dts/berlin2q.dtsi                    |  13 ++
 drivers/mtd/nand/Kconfig                           |   4 +-
 drivers/mtd/nand/pxa3xx_nand.c                     | 214 +++++++++++++++++++--
 5 files changed, 240 insertions(+), 21 deletions(-)

-- 
2.4.5
