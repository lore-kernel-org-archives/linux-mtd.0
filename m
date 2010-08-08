Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Oi2dj-0003gW-BH
	for linux-mtd@lists.infradead.org; Sun, 08 Aug 2010 09:58:00 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCHv2 6/9] UBIFS: improve assertion in node comparison functions
Date: Sun,  8 Aug 2010 12:57:29 +0300
Message-Id: <1281261452-9868-7-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1281261452-9868-1-git-send-email-dedekind1@gmail.com>
References: <1281261452-9868-1-git-send-email-dedekind1@gmail.com>
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

Improve assertions in gc.c in the comparison functions for 'list_sort()': check
key types _and_ node types.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/gc.c |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index f2be055..8dbe36f 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -127,8 +127,11 @@ int data_nodes_cmp(void *priv, struct list_head *a, struct list_head *b)
 	cond_resched();
 	sa = list_entry(a, struct ubifs_scan_node, list);
 	sb = list_entry(b, struct ubifs_scan_node, list);
+
 	ubifs_assert(key_type(c, &sa->key) == UBIFS_DATA_KEY);
 	ubifs_assert(key_type(c, &sb->key) == UBIFS_DATA_KEY);
+	ubifs_assert(sa->type == UBIFS_DATA_NODE);
+	ubifs_assert(sb->type == UBIFS_DATA_NODE);
 
 	inuma = key_inum(c, &sa->key);
 	inumb = key_inum(c, &sb->key);
@@ -164,6 +167,9 @@ int nondata_nodes_cmp(void *priv, struct list_head *a, struct list_head *b)
 	cond_resched();
 	sa = list_entry(a, struct ubifs_scan_node, list);
 	sb = list_entry(b, struct ubifs_scan_node, list);
+
+	ubifs_assert(key_type(c, &sa->key) != UBIFS_DATA_KEY &&
+		     key_type(c, &sb->key) != UBIFS_DATA_KEY);
 	ubifs_assert(sa->type != UBIFS_DATA_NODE &&
 		     sb->type != UBIFS_DATA_NODE);
 
@@ -176,10 +182,15 @@ int nondata_nodes_cmp(void *priv, struct list_head *a, struct list_head *b)
 	if (sb->type == UBIFS_INO_NODE)
 		return 1;
 
+	ubifs_assert(key_type(c, &sa->key) == UBIFS_DENT_KEY ||
+		     key_type(c, &sa->key) == UBIFS_XENT_KEY);
+	ubifs_assert(key_type(c, &sb->key) == UBIFS_DENT_KEY ||
+		     key_type(c, &sb->key) == UBIFS_XENT_KEY);
 	ubifs_assert(sa->type == UBIFS_DENT_NODE ||
 		     sa->type == UBIFS_XENT_NODE);
 	ubifs_assert(sb->type == UBIFS_DENT_NODE ||
 		     sb->type == UBIFS_XENT_NODE);
+
 	inuma = key_inum(c, &sa->key);
 	inumb = key_inum(c, &sb->key);
 
-- 
1.7.1.1
