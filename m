Received: from mail-qc0-f178.google.com ([209.85.216.178])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XQM7Z-0002ky-VT
 for linux-mtd@lists.infradead.org; Sat, 06 Sep 2014 19:58:07 +0000
Received: by mail-qc0-f178.google.com with SMTP id x13so13724185qcv.23
 for <linux-mtd@lists.infradead.org>; Sat, 06 Sep 2014 12:57:43 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Brian Norris <computersforpeace@gmail.com>, Roger Quadros <rogerq@ti.com>
Subject: [PATCH 0/3] nand: omap2: Two and a half improvements
Date: Sat,  6 Sep 2014 16:56:26 -0300
Message-Id: <1410033389-32357-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Cc: Tony Lindgren <tony@atomide.com>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian, Roger:

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

Roger, do you think you can test patches 1 and 2 with different ECCs
and configurations? It's an invasive patch and I don't want to see more
regressions with this driver.

And speaking of modules, the driver loads as "modprobe omap2". And it's not
the only one with a clumsy name: "modprobe elm". I guess we cannot fix it now,
but it would be great to be more careful with driver naming in the future.

Ezequiel Garcia (3):
  nand: omap2: Add support for a flash-based bad block table
  nand: omap2: Refactor the code to remove horrible ifdefs
  nand: omap2: Replace pr_err with dev_err

 arch/arm/mach-omap2/gpmc.c                   |   2 +
 drivers/mtd/nand/omap2.c                     | 166 +++++++++++++++------------
 include/linux/platform_data/elm.h            |  14 +++
 include/linux/platform_data/mtd-nand-omap2.h |   1 +
 4 files changed, 108 insertions(+), 75 deletions(-)

-- 
2.0.1
