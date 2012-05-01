Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPGpf-0006tJ-8e
 for linux-mtd@lists.infradead.org; Tue, 01 May 2012 17:25:47 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: docg3: fix max_bitflips related bug
Date: Tue,  1 May 2012 10:25:25 -0700
Message-Id: <1335893125-15904-1-git-send-email-mikedunn@newsguy.com>
Cc: Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This fixes a bug in the docg3 driver that was introduced by the EUCLEAN patch
set [1].

[1] http://lists.infradead.org/pipermail/linux-mtd/2012-April/040941.html

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/mtd/devices/docg3.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 7644d59..3dbbfa5 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -889,7 +889,7 @@ static int doc_read_oob(struct mtd_info *mtd, loff_t from,
 	ret = 0;
 	skip = from % DOC_LAYOUT_PAGE_SIZE;
 	mutex_lock(&docg3->cascade->lock);
-	while (!ret && (len > 0 || ooblen > 0)) {
+	while (ret >= 0 && (len > 0 || ooblen > 0)) {
 		calc_block_sector(from - skip, &block0, &block1, &page, &ofs,
 			docg3->reliable);
 		nbdata = min_t(size_t, len, DOC_LAYOUT_PAGE_SIZE - skip);
-- 
1.7.3.4
