Received: from mail-it0-x244.google.com ([2607:f8b0:4001:c0b::244])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eXXh3-0003bK-2z
 for linux-mtd@lists.infradead.org; Fri, 05 Jan 2018 19:30:18 +0000
Received: by mail-it0-x244.google.com with SMTP id 68so2804237ite.4
 for <linux-mtd@lists.infradead.org>; Fri, 05 Jan 2018 11:30:06 -0800 (PST)
From: Eric Biggers <ebiggers3@gmail.com>
To: linux-mtd@lists.infradead.org,
	Richard Weinberger <richard@nod.at>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-fscrypt@vger.kernel.org,
 Eric Biggers <ebiggers@google.com>
Subject: [PATCH v2] ubifs: free the encrypted symlink target
Date: Fri,  5 Jan 2018 11:30:03 -0800
Message-Id: <20180105193003.118283-1-ebiggers3@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Eric Biggers <ebiggers@google.com>

ubifs_symlink() forgot to free the kmalloc()'ed buffer holding the
encrypted symlink target, creating a memory leak.  Fix it.

(UBIFS could actually encrypt directly into ui->data, removing the
temporary buffer, but that is left for the patch that switches to use
the symlink helper functions.)

Fixes: ca7f85be8d6c ("ubifs: Add support for encrypted symlinks")
Cc: <stable@vger.kernel.org> # v4.10+
Signed-off-by: Eric Biggers <ebiggers@google.com>
---

No changes since v1, just resent as standalone patch.
	
 fs/ubifs/dir.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 417fe0b29f23..ef820f803176 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -1216,10 +1216,8 @@ static int ubifs_symlink(struct inode *dir, struct dentry *dentry,
 		ostr.len = disk_link.len;
 
 		err = fscrypt_fname_usr_to_disk(inode, &istr, &ostr);
-		if (err) {
-			kfree(sd);
+		if (err)
 			goto out_inode;
-		}
 
 		sd->len = cpu_to_le16(ostr.len);
 		disk_link.name = (char *)sd;
@@ -1251,11 +1249,10 @@ static int ubifs_symlink(struct inode *dir, struct dentry *dentry,
 		goto out_cancel;
 	mutex_unlock(&dir_ui->ui_mutex);
 
-	ubifs_release_budget(c, &req);
 	insert_inode_hash(inode);
 	d_instantiate(dentry, inode);
-	fscrypt_free_filename(&nm);
-	return 0;
+	err = 0;
+	goto out_fname;
 
 out_cancel:
 	dir->i_size -= sz_change;
@@ -1268,6 +1265,7 @@ static int ubifs_symlink(struct inode *dir, struct dentry *dentry,
 	fscrypt_free_filename(&nm);
 out_budg:
 	ubifs_release_budget(c, &req);
+	kfree(sd);
 	return err;
 }
 
-- 
2.16.0.rc0.223.g4a4ac83678-goog
