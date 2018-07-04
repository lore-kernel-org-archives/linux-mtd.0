Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fah72-0004Hq-En
 for linux-mtd@lists.infradead.org; Wed, 04 Jul 2018 12:42:29 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: David Gstir <david@sigma-star.at>, Richard Weinberger <richard@nod.at>,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 06/25] ubifs: drop write_node
Date: Wed,  4 Jul 2018 14:41:18 +0200
Message-Id: <20180704124137.13396-7-s.hauer@pengutronix.de>
In-Reply-To: <20180704124137.13396-1-s.hauer@pengutronix.de>
References: <20180704124137.13396-1-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

write_node() is used only once and can easily be replaced with calls
to ubifs_prepare_node()/write_head() which makes the code a bit shorter.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/ubifs/journal.c | 39 +++++----------------------------------
 1 file changed, 5 insertions(+), 34 deletions(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 07b4956e0425..754d969eb27e 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -228,36 +228,6 @@ static int reserve_space(struct ubifs_info *c, int jhead, int len)
 	return err;
 }
 
-/**
- * write_node - write node to a journal head.
- * @c: UBIFS file-system description object
- * @jhead: journal head
- * @node: node to write
- * @len: node length
- * @lnum: LEB number written is returned here
- * @offs: offset written is returned here
- *
- * This function writes a node to reserved space of journal head @jhead.
- * Returns zero in case of success and a negative error code in case of
- * failure.
- */
-static int write_node(struct ubifs_info *c, int jhead, void *node, int len,
-		      int *lnum, int *offs)
-{
-	struct ubifs_wbuf *wbuf = &c->jheads[jhead].wbuf;
-
-	ubifs_assert(jhead != GCHD);
-
-	*lnum = c->jheads[jhead].wbuf.lnum;
-	*offs = c->jheads[jhead].wbuf.offs + c->jheads[jhead].wbuf.used;
-
-	dbg_jnl("jhead %s, LEB %d:%d, len %d",
-		dbg_jhead(jhead), *lnum, *offs, len);
-	ubifs_prepare_node(c, node, len, 0);
-
-	return ubifs_wbuf_write_nolock(wbuf, node, len);
-}
-
 /**
  * write_head - write data to a journal head.
  * @c: UBIFS file-system description object
@@ -268,9 +238,9 @@ static int write_node(struct ubifs_info *c, int jhead, void *node, int len,
  * @offs: offset written is returned here
  * @sync: non-zero if the write-buffer has to by synchronized
  *
- * This function is the same as 'write_node()' but it does not assume the
- * buffer it is writing is a node, so it does not prepare it (which means
- * initializing common header and calculating CRC).
+ * This function writes data to the reserved space of journal head @jhead.
+ * Returns zero in case of success and a negative error code in case of
+ * failure.
  */
 static int write_head(struct ubifs_info *c, int jhead, void *buf, int len,
 		      int *lnum, int *offs, int sync)
@@ -758,7 +728,8 @@ int ubifs_jnl_write_data(struct ubifs_info *c, const struct inode *inode,
 	if (err)
 		goto out_free;
 
-	err = write_node(c, DATAHD, data, dlen, &lnum, &offs);
+	ubifs_prepare_node(c, data, dlen, 0);
+	err = write_head(c, DATAHD, data, dlen, &lnum, &offs, 0);
 	if (err)
 		goto out_release;
 	ubifs_wbuf_add_ino_nolock(&c->jheads[DATAHD].wbuf, key_inum(c, key));
-- 
2.18.0
