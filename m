Received: from mailrelay106.isp.belgacom.be ([195.238.20.133])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSs6h-0000Vo-4R
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 19:03:52 +0000
From: Fabian Frederick <fabf@skynet.be>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/1 linux-next] jffs2: remove multiple dereferences in debug
Date: Tue,  3 Mar 2015 20:03:09 +0100
Message-Id: <1425409389-21613-1-git-send-email-fabf@skynet.be>
Cc: Fabian Frederick <fabf@skynet.be>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

use jffs2_eraseblock variables to simplify the code

Signed-off-by: Fabian Frederick <fabf@skynet.be>
---
 fs/jffs2/debug.c |   26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/fs/jffs2/debug.c b/fs/jffs2/debug.c
index 1090eb6..2ddb967 100644
--- a/fs/jffs2/debug.c
+++ b/fs/jffs2/debug.c
@@ -160,26 +160,28 @@ __jffs2_dbg_prewrite_paranoia_check(struct jffs2_sb_info *c,
 void __jffs2_dbg_superblock_counts(struct jffs2_sb_info *c)
 {
 	struct jffs2_eraseblock *jeb;
+	struct jffs2_eraseblock *gcb = c->gcblock;
+	struct jffs2_eraseblock *nextb = c->nextblock;
 	uint32_t free = 0, dirty = 0, used = 0, wasted = 0,
 		erasing = 0, bad = 0, unchecked = 0;
 	int nr_counted = 0;
 	int dump = 0;
 
-	if (c->gcblock) {
+	if (gcb) {
 		nr_counted++;
-		free += c->gcblock->free_size;
-		dirty += c->gcblock->dirty_size;
-		used += c->gcblock->used_size;
-		wasted += c->gcblock->wasted_size;
-		unchecked += c->gcblock->unchecked_size;
+		free += gcb->free_size;
+		dirty += gcb->dirty_size;
+		used += gcb->used_size;
+		wasted += gcb->wasted_size;
+		unchecked += gcb->unchecked_size;
 	}
-	if (c->nextblock) {
+	if (nextb) {
 		nr_counted++;
-		free += c->nextblock->free_size;
-		dirty += c->nextblock->dirty_size;
-		used += c->nextblock->used_size;
-		wasted += c->nextblock->wasted_size;
-		unchecked += c->nextblock->unchecked_size;
+		free += nextb->free_size;
+		dirty += nextb->dirty_size;
+		used += nextb->used_size;
+		wasted += nextb->wasted_size;
+		unchecked += nextb->unchecked_size;
 	}
 	list_for_each_entry(jeb, &c->clean_list, list) {
 		nr_counted++;
-- 
1.7.9.5
