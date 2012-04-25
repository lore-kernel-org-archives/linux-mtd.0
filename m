Received: from ns.pmeerw.net ([87.118.82.44] helo=pmeerw.net)
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SN23P-0001PC-BN
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 13:14:44 +0000
From: Peter Meerwald <pmeerw@pmeerw.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd/cmdlinepart: fix reference to mtdpart_setup() in comment
Date: Wed, 25 Apr 2012 15:14:17 +0200
Message-Id: <1335359657-5963-1-git-send-email-pmeerw@pmeerw.net>
Cc: Peter Meerwald <p.meerwald@bct-electronic.com>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Peter Meerwald <p.meerwald@bct-electronic.com>

Signed-off-by: Peter Meerwald <p.meerwald@bct-electronic.com>
---
 drivers/mtd/cmdlinepart.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index ddf9ec6..4558e0f 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -70,7 +70,7 @@ struct cmdline_mtd_partition {
 /* mtdpart_setup() parses into here */
 static struct cmdline_mtd_partition *partitions;
 
-/* the command line passed to mtdpart_setupd() */
+/* the command line passed to mtdpart_setup() */
 static char *cmdline;
 static int cmdline_parsed = 0;
 
-- 
1.7.5.4
