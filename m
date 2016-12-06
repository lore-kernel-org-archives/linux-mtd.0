Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEOer-0000XN-Os
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2016 22:56:24 +0000
From: David Gstir <david@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: tytso@mit.edu, dedekind1@gmail.com, ebiggers@google.com,
 mhalcrow@google.com, adrian.hunter@intel.com, linux-kernel@vger.kernel.org,
 hch@infradead.org, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 dengler@linutronix.de, sbabic@denx.de, wd@denx.de, richard@nod.at,
 David Gstir <david@sigma-star.at>
Subject: [PATCH v2 5/6] fscrypt: Delay bounce page pool allocation until needed
Date: Tue,  6 Dec 2016 23:53:57 +0100
Message-Id: <20161206225358.12126-6-david@sigma-star.at>
In-Reply-To: <20161206225358.12126-1-david@sigma-star.at>
References: <20161206225358.12126-1-david@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since fscrypt users can now indicated if fscrypt_encrypt_page() should
use a bounce page, we can delay the bounce page pool initialization util
it is really needed. That is until fscrypt_operations has no
FS_CFLG_OWN_PAGES flag set.

Signed-off-by: David Gstir <david@sigma-star.at>
---
 fs/crypto/crypto.c       | 9 +++++++--
 fs/crypto/keyinfo.c      | 2 +-
 include/linux/fscrypto.h | 2 +-
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index 6f5c3a8df70b..c1e4316045e9 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -525,17 +525,22 @@ static void fscrypt_destroy(void)
 
 /**
  * fscrypt_initialize() - allocate major buffers for fs encryption.
+ * @cop_flags:  fscrypt operations flags
  *
  * We only call this when we start accessing encrypted files, since it
  * results in memory getting allocated that wouldn't otherwise be used.
  *
  * Return: Zero on success, non-zero otherwise.
  */
-int fscrypt_initialize(void)
+int fscrypt_initialize(unsigned int cop_flags)
 {
 	int i, res = -ENOMEM;
 
-	if (fscrypt_bounce_page_pool)
+	/*
+	 * No need to allocate a bounce page pool if there already is one or
+	 * this FS won't use it.
+	 */
+	if (cop_flags & FS_CFLG_OWN_PAGES || fscrypt_bounce_page_pool)
 		return 0;
 
 	mutex_lock(&fscrypt_init_mutex);
diff --git a/fs/crypto/keyinfo.c b/fs/crypto/keyinfo.c
index 67fb6d8876d0..5951f4ebf2a9 100644
--- a/fs/crypto/keyinfo.c
+++ b/fs/crypto/keyinfo.c
@@ -188,7 +188,7 @@ int get_crypt_info(struct inode *inode)
 	u8 *raw_key = NULL;
 	int res;
 
-	res = fscrypt_initialize();
+	res = fscrypt_initialize(inode->i_sb->s_cop->flags);
 	if (res)
 		return res;
 
diff --git a/include/linux/fscrypto.h b/include/linux/fscrypto.h
index 65be74f3afb6..6039c86ff849 100644
--- a/include/linux/fscrypto.h
+++ b/include/linux/fscrypto.h
@@ -244,7 +244,7 @@ static inline void fscrypt_set_d_op(struct dentry *dentry)
 #if IS_ENABLED(CONFIG_FS_ENCRYPTION)
 /* crypto.c */
 extern struct kmem_cache *fscrypt_info_cachep;
-int fscrypt_initialize(void);
+int fscrypt_initialize(unsigned int cop_flags);
 
 extern struct fscrypt_ctx *fscrypt_get_ctx(const struct inode *, gfp_t);
 extern void fscrypt_release_ctx(struct fscrypt_ctx *);
-- 
2.10.1
