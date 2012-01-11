Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rl16k-0003iD-Hp
 for linux-mtd@lists.infradead.org; Wed, 11 Jan 2012 16:33:04 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] UBIFS: use snprintf instead of sprintf when printing keys
Date: Wed, 11 Jan 2012 18:35:18 +0200
Message-Id: <1326299718-30697-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1326299718-30697-1-git-send-email-dedekind1@gmail.com>
References: <1326299718-30697-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Switch to 'snprintf()' which is more secure and reliable. This is also a
preparation to the subsequent key printing fixes.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/ubifs/debug.c |   38 ++++++++++++++++++++------------------
 1 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index b09ba2d..6ae9fdc 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -103,8 +103,8 @@ static const char *get_dent_type(int type)
 	}
 }
 
-static void sprintf_key(const struct ubifs_info *c, const union ubifs_key *key,
-			char *buffer)
+static void snprintf_key(const struct ubifs_info *c, const union ubifs_key *key,
+			 char *buffer, int len)
 {
 	char *p = buffer;
 	int type = key_type(c, key);
@@ -112,44 +112,46 @@ static void sprintf_key(const struct ubifs_info *c, const union ubifs_key *key,
 	if (c->key_fmt == UBIFS_SIMPLE_KEY_FMT) {
 		switch (type) {
 		case UBIFS_INO_KEY:
-			sprintf(p, "(%lu, %s)", (unsigned long)key_inum(c, key),
-			       get_key_type(type));
+			len -= snprintf(p, len, "(%lu, %s)",
+					(unsigned long)key_inum(c, key),
+					get_key_type(type));
 			break;
 		case UBIFS_DENT_KEY:
 		case UBIFS_XENT_KEY:
-			sprintf(p, "(%lu, %s, %#08x)",
-				(unsigned long)key_inum(c, key),
-				get_key_type(type), key_hash(c, key));
+			len -= snprintf(p, len, "(%lu, %s, %#08x)",
+					(unsigned long)key_inum(c, key),
+					get_key_type(type), key_hash(c, key));
 			break;
 		case UBIFS_DATA_KEY:
-			sprintf(p, "(%lu, %s, %u)",
-				(unsigned long)key_inum(c, key),
-				get_key_type(type), key_block(c, key));
+			len -= snprintf(p, len, "(%lu, %s, %u)",
+					(unsigned long)key_inum(c, key),
+					get_key_type(type), key_block(c, key));
 			break;
 		case UBIFS_TRUN_KEY:
-			sprintf(p, "(%lu, %s)",
-				(unsigned long)key_inum(c, key),
-				get_key_type(type));
+			len -= snprintf(p, len, "(%lu, %s)",
+					(unsigned long)key_inum(c, key),
+					get_key_type(type));
 			break;
 		default:
-			sprintf(p, "(bad key type: %#08x, %#08x)",
-				key->u32[0], key->u32[1]);
+			len -= snprintf(p, len, "(bad key type: %#08x, %#08x)",
+					key->u32[0], key->u32[1]);
 		}
 	} else
-		sprintf(p, "bad key format %d", c->key_fmt);
+		len -= snprintf(p, len, "bad key format %d", c->key_fmt);
+	ubifs_assert(len > 0);
 }
 
 const char *dbg_key_str0(const struct ubifs_info *c, const union ubifs_key *key)
 {
 	/* dbg_lock must be held */
-	sprintf_key(c, key, dbg_key_buf0);
+	snprintf_key(c, key, dbg_key_buf0, sizeof(dbg_key_buf0) - 1);
 	return dbg_key_buf0;
 }
 
 const char *dbg_key_str1(const struct ubifs_info *c, const union ubifs_key *key)
 {
 	/* dbg_lock must be held */
-	sprintf_key(c, key, dbg_key_buf1);
+	snprintf_key(c, key, dbg_key_buf1, sizeof(dbg_key_buf1) - 1);
 	return dbg_key_buf1;
 }
 
-- 
1.7.6.5
