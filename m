Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5eDd-0004Hl-Id
 for linux-mtd@lists.infradead.org; Thu, 08 Mar 2012 14:21:26 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] UBI: fix documentation and improve readability
Date: Thu,  8 Mar 2012 16:21:30 +0200
Message-Id: <1331216491-6728-1-git-send-email-dedekind1@gmail.com>
Cc: Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

The "max" parameter of 'find_wl_entry()' was documented incorrectly and
it actually means the maximum possible difference from th smallest erase
counter. Rename it to "diff" instead, and amend the documentation.

Reported-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Reviewed-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
---
 drivers/mtd/ubi/wl.c |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 0696e36..8616f52 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -350,18 +350,19 @@ static void prot_queue_add(struct ubi_device *ubi, struct ubi_wl_entry *e)
 /**
  * find_wl_entry - find wear-leveling entry closest to certain erase counter.
  * @root: the RB-tree where to look for
- * @max: highest possible erase counter
+ * @diff: maximum possible difference from the smallest erase counter
  *
  * This function looks for a wear leveling entry with erase counter closest to
- * @max and less than @max.
+ * min + @diff, where min is the smallest erase counter.
  */
-static struct ubi_wl_entry *find_wl_entry(struct rb_root *root, int max)
+static struct ubi_wl_entry *find_wl_entry(struct rb_root *root, int diff)
 {
 	struct rb_node *p;
 	struct ubi_wl_entry *e;
+	int max;
 
 	e = rb_entry(rb_first(root), struct ubi_wl_entry, u.rb);
-	max += e->ec;
+	max = e->ec + diff;
 
 	p = root->rb_node;
 	while (p) {
-- 
1.7.9.1
