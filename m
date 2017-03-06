Received: from nbd.name ([2a01:4f8:131:30e2::2])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ckoZW-0005AZ-9Q
 for linux-mtd@lists.infradead.org; Mon, 06 Mar 2017 09:04:52 +0000
From: Felix Fietkau <nbd@nbd.name>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>
Subject: [PATCH] ubifs: fix RENAME_WHITEOUT support
Date: Mon,  6 Mar 2017 10:04:25 +0100
Message-Id: <20170306090425.61855-1-nbd@nbd.name>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove faulty leftover check in do_rename(), apparently introduced in a
merge that combined whiteout support changes with commit f03b8ad8d386
("fs: support RENAME_NOREPLACE for local filesystems")

Fixes: 9e0a1fff8db5 ("ubifs: Implement RENAME_WHITEOUT")
Cc: stable@vger.kernel.org
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 fs/ubifs/dir.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 528369f3e472..f131898b7d2b 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -1316,9 +1316,6 @@ static int do_rename(struct inode *old_dir, struct dentry *old_dentry,
 	unsigned int uninitialized_var(saved_nlink);
 	struct fscrypt_name old_nm, new_nm;
 
-	if (flags & ~RENAME_NOREPLACE)
-		return -EINVAL;
-
 	/*
 	 * Budget request settings: deletion direntry, new direntry, removing
 	 * the old inode, and changing old and new parent directory inodes.
-- 
2.11.0
