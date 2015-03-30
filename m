Received: from mail-ig0-x22f.google.com ([2607:f8b0:4001:c05::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ycgoy-0005Zx-3Z
 for linux-mtd@lists.infradead.org; Mon, 30 Mar 2015 21:02:08 +0000
Received: by igbqf9 with SMTP id qf9so656289igb.1
 for <linux-mtd@lists.infradead.org>; Mon, 30 Mar 2015 14:01:46 -0700 (PDT)
Sender: Daniel Ehrenberg <dehrenberg@google.com>
From: Dan Ehrenberg <dehrenberg@chromium.org>
To: computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 ezequiel@vanguardiasur.com.ar, Richard Weinberger <richard@nod.at>
Subject: [PATCH v4 3/3] mtd: part: Remove partition overlap checks
Date: Mon, 30 Mar 2015 14:01:38 -0700
Message-Id: <1427749298-31714-4-git-send-email-dehrenberg@chromium.org>
In-Reply-To: <1427749298-31714-1-git-send-email-dehrenberg@chromium.org>
References: <1427749298-31714-1-git-send-email-dehrenberg@chromium.org>
Cc: gwendal@chromium.org, Dan Ehrenberg <dehrenberg@chromium.org>
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
static partitions are allowed to overlap freely.

The checks previously had an off-by-one error, where 'end' should be
one less than what it is currently set at, and adding partitions out of
increasing order will fail. Disabling the checks resolves this issue.

Signed-off-by: Dan Ehrenberg <dehrenberg@chromium.org>
---
 drivers/mtd/mtdpart.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index be80340..c444842 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -582,7 +582,7 @@ int mtd_add_partition(struct mtd_info *master, const char *name,
 		      long long offset, long long length)
 {
 	struct mtd_partition part;
-	struct mtd_part *p, *new;
+	struct mtd_part *new;
 	uint64_t start, end;
 	int ret = 0;
 
@@ -611,17 +611,6 @@ int mtd_add_partition(struct mtd_info *master, const char *name,
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
 
@@ -630,10 +619,6 @@ int mtd_add_partition(struct mtd_info *master, const char *name,
 	mtd_add_partition_attrs(new);
 
 	return ret;
-err_inv:
-	mutex_unlock(&mtd_partitions_mutex);
-	free_partition(new);
-	return -EINVAL;
 }
 EXPORT_SYMBOL_GPL(mtd_add_partition);
 
-- 
2.2.0.rc0.207.ga3a616c
