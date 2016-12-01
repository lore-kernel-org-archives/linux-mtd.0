Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCYnw-00035S-CR
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 21:22:14 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david@sigma-star.at, tytso@mit.edu, dedekind1@gmail.com,
 ebiggers@google.com, mhalcrow@google.com, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, hch@infradead.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, dengler@linutronix.de,
 sbabic@denx.de, wd@denx.de, Richard Weinberger <richard@nod.at>
Subject: [PATCH 06/24] ubifs: Implement directory open operation
Date: Thu,  1 Dec 2016 22:20:53 +0100
Message-Id: <1480627271-10441-7-git-send-email-richard@nod.at>
In-Reply-To: <1480627271-10441-1-git-send-email-richard@nod.at>
References: <1480627271-10441-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We need the ->open() hook to load the crypto context
which is needed for all crypto operations within that
directory.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/dir.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 2315cb864c39..477817567971 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -1410,6 +1410,14 @@ int ubifs_getattr(struct vfsmount *mnt, struct dentry *dentry,
 	return 0;
 }
 
+static int ubifs_dir_open(struct inode *dir, struct file *file)
+{
+	if (ubifs_crypt_is_encrypted(dir))
+		return fscrypt_get_encryption_info(dir) ? -EACCES : 0;
+
+	return 0;
+}
+
 const struct inode_operations ubifs_dir_inode_operations = {
 	.lookup      = ubifs_lookup,
 	.create      = ubifs_create,
@@ -1436,6 +1444,7 @@ const struct file_operations ubifs_dir_operations = {
 	.iterate_shared = ubifs_readdir,
 	.fsync          = ubifs_fsync,
 	.unlocked_ioctl = ubifs_ioctl,
+	.open		= ubifs_dir_open,
 #ifdef CONFIG_COMPAT
 	.compat_ioctl   = ubifs_compat_ioctl,
 #endif
-- 
2.7.3
