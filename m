From: Sukumar Ghorai <s-ghorai@ti.com>
To: linux-omap@vger.kernel.org
Subject: [PATCH v9 0/7] nand prefetch-irq support and ecc layout chanage
Date: Fri, 28 Jan 2011 15:42:02 +0530
Message-Id: <1296209529-22696-1-git-send-email-s-ghorai@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	Sukumar Ghorai <s-ghorai@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The following set of patches applies on linux-2.6.

The main motivations behind this patch series are -
        1. support NAND I/O in irq mode.
        2. support of different ECC schema.
        3. also add support ecc layout as like in romcode ecc layout, but not enabled

v9: gpmc_init() changed to postcore_initcall(gpmc_init);

v8: free_irq() added; used timeout for while(tight loop)
And resend of http://www.mail-archive.com/linux-omap@vger.kernel.org/msg41614.html

v7: NAND type (x16 or x8) is board specific and not omap specific; this passed form board file.
    http://www.mail-archive.com/linux-omap@vger.kernel.org/msg41469.html

v6: configurable transfer type from board file; 
    #define irq number used for nand-irq
    http://www.mail-archive.com/linux-omap@vger.kernel.org/msg39397.html
    
v5: http://www.mail-archive.com/linux-omap@vger.kernel.org/msg35860.html
This address the input as to support the irq_chained in GPMC.
And resend of
http://www.mail-archive.com/linux-omap@vger.kernel.org/msg35848.html

v4: http://www.mail-archive.com/linux-omap@vger.kernel.org/msg34882.html
and resend of
http://www.mail-archive.com/linux-omap@vger.kernel.org/msg32689.html

v3: http://www.mail-archive.com/linux-omap@vger.kernel.org/msg32071.html
Rebase on latest codebase and previous patch(posted).
http://www.mail-archive.com/linux-omap@vger.kernel.org/msg31963.html

v2: Rebase on latest codebase and previous patch(posted).
http://www.mail-archive.com/linux-omap@vger.kernel.org/msg31471.html

v1: http://www.mail-archive.com/linux-omap@vger.kernel.org/msg26666.html

Sukumar Ghorai (7):
  omap3630: nand: fix device size to work in polled mode
  omap3: nand: configurable transfer type per board
  omap: gpmc: enable irq mode in gpmc
  omap3: nand: prefetch in irq mode support
  omap3: nand: configurable fifo threshold to gain the throughput
  omap3: nand: ecc layout select from board file
  omap3: nand: making ecc layout as compatible with romcode ecc

 arch/arm/mach-omap2/board-3430sdp.c    |    2 +-
 arch/arm/mach-omap2/board-3630sdp.c    |    3 +-
 arch/arm/mach-omap2/board-flash.c      |   13 +-
 arch/arm/mach-omap2/board-flash.h      |    4 +-
 arch/arm/mach-omap2/board-ldp.c        |    2 +-
 arch/arm/mach-omap2/board-zoom.c       |    5 +-
 arch/arm/mach-omap2/gpmc-nand.c        |    7 +-
 arch/arm/mach-omap2/gpmc.c             |   56 +++++-
 arch/arm/mach-omap2/io.c               |    2 -
 arch/arm/plat-omap/include/plat/gpmc.h |   18 ++-
 arch/arm/plat-omap/include/plat/irqs.h |    9 +-
 arch/arm/plat-omap/include/plat/nand.h |   11 +
 drivers/mtd/nand/Kconfig               |   17 --
 drivers/mtd/nand/omap2.c               |  367 ++++++++++++++++++++++++--------
 14 files changed, 386 insertions(+), 130 deletions(-)
