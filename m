Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UcrQf-0008PD-BB
 for linux-mtd@lists.infradead.org; Thu, 16 May 2013 06:12:42 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: <linux-mtd@lists.infradead.org>, <linux-omap@vger.kernel.org>
Subject: [PATCH 0/2] mtd:nand:omap2: ECC support clean-up for omap2-nand driver
Date: Thu, 16 May 2013 11:41:58 +0530
Message-ID: <1368684720-26763-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: tony@atomide.com, balbi@ti.com, "Gupta, Pekon" <pekon@ti.com>,
 arnd@arndb.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: "Gupta, Pekon" <pekon@ti.com>

This patch series makes ECC scheme selection for omap2-nand driver more 
user-friendly.It also adds scalability for large page-sized NAND devices,
and adding new ECC schemes in future.

[PATCH 1/2]
	- clean-up and optimization for supported ECC schemes.
	- added checks for Kconfigs required by specific ECC schemes.

[PATCH 2/2]
	- add DT options for selecting supported ECC scheme.

Gupta, Pekon (2):
  mtd:nand:omap2: clean-up BCHx_HW and BCHx_SW ECC configurations in
    device_probe
  ARM: OMAP2+: cleaned-up DT support of various ECC schemes

 .../devicetree/bindings/mtd/gpmc-nand.txt          |  37 +-
 arch/arm/boot/dts/am335x-evm.dts                   |   2 +-
 arch/arm/mach-omap2/gpmc.c                         |  12 +-
 drivers/mtd/nand/omap2.c                           | 432 ++++++++++-----------
 include/linux/platform_data/elm.h                  |   4 +
 include/linux/platform_data/mtd-nand-omap2.h       |  22 +-
 6 files changed, 258 insertions(+), 251 deletions(-)

-- 
1.8.1
