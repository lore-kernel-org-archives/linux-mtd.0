From: Adrian Hunter <adrian.hunter@nokia.com>
To: Tony Lindgren <tony@atomide.com>
Subject: [PATCH 0/4] Fix 104MHz support for OMAP OneNAND
Date: Mon,  7 Feb 2011 10:46:57 +0200
Message-Id: <1297068421-14430-1-git-send-email-adrian.hunter@nokia.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
	linux-omap Mailing List <linux-omap@vger.kernel.org>,
	linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

Adrian Hunter (3):
      OMAP: OneNAND: fix 104MHz support
      OMAP: OneNAND: determine frequency in one place
      OMAP: OneNAND: let boards determine OneNAND frequency

Roman Tereshonkov (1):
      mtd: OneNAND: OMAP2: increase multiblock erase verify timeout

 arch/arm/mach-omap2/gpmc-onenand.c        |  113 +++++++++++++++++++++--------
 arch/arm/plat-omap/include/plat/onenand.h |   10 +++-
 drivers/mtd/onenand/omap2.c               |   36 ++-------
 include/linux/mtd/onenand_regs.h          |    1 +
 4 files changed, 100 insertions(+), 60 deletions(-)
 
Regards
Adrian
