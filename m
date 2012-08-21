Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T3kux-0001HK-JU
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2012 09:38:36 +0000
From: Afzal Mohammed <afzal@ti.com>
To: <tony@atomide.com>, <artem.bityutskiy@linux.intel.com>,
 <linux-omap@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 00/10] Prepare for GPMC driver conversion (w.r.t MTD)
Date: Tue, 21 Aug 2012 15:08:24 +0530
Message-ID: <cover.1344609341.git.afzal@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: ivan.djelic@parrot.com, Afzal Mohammed <afzal@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This is a RESEND of the series that was sent on 10-August-2012,
which unfortunately did not make it to mailing lists.

This series cleans up gpmc mtd interactions so that GPMC driver
conversion which is going to happen shortly would happen smoothly
by not creating much disturbance outside of arch/arm/*omap*/

This series,
1. provides the ability for OMAP NAND driver to configure GPMC-NAND
   registers by NAND driver itself instead of using exported GPMC
   symbols
2. modifies GPMC to provide OMAP ONENAND & NAND drivers with GPMC
   allocated address space as resource
3. creates a fictitious GPMC interrupt chip and provide the clients
   with interrupts that could be handled using standard APIs (helps
   in removing the requirement for driver of peripheral connected to
   GPMC having the knowledge about GPMC interrupt handling). The
   only user is OMAP NAND driver, it has also been modified to take
   advantage of this

This series has been made over linux-omap master & can be applied
over 3.6-rc1 too. This has been tested on omap3evm. Artem's Acked-by
has been added to mtd patches except for 10/10 where a change has
been made to handle error path properly.

Regards
Afzal

v3: Handle error path properly
v2: simplify omap_prefetch_enable()


Afzal Mohammed (10):
  ARM: OMAP2+: gpmc: update nand register helper
  ARM: OMAP2+: gpmc-nand: update gpmc-nand regs
  mtd: nand: omap2: handle nand on gpmc
  ARM: OMAP2+: gpmc-nand: update resource with memory
  ARM: OMAP2+: gpmc-onenand: provide memory as resource
  mtd: nand: omap2: obtain memory from resource
  mtd: onenand: omap2: obtain memory from resource
  ARM: OMAP2+: gpmc: Modify interrupt handling
  ARM: OMAP2+: gpmc-nand: Modify Interrupt handling
  mtd: nand: omap2: use gpmc provided irqs

 arch/arm/mach-omap2/gpmc-nand.c        |   28 +++-
 arch/arm/mach-omap2/gpmc-onenand.c     |   23 +++-
 arch/arm/mach-omap2/gpmc.c             |  156 +++++++++++++++--
 arch/arm/plat-omap/include/plat/gpmc.h |   19 ++
 arch/arm/plat-omap/include/plat/nand.h |    2 +-
 drivers/mtd/nand/omap2.c               |  299 ++++++++++++++++++++++++--------
 drivers/mtd/onenand/omap2.c            |   29 ++--
 7 files changed, 443 insertions(+), 113 deletions(-)
