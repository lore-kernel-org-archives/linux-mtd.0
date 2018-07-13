Received: from mout.kundenserver.de ([217.72.192.73])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fdz7q-0000Ez-K3
 for linux-mtd@lists.infradead.org; Fri, 13 Jul 2018 14:32:52 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
Cc: y2038@lists.linaro.org, Arnd Bergmann <arnd@arndb.de>,
 Eric Biggers <ebiggers@google.com>,
 Deepa Dinamani <deepa.kernel@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] [RESEND] ubifs: use timespec64 for inode timestamps
Date: Fri, 13 Jul 2018 16:31:55 +0200
Message-Id: <20180713143212.3142541-1-arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Both vfs and the on-disk inode structures can deal with fine-grained
timestamps now, so this is the last missing piece to make ubifs
y2038-safe on 32-bit architectures.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I sent these two patches originally on Jun 20, but forgot to write
back when Richard asked who should apply them.

Please pick up both patches in the ubifs tree for 4.19.
---
 fs/ubifs/file.c | 11 +++++------
 fs/ubifs/sb.c   |  6 +++---
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index fd7eb6fe9090..02fab5c322c7 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1365,11 +1365,10 @@ int ubifs_fsync(struct file *file, loff_t start, loff_t end, int datasync)
  * granularity, they are not updated. This is an optimization.
  */
 static inline int mctime_update_needed(const struct inode *inode,
-				       const struct timespec *now)
+				       const struct timespec64 *now)
 {
-	struct timespec64 now64 = timespec_to_timespec64(*now);
-	if (!timespec64_equal(&inode->i_mtime, &now64) ||
-	    !timespec64_equal(&inode->i_ctime, &now64))
+	if (!timespec64_equal(&inode->i_mtime, now) ||
+	    !timespec64_equal(&inode->i_ctime, now))
 		return 1;
 	return 0;
 }
@@ -1425,7 +1424,7 @@ int ubifs_update_time(struct inode *inode, struct timespec64 *time,
  */
 static int update_mctime(struct inode *inode)
 {
-	struct timespec now = timespec64_to_timespec(current_time(inode));
+	struct timespec64 now = current_time(inode);
 	struct ubifs_inode *ui = ubifs_inode(inode);
 	struct ubifs_info *c = inode->i_sb->s_fs_info;
 
@@ -1519,7 +1518,7 @@ static vm_fault_t ubifs_vm_page_mkwrite(struct vm_fault *vmf)
 	struct page *page = vmf->page;
 	struct inode *inode = file_inode(vmf->vma->vm_file);
 	struct ubifs_info *c = inode->i_sb->s_fs_info;
-	struct timespec now = timespec64_to_timespec(current_time(inode));
+	struct timespec64 now = current_time(inode);
 	struct ubifs_budget_req req = { .new_page = 1 };
 	int err, update_time;
 
diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 8c25081a5109..fa0a982a6797 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -85,7 +85,7 @@ static int create_default_filesystem(struct ubifs_info *c)
 	long long tmp64, main_bytes;
 	__le64 tmp_le64;
 	__le32 tmp_le32;
-	struct timespec ts;
+	struct timespec64 ts;
 
 	/* Some functions called from here depend on the @c->key_len filed */
 	c->key_len = UBIFS_SK_LEN;
@@ -301,8 +301,8 @@ static int create_default_filesystem(struct ubifs_info *c)
 	ino->creat_sqnum = cpu_to_le64(++c->max_sqnum);
 	ino->nlink = cpu_to_le32(2);
 
-	ktime_get_real_ts(&ts);
-	ts = timespec_trunc(ts, DEFAULT_TIME_GRAN);
+	ktime_get_real_ts64(&ts);
+	ts = timespec64_trunc(ts, DEFAULT_TIME_GRAN);
 	tmp_le64 = cpu_to_le64(ts.tv_sec);
 	ino->atime_sec   = tmp_le64;
 	ino->ctime_sec   = tmp_le64;
-- 
2.9.0
