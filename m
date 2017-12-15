Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePu4j-0004ko-4d
 for linux-mtd@lists.infradead.org; Fri, 15 Dec 2017 17:47:10 +0000
Received: by mail-pg0-x242.google.com with SMTP id o2so6250569pgc.8
 for <linux-mtd@lists.infradead.org>; Fri, 15 Dec 2017 09:46:48 -0800 (PST)
From: Eric Biggers <ebiggers3@gmail.com>
To: linux-fscrypt@vger.kernel.org
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, Eric Biggers <ebiggers@google.com>
Subject: [PATCH 07/24] fscrypt: move fscrypt_valid_enc_modes() to
 fscrypt_private.h
Date: Fri, 15 Dec 2017 09:42:08 -0800
Message-Id: <20171215174225.31583-8-ebiggers3@gmail.com>
In-Reply-To: <20171215174225.31583-1-ebiggers3@gmail.com>
References: <20171215174225.31583-1-ebiggers3@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Eric Biggers <ebiggers@google.com>

The encryption modes are validated by fs/crypto/, not by individual
filesystems.  Therefore, move fscrypt_valid_enc_modes() from fscrypt.h
to fscrypt_private.h.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/fscrypt_private.h | 14 ++++++++++++++
 include/linux/fscrypt.h     | 14 --------------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index 823c43a00bf7..2b848e7c92f0 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -71,6 +71,20 @@ typedef enum {
 #define FS_CTX_REQUIRES_FREE_ENCRYPT_FL		0x00000001
 #define FS_CTX_HAS_BOUNCE_BUFFER_FL		0x00000002
 
+static inline bool fscrypt_valid_enc_modes(u32 contents_mode,
+					   u32 filenames_mode)
+{
+	if (contents_mode == FS_ENCRYPTION_MODE_AES_128_CBC &&
+	    filenames_mode == FS_ENCRYPTION_MODE_AES_128_CTS)
+		return true;
+
+	if (contents_mode == FS_ENCRYPTION_MODE_AES_256_XTS &&
+	    filenames_mode == FS_ENCRYPTION_MODE_AES_256_CTS)
+		return true;
+
+	return false;
+}
+
 /* crypto.c */
 extern struct kmem_cache *fscrypt_info_cachep;
 extern int fscrypt_initialize(unsigned int cop_flags);
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 33b95a91f720..2e4dce0365cf 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -57,20 +57,6 @@ struct fscrypt_name {
 /* Maximum value for the third parameter of fscrypt_operations.set_context(). */
 #define FSCRYPT_SET_CONTEXT_MAX_SIZE	28
 
-static inline bool fscrypt_valid_enc_modes(u32 contents_mode,
-					u32 filenames_mode)
-{
-	if (contents_mode == FS_ENCRYPTION_MODE_AES_128_CBC &&
-	    filenames_mode == FS_ENCRYPTION_MODE_AES_128_CTS)
-		return true;
-
-	if (contents_mode == FS_ENCRYPTION_MODE_AES_256_XTS &&
-	    filenames_mode == FS_ENCRYPTION_MODE_AES_256_CTS)
-		return true;
-
-	return false;
-}
-
 static inline bool fscrypt_is_dot_dotdot(const struct qstr *str)
 {
 	if (str->len == 1 && str->name[0] == '.')
-- 
2.15.1
