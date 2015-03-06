Received: from mail-by2on0138.outbound.protection.outlook.com
 ([207.46.100.138] helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YU0Z8-0007Pq-MR
 for linux-mtd@lists.infradead.org; Fri, 06 Mar 2015 22:17:55 +0000
From: Yannick Guerrini <yguerrini@tomshardware.fr>
To: <dedekind1@gmail.com>
Subject: [PATCH] UBIFS: Fix trivial typos in comments
Date: Fri, 6 Mar 2015 23:14:39 +0100
Message-ID: <1425680079-884-1-git-send-email-yguerrini@tomshardware.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, Yannick Guerrini <yguerrini@tomshardware.fr>,
 trivial@kernel.org, adrian.hunter@intel.com, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Change 'comress' to 'compress'
Change 'inteval' to 'interval'
Change 'disabe' to 'disable'
Change 'nenver' to 'never'

Signed-off-by: Yannick Guerrini <yguerrini@tomshardware.fr>
---
 fs/ubifs/ubifs.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index bc04b9c..2911d2d 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -158,7 +158,7 @@
 #define WORST_COMPR_FACTOR 2
 
 /*
- * How much memory is needed for a buffer where we comress a data node.
+ * How much memory is needed for a buffer where we compress a data node.
  */
 #define COMPRESSED_DATA_NODE_BUF_SZ \
 	(UBIFS_DATA_NODE_SZ + UBIFS_BLOCK_SIZE * WORST_COMPR_FACTOR)
@@ -664,7 +664,7 @@ typedef int (*ubifs_lpt_scan_callback)(struct ubifs_info *c,
  * @lock: serializes @buf, @lnum, @offs, @avail, @used, @next_ino and @inodes
  *        fields
  * @softlimit: soft write-buffer timeout interval
- * @delta: hard and soft timeouts delta (the timer expire inteval is @softlimit
+ * @delta: hard and soft timeouts delta (the timer expire interval is @softlimit
  *         and @softlimit + @delta)
  * @timer: write-buffer timer
  * @no_timer: non-zero if this write-buffer does not have a timer
@@ -930,9 +930,9 @@ struct ubifs_orphan {
 /**
  * struct ubifs_mount_opts - UBIFS-specific mount options information.
  * @unmount_mode: selected unmount mode (%0 default, %1 normal, %2 fast)
- * @bulk_read: enable/disable bulk-reads (%0 default, %1 disabe, %2 enable)
+ * @bulk_read: enable/disable bulk-reads (%0 default, %1 disable, %2 enable)
  * @chk_data_crc: enable/disable CRC data checking when reading data nodes
- *                (%0 default, %1 disabe, %2 enable)
+ *                (%0 default, %1 disable, %2 enable)
  * @override_compr: override default compressor (%0 - do not override and use
  *                  superblock compressor, %1 - override and use compressor
  *                  specified in @compr_type)
@@ -962,9 +962,9 @@ struct ubifs_mount_opts {
  *           optimization)
  * @nospace_rp: the same as @nospace, but additionally means that even reserved
  *              pool is full
- * @page_budget: budget for a page (constant, nenver changed after mount)
- * @inode_budget: budget for an inode (constant, nenver changed after mount)
- * @dent_budget: budget for a directory entry (constant, nenver changed after
+ * @page_budget: budget for a page (constant, never changed after mount)
+ * @inode_budget: budget for an inode (constant, never changed after mount)
+ * @dent_budget: budget for a directory entry (constant, never changed after
  *               mount)
  */
 struct ubifs_budg_info {
-- 
1.9.5.msysgit.0
