From: Adrian Hunter <adrian.hunter@nokia.com>
To: Tony Lindgren <tony@atomide.com>
Date: Tue, 21 Dec 2010 21:44:33 +0200
Message-Id: <20101221194433.3127.74744.sendpatchset@ahunter-work.research.nokia.com>
Subject: [PATCH 0/2] Add 104MHz support for OMAP OneNAND
Cc: Felipe Balbi <balbi@ti.com>, Kyungmin Park <kyungmin.park@samsung.com>,
	linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	linux-omap Mailing List <linux-omap@vger.kernel.org>,
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

Here is OMAP2/3: OneNAND: add 104MHz support.

Adrian Hunter (2):
      OMAP2/3: GPMC: put sync_clk value in picoseconds instead of nanoseconds
      OMAP2/3: OneNAND: add 104MHz support

 arch/arm/mach-omap2/gpmc-nand.c        |    2 +-
 arch/arm/mach-omap2/gpmc-onenand.c     |   19 ++++++++++++++-----
 arch/arm/mach-omap2/gpmc.c             |   12 +++++++++++-
 arch/arm/mach-omap2/usb-tusb6010.c     |    4 ++--
 arch/arm/plat-omap/include/plat/gpmc.h |    9 +++++----
 drivers/mtd/onenand/omap2.c            |    3 +++
 6 files changed, 36 insertions(+), 13 deletions(-)
 
Regards
Adrian
