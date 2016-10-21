Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxZGk-0004W5-RJ
 for linux-mtd@lists.infradead.org; Fri, 21 Oct 2016 12:50:03 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, tytso@mit.edu,
 jaegeuk@kernel.org, david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, Richard Weinberger <richard@nod.at>
Subject: [PATCH 08/26] ubifs: Implement directory open operation
Date: Fri, 21 Oct 2016 14:48:23 +0200
Message-Id: <1477054121-10198-9-git-send-email-richard@nod.at>
In-Reply-To: <1477054121-10198-1-git-send-email-richard@nod.at>
References: <1477054121-10198-1-git-send-email-richard@nod.at>
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
index 0e47127352ed..e80de3852c3e 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -1196,6 +1196,14 @@ int ubifs_getattr(struct vfsmount *mnt, struct dentry *dentry,
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
@@ -1224,6 +1232,7 @@ const struct file_operations ubifs_dir_operations = {
 	.iterate_shared = ubifs_readdir,
 	.fsync          = ubifs_fsync,
 	.unlocked_ioctl = ubifs_ioctl,
+	.open		= ubifs_dir_open,
 #ifdef CONFIG_COMPAT
 	.compat_ioctl   = ubifs_compat_ioctl,
 #endif
-- 
2.7.3
