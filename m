Received: from mail-pf0-f195.google.com ([209.85.192.195])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dunmM-00056h-GI
 for linux-mtd@lists.infradead.org; Wed, 20 Sep 2017 22:47:42 +0000
Received: by mail-pf0-f195.google.com with SMTP id i23so1721494pfi.2
 for <linux-mtd@lists.infradead.org>; Wed, 20 Sep 2017 15:47:17 -0700 (PDT)
From: Eric Biggers <ebiggers3@gmail.com>
To: linux-fscrypt@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Michael Halcrow <mhalcrow@google.com>, Eric Biggers <ebiggers@google.com>
Subject: [PATCH 24/25] ubifs: switch to fscrypt_prepare_lookup()
Date: Wed, 20 Sep 2017 15:46:04 -0700
Message-Id: <20170920224605.22030-25-ebiggers3@gmail.com>
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
 fs/ubifs/dir.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 7bf847d79b4a..a2ea4856e67b 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -220,20 +220,9 @@ static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
 
 	dbg_gen("'%pd' in dir ino %lu", dentry, dir->i_ino);
 
-	if (ubifs_crypt_is_encrypted(dir)) {
-		err = fscrypt_get_encryption_info(dir);
-
-		/*
-		 * DCACHE_ENCRYPTED_WITH_KEY is set if the dentry is
-		 * created while the directory was encrypted and we
-		 * have access to the key.
-		 */
-		if (fscrypt_has_encryption_key(dir))
-			fscrypt_set_encrypted_dentry(dentry);
-		fscrypt_set_d_op(dentry);
-		if (err && err != -ENOKEY)
-			return ERR_PTR(err);
-	}
+	err = fscrypt_prepare_lookup(dir, dentry, flags);
+	if (err)
+		return ERR_PTR(err);
 
 	err = fscrypt_setup_filename(dir, &dentry->d_name, 1, &nm);
 	if (err)
-- 
2.14.1.821.g8fa685d3b7-goog
