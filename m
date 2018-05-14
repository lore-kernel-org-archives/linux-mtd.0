Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fI8h9-0002C5-8g
 for linux-mtd@lists.infradead.org; Mon, 14 May 2018 08:19:19 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 1/6] ubifs: remove set but never used variable
Date: Mon, 14 May 2018 10:18:14 +0200
Message-Id: <20180514081819.20921-2-s.hauer@pengutronix.de>
In-Reply-To: <20180514081819.20921-1-s.hauer@pengutronix.de>
References: <20180514081819.20921-1-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

replay_sqnum is set but never used. Remove it.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/ubifs/replay.c | 3 ---
 fs/ubifs/ubifs.h  | 2 --
 2 files changed, 5 deletions(-)

diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index ae5c02f22f3e..f10a72a75ed7 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -223,9 +223,6 @@ static int apply_replay_entry(struct ubifs_info *c, struct replay_entry *r)
 	dbg_mntk(&r->key, "LEB %d:%d len %d deletion %d sqnum %llu key ",
 		 r->lnum, r->offs, r->len, r->deletion, r->sqnum);
 
-	/* Set c->replay_sqnum to help deal with dangling branches. */
-	c->replay_sqnum = r->sqnum;
-
 	if (is_hash_key(c, &r->key)) {
 		if (r->deletion)
 			err = ubifs_tnc_remove_nm(c, &r->key, &r->nm);
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 5ee7af879cc4..209d6369ae71 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1206,7 +1206,6 @@ struct ubifs_debug_info;
  * @replay_list: temporary list used during journal replay
  * @replay_buds: list of buds to replay
  * @cs_sqnum: sequence number of first node in the log (commit start node)
- * @replay_sqnum: sequence number of node currently being replayed
  * @unclean_leb_list: LEBs to recover when re-mounting R/O mounted FS to R/W
  *                    mode
  * @rcvrd_mst_node: recovered master node to write when re-mounting R/O mounted
@@ -1438,7 +1437,6 @@ struct ubifs_info {
 	struct list_head replay_list;
 	struct list_head replay_buds;
 	unsigned long long cs_sqnum;
-	unsigned long long replay_sqnum;
 	struct list_head unclean_leb_list;
 	struct ubifs_mst_node *rcvrd_mst_node;
 	struct rb_root size_tree;
-- 
2.17.0
