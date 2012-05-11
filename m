Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SSwUE-000504-4d
 for linux-mtd@lists.infradead.org; Fri, 11 May 2012 20:30:50 +0000
Received: by pbbrq13 with SMTP id rq13so4237804pbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 11 May 2012 13:30:48 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 3/3] mtd: nand: gpmi: [FIXME] need to use {read, write}_oob_raw
Date: Fri, 11 May 2012 13:30:35 -0700
Message-Id: <1336768235-12658-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1336768235-12658-1-git-send-email-computersforpeace@gmail.com>
References: <1336768235-12658-1-git-send-email-computersforpeace@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch is simply an added warning in the comments. Ideally, this patch
need not be merged, but rather, a developer will write a proper solution
that can use the ecc.read_oob_raw and ecc.write_oob_raw interfaces.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 8250f63..033bd7a 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1054,6 +1054,9 @@ exit_auxiliary:
  * ECC-based or raw view of the page is implicit in which function it calls
  * (there is a similar pair of ECC-based/raw functions for writing).
  *
+ * FIXME: The following paragraph is incorrect, now that there exist
+ * ecc.read_oob_raw and ecc.write_oob_raw functions.
+ *
  * Since MTD assumes the OOB is not covered by ECC, there is no pair of
  * ECC-based/raw functions for reading or or writing the OOB. The fact that the
  * caller wants an ECC-based or raw view of the page is not propagated down to
-- 
1.7.5.4.2.g519b1
