Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aAwBS-0001xO-C0
 for linux-mtd@lists.infradead.org; Mon, 21 Dec 2015 08:51:13 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <computersforpeace@gmail.com>, <richard@nod.at>, <david@sigma-star.at>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH 36/38] ubifs: Add more key helper functions
Date: Mon, 21 Dec 2015 16:41:59 +0800
Message-ID: <1450687321-12381-37-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1450687321-12381-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1450687321-12381-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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

From: David Gstir <david@sigma-star.at>

Signed-off-by: David Gstir <david@sigma-star.at>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 ubifs-utils/include/key.h | 78 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/ubifs-utils/include/key.h b/ubifs-utils/include/key.h
index ebcf79c..3210cf2 100644
--- a/ubifs-utils/include/key.h
+++ b/ubifs-utils/include/key.h
@@ -138,6 +138,17 @@ static inline void xent_key_init(const struct ubifs_info *c,
 }
 
 /**
+ * lowest_dent_key - get the lowest possible directory entry key.
+ * @key: where to store the lowest key
+ * @inum: parent inode number
+ */
+static inline void lowest_dent_key(union ubifs_key *key, ino_t inum)
+{
+	key->u32[0] = inum;
+	key->u32[1] = UBIFS_DENT_KEY << UBIFS_S_KEY_HASH_BITS;
+}
+
+/**
  * data_key_init - initialize data key.
  * @c: UBIFS file-system description object
  * @key: key to initialize
@@ -182,6 +193,17 @@ static inline void key_write_idx(const union ubifs_key *from, void *to)
 }
 
 /**
+ * key_copy - copy a key.
+ * @c: UBIFS file-system description object
+ * @from: the key to copy from
+ * @to: the key to copy to
+ */
+static inline void key_copy(const union ubifs_key *from, union ubifs_key *to)
+{
+	to->u64[0] = from->u64[0];
+}
+
+/**
  * keys_cmp - compare keys.
  * @c: UBIFS file-system description object
  * @key1: the first key to compare
@@ -219,6 +241,22 @@ static inline void key_read(const void *from, union ubifs_key *to)
 }
 
 /**
+ * trun_key_init - initialize truncation node key.
+ * @c: UBIFS file-system description object
+ * @key: key to initialize
+ * @inum: inode number
+ *
+ * Note, UBIFS does not have truncation keys on the media and this function is
+ * only used for purposes of replay.
+ */
+static inline void trun_key_init(const struct ubifs_info *c __attribute__((unused)),
+				 union ubifs_key *key, ino_t inum)
+{
+	key->u32[0] = inum;
+	key->u32[1] = UBIFS_TRUN_KEY << UBIFS_S_KEY_BLOCK_BITS;
+}
+
+/**
  * invalid_key_init - initialize invalid node key.
  * @key: key to initialize
  *
@@ -238,6 +276,18 @@ static inline int key_type(const union ubifs_key *key)
 	return key->u32[1] >> UBIFS_S_KEY_BLOCK_BITS;
 }
 
+/**
+ * key_type_flash - get type of a on-flash formatted key.
+ * @c: UBIFS file-system description object
+ * @k: key to get type of
+ */
+static inline int key_type_flash(const void *k)
+{
+	const union ubifs_key *key = k;
+
+	return le32_to_cpu(key->j32[1]) >> UBIFS_S_KEY_BLOCK_BITS;
+}
+
 /*
  * key_hash - get directory entry hash.
  * @key: the key to get hash from
@@ -266,4 +316,32 @@ static inline unsigned int key_block(const union ubifs_key *key)
 {
 	return key->u32[1] & UBIFS_S_KEY_BLOCK_MASK;
 }
+
+/**
+ * is_hash_key - is a key vulnerable to hash collisions.
+ * @key: key
+ *
+ * This function returns %1 if @key is a hashed key or %0 otherwise.
+ */
+static inline int is_hash_key(const union ubifs_key *key)
+{
+	int type = key_type(key);
+
+	return type == UBIFS_DENT_KEY || type == UBIFS_XENT_KEY;
+}
+
+/**
+ * key_max_inode_size - get maximum file size allowed by current key format.
+ * @c: UBIFS file-system description object
+ */
+static inline unsigned long long key_max_inode_size(const struct ubifs_info *c)
+{
+	switch (c->key_fmt) {
+	case UBIFS_SIMPLE_KEY_FMT:
+		return (1ULL << UBIFS_S_KEY_BLOCK_BITS) * UBIFS_BLOCK_SIZE;
+	default:
+		return 0;
+	}
+}
+
 #endif /* !__UBIFS_KEY_H__ */
-- 
1.8.4.2
