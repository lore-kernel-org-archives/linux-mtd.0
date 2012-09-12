Received: from mail-wi0-f171.google.com ([209.85.212.171])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TBm1i-0007Ln-1K
 for linux-mtd@lists.infradead.org; Wed, 12 Sep 2012 12:26:42 +0000
Received: by wibhq4 with SMTP id hq4so3685923wib.0
 for <linux-mtd@lists.infradead.org>; Wed, 12 Sep 2012 05:26:39 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Subject: [PATCH] MTD: nandsim: BUG: Fail if overridesize is too big
Date: Wed, 12 Sep 2012 14:26:26 +0200
Message-Id: <1347452786-10208-1-git-send-email-richard.genoud@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org,
 Adrian Hunter <adrian.hunter@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If override size is too big, the module was actually loaded instead of
failing, because retval was not set.

This lead to memory corruption with the use of the freed structs nandsim
and nand_chip.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 drivers/mtd/nand/nandsim.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index cf0cd31..5d881180 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -2333,6 +2333,7 @@ static int __init ns_init_module(void)
 		uint64_t new_size = (uint64_t)nsmtd->erasesize << overridesize;
 		if (new_size >> overridesize != nsmtd->erasesize) {
 			NS_ERR("overridesize is too big\n");
+			retval = -EINVAL;
 			goto err_exit;
 		}
 		/* N.B. This relies on nand_scan not doing anything with the size before we change it */
-- 
1.7.2.5
