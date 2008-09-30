Received: from mgw-fb01.nokia.com ([192.100.122.235])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KkZry-0005Jr-R4
	for linux-mtd@lists.infradead.org; Tue, 30 Sep 2008 07:42:07 +0000
Received: from mgw-mx03.nokia.com (mgw-mx03.nokia.com [192.100.122.230])
	by mgw-fb01.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	m8U7g3UZ009989
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-mtd@lists.infradead.org>; Tue, 30 Sep 2008 10:42:04 +0300
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH] UBIFS: fix races in bit-fields
Date: Tue, 30 Sep 2008 12:19:08 +0300
Message-Id: <1222766358-21886-13-git-send-email-dedekind@infradead.org>
In-Reply-To: <1222766358-21886-1-git-send-email-dedekind@infradead.org>
References: <1222766358-21886-1-git-send-email-dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <ext-adrian.hunter@nokia.com>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

We cannot store bit-fields together if the processes which
change them may race, unless we serialize them.

Thus, move the nospc and nospc_rp bit-fields eway from
the mount option/constant bit-fields, to avoid races.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/ubifs.h |   17 +++++++++--------
 1 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 542cbaf..c3ac5a8 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -334,7 +334,7 @@ struct ubifs_gced_idx_leb {
  * @bulk_read: non-zero if bulk-read should be used
  * @ui_mutex: serializes inode write-back with the rest of VFS operations,
  *            serializes "clean <-> dirty" state changes, serializes bulk-read,
- *            protects @dirty, @ui_size, and @xattr_size
+ *            protects @dirty, @bulk_read, @ui_size, and @xattr_size
  * @ui_lock: protects @synced_i_size
  * @synced_i_size: synchronized size of inode, i.e. the value of inode size
  *                 currently stored on the flash; used only for regular file
@@ -944,10 +944,6 @@ struct ubifs_mount_opts {
  * @fast_unmount: do not run journal commit before un-mounting
  * @big_lpt: flag that LPT is too big to write whole during commit
  * @check_lpt_free: flag that indicates LPT GC may be needed
- * @nospace: non-zero if the file-system does not have flash space (used as
- *           optimization)
- * @nospace_rp: the same as @nospace, but additionally means that even reserved
- *              pool is full
  * @no_chk_data_crc: do not check CRCs when reading data nodes (except during
  *                   recovery)
  * @bulk_read: enable bulk-reads
@@ -1017,12 +1013,17 @@ struct ubifs_mount_opts {
  *                        but which still have to be taken into account because
  *                        the index has not been committed so far
  * @space_lock: protects @budg_idx_growth, @budg_data_growth, @budg_dd_growth,
- *              @budg_uncommited_idx, @min_idx_lebs, @old_idx_sz, and @lst;
+ *              @budg_uncommited_idx, @min_idx_lebs, @old_idx_sz, @lst,
+ *              @nospace, and @nospace_rp;
  * @min_idx_lebs: minimum number of LEBs required for the index
  * @old_idx_sz: size of index on flash
  * @calc_idx_sz: temporary variable which is used to calculate new index size
  *               (contains accurate new index size at end of TNC commit start)
  * @lst: lprops statistics
+ * @nospace: non-zero if the file-system does not have flash space (used as
+ *           optimization)
+ * @nospace_rp: the same as @nospace, but additionally means that even reserved
+ *              pool is full
  *
  * @page_budget: budget for a page
  * @inode_budget: budget for an inode
@@ -1191,8 +1192,6 @@ struct ubifs_info {
 	unsigned int fast_unmount:1;
 	unsigned int big_lpt:1;
 	unsigned int check_lpt_free:1;
-	unsigned int nospace:1;
-	unsigned int nospace_rp:1;
 	unsigned int no_chk_data_crc:1;
 	unsigned int bulk_read:1;
 
@@ -1263,6 +1262,8 @@ struct ubifs_info {
 	unsigned long long old_idx_sz;
 	unsigned long long calc_idx_sz;
 	struct ubifs_lp_stats lst;
+	unsigned int nospace:1;
+	unsigned int nospace_rp:1;
 
 	int page_budget;
 	int inode_budget;
-- 
1.5.4.1
