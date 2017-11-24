From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 kernel@pengutronix.de, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH] UBI: Fastmap: Fix typo
Date: Fri, 24 Nov 2017 12:14:06 +0100
Message-Id: <20171124111406.27451-1-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix misspelling of 'available' in function name.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/ubi/fastmap-wl.c | 2 +-
 drivers/mtd/ubi/wl.c         | 2 +-
 drivers/mtd/ubi/wl.h         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
index 4f0bd6b4422a..590d967011bb 100644
--- a/drivers/mtd/ubi/fastmap-wl.c
+++ b/drivers/mtd/ubi/fastmap-wl.c
@@ -66,7 +66,7 @@ static void return_unused_pool_pebs(struct ubi_device *ubi,
 	}
 }
 
-static int anchor_pebs_avalible(struct rb_root *root)
+static int anchor_pebs_available(struct rb_root *root)
 {
 	struct rb_node *p;
 	struct ubi_wl_entry *e;
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index b5b8cd6f481c..599495dfbd0c 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -692,7 +692,7 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 #ifdef CONFIG_MTD_UBI_FASTMAP
 	/* Check whether we need to produce an anchor PEB */
 	if (!anchor)
-		anchor = !anchor_pebs_avalible(&ubi->free);
+		anchor = !anchor_pebs_available(&ubi->free);
 
 	if (anchor) {
 		e1 = find_anchor_wl_entry(&ubi->used);
diff --git a/drivers/mtd/ubi/wl.h b/drivers/mtd/ubi/wl.h
index 2aaa3f7f2ba9..a9e2d669acd8 100644
--- a/drivers/mtd/ubi/wl.h
+++ b/drivers/mtd/ubi/wl.h
@@ -2,7 +2,7 @@
 #ifndef UBI_WL_H
 #define UBI_WL_H
 #ifdef CONFIG_MTD_UBI_FASTMAP
-static int anchor_pebs_avalible(struct rb_root *root);
+static int anchor_pebs_available(struct rb_root *root);
 static void update_fastmap_work_fn(struct work_struct *wrk);
 static struct ubi_wl_entry *find_anchor_wl_entry(struct rb_root *root);
 static struct ubi_wl_entry *get_peb_for_wl(struct ubi_device *ubi);
-- 
2.11.0
