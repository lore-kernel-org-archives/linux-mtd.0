Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZsU9e-0001KR-Vr
 for linux-mtd@lists.infradead.org; Sat, 31 Oct 2015 11:17:06 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david@sigma-star.at, yangds.fnst@cn.fujitsu.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH 09/11] ubifs: Add more key helper functions
Date: Sat, 31 Oct 2015 12:15:58 +0100
Message-Id: <1446290160-30696-10-git-send-email-richard@nod.at>
In-Reply-To: <1446290160-30696-1-git-send-email-richard@nod.at>
References: <1446290160-30696-1-git-send-email-richard@nod.at>
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
index 9ee7597..77f840d 100644
--- a/ubifs-utils/include/key.h
+++ b/ubifs-utils/include/key.h
@@ -120,6 +120,17 @@ static inline void dent_key_init(const struct ubifs_info *c __attribute__((unuse
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
@@ -164,6 +175,17 @@ static inline void key_write_idx(const union ubifs_key *from, void *to)
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
@@ -201,6 +223,22 @@ static inline void key_read(const void *from, union ubifs_key *to)
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
@@ -220,6 +258,18 @@ static inline int key_type(const union ubifs_key *key)
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
@@ -248,4 +298,32 @@ static inline unsigned int key_block(const union ubifs_key *key)
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
2.5.0
