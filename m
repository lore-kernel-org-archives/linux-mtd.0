Received: from hauke-m.de ([5.39.93.123])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yu0hB-00015W-9v
 for linux-mtd@lists.infradead.org; Sun, 17 May 2015 15:41:42 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: computersforpeace@gmail.com
Subject: [PATCH 0/7] mtd: brcmnand: add support for NAND core on bcma bus
Date: Sun, 17 May 2015 17:40:59 +0200
Message-Id: <1431877266-28566-1-git-send-email-hauke@hauke-m.de>
Cc: devicetree@vger.kernel.org, f.fainelli@gmail.com, rjui@broadcom.com,
 zajec5@gmail.com, linux-mtd@lists.infradead.org,
 Hauke Mehrtens <hauke@hauke-m.de>, bcm-kernel-feedback-list@broadcom.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These patches are adding support for the NAND controller on the BCM53xx 
and BCM47xx arm SoCs (Northstar). These SoCs are using the axi bus 
driven by bcma and not only device tree.

This was tested on a Netgear R6250 with a BCM4708 SoC.
The patches are based on top of current l2-mtd/master tree.

Hauke Mehrtens (7):
  mtd: brcmnand: remove double new line from print
  mtd: brcmnand: do not make local variable static
  mtd: brcmnand: use struct device and not platform_device
  mtd: brcmnand: add methods to register struct device
  mtd: brcmnand: add bcma driver
  mtd: brcmnand: run bcm47xxpart part parser in addition
  ARM: BCM5301X: add NAND flash chip description

 arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts |  12 +--
 arch/arm/boot/dts/bcm5301x.dtsi              |  19 ++++
 drivers/mtd/nand/Kconfig                     |   8 ++
 drivers/mtd/nand/brcmnand/Makefile           |   1 +
 drivers/mtd/nand/brcmnand/bcm63138_nand.c    |   2 +-
 drivers/mtd/nand/brcmnand/bcma_nand.c        | 153 +++++++++++++++++++++++++++
 drivers/mtd/nand/brcmnand/brcmnand.c         | 150 ++++++++++++++++----------
 drivers/mtd/nand/brcmnand/brcmnand.h         |  10 +-
 drivers/mtd/nand/brcmnand/iproc_nand.c       |   2 +-
 9 files changed, 293 insertions(+), 64 deletions(-)
 create mode 100644 drivers/mtd/nand/brcmnand/bcma_nand.c

-- 
2.1.4
