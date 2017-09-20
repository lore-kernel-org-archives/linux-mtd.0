Received: from mail-pg0-f67.google.com ([74.125.83.67])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dunmN-000586-HH
 for linux-mtd@lists.infradead.org; Wed, 20 Sep 2017 22:47:46 +0000
Received: by mail-pg0-f67.google.com with SMTP id v5so2365634pgn.4
 for <linux-mtd@lists.infradead.org>; Wed, 20 Sep 2017 15:47:18 -0700 (PDT)
From: Eric Biggers <ebiggers3@gmail.com>
To: linux-fscrypt@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Michael Halcrow <mhalcrow@google.com>, Eric Biggers <ebiggers@google.com>
Subject: [PATCH 25/25] ubifs: switch to fscrypt_prepare_setattr()
Date: Wed, 20 Sep 2017 15:46:05 -0700
Message-Id: <20170920224605.22030-26-ebiggers3@gmail.com>
In-Reply-To: <20170920224605.22030-1-ebiggers3@gmail.com>
References: <20170920224605.22030-1-ebiggers3@gmail.com>
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
 fs/ubifs/file.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 31dc632a52fc..f5578f1bd170 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1284,13 +1284,9 @@ int ubifs_setattr(struct dentry *dentry, struct iattr *attr)
 	if (err)
 		return err;
 
-	if (ubifs_crypt_is_encrypted(inode) && (attr->ia_valid & ATTR_SIZE)) {
-		err = fscrypt_get_encryption_info(inode);
-		if (err)
-			return err;
-		if (!fscrypt_has_encryption_key(inode))
-			return -ENOKEY;
-	}
+	err = fscrypt_prepare_setattr(dentry, attr);
+	if (err)
+		return err;
 
 	if ((attr->ia_valid & ATTR_SIZE) && attr->ia_size < inode->i_size)
 		/* Truncation to a smaller size */
-- 
2.14.1.821.g8fa685d3b7-goog
