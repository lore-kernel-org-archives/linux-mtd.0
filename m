Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRz0O-0005lY-C1
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 08:45:58 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <dedekind1@gmail.com>, <richard@nod.at>, <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 12/27] ubifs: copy some important functions in key.h from
 kernel to ubifs-utils
Date: Wed, 19 Aug 2015 16:39:17 +0800
Message-ID: <1439973572-12489-13-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1439973572-12489-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1439973572-12489-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We need some more functions in key.h, then copy it from kernel.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 ubifs-utils/include/key.h | 76 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 75 insertions(+), 1 deletion(-)

diff --git a/ubifs-utils/include/key.h b/ubifs-utils/include/key.h
index d3a02d4..779981a 100644
--- a/ubifs-utils/include/key.h
+++ b/ubifs-utils/include/key.h
@@ -37,6 +37,8 @@
 #ifndef __UBIFS_KEY_H__
 #define __UBIFS_KEY_H__
 
+#include "defs.h"
+
 /**
  * key_mask_hash - mask a valid hash value.
  * @val: value to be masked
@@ -107,7 +109,7 @@ static inline void ino_key_init(union ubifs_key *key, ino_t inum)
  * @inum: parent inode number
  * @nm: direntry name and length
  */
-static inline void dent_key_init(const struct ubifs_info *c,
+static inline void dent_key_init(const struct ubifs_info *c __attribute__((unused)),
 				 union ubifs_key *key, ino_t inum,
 				 const struct qstr *nm)
 {
@@ -186,4 +188,76 @@ static inline int keys_cmp(const union ubifs_key *key1,
 	return 0;
 }
 
+/**
+ * key_read - transform a key to in-memory format.
+ * @c: UBIFS file-system description object
+ * @from: the key to transform
+ * @to: the key to store the result
+ */
+static inline void key_read(const struct ubifs_info *c __attribute__((unused)), const void *from,
+			    union ubifs_key *to)
+{
+	const union ubifs_key *f = from;
+
+	to->u32[0] = le32_to_cpu(f->j32[0]);
+	to->u32[1] = le32_to_cpu(f->j32[1]);
+}
+
+/**
+ * invalid_key_init - initialize invalid node key.
+ * @c: UBIFS file-system description object
+ * @key: key to initialize
+ *
+ * This is a helper function which marks a @key object as invalid.
+ */
+static inline void invalid_key_init(const struct ubifs_info *c __attribute__((unused)),
+				    union ubifs_key *key)
+{
+	key->u32[0] = 0xDEADBEAF;
+	key->u32[1] = UBIFS_INVALID_KEY;
+}
+/**
+ * key_type - get key type.
+ * @c: UBIFS file-system description object
+ * @key: key to get type of
+ */
+static inline int key_type(const struct ubifs_info *c __attribute__((unused)),
+			   const union ubifs_key *key)
+{
+	return key->u32[1] >> UBIFS_S_KEY_BLOCK_BITS;
+}
+
+/*
+ * key_hash - get directory entry hash.
+ * @c: UBIFS file-system description object
+ * @key: the key to get hash from
+ */
+static inline uint32_t key_hash(const struct ubifs_info *c __attribute__((unused)),
+				const union ubifs_key *key)
+{
+	return key->u32[1] & UBIFS_S_KEY_HASH_MASK;
+}
+
+/**
+ * key_inum - fetch inode number from key.
+ * @c: UBIFS file-system description object
+ * @k: key to fetch inode number from
+ */
+static inline ino_t key_inum(const struct ubifs_info *c __attribute__((unused)), const void *k)
+{
+	const union ubifs_key *key = k;
+
+	return key->u32[0];
+}
+
+/**
+ * key_block - get data block number.
+ * @c: UBIFS file-system description object
+ * @key: the key to get the block number from
+ */
+static inline unsigned int key_block(const struct ubifs_info *c __attribute__((unused)),
+				     const union ubifs_key *key)
+{
+	return key->u32[1] & UBIFS_S_KEY_BLOCK_MASK;
+}
 #endif /* !__UBIFS_KEY_H__ */
-- 
1.8.4.2
