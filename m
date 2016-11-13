Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c62EZ-0004vT-Oh
 for linux-mtd@lists.infradead.org; Sun, 13 Nov 2016 21:22:43 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, tytso@mit.edu,
 jaegeuk@kernel.org, david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, ebiggers@google.com, mhalcrow@google.com,
 hch@infradead.org, Richard Weinberger <richard@nod.at>
Subject: [PATCH 12/29] ubifs: Implement file open operation
Date: Sun, 13 Nov 2016 22:20:55 +0100
Message-Id: <1479072072-6844-13-git-send-email-richard@nod.at>
In-Reply-To: <1479072072-6844-1-git-send-email-richard@nod.at>
References: <1479072072-6844-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We need ->open() for files to load the crypto key.
If the no key is present and the file is encrypted,
refuse to open.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/file.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index b4fbeefba246..a9c5cc6c0bc5 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1605,6 +1605,35 @@ static int ubifs_file_mmap(struct file *file, struct vm_area_struct *vma)
 	return 0;
 }
 
+static int ubifs_file_open(struct inode *inode, struct file *filp)
+{
+	int ret;
+	struct dentry *dir;
+	struct ubifs_info *c = inode->i_sb->s_fs_info;
+
+	if (ubifs_crypt_is_encrypted(inode)) {
+		ret = fscrypt_get_encryption_info(inode);
+		if (ret)
+			return -EACCES;
+		if (!fscrypt_has_encryption_key(inode))
+			return -ENOKEY;
+	}
+
+	dir = dget_parent(file_dentry(filp));
+	if (ubifs_crypt_is_encrypted(d_inode(dir)) &&
+			!fscrypt_has_permitted_context(d_inode(dir), inode)) {
+		ubifs_err(c, "Inconsistent encryption contexts: %lu/%lu",
+			  (unsigned long) d_inode(dir)->i_ino,
+			  (unsigned long) inode->i_ino);
+		dput(dir);
+		ubifs_ro_mode(c, -EPERM);
+		return -EPERM;
+	}
+	dput(dir);
+
+	return 0;
+}
+
 const struct address_space_operations ubifs_file_address_operations = {
 	.readpage       = ubifs_readpage,
 	.writepage      = ubifs_writepage,
@@ -1647,6 +1676,7 @@ const struct file_operations ubifs_file_operations = {
 	.unlocked_ioctl = ubifs_ioctl,
 	.splice_read	= generic_file_splice_read,
 	.splice_write	= iter_file_splice_write,
+	.open		= ubifs_file_open,
 #ifdef CONFIG_COMPAT
 	.compat_ioctl   = ubifs_compat_ioctl,
 #endif
-- 
2.7.3
