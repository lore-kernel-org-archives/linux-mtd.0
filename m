Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCZdv-00080z-7i
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 22:15:52 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david@sigma-star.at, tytso@mit.edu, dedekind1@gmail.com,
 ebiggers@google.com, mhalcrow@google.com, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, hch@infradead.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, dengler@linutronix.de,
 sbabic@denx.de, wd@denx.de, Richard Weinberger <richard@nod.at>
Subject: [PATCH 5/6] fscrypt: Deplay bounce page pool allocation until needed
Date: Thu,  1 Dec 2016 23:14:57 +0100
Message-Id: <1480630498-19201-6-git-send-email-richard@nod.at>
In-Reply-To: <1480630498-19201-1-git-send-email-richard@nod.at>
References: <1480630498-19201-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Gstir <david@sigma-star.at>

Since fscrypt users can now indicated if fscrypt_encrypt_page() should
use a bounce page, we can delay the bounce page pool initialization util
it is really needed. That is until fscrypt_operations has no
FS_CFLG_OWN_PAGES flag set.

Signed-off-by: David Gstir <david@sigma-star.at>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/crypto/crypto.c       | 7 +++++--
 fs/crypto/keyinfo.c      | 2 +-
 include/linux/fscrypto.h | 2 +-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index 2f41eee963e1..d694a3a93eb3 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -521,17 +521,20 @@ static void fscrypt_destroy(void)
 
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
+	/* No need to allocate a bounce page pool if there already is one or
+	 * this FS won't use it. */
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
index 65be74f3afb6..6f5c7e8fbd55 100644
--- a/include/linux/fscrypto.h
+++ b/include/linux/fscrypto.h
@@ -244,7 +244,7 @@ static inline void fscrypt_set_d_op(struct dentry *dentry)
 #if IS_ENABLED(CONFIG_FS_ENCRYPTION)
 /* crypto.c */
 extern struct kmem_cache *fscrypt_info_cachep;
-int fscrypt_initialize(void);
+int fscrypt_initialize(unsigned int);
 
 extern struct fscrypt_ctx *fscrypt_get_ctx(const struct inode *, gfp_t);
 extern void fscrypt_release_ctx(struct fscrypt_ctx *);
-- 
2.7.3
