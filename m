Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d2lon-0001SP-2C
 for linux-mtd@lists.infradead.org; Mon, 24 Apr 2017 21:46:51 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 david@sigma-star.at,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH] ubifs: Return -ENOKEY from rename if encryption keys are
 missing
Date: Mon, 24 Apr 2017 23:46:21 +0200
Message-Id: <1493070381-20075-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>

If either source or destination directory is encrypted and the
encryption key is unknown, make sure we return -ENOKEY instead
of -EPERM, similar to how this case is handled in ext4.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Signed-off-by: Richard Weinberger <richard@nod.at>

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index ff77a0aa2f2b..c342f23581d2 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -1340,6 +1340,12 @@ static int do_rename(struct inode *old_dir, struct dentry *old_dentry,
 	if (unlink)
 		ubifs_assert(inode_is_locked(new_inode));
 
+	if ((ubifs_crypt_is_encrypted(old_dir) &&
+	     !fscrypt_has_encryption_key(old_dir)) ||
+	    (ubifs_crypt_is_encrypted(new_dir) &&
+	     !fscrypt_has_encryption_key(new_dir)))
+		return -ENOKEY;
+
 	if (old_dir != new_dir) {
 		if (ubifs_crypt_is_encrypted(new_dir) &&
 		    !fscrypt_has_permitted_context(new_dir, old_inode))
@@ -1564,6 +1570,12 @@ static int ubifs_xrename(struct inode *old_dir, struct dentry *old_dentry,
 
 	ubifs_assert(fst_inode && snd_inode);
 
+	if ((ubifs_crypt_is_encrypted(old_dir) &&
+	     !fscrypt_has_encryption_key(old_dir)) ||
+	    (ubifs_crypt_is_encrypted(new_dir) &&
+	     !fscrypt_has_encryption_key(new_dir)))
+		return -ENOKEY;
+
 	if ((ubifs_crypt_is_encrypted(old_dir) ||
 	    ubifs_crypt_is_encrypted(new_dir)) &&
 	    (old_dir != new_dir) &&
-- 
2.7.3
