Received: from mga03.intel.com ([143.182.124.21])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1FuH-0000vs-1Z
 for linux-mtd@lists.infradead.org; Sun, 29 Jun 2014 14:16:38 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: hujianyang <hujianyang@huawei.com>
Subject: [PATCH v2 1/2] UBIFS: remove mst_mutex
Date: Sun, 29 Jun 2014 17:16:10 +0300
Message-Id: <1404051371-29756-1-git-send-email-dedekind1@gmail.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

The 'mst_mutex' is not needed since because 'ubifs_write_master()' is only
called on the mount path and commit path. The mount path is sequential and
there is no parallelism, and the commit path is also serialized - there is only
one commit going on at a time.

This patch is CCed to -stable because it is required to make the next fix
apply.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: stable@vger.kernel.org
---
 fs/ubifs/commit.c | 2 --
 fs/ubifs/master.c | 7 +++----
 fs/ubifs/super.c  | 1 -
 fs/ubifs/ubifs.h  | 2 --
 4 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/fs/ubifs/commit.c b/fs/ubifs/commit.c
index ff82293..aa13ad0 100644
--- a/fs/ubifs/commit.c
+++ b/fs/ubifs/commit.c
@@ -174,7 +174,6 @@ static int do_commit(struct ubifs_info *c)
 	if (err)
 		goto out;
 
-	mutex_lock(&c->mst_mutex);
 	c->mst_node->cmt_no      = cpu_to_le64(c->cmt_no);
 	c->mst_node->log_lnum    = cpu_to_le32(new_ltail_lnum);
 	c->mst_node->root_lnum   = cpu_to_le32(zroot.lnum);
@@ -204,7 +203,6 @@ static int do_commit(struct ubifs_info *c)
 	else
 		c->mst_node->flags &= ~cpu_to_le32(UBIFS_MST_NO_ORPHS);
 	err = ubifs_write_master(c);
-	mutex_unlock(&c->mst_mutex);
 	if (err)
 		goto out;
 
diff --git a/fs/ubifs/master.c b/fs/ubifs/master.c
index ab83ace..1a4bb9e 100644
--- a/fs/ubifs/master.c
+++ b/fs/ubifs/master.c
@@ -352,10 +352,9 @@ int ubifs_read_master(struct ubifs_info *c)
  * ubifs_write_master - write master node.
  * @c: UBIFS file-system description object
  *
- * This function writes the master node. The caller has to take the
- * @c->mst_mutex lock before calling this function. Returns zero in case of
- * success and a negative error code in case of failure. The master node is
- * written twice to enable recovery.
+ * This function writes the master node. Returns zero in case of success and a
+ * negative error code in case of failure. The master node is written twice to
+ * enable recovery.
  */
 int ubifs_write_master(struct ubifs_info *c)
 {
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 3904c85..eb25aa9 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1963,7 +1963,6 @@ static struct ubifs_info *alloc_ubifs_info(struct ubi_volume_desc *ubi)
 		mutex_init(&c->lp_mutex);
 		mutex_init(&c->tnc_mutex);
 		mutex_init(&c->log_mutex);
-		mutex_init(&c->mst_mutex);
 		mutex_init(&c->umount_mutex);
 		mutex_init(&c->bu_mutex);
 		mutex_init(&c->write_reserve_mutex);
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index c1f71fe..2a18270 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1051,7 +1051,6 @@ struct ubifs_debug_info;
  *
  * @mst_node: master node
  * @mst_offs: offset of valid master node
- * @mst_mutex: protects the master node area, @mst_node, and @mst_offs
  *
  * @max_bu_buf_len: maximum bulk-read buffer length
  * @bu_mutex: protects the pre-allocated bulk-read buffer and @c->bu
@@ -1292,7 +1291,6 @@ struct ubifs_info {
 
 	struct ubifs_mst_node *mst_node;
 	int mst_offs;
-	struct mutex mst_mutex;
 
 	int max_bu_buf_len;
 	struct mutex bu_mutex;
-- 
1.9.3
