Received: from mail-pf0-x231.google.com ([2607:f8b0:400e:c00::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGWWq-00030r-Eb
 for linux-mtd@lists.infradead.org; Tue, 05 Jan 2016 18:40:21 +0000
Received: by mail-pf0-x231.google.com with SMTP id 78so226950364pfw.2
 for <linux-mtd@lists.infradead.org>; Tue, 05 Jan 2016 10:39:59 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 =?UTF-8?q?S=C3=B8rensen=2C=20Stefan?= <Stefan.Sorensen@spectralink.com>,
 Heiko Schocher <hs@denx.de>, Frans Klaver <fransklaver@gmail.com>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH for-4.5 v2] mtd: nand: assign reasonable default name for NAND
 drivers
Date: Tue,  5 Jan 2016 10:39:45 -0800
Message-Id: <1452019185-134498-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commits such as commit 853f1c58c4b2 ("mtd: nand: omap2: show parent
device structure in sysfs") attempt to rely on the core MTD code to set
the MTD name based on the parent device. However, nand_base tries to set
a different default name according to the flash name (e.g., extracted
from the ONFI parameter page), which means NAND drivers will never make
use of the MTD defaults. This is not the intention of commit
853f1c58c4b2.

This results in problems when trying to use the cmdline partition
parser, since the MTD name is different than expected. Let's fix this by
providing a default NAND name, where possible.

Note that this is not really a great default name in the long run, since
this means that if there are multiple MTDs attached to the same
controller device, they will have the same name. But that is an existing
issue and requires future work on a better controller vs. flash chip
abstraction to fix properly.

Fixes: 853f1c58c4b2 ("mtd: nand: omap2: show parent device structure in sysfs")
Reported-by: Heiko Schocher <hs@denx.de>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Tested-by: Heiko Schocher <hs@denx.de>
Cc: Heiko Schocher <hs@denx.de>
Cc: Frans Klaver <fransklaver@gmail.com>
Cc: <stable@vger.kernel.org>
---
v2:
 * target 4.5, as 4.4 is getting late
 * add -stable tags
 * move assignment directly into nand_scan_ident() (nand_set_defaults() has a
   slightly different purpose and gets reused, so it's not as good of a
   candidate)

I kept the Tested-by since the v2 change is trivial

 drivers/mtd/nand/nand_base.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 928081bbdafd..50514f2501bb 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3996,6 +3996,9 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 	if (ret)
 		return ret;
 
+	if (!mtd->name && mtd->dev.parent)
+		mtd->name = dev_name(mtd->dev.parent);
+
 	/* Set the default functions */
 	nand_set_defaults(chip, chip->options & NAND_BUSWIDTH_16);
 
-- 
2.6.0.rc2.230.g3dd15c0
