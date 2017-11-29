Received: from mail-it0-x243.google.com ([2607:f8b0:4001:c0b::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eK9Dk-0002vH-19
 for linux-mtd@lists.infradead.org; Wed, 29 Nov 2017 20:44:47 +0000
Received: by mail-it0-x243.google.com with SMTP id u62so5652660ita.2
 for <linux-mtd@lists.infradead.org>; Wed, 29 Nov 2017 12:44:19 -0800 (PST)
From: Eric Biggers <ebiggers3@gmail.com>
To: linux-mtd@lists.infradead.org,
	Richard Weinberger <richard@nod.at>
Cc: linux-fscrypt@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Eric Biggers <ebiggers@google.com>
Subject: [PATCH v2 3/5] ubifs: switch to fscrypt_prepare_rename()
Date: Wed, 29 Nov 2017 12:43:15 -0800
Message-Id: <20171129204317.91205-4-ebiggers3@gmail.com>
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
 fs/ubifs/dir.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 09e6c56b11bc..7bf847d79b4a 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -1353,12 +1353,6 @@ static int do_rename(struct inode *old_dir, struct dentry *old_dentry,
 	if (unlink)
 		ubifs_assert(inode_is_locked(new_inode));
 
-	if (old_dir != new_dir) {
-		if (ubifs_crypt_is_encrypted(new_dir) &&
-		    !fscrypt_has_permitted_context(new_dir, old_inode))
-			return -EPERM;
-	}
-
 	if (unlink && is_dir) {
 		err = ubifs_check_dir_empty(new_inode);
 		if (err)
@@ -1573,13 +1567,6 @@ static int ubifs_xrename(struct inode *old_dir, struct dentry *old_dentry,
 
 	ubifs_assert(fst_inode && snd_inode);
 
-	if ((ubifs_crypt_is_encrypted(old_dir) ||
-	    ubifs_crypt_is_encrypted(new_dir)) &&
-	    (old_dir != new_dir) &&
-	    (!fscrypt_has_permitted_context(new_dir, fst_inode) ||
-	     !fscrypt_has_permitted_context(old_dir, snd_inode)))
-		return -EPERM;
-
 	err = fscrypt_setup_filename(old_dir, &old_dentry->d_name, 0, &fst_nm);
 	if (err)
 		return err;
@@ -1624,12 +1611,19 @@ static int ubifs_rename(struct inode *old_dir, struct dentry *old_dentry,
 			struct inode *new_dir, struct dentry *new_dentry,
 			unsigned int flags)
 {
+	int err;
+
 	if (flags & ~(RENAME_NOREPLACE | RENAME_WHITEOUT | RENAME_EXCHANGE))
 		return -EINVAL;
 
 	ubifs_assert(inode_is_locked(old_dir));
 	ubifs_assert(inode_is_locked(new_dir));
 
+	err = fscrypt_prepare_rename(old_dir, old_dentry, new_dir, new_dentry,
+				     flags);
+	if (err)
+		return err;
+
 	if (flags & RENAME_EXCHANGE)
 		return ubifs_xrename(old_dir, old_dentry, new_dir, new_dentry);
 
-- 
2.15.0.531.g2ccb3012c9-goog
