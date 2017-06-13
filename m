Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKvYv-0007UO-3h
 for linux-mtd@lists.infradead.org; Tue, 13 Jun 2017 23:49:30 +0000
Received: by mail-pf0-x241.google.com with SMTP id s66so9331565pfs.2
 for <linux-mtd@lists.infradead.org>; Tue, 13 Jun 2017 16:49:08 -0700 (PDT)
From: Eric Biggers <ebiggers3@gmail.com>
To: linux-fscrypt@vger.kernel.org
Cc: Theodore Ts'o <tytso@mit.edu>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, Eric Biggers <ebiggers@google.com>
Subject: [PATCH 2/3] f2fs: require key for truncate(2) of encrypted file
Date: Tue, 13 Jun 2017 16:47:54 -0700
Message-Id: <20170613234755.111167-3-ebiggers3@gmail.com>
In-Reply-To: <20170613234755.111167-1-ebiggers3@gmail.com>
References: <20170613234755.111167-1-ebiggers3@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Eric Biggers <ebiggers@google.com>

Currently, filesystems allow truncate(2) on an encrypted file without
the encryption key.  However, it's impossible to correctly handle the
case where the size being truncated to is not a multiple of the
filesystem block size, because that would require decrypting the final
block, zeroing the part beyond i_size, then encrypting the block.

As other modifications to encrypted file contents are prohibited without
the key, just prohibit truncate(2) as well, making it fail with ENOKEY.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/file.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 61af721329fa..be0b32bd1297 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -682,9 +682,13 @@ int f2fs_setattr(struct dentry *dentry, struct iattr *attr)
 		return err;
 
 	if (attr->ia_valid & ATTR_SIZE) {
-		if (f2fs_encrypted_inode(inode) &&
-				fscrypt_get_encryption_info(inode))
-			return -EACCES;
+		if (f2fs_encrypted_inode(inode)) {
+			err = fscrypt_get_encryption_info(inode);
+			if (err)
+				return err;
+			if (!fscrypt_has_encryption_key(inode))
+				return -ENOKEY;
+		}
 
 		if (attr->ia_size <= i_size_read(inode)) {
 			truncate_setsize(inode, attr->ia_size);
-- 
2.13.1.508.gb3defc5cc-goog
