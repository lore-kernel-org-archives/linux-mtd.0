Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLun7-0000dl-0F
 for linux-mtd@lists.infradead.org; Fri, 07 Mar 2014 13:26:21 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>, Tony Lindgren
 <tony@atomide.com>
Subject: [PATCH v2 0/4] mtd: nand: omap: add support for BCH16_ECC
Date: Fri, 7 Mar 2014 18:54:49 +0530
Message-ID: <1394198693-8003-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Jon Cormier <jcormier@criticallink.com>,
 linux-omap <linux-omap@vger.kernel.org>, Felipe Balbi <balbi@ti.com>,
 Daniel Mack <zonque@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Pekon Gupta <pekon@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Stefan Roese <sr@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

*changes v1 -> v2*
 Rebased and Cleaned on following versions of pending patches
  (1) [PATCH v8 0/6] mtd: nand: omap: optimized chip->ecc.correct() for H/W ECC schemes
  http://lists.infradead.org/pipermail/linux-mtd/2014-February/052092.html

  (2) [PATCH v6 0/4] mtd: nand: omap: optimize chip->ecc.calculate() for H/W ECC schemes
  http://lists.infradead.org/pipermail/linux-mtd/2014-February/052272.html

  (3) [PATCH v5 0/4] mtd: nand: omap: optimize chip->ecc.hwctl() for H/W ECC schemes
  http://lists.infradead.org/pipermail/linux-mtd/2014-March/052327.html

  (4) [PATCH v6 0/4] mtd: devices: elm: add checks ELM H/W constrains, driver code cleanup
  http://lists.infradead.org/pipermail/linux-mtd/2014-March/052455.html
 
 Tested on Beaglebone-LT(white) NAND cape having NAND Device with
       bus-width=16, block-size=256k, page-size=4k, oob-size=224


*original v1*
http://lists.infradead.org/pipermail/linux-mtd/2013-July/047562.html

With increase in NAND flash densities and shrinking of technology
NAND flash has become more suspectible to multiple bit-flips.
Thus stronger ECC schemes are required for detecting and correcting multiple
simultaneous bit-flips in same NAND page. But stronger ECC schemes have large
ECC syndrome which require more space in OOB/Spare.

This patch add support for BCH16 ecc-scheme on OMAP NAND driver:
(a) BCH16 ecc-scheme can correct 16 bit-flips per 512Bytes of data.
(b) BCH16 ecc-scheme generates 26-bytes of ECC syndrome / 512B.

Due to (b) this scheme can only be used with NAND devices which have enough
OOB to satisfy following equation:
OOBsize per page >= 26 * (page-size / 512)


Pekon Gupta (4):
  mtd: nand: omap: add support for BCH16_ECC - GPMC driver updates
  mtd: nand: omap: add support for BCH16_ECC - ELM driver updates
  mtd: nand: omap: add support for BCH16_ECC - NAND driver updates
  mtd: nand: omap: Documentation: How to select correct ECC scheme for
    your device ?

 .../devicetree/bindings/mtd/gpmc-nand.txt          | 39 ++++++++++
 arch/arm/mach-omap2/gpmc.c                         | 15 ++++
 drivers/mtd/devices/elm.c                          | 42 ++++++++++
 drivers/mtd/nand/omap2.c                           | 89 ++++++++++++++++++++++
 include/linux/platform_data/elm.h                  |  3 +-
 include/linux/platform_data/mtd-nand-omap2.h       |  5 ++
 6 files changed, 192 insertions(+), 1 deletion(-)

-- 
1.8.5.1.163.gd7aced9
