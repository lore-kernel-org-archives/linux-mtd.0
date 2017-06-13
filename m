Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKvYw-0007Ue-8M
 for linux-mtd@lists.infradead.org; Tue, 13 Jun 2017 23:49:32 +0000
Received: by mail-pg0-x241.google.com with SMTP id a70so21076768pge.0
 for <linux-mtd@lists.infradead.org>; Tue, 13 Jun 2017 16:49:09 -0700 (PDT)
From: Eric Biggers <ebiggers3@gmail.com>
To: linux-fscrypt@vger.kernel.org
Cc: Theodore Ts'o <tytso@mit.edu>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, Eric Biggers <ebiggers@google.com>
Subject: [PATCH 3/3] ubifs: require key for truncate(2) of encrypted file
Date: Tue, 13 Jun 2017 16:47:55 -0700
Message-Id: <20170613234755.111167-4-ebiggers3@gmail.com>
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
 fs/ubifs/file.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 2cda3d67e2d0..ee3ff4c6bf4a 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1284,6 +1284,14 @@ int ubifs_setattr(struct dentry *dentry, struct iattr *attr)
 	if (err)
 		return err;
 
+	if (ubifs_crypt_is_encrypted(inode) && (attr->ia_valid & ATTR_SIZE)) {
+		err = fscrypt_get_encryption_info(inode);
+		if (err)
+			return err;
+		if (!fscrypt_has_encryption_key(inode))
+			return -ENOKEY;
+	}
+
 	if ((attr->ia_valid & ATTR_SIZE) && attr->ia_size < inode->i_size)
 		/* Truncation to a smaller size */
 		err = do_truncation(c, inode, attr);
-- 
2.13.1.508.gb3defc5cc-goog
