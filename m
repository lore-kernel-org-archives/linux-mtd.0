Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Ohejo-0007ct-LA
	for linux-mtd@lists.infradead.org; Sat, 07 Aug 2010 08:26:41 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 6/7] UBIFS: do not use key type in list_sort compariosn fuction
Date: Sat,  7 Aug 2010 11:26:16 +0300
Message-Id: <1281169577-18664-7-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1281169577-18664-1-git-send-email-dedekind1@gmail.com>
References: <1281169577-18664-1-git-send-email-dedekind1@gmail.com>
Cc: Matthieu CASTET <matthieu.castet@parrot.com>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Simplify the 'nondata_nodes_cmp()' a bit by using the
'struct ubifs_scan_node->type' field, instead of the key type.

And while on it, add more 'ubifs_assert()' statements to the 'list_sort()'
comparison function in gc.c.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/gc.c |   29 ++++++++++++++++++++---------
 1 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index f68e58d..0bc6565 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -130,8 +130,11 @@ int data_nodes_cmp(void *priv, struct list_head *a, struct list_head *b)
 
 	sa = list_entry(a, struct ubifs_scan_node, list);
 	sb = list_entry(b, struct ubifs_scan_node, list);
+
 	ubifs_assert(key_type(c, &sa->key) == UBIFS_DATA_KEY);
 	ubifs_assert(key_type(c, &sb->key) == UBIFS_DATA_KEY);
+	ubifs_assert(sa->type == UBIFS_DATA_NODE);
+	ubifs_assert(sb->type == UBIFS_DATA_NODE);
 
 	inuma = key_inum(c, &sa->key);
 	inumb = key_inum(c, &sb->key);
@@ -154,7 +157,6 @@ int data_nodes_cmp(void *priv, struct list_head *a, struct list_head *b)
  */
 int nondata_nodes_cmp(void *priv, struct list_head *a, struct list_head *b)
 {
-	int typea, typeb;
 	ino_t inuma, inumb;
 	struct ubifs_info *c = priv;
 	struct ubifs_scan_node *sa, *sb;
@@ -165,21 +167,30 @@ int nondata_nodes_cmp(void *priv, struct list_head *a, struct list_head *b)
 
 	sa = list_entry(a, struct ubifs_scan_node, list);
 	sb = list_entry(b, struct ubifs_scan_node, list);
-	typea = key_type(c, &sa->key);
-	typeb = key_type(c, &sb->key);
-	ubifs_assert(typea != UBIFS_DATA_KEY && typeb != UBIFS_DATA_KEY);
+
+	ubifs_assert(key_type(c, &sa->key) != UBIFS_DATA_KEY &&
+		     key_type(c, &sb->key) != UBIFS_DATA_KEY);
+	ubifs_assert(sa->type != UBIFS_DATA_NODE &&
+		     sb->type != UBIFS_DATA_NODE);
 
 	/* Inodes go before directory entries */
-	if (typea == UBIFS_INO_KEY) {
-		if (typeb == UBIFS_INO_KEY)
+	if (sa->type == UBIFS_INO_NODE) {
+		if (sb->type == UBIFS_INO_NODE)
 			return sb->len - sa->len;
 		return -1;
 	}
-	if (typeb == UBIFS_INO_KEY)
+	if (sb->type == UBIFS_INO_NODE)
 		return 1;
 
-	ubifs_assert(typea == UBIFS_DENT_KEY || typea == UBIFS_XENT_KEY);
-	ubifs_assert(typeb == UBIFS_DENT_KEY || typeb == UBIFS_XENT_KEY);
+	ubifs_assert(key_type(c, &sa->key) == UBIFS_DENT_KEY ||
+		     key_type(c, &sa->key) == UBIFS_XENT_KEY);
+	ubifs_assert(key_type(c, &sb->key) == UBIFS_DENT_KEY ||
+		     key_type(c, &sb->key) == UBIFS_XENT_KEY);
+	ubifs_assert(sa->type == UBIFS_DENT_NODE ||
+		     sa->type == UBIFS_XENT_NODE);
+	ubifs_assert(sb->type == UBIFS_DENT_NODE ||
+		     sb->type == UBIFS_XENT_NODE);
+
 	inuma = key_inum(c, &sa->key);
 	inumb = key_inum(c, &sb->key);
 
-- 
1.7.1.1
