Received: from mail-ig0-x236.google.com ([2607:f8b0:4001:c05::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YLJmE-0003c9-N0
 for linux-mtd@lists.infradead.org; Tue, 10 Feb 2015 22:59:31 +0000
Received: by mail-ig0-f182.google.com with SMTP id h15so894223igd.3
 for <linux-mtd@lists.infradead.org>; Tue, 10 Feb 2015 14:59:09 -0800 (PST)
Sender: Daniel Ehrenberg <dehrenberg@google.com>
From: Dan Ehrenberg <dehrenberg@chromium.org>
To: linux-mtd@lists.infradead.org, richard.weinberger@gmail.com,
 ezequiel.garcia@imgtec.com
Subject: [PATCH v2 2/3] mtdpart: Remove partition overlap checks
Date: Tue, 10 Feb 2015 14:58:57 -0800
Message-Id: <1423609138-19321-2-git-send-email-dehrenberg@chromium.org>
In-Reply-To: <1423609138-19321-1-git-send-email-dehrenberg@chromium.org>
References: <1423609138-19321-1-git-send-email-dehrenberg@chromium.org>
Cc: namnguyen@chromium.org, grundler@chromium.org, gwendal@chromium.org,
 Dan Ehrenberg <dehrenberg@chromium.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch makes MTD dynamic partitioning more flexible by removing
overlap checks for dynamic partitions. I don't see any  particular
reason why overlapping dynamic partitions should be prohibited while
static partitions are allowed to overlap freely, and this is useful
for users who want one additional partition to span over the whole
device.

Signed-off-by: Dan Ehrenberg <dehrenberg@chromium.org>
---
 drivers/mtd/mtdpart.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 7c6f526..7eb9083 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -551,7 +551,7 @@ int mtd_add_partition(struct mtd_info *master, const char *name,
 		      long long offset, long long length)
 {
 	struct mtd_partition part;
-	struct mtd_part *p, *new;
+	struct mtd_part *new;
 	uint64_t start, end;
 	int ret = 0;
 
@@ -586,27 +586,12 @@ int mtd_add_partition(struct mtd_info *master, const char *name,
 	end = offset + length;
 
 	mutex_lock(&mtd_partitions_mutex);
-	list_for_each_entry(p, &mtd_partitions, list)
-		if (p->master == master) {
-			if ((start >= p->offset) &&
-			    (start < (p->offset + p->mtd.size)))
-				goto err_inv;
-
-			if ((end >= p->offset) &&
-			    (end < (p->offset + p->mtd.size)))
-				goto err_inv;
-		}
-
 	list_add(&new->list, &mtd_partitions);
 	mutex_unlock(&mtd_partitions_mutex);
 
 	add_mtd_device(&new->mtd);
 
 	return ret;
-err_inv:
-	mutex_unlock(&mtd_partitions_mutex);
-	free_partition(new);
-	return -EINVAL;
 }
 EXPORT_SYMBOL_GPL(mtd_add_partition);
 
-- 
2.2.0.rc0.207.ga3a616c
