Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Ohejm-0007bC-E4
	for linux-mtd@lists.infradead.org; Sat, 07 Aug 2010 08:26:39 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/7] UBIFS: fix GC sroting
Date: Sat,  7 Aug 2010 11:26:14 +0300
Message-Id: <1281169577-18664-5-git-send-email-dedekind1@gmail.com>
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

Unfortunately, the comparison functions for both data and non-data nodes
('data_nodes_cmp()' and 'nondata_nodes_cmp()') was screwed. It did not
work for the case when 'inuma == inumb' and 'blka > blkb' or 'hasha > hashb'.

Basically, this means that it did not actually sort the list. This is not
fatal, but this means that GC did not optimize the on-flash layout as we
thought it would.

This issue was revealed by commit '835cc0c8477fdbc59e0217891d6f11061b1ac4e2' of
Don Mullis: assertions in the comparison functions started triggering.

This patch fixes the issue. Additionally, it makes the comparison functions
return immediately the elements to compare are actually the same element.
This is just a tiny optimization.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/gc.c |   34 ++++++++++++++--------------------
 1 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index d060c62..fbb9272 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -125,6 +125,9 @@ int data_nodes_cmp(void *priv, struct list_head *a, struct list_head *b)
 	struct ubifs_scan_node *sa, *sb;
 
 	cond_resched();
+	if (a == b)
+		return 0;
+
 	sa = list_entry(a, struct ubifs_scan_node, list);
 	sb = list_entry(b, struct ubifs_scan_node, list);
 	ubifs_assert(key_type(c, &sa->key) == UBIFS_DATA_KEY);
@@ -133,16 +136,10 @@ int data_nodes_cmp(void *priv, struct list_head *a, struct list_head *b)
 	inuma = key_inum(c, &sa->key);
 	inumb = key_inum(c, &sb->key);
 
-	if (inuma == inumb) {
-		unsigned int blka = key_block(c, &sa->key);
-		unsigned int blkb = key_block(c, &sb->key);
-
-		if (blka <= blkb)
-			return -1;
-	} else if (inuma <= inumb)
-		return -1;
-
-	return 1;
+	if (inuma == inumb)
+		return key_block(c, &sa->key) - key_block(c, &sb->key);
+	else
+		return inuma - inumb;
 }
 
 /*
@@ -163,6 +160,9 @@ int nondata_nodes_cmp(void *priv, struct list_head *a, struct list_head *b)
 	struct ubifs_scan_node *sa, *sb;
 
 	cond_resched();
+	if (a == b)
+		return 0;
+
 	sa = list_entry(a, struct ubifs_scan_node, list);
 	sb = list_entry(b, struct ubifs_scan_node, list);
 	typea = key_type(c, &sa->key);
@@ -183,16 +183,10 @@ int nondata_nodes_cmp(void *priv, struct list_head *a, struct list_head *b)
 	inuma = key_inum(c, &sa->key);
 	inumb = key_inum(c, &sb->key);
 
-	if (inuma == inumb) {
-		uint32_t hasha = key_hash(c, &sa->key);
-		uint32_t hashb = key_hash(c, &sb->key);
-
-		if (hasha <= hashb)
-			return -1;
-	} else if (inuma <= inumb)
-		return -1;
-
-	return 1;
+	if (inuma == inumb)
+		return key_hash(c, &sa->key) - key_hash(c, &sb->key);
+	else
+		return inuma - inumb;
 }
 
 /**
-- 
1.7.1.1
