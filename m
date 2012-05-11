Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SSrzn-0004DK-2U
 for linux-mtd@lists.infradead.org; Fri, 11 May 2012 15:43:08 +0000
From: Afzal Mohammed <afzal@ti.com>
To: <tony@atomide.com>, <dedekind1@gmail.com>, <linux-omap@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/3] Handle GPMC-NAND registers by NAND driver
Date: Fri, 11 May 2012 20:56:32 +0530
Message-ID: <cover.1336748974.git.afzal@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Afzal Mohammed <afzal@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This series provides the ability for OMAP NAND driver to configure
GPMC_NAND registers by NAND driver itself instead of using GPMC
exported symbols.

Regards
Afzal

Afzal Mohammed (3):
  ARM: OMAP2+: gpmc: update nand register helper
  ARM: OMAP2+: gpmc-nand: update gpmc-nand regs
  mtd: nand: omap2: handle nand on gpmc

 arch/arm/mach-omap2/gpmc-nand.c        |    2 +
 arch/arm/mach-omap2/gpmc.c             |   21 ++++
 arch/arm/plat-omap/include/plat/gpmc.h |   18 +++
 arch/arm/plat-omap/include/plat/nand.h |    1 +
 drivers/mtd/nand/omap2.c               |  207 +++++++++++++++++++++++++-------
 5 files changed, 205 insertions(+), 44 deletions(-)

-- 
1.7.10
