Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cJ3Q1-0004De-Fk
 for linux-mtd@lists.infradead.org; Mon, 19 Dec 2016 19:16:18 +0000
Received: by mail-pf0-x243.google.com with SMTP id c4so7891692pfb.3
 for <linux-mtd@lists.infradead.org>; Mon, 19 Dec 2016 11:15:56 -0800 (PST)
From: Eric Biggers <ebiggers3@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-fsdevel@vger.kernel.org,
 Eric Biggers <ebiggers@google.com>
Subject: [PATCH] ubifs: remove redundant checks for encryption key
Date: Mon, 19 Dec 2016 11:15:48 -0800
Message-Id: <1482174948-104602-1-git-send-email-ebiggers3@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Eric Biggers <ebiggers@google.com>

In several places, ubifs checked for an encryption key before creating a
file in an encrypted directory.  This was redundant with
fscrypt_setup_filename() or ubifs_new_inode(), and in the case of
ubifs_link() it broke linking to special files.  So remove the extra
checks.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ubifs/dir.c | 58 +++-------------------------------------------------------
 1 file changed, 3 insertions(+), 55 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 9de9eaa..d346f1e 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -400,16 +400,6 @@ static int do_tmpfile(struct inode *dir, struct dentry *dentry,
 	dbg_gen("dent '%pd', mode %#hx in dir ino %lu",
 		dentry, mode, dir->i_ino);
 
-	if (ubifs_crypt_is_encrypted(dir)) {
-		err = fscrypt_get_encryption_info(dir);
-		if (err)
-			return err;
-
-		if (!fscrypt_has_encryption_key(dir)) {
-			return -EPERM;
-		}
-	}
-
 	err = fscrypt_setup_filename(dir, &dentry->d_name, 0, &nm);
 	if (err)
 		return err;
@@ -751,17 +741,9 @@ static int ubifs_link(struct dentry *old_dentry, struct inode *dir,
 	ubifs_assert(inode_is_locked(dir));
 	ubifs_assert(inode_is_locked(inode));
 
-	if (ubifs_crypt_is_encrypted(dir)) {
-		if (!fscrypt_has_permitted_context(dir, inode))
-			return -EPERM;
-
-		err = fscrypt_get_encryption_info(inode);
-		if (err)
-			return err;
-
-		if (!fscrypt_has_encryption_key(inode))
-			return -EPERM;
-	}
+	if (ubifs_crypt_is_encrypted(dir) &&
+	    !fscrypt_has_permitted_context(dir, inode))
+		return -EPERM;
 
 	err = fscrypt_setup_filename(dir, &dentry->d_name, 0, &nm);
 	if (err)
@@ -1010,17 +992,6 @@ static int ubifs_mkdir(struct inode *dir, struct dentry *dentry, umode_t mode)
 	if (err)
 		return err;
 
-	if (ubifs_crypt_is_encrypted(dir)) {
-		err = fscrypt_get_encryption_info(dir);
-		if (err)
-			goto out_budg;
-
-		if (!fscrypt_has_encryption_key(dir)) {
-			err = -EPERM;
-			goto out_budg;
-		}
-	}
-
 	err = fscrypt_setup_filename(dir, &dentry->d_name, 0, &nm);
 	if (err)
 		goto out_budg;
@@ -1106,17 +1077,6 @@ static int ubifs_mknod(struct inode *dir, struct dentry *dentry,
 		return err;
 	}
 
-	if (ubifs_crypt_is_encrypted(dir)) {
-		err = fscrypt_get_encryption_info(dir);
-		if (err)
-			goto out_budg;
-
-		if (!fscrypt_has_encryption_key(dir)) {
-			err = -EPERM;
-			goto out_budg;
-		}
-	}
-
 	err = fscrypt_setup_filename(dir, &dentry->d_name, 0, &nm);
 	if (err)
 		goto out_budg;
@@ -1241,18 +1201,6 @@ static int ubifs_symlink(struct inode *dir, struct dentry *dentry,
 			goto out_inode;
 		}
 
-		err = fscrypt_get_encryption_info(inode);
-		if (err) {
-			kfree(sd);
-			goto out_inode;
-		}
-
-		if (!fscrypt_has_encryption_key(inode)) {
-			kfree(sd);
-			err = -EPERM;
-			goto out_inode;
-		}
-
 		ostr.name = sd->encrypted_path;
 		ostr.len = disk_link.len;
 
-- 
2.8.0.rc3.226.g39d4020
