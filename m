Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1STrzk-0007Ue-DX
 for linux-mtd@lists.infradead.org; Mon, 14 May 2012 09:55:14 +0000
From: Afzal Mohammed <afzal@ti.com>
To: <tony@atomide.com>, <dwmw2@infradead.org>,
 <artem.bityutskiy@linux.intel.com>, <dedekind1@gmail.com>,
 <linux-omap@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/4] Provide GPMC memory to OMAP nand/onenand as resource
Date: Mon, 14 May 2012 15:08:34 +0530
Message-ID: <cover.1336985941.git.afzal@ti.com>
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

Hi Tony, Artem,

This series modifies GPMC to provide OMAP onenand & nand peripherals
with GPMC allocated address space as resource. This conversion helps
in smooth migration of gpmc code to driver.

This series has been made over [1-3], but is not functionally
dependent on those, only depedency is w.r.t avoiding trivial merge
conflict (if [3] is not taken before this series), and that too
would affect only nand mtd driver.

This is targeted for 3.5, if this can be taken for 3.5, it also
helps in making mtd drivers feel less vibration when GPMC gets
converted to driver.

Regards
Afzal

[1] http://marc.info/?l=linux-omap&m=133675123118577&w=2
[2] http://marc.info/?l=linux-omap&m=133675123718579&w=2
[3] http://marc.info/?l=linux-omap&m=133675124818580&w=2

Afzal Mohammed (4):
  ARM: OMAP2+: gpmc-nand: update resource with memory
  ARM: OMAP2+: gpmc-onenand: provide memory as resource
  mtd: nand: omap2: obtain memory from resource
  mtd: onenand: omap2: obtain memory from resource

 arch/arm/mach-omap2/gpmc-nand.c        |    4 +++-
 arch/arm/mach-omap2/gpmc-onenand.c     |   23 ++++++++++++++++++++++-
 arch/arm/plat-omap/include/plat/nand.h |    1 -
 drivers/mtd/nand/omap2.c               |   19 +++++++++++++++----
 drivers/mtd/onenand/omap2.c            |   29 ++++++++++++++++-------------
 5 files changed, 56 insertions(+), 20 deletions(-)

-- 
1.7.10
