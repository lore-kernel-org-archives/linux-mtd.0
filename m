Received: from mail-ig0-x22e.google.com ([2607:f8b0:4001:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YLJm8-0003bI-Oo
 for linux-mtd@lists.infradead.org; Tue, 10 Feb 2015 22:59:25 +0000
Received: by mail-ig0-f174.google.com with SMTP id b16so27280610igk.1
 for <linux-mtd@lists.infradead.org>; Tue, 10 Feb 2015 14:59:03 -0800 (PST)
Sender: Daniel Ehrenberg <dehrenberg@google.com>
From: Dan Ehrenberg <dehrenberg@chromium.org>
To: linux-mtd@lists.infradead.org, richard.weinberger@gmail.com,
 ezequiel.garcia@imgtec.com
Subject: [PATCH v2 1/3] mtdpart: Allow adding a partition of a partition
Date: Tue, 10 Feb 2015 14:58:56 -0800
Message-Id: <1423609138-19321-1-git-send-email-dehrenberg@chromium.org>
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

MTD allows dynamic partitioning by the BLKPG ioctl.
The current code restricts partition dynamic addition to work only on
the master MTD device. This doesn't make a lot of sense, and is
impossible to meet if the device is already partitioned (since the
master MTD device is not visible). This commit removes the restriction.

Signed-off-by: Dan Ehrenberg <dehrenberg@chromium.org>
---
 drivers/mtd/mtdchar.c | 4 ----
 drivers/mtd/mtdpart.c | 6 ++++++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 5356395..30215c7 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -545,10 +545,6 @@ static int mtdchar_blkpg_ioctl(struct mtd_info *mtd,
 	switch (a.op) {
 	case BLKPG_ADD_PARTITION:
 
-		/* Only master mtd device must be used to add partitions */
-		if (mtd_is_partition(mtd))
-			return -EINVAL;
-
 		/* Sanitize user input */
 		p.devname[BLKPG_DEVNAMELTH - 1] = '\0';
 
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index a3e3a7d..7c6f526 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -566,6 +566,12 @@ int mtd_add_partition(struct mtd_info *master, const char *name,
 	if (length <= 0)
 		return -EINVAL;
 
+	if (mtd_is_partition(master)) {
+		struct mtd_part *master_partition = PART(master);
+		offset += master_partition->offset;
+		master = master_partition->master;
+	}
+
 	part.name = name;
 	part.size = length;
 	part.offset = offset;
-- 
2.2.0.rc0.207.ga3a616c
