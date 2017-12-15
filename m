Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePu4e-0008On-No
 for linux-mtd@lists.infradead.org; Fri, 15 Dec 2017 17:47:13 +0000
Received: by mail-pg0-x244.google.com with SMTP id k15so6252014pgr.7
 for <linux-mtd@lists.infradead.org>; Fri, 15 Dec 2017 09:46:44 -0800 (PST)
From: Eric Biggers <ebiggers3@gmail.com>
To: linux-fscrypt@vger.kernel.org
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, Eric Biggers <ebiggers@google.com>
Subject: [PATCH 04/24] fscrypt: move fscrypt_ctx declaration to fscrypt_supp.h
Date: Fri, 15 Dec 2017 09:42:05 -0800
Message-Id: <20171215174225.31583-5-ebiggers3@gmail.com>
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

Filesystems only ever access 'struct fscrypt_ctx' through fscrypt
functions.  But when a filesystem is built without encryption support,
these functions are all stubbed out, so the declaration of fscrypt_ctx
is unneeded.  Therefore, move it from fscrypt.h to fscrypt_supp.h.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 include/linux/fscrypt.h      | 16 +---------------
 include/linux/fscrypt_supp.h | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index c23b2f16129a..0f94d087a6d1 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -24,23 +24,9 @@
 
 #define FS_CRYPTO_BLOCK_SIZE		16
 
+struct fscrypt_ctx;
 struct fscrypt_info;
 
-struct fscrypt_ctx {
-	union {
-		struct {
-			struct page *bounce_page;	/* Ciphertext page */
-			struct page *control_page;	/* Original page  */
-		} w;
-		struct {
-			struct bio *bio;
-			struct work_struct work;
-		} r;
-		struct list_head free_list;	/* Free list */
-	};
-	u8 flags;				/* Flags */
-};
-
 /**
  * For encrypted symlinks, the ciphertext length is stored at the beginning
  * of the string in little-endian format.
diff --git a/include/linux/fscrypt_supp.h b/include/linux/fscrypt_supp.h
index 33d641e27c18..fd6ee089ced0 100644
--- a/include/linux/fscrypt_supp.h
+++ b/include/linux/fscrypt_supp.h
@@ -11,6 +11,21 @@
 #ifndef _LINUX_FSCRYPT_SUPP_H
 #define _LINUX_FSCRYPT_SUPP_H
 
+struct fscrypt_ctx {
+	union {
+		struct {
+			struct page *bounce_page;	/* Ciphertext page */
+			struct page *control_page;	/* Original page  */
+		} w;
+		struct {
+			struct bio *bio;
+			struct work_struct work;
+		} r;
+		struct list_head free_list;	/* Free list */
+	};
+	u8 flags;				/* Flags */
+};
+
 static inline bool fscrypt_has_encryption_key(const struct inode *inode)
 {
 	return (inode->i_crypt_info != NULL);
-- 
2.15.1
