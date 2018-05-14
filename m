Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fI8hB-0003OW-GZ
 for linux-mtd@lists.infradead.org; Mon, 14 May 2018 08:19:04 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 5/6] ubifs: gc: Fix typo
Date: Mon, 14 May 2018 10:18:18 +0200
Message-Id: <20180514081819.20921-6-s.hauer@pengutronix.de>
In-Reply-To: <20180514081819.20921-1-s.hauer@pengutronix.de>
References: <20180514081819.20921-1-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

"point of view" makes more sense than "point of few". Fix this.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/ubifs/gc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index 7b35e3d6cde7..a03a47cf880d 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -49,7 +49,7 @@
  * maximum size. So dark watermark is the amount of free + dirty space in LEB
  * which are guaranteed to be reclaimable. If LEB has less space, the GC might
  * be unable to reclaim it. So, LEBs with free + dirty greater than dark
- * watermark are "good" LEBs from GC's point of few. The other LEBs are not so
+ * watermark are "good" LEBs from GC's point of view. The other LEBs are not so
  * good, and GC takes extra care when moving them.
  */
 
-- 
2.17.0
