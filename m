Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fyG2h-0002Fb-7v
 for linux-mtd@lists.infradead.org; Fri, 07 Sep 2018 12:39:20 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: David Gstir <david@sigma-star.at>, Richard Weinberger <richard@nod.at>,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 16/25] ubifs: Add auth nodes to garbage collector journal head
Date: Fri,  7 Sep 2018 14:36:37 +0200
Message-Id: <20180907123646.12688-17-s.hauer@pengutronix.de>
In-Reply-To: <20180907123646.12688-1-s.hauer@pengutronix.de>
References: <20180907123646.12688-1-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To be able to authenticate the garbage collector journal head add
authentication nodes to the buds the garbage collector creates.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/ubifs/gc.c | 46 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index 399d764f83cb..bf75fdc76fc3 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -365,12 +365,13 @@ static int move_nodes(struct ubifs_info *c, struct ubifs_scan_leb *sleb)
 
 	/* Write nodes to their new location. Use the first-fit strategy */
 	while (1) {
-		int avail;
+		int avail, moved = 0;
 		struct ubifs_scan_node *snod, *tmp;
 
 		/* Move data nodes */
 		list_for_each_entry_safe(snod, tmp, &sleb->nodes, list) {
-			avail = c->leb_size - wbuf->offs - wbuf->used;
+			avail = c->leb_size - wbuf->offs - wbuf->used -
+					ubifs_auth_node_sz(c);
 			if  (snod->len > avail)
 				/*
 				 * Do not skip data nodes in order to optimize
@@ -378,14 +379,21 @@ static int move_nodes(struct ubifs_info *c, struct ubifs_scan_leb *sleb)
 				 */
 				break;
 
+			err = ubifs_shash_update(c, c->jheads[GCHD].log_hash,
+						 snod->node, snod->len);
+			if (err)
+				goto out;
+
 			err = move_node(c, sleb, snod, wbuf);
 			if (err)
 				goto out;
+			moved = 1;
 		}
 
 		/* Move non-data nodes */
 		list_for_each_entry_safe(snod, tmp, &nondata, list) {
-			avail = c->leb_size - wbuf->offs - wbuf->used;
+			avail = c->leb_size - wbuf->offs - wbuf->used -
+					ubifs_auth_node_sz(c);
 			if (avail < min)
 				break;
 
@@ -403,9 +411,41 @@ static int move_nodes(struct ubifs_info *c, struct ubifs_scan_leb *sleb)
 				continue;
 			}
 
+			err = ubifs_shash_update(c, c->jheads[GCHD].log_hash,
+						 snod->node, snod->len);
+			if (err)
+				goto out;
+
 			err = move_node(c, sleb, snod, wbuf);
 			if (err)
 				goto out;
+			moved = 1;
+		}
+
+		if (ubifs_authenticated(c) && moved) {
+			struct ubifs_auth_node *auth;
+
+			auth = kmalloc(ubifs_auth_node_sz(c), GFP_NOFS);
+			if (!auth) {
+				err = -ENOMEM;
+				goto out;
+			}
+
+			err = ubifs_prepare_auth_node(c, auth,
+						c->jheads[GCHD].log_hash);
+			if (err) {
+				kfree(auth);
+				goto out;
+			}
+
+			err = ubifs_wbuf_write_nolock(wbuf, auth,
+						      ubifs_auth_node_sz(c));
+			if (err) {
+				kfree(auth);
+				goto out;
+			}
+
+			ubifs_add_dirt(c, wbuf->lnum, ubifs_auth_node_sz(c));
 		}
 
 		if (list_empty(&sleb->nodes) && list_empty(&nondata))
-- 
2.18.0
