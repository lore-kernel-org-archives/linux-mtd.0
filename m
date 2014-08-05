Received: from arroyo.ext.ti.com ([192.94.94.40])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XEbjN-0006fC-Ji
 for linux-mtd@lists.infradead.org; Tue, 05 Aug 2014 10:12:38 +0000
From: Roger Quadros <rogerq@ti.com>
To: <computersforpeace@gmail.com>, <tony@atomide.com>
Subject: [PATCH 0/3] [PATCH 0/3] mtd: nand: omap: Use Software ECC by default
Date: Tue, 5 Aug 2014 13:11:19 +0300
Message-ID: <1407233482-11642-1-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: artem.bityutskiy@linux.intel.com, jg1.han@samsung.com,
 linux-kernel@vger.kernel.org, balbi@ti.com, linux-mtd@lists.infradead.org,
 ezequiel.garcia@free-electrons.com, pekon.gupta@gmail.com,
 linux-omap@vger.kernel.org, dwmw2@infradead.org, Roger Quadros <rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

In Linux v3.12 and earlier some boards [1] used Software based ECC as
the NAND ECC scheme. In 3.13 commit c66d039197e4 changed that to
Hardware ECC using ROM code ECC layout. This will cause NAND filesystems
created in 3.12 and earlier to be unreadable in v3.13 and later till
they are erased and re-created.

This series fixes this issue by using Software ECC as the default ECC
scheme for the affected boards.

Tested on omap3beagle.

[1] - Affected boards
-omap3beagle
-omap3touchbook
-overo
-am3517crane
-devkit8000
-ldp
-3430sdp

cheers,
-roger

---
Roger Quadros (3):
  mtd: nand: omap: Revert to using software ECC by default
  ARM: OMAP2+: GPMC: Support Software ECC scheme via DT
  ARM: dts: omap3430-sdp: Revert to using software ECC for NAND

 Documentation/devicetree/bindings/mtd/gpmc-nand.txt |  2 +-
 arch/arm/boot/dts/omap3430-sdp.dts                  |  2 +-
 arch/arm/mach-omap2/board-flash.c                   |  2 +-
 arch/arm/mach-omap2/gpmc-nand.c                     |  3 ++-
 arch/arm/mach-omap2/gpmc.c                          |  7 +++++--
 drivers/mtd/nand/omap2.c                            | 14 +++++++++++---
 include/linux/platform_data/mtd-nand-omap2.h        | 13 +++++++++++--
 7 files changed, 32 insertions(+), 11 deletions(-)

-- 
1.8.3.2
