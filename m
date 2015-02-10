Received: from mail-ie0-f181.google.com ([209.85.223.181])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YLK9k-0005Qx-Au
 for linux-mtd@lists.infradead.org; Tue, 10 Feb 2015 23:23:48 +0000
Received: by iebtr6 with SMTP id tr6so180107ieb.2
 for <linux-mtd@lists.infradead.org>; Tue, 10 Feb 2015 15:23:27 -0800 (PST)
Sender: Daniel Ehrenberg <dehrenberg@google.com>
From: Dan Ehrenberg <dehrenberg@chromium.org>
To: linux-mtd@lists.infradead.org, richard.weinberger@gmail.com,
 ezequiel.garcia@imgtec.com
Subject: [PATCH v2 3/3] mtdpart: Allow deleting a partition with another
 partition as master
Date: Tue, 10 Feb 2015 14:58:58 -0800
Message-Id: <1423609138-19321-3-git-send-email-dehrenberg@chromium.org>
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

This patch makes MTD dynamic partitioning more flexible by allowing
partitions to be deleted by referencing any partition with the same
master. For example, if you have /dev/mtd0 and /dev/mtd1 both
partitions on the same underlying device, then you can call
BLKPG_DEL_PARTITION with an fd of /dev/mtd0 and pno of 1, and
/dev/mtd1 will be deleted (as opposed to returning EINVAL to signal a
missing partition, which it did previously).

Signed-off-by: Dan Ehrenberg <dehrenberg@chromium.org>
---
 drivers/mtd/mtdpart.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 7eb9083..7874bbd 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -600,6 +600,15 @@ int mtd_del_partition(struct mtd_info *master, int partno)
 	struct mtd_part *slave, *next;
 	int ret = -EINVAL;
 
+	/* If del_partition was called as a partition, just treat
+	 * this as if it were called on its master. This is a harmless
+	 * generalization and lets partitions be deleted in a system
+	 * where they are sometimes already present on boot */
+	if (mtd_is_partition(master)) {
+		struct mtd_part *master_partition = PART(master);
+		master = master_partition->master;
+	}
+
 	mutex_lock(&mtd_partitions_mutex);
 	list_for_each_entry_safe(slave, next, &mtd_partitions, list)
 		if ((slave->master == master) &&
-- 
2.2.0.rc0.207.ga3a616c
