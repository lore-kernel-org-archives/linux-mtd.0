Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dQAqJ-0006a0-Ro
 for linux-mtd@lists.infradead.org; Wed, 28 Jun 2017 11:09:11 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.sigma-star.at (Postfix) with ESMTP id 21AFB24E001C
 for <linux-mtd@lists.infradead.org>; Wed, 28 Jun 2017 13:08:43 +0200 (CEST)
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH 1/9] Replace defunct ubifs_assert
Date: Wed, 28 Jun 2017 13:08:11 +0200
Message-Id: <20170628110819.30563-2-david.oberhollenzer@sigma-star.at>
In-Reply-To: <20170628110819.30563-1-david.oberhollenzer@sigma-star.at>
References: <20170628110819.30563-1-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The ubifs assert defined in defs.h was only used in three places
inside key.h and defined to never perform any checks at all.

This patch replaces ubifs_assert in mkfs.ubifs with the regular
libc assert macro.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 ubifs-utils/mkfs.ubifs/defs.h | 2 --
 ubifs-utils/mkfs.ubifs/key.h  | 8 +++++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/defs.h b/ubifs-utils/mkfs.ubifs/defs.h
index 1fa3316..8db5277 100644
--- a/ubifs-utils/mkfs.ubifs/defs.h
+++ b/ubifs-utils/mkfs.ubifs/defs.h
@@ -31,8 +31,6 @@
 
 #define unlikely(x) (x)
 
-#define ubifs_assert(x) ({})
-
 struct qstr
 {
 	char *name;
diff --git a/ubifs-utils/mkfs.ubifs/key.h b/ubifs-utils/mkfs.ubifs/key.h
index 118858b..cd4b849 100644
--- a/ubifs-utils/mkfs.ubifs/key.h
+++ b/ubifs-utils/mkfs.ubifs/key.h
@@ -37,6 +37,8 @@
 #ifndef __UBIFS_KEY_H__
 #define __UBIFS_KEY_H__
 
+#include <assert.h>
+
 /**
  * key_mask_hash - mask a valid hash value.
  * @val: value to be masked
@@ -113,7 +115,7 @@ static inline void dent_key_init(const struct ubifs_info *c,
 {
 	uint32_t hash = c->key_hash(nm->name, nm->len);
 
-	ubifs_assert(!(hash & ~UBIFS_S_KEY_HASH_MASK));
+	assert(!(hash & ~UBIFS_S_KEY_HASH_MASK));
 	key->u32[0] = inum;
 	key->u32[1] = hash | (UBIFS_DENT_KEY << UBIFS_S_KEY_HASH_BITS);
 }
@@ -131,7 +133,7 @@ static inline void xent_key_init(const struct ubifs_info *c,
 {
 	uint32_t hash = c->key_hash(nm->name, nm->len);
 
-	ubifs_assert(!(hash & ~UBIFS_S_KEY_HASH_MASK));
+	assert(!(hash & ~UBIFS_S_KEY_HASH_MASK));
 	key->u32[0] = inum;
 	key->u32[1] = hash | (UBIFS_XENT_KEY << UBIFS_S_KEY_HASH_BITS);
 }
@@ -146,7 +148,7 @@ static inline void xent_key_init(const struct ubifs_info *c,
 static inline void data_key_init(union ubifs_key *key, ino_t inum,
 				 unsigned int block)
 {
-	ubifs_assert(!(block & ~UBIFS_S_KEY_BLOCK_MASK));
+	assert(!(block & ~UBIFS_S_KEY_BLOCK_MASK));
 	key->u32[0] = inum;
 	key->u32[1] = block | (UBIFS_DATA_KEY << UBIFS_S_KEY_BLOCK_BITS);
 }
-- 
2.12.3
