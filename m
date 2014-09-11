Received: from mail-qa0-f45.google.com ([209.85.216.45])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XS5vQ-0004Yu-Fv
 for linux-mtd@lists.infradead.org; Thu, 11 Sep 2014 15:04:44 +0000
Received: by mail-qa0-f45.google.com with SMTP id s7so3522270qap.32
 for <linux-mtd@lists.infradead.org>; Thu, 11 Sep 2014 08:04:17 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Roger Quadros <rogerq@ti.com>, Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v3 0/3] nand: omap2: Two and a half improvements
Date: Thu, 11 Sep 2014 12:02:07 -0300
Message-Id: <1410447730-16087-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
 linux-mtd@lists.infradead.org, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Changes from v2:

  * Fixed some silly mistakes in patch 3, and reverted the removed
    error messages when nand_bch_init fails.

Changes from v1:

  * Rebased on v3.14-rc2.

  * Removed a few s/pr_err/dev_err change from patch two, and added it
    to patch three. This was some git-rebase leftover.

Pekon's attempt to add flash BBT support for this driver made me realise
the addition made sense and there were good reasons for it. The first patch
adds support for enabling a flash BBT either from legacy board files or
from devicetree.

While testing this, I noticed how the driver relied on a whole bunch of
horrible #ifdefs, which prevented me from loading the driver as a module.
The second patch attempts to fix that.

The third patch is just a dummy cleanup replacing pr_errs with dev_errs.
This driver is abusing from user messages, but I'm not sure fixing them
worths the trouble.

Ezequiel Garcia (3):
  nand: omap2: Add support for flash-based bad block table
  nand: omap2: Remove horrible ifdefs to fix module probe
  nand: omap2: Replace pr_err with dev_err

 arch/arm/mach-omap2/gpmc.c                   |   2 +
 drivers/mtd/nand/omap2.c                     | 166 +++++++++++++++------------
 include/linux/platform_data/elm.h            |  14 +++
 include/linux/platform_data/mtd-nand-omap2.h |   1 +
 4 files changed, 110 insertions(+), 73 deletions(-)

-- 
2.1.0
