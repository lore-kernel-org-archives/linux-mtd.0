Received: from mail-io0-x243.google.com ([2607:f8b0:4001:c06::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eK9De-0002v7-5t
 for linux-mtd@lists.infradead.org; Wed, 29 Nov 2017 20:44:35 +0000
Received: by mail-io0-x243.google.com with SMTP id d21so5126407ioe.7
 for <linux-mtd@lists.infradead.org>; Wed, 29 Nov 2017 12:44:16 -0800 (PST)
From: Eric Biggers <ebiggers3@gmail.com>
To: linux-mtd@lists.infradead.org,
	Richard Weinberger <richard@nod.at>
Cc: linux-fscrypt@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Eric Biggers <ebiggers@google.com>
Subject: [PATCH v2 1/5] ubifs: switch to fscrypt_file_open()
Date: Wed, 29 Nov 2017 12:43:13 -0800
Message-Id: <20171129204317.91205-2-ebiggers3@gmail.com>
In-Reply-To: <20171129204317.91205-1-ebiggers3@gmail.com>
References: <20171129204317.91205-1-ebiggers3@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Eric Biggers <ebiggers@google.com>

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ubifs/file.c | 31 +------------------------------
 1 file changed, 1 insertion(+), 30 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index a02aa59d1e24..31dc632a52fc 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1629,35 +1629,6 @@ static int ubifs_file_mmap(struct file *file, struct vm_area_struct *vma)
 	return 0;
 }
 
-static int ubifs_file_open(struct inode *inode, struct file *filp)
-{
-	int ret;
-	struct dentry *dir;
-	struct ubifs_info *c = inode->i_sb->s_fs_info;
-
-	if (ubifs_crypt_is_encrypted(inode)) {
-		ret = fscrypt_get_encryption_info(inode);
-		if (ret)
-			return -EACCES;
-		if (!fscrypt_has_encryption_key(inode))
-			return -ENOKEY;
-	}
-
-	dir = dget_parent(file_dentry(filp));
-	if (ubifs_crypt_is_encrypted(d_inode(dir)) &&
-			!fscrypt_has_permitted_context(d_inode(dir), inode)) {
-		ubifs_err(c, "Inconsistent encryption contexts: %lu/%lu",
-			  (unsigned long) d_inode(dir)->i_ino,
-			  (unsigned long) inode->i_ino);
-		dput(dir);
-		ubifs_ro_mode(c, -EPERM);
-		return -EPERM;
-	}
-	dput(dir);
-
-	return 0;
-}
-
 static const char *ubifs_get_link(struct dentry *dentry,
 					    struct inode *inode,
 					    struct delayed_call *done)
@@ -1746,7 +1717,7 @@ const struct file_operations ubifs_file_operations = {
 	.unlocked_ioctl = ubifs_ioctl,
 	.splice_read	= generic_file_splice_read,
 	.splice_write	= iter_file_splice_write,
-	.open		= ubifs_file_open,
+	.open		= fscrypt_file_open,
 #ifdef CONFIG_COMPAT
 	.compat_ioctl   = ubifs_compat_ioctl,
 #endif
-- 
2.15.0.531.g2ccb3012c9-goog
