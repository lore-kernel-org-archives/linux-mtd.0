Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ekzwY-0003pd-7Q
 for linux-mtd@lists.infradead.org; Sun, 11 Feb 2018 22:17:55 +0000
From: Stefan Agner <stefan@agner.ch>
To: richard@nod.at,
	dedekind1@gmail.com,
	adrian.hunter@intel.com
Cc: linux-mtd@lists.infradead.org,
	Stefan Agner <stefan@agner.ch>
Subject: [PATCH] UBIFS: remove unnecessary assignment
Date: Sun, 11 Feb 2018 23:17:36 +0100
Message-Id: <20180211221736.25453-1-stefan@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Assigning a value of a variable to itself is not useful. This
fixes a warning shown when using clang:
  warning: explicitly assigning value of variable of type 'int' to itself [-Wself-assign]

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 fs/ubifs/scan.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/ubifs/scan.c b/fs/ubifs/scan.c
index aab87340d3de..16f03d9929e5 100644
--- a/fs/ubifs/scan.c
+++ b/fs/ubifs/scan.c
@@ -175,7 +175,6 @@ struct ubifs_scan_leb *ubifs_start_scan(const struct ubifs_info *c, int lnum,
 void ubifs_end_scan(const struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 		    int lnum, int offs)
 {
-	lnum = lnum;
 	dbg_scan("stop scanning LEB %d at offset %d", lnum, offs);
 	ubifs_assert(offs % c->min_io_size == 0);
 
-- 
2.16.1
