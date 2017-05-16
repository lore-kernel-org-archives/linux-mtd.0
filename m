Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAkpr-0002Kx-RH
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 22:21:07 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, adrian.hunter@intel.com, dedekind1@gmail.com,
 Richard Weinberger <richard@nod.at>, stable@vger.kernel.org
Subject: [PATCH 2/2] ubifs: Correctly evict xattr inodes
Date: Wed, 17 May 2017 00:20:27 +0200
Message-Id: <1494973227-17271-2-git-send-email-richard@nod.at>
In-Reply-To: <1494973227-17271-1-git-send-email-richard@nod.at>
References: <1494973227-17271-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

UBIFS handles extended attributes just like files, as consequence of
that, they also have inodes.
Therefore UBIFS does all the inode machinery also for xattrs. Since new
inodes have i_nlink of 1, a file or xattr inode will be evicted
if i_nlink goes down to 0 after an unlink. UBIFS assumes this model also
for xattrs, which is not correct.
One can create a file "foo" with xattr "user.test". By reading
"user.test" an inode will be created, and by deleting "user.test" it
will get evicted later. The assumption breaks if the file "foo", which
hosts the xattrs, will be removed. VFS nor UBIFS does not remove each
xattr via ubifs_xattr_remove(), it just removes the host inode from
the TNC and all underlying xattr nodes too and the inode will remain
in the cache and wastes memory.

To solve this problem, remove xattr inodes from the VFS inode cache in
ubifs_xattr_remove() to make sure that they get evicted.

Fixes: 1e51764a3c2ac05a ("UBIFS: add new flash file system")
Cc: <stable@vger.kernel.org>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/tnc.c   |  2 ++
 fs/ubifs/ubifs.h |  1 +
 fs/ubifs/xattr.c | 22 ++++++++++++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index 709aa098dd46..96374a39ffba 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -2802,6 +2802,8 @@ int ubifs_tnc_remove_ino(struct ubifs_info *c, ino_t inum)
 		dbg_tnc("xent '%s', ino %lu", xent->name,
 			(unsigned long)xattr_inum);
 
+		ubifs_evict_xattr_inode(c, xattr_inum);
+
 		fname_name(&nm) = xent->name;
 		fname_len(&nm) = le16_to_cpu(xent->nlen);
 		err = ubifs_tnc_remove_nm(c, &key1, &nm);
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index c2797d999caa..a771d0b40ab0 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1761,6 +1761,7 @@ int ubifs_xattr_set(struct inode *host, const char *name, const void *value,
 		    size_t size, int flags);
 ssize_t ubifs_xattr_get(struct inode *host, const char *name, void *buf,
 			size_t size);
+void ubifs_evict_xattr_inode(struct ubifs_info *c, ino_t xattr_inum);
 
 /* super.c */
 struct inode *ubifs_iget(struct super_block *sb, unsigned long inum);
diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index efe00fcb8b75..9c20fd4067ce 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -513,6 +513,28 @@ static int remove_xattr(struct ubifs_info *c, struct inode *host,
 	return err;
 }
 
+/**
+ * ubifs_evict_xattr_inode - Evict an xattr inode.
+ * @c: UBIFS file-system description object
+ * @xattr_inum: xattr inode number
+ *
+ * When an inode that hosts xattrs is being removed we have to make sure
+ * that cached inodes of the xattrs also get removed from the inode cache
+ * otherwise we'd waste memory. This function looks up an inode from the
+ * inode cache and clears the link counter such that iput() will evict
+ * the inode.
+ */
+void ubifs_evict_xattr_inode(struct ubifs_info *c, ino_t xattr_inum)
+{
+	struct inode *inode;
+
+	inode = ilookup(c->vfs_sb, xattr_inum);
+	if (inode) {
+		clear_nlink(inode);
+		iput(inode);
+	}
+}
+
 static int ubifs_xattr_remove(struct inode *host, const char *name)
 {
 	struct inode *inode;
-- 
2.7.3
