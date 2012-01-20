Received: from mail-gx0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RoLop-0003w9-LH
 for linux-mtd@lists.infradead.org; Fri, 20 Jan 2012 21:16:20 +0000
Received: by ggnl1 with SMTP id l1so652635ggn.36
 for <linux-mtd@lists.infradead.org>; Fri, 20 Jan 2012 13:16:18 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: mtdoops: kill Kconfig usage instructions
Date: Fri, 20 Jan 2012 13:17:00 -0800
Message-Id: <1327094220-26296-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The mtdoops usage instructions found in Kconfig have been incorrect
since:

    commit 2e386e4bac90554887e73d6f342e845185b33fc3
    mtd: mtdoops: refactor as a kmsg_dumper

mtdoops no longer uses a console. Now, if you build it into your kernel,
you add something like the following to your command line to select
partition X as your logging partition:

    mtdoops.mtddev=X

Anyway, it seems better to leave the documentation out of Kconfig.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/Kconfig |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 1be6218..58c6020 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -304,9 +304,6 @@ config MTD_OOPS
 	  buffer in a flash partition where it can be read back at some
 	  later point.
 
-	  To use, add console=ttyMTDx to the kernel command line,
-	  where x is the MTD device number to use.
-
 config MTD_SWAP
 	tristate "Swap on MTD device support"
 	depends on MTD && SWAP
-- 
1.7.5.4
