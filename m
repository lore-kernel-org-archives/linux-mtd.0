Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QILkx-00089G-1E
	for linux-mtd@lists.infradead.org; Fri, 06 May 2011 14:11:51 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p46EBiFf000678
	for <linux-mtd@lists.infradead.org>; Fri, 6 May 2011 17:11:45 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 5/7] UBIFS: fix debugging FS checking failure
Date: Fri,  6 May 2011 17:15:15 +0300
Message-Id: <1304691317-32214-5-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1304691317-32214-1-git-send-email-dedekind1@gmail.com>
References: <1304691317-32214-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

When the debugging self-checks are enabled, we go trough whole file-system
after mount and check/validate every single node referred to by the index.
This is implemented by the 'dbg_check_filesystem()' function. However, this
function fails if we mount "unclean" file-system, i.e., if we mount the
file-system after a power cut. It fails with the following symptoms:

UBIFS DBG (pid 8171): ubifs_recover_size: ino 937 size 3309925 -> 3317760
UBIFS: recovery deferred
UBIFS error (pid 8171): check_leaf: data node at LEB 1000:0 is not within inode size 3309925

The reason of failure is that recovery fixed up the inode size in memory, but
not on the flash so far. So the value on the flash is incorrect so far,
and would be corrected when we re-mount R/W. But 'check_leaf()' ignores
this fact and tries to validate the size of the on-flash inode, which is
incorrect, so it fails.

This patch teaches the checking code to look at the VFS inode cache first,
and if there is the inode in question, use that inode instead of the inode
on the flash media. This fixes the issue.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.c |   41 +++++++++++++++++++++++++++++++++++------
 1 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index f7515bd..b5ba2ea 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -1818,6 +1818,8 @@ static struct fsck_inode *add_inode(struct ubifs_info *c,
 	struct rb_node **p, *parent = NULL;
 	struct fsck_inode *fscki;
 	ino_t inum = key_inum_flash(c, &ino->key);
+	struct inode *inode;
+	struct ubifs_inode *ui;
 
 	p = &fsckd->inodes.rb_node;
 	while (*p) {
@@ -1841,19 +1843,46 @@ static struct fsck_inode *add_inode(struct ubifs_info *c,
 	if (!fscki)
 		return ERR_PTR(-ENOMEM);
 
+	inode = ilookup(c->vfs_sb, inum);
+
 	fscki->inum = inum;
-	fscki->nlink = le32_to_cpu(ino->nlink);
-	fscki->size = le64_to_cpu(ino->size);
-	fscki->xattr_cnt = le32_to_cpu(ino->xattr_cnt);
-	fscki->xattr_sz = le32_to_cpu(ino->xattr_size);
-	fscki->xattr_nms = le32_to_cpu(ino->xattr_names);
-	fscki->mode = le32_to_cpu(ino->mode);
+	/*
+	 * If the inode is present in the VFS inode cache, use it instead of
+	 * the on-flash inode which might be out-of-date. E.g., the size might
+	 * be out-of-date. If we do not do this, the following may happen, for
+	 * example:
+	 *   1. A power cut happens
+	 *   2. We mount the file-system R/O, the replay process fixes up the
+	 *      inode size in the VFS cache, but on on-flash.
+	 *   3. 'check_leaf()' fails because it hits a data node beyond inode
+	 *      size.
+	 */
+	if (!inode) {
+		fscki->nlink = le32_to_cpu(ino->nlink);
+		fscki->size = le64_to_cpu(ino->size);
+		fscki->xattr_cnt = le32_to_cpu(ino->xattr_cnt);
+		fscki->xattr_sz = le32_to_cpu(ino->xattr_size);
+		fscki->xattr_nms = le32_to_cpu(ino->xattr_names);
+		fscki->mode = le32_to_cpu(ino->mode);
+	} else {
+		ui = ubifs_inode(inode);
+		fscki->nlink = inode->i_nlink;
+		fscki->size = inode->i_size;
+		fscki->xattr_cnt = ui->xattr_cnt;
+		fscki->xattr_sz = ui->xattr_size;
+		fscki->xattr_nms = ui->xattr_names;
+		fscki->mode = inode->i_mode;
+		iput(inode);
+	}
+
 	if (S_ISDIR(fscki->mode)) {
 		fscki->calc_sz = UBIFS_INO_NODE_SZ;
 		fscki->calc_cnt = 2;
 	}
+
 	rb_link_node(&fscki->rb, parent, p);
 	rb_insert_color(&fscki->rb, &fsckd->inodes);
+
 	return fscki;
 }
 
-- 
1.7.2.3
