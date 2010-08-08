Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Oi2dd-0003L7-Hb
	for linux-mtd@lists.infradead.org; Sun, 08 Aug 2010 09:57:54 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCHv2 4/9] UBIFS: do not look up truncation nodes
Date: Sun,  8 Aug 2010 12:57:27 +0300
Message-Id: <1281261452-9868-5-git-send-email-dedekind1@gmail.com>
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

When moving nodes in GC, do not try to look up truncation nodes in TNC,
because they do not exist there. This would be harmless, because the TNC
look-up would fail, if we did not have bug 'ubifs_add_snod()' which reads
garbage into 'snod->key'. But in any case, it is less error prone to
explicitly ignore everything but inode, data, dentry and xentry nodes.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/gc.c |   23 ++++++++++++++++++++---
 1 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index d060c62..fd944fe 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -233,9 +233,26 @@ static int sort_nodes(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 	list_for_each_entry_safe(snod, tmp, &sleb->nodes, list) {
 		int err;
 
-		ubifs_assert(snod->type != UBIFS_IDX_NODE);
-		ubifs_assert(snod->type != UBIFS_REF_NODE);
-		ubifs_assert(snod->type != UBIFS_CS_NODE);
+		ubifs_assert(snod->type == UBIFS_INO_NODE  ||
+			     snod->type == UBIFS_DATA_NODE ||
+			     snod->type == UBIFS_DENT_NODE ||
+			     snod->type == UBIFS_XENT_NODE ||
+			     snod->type == UBIFS_TRUN_NODE);
+
+		if (snod->type != UBIFS_INO_NODE  &&
+		    snod->type != UBIFS_DATA_NODE &&
+		    snod->type != UBIFS_DENT_NODE &&
+		    snod->type != UBIFS_XENT_NODE) {
+			/* Probably truncation node, zap it */
+			list_del(&snod->list);
+			kfree(snod);
+			continue;
+		}
+
+		ubifs_assert(key_type(c, &snod->key) == UBIFS_DATA_KEY ||
+			     key_type(c, &snod->key) == UBIFS_INO_KEY  ||
+			     key_type(c, &snod->key) == UBIFS_DENT_KEY ||
+			     key_type(c, &snod->key) == UBIFS_XENT_KEY);
 
 		err = ubifs_tnc_has_node(c, &snod->key, 0, sleb->lnum,
 					 snod->offs, 0);
-- 
1.7.1.1
