Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUb6z-0002Wt-J9
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 09:01:25 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p5990wEO028399
	for <linux-mtd@lists.infradead.org>; Thu, 9 Jun 2011 12:01:08 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 24/30] UBIFS: switch to ubifs_leb_read
Date: Thu,  9 Jun 2011 12:05:04 +0300
Message-Id: <1307610310-28691-25-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1307610310-28691-1-git-send-email-dedekind1@gmail.com>
References: <1307610310-28691-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Instead of using 'ubi_read()' function directly, used the 'ubifs_leb_read()'
helper function instead. This allows to get rid of several redundant error
messages and make sure that we always have a stack dump on read errors.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/io.c         |   15 ++++-----------
 fs/ubifs/lpt.c        |   17 +++++++++--------
 fs/ubifs/lpt_commit.c |   23 +++++++++++------------
 fs/ubifs/recovery.c   |   17 +++++++++--------
 fs/ubifs/replay.c     |    3 +--
 fs/ubifs/sb.c         |    2 +-
 fs/ubifs/scan.c       |    2 +-
 fs/ubifs/tnc.c        |    8 ++++----
 8 files changed, 40 insertions(+), 47 deletions(-)

diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 239899d..f58f11b 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -941,13 +941,9 @@ int ubifs_read_node_wbuf(struct ubifs_wbuf *wbuf, void *buf, int type, int len,
 
 	if (rlen > 0) {
 		/* Read everything that goes before write-buffer */
-		err = ubi_read(c->ubi, lnum, buf, offs, rlen);
-		if (err && err != -EBADMSG) {
-			ubifs_err("failed to read node %d from LEB %d:%d, "
-				  "error %d", type, lnum, offs, err);
-			dbg_dump_stack();
+		err = ubifs_leb_read(c, lnum, buf, offs, rlen, 0);
+		if (err && err != -EBADMSG)
 			return err;
-		}
 	}
 
 	if (type != ch->node_type) {
@@ -1002,12 +998,9 @@ int ubifs_read_node(const struct ubifs_info *c, void *buf, int type, int len,
 	ubifs_assert(!(offs & 7) && offs < c->leb_size);
 	ubifs_assert(type >= 0 && type < UBIFS_NODE_TYPES_CNT);
 
-	err = ubi_read(c->ubi, lnum, buf, offs, len);
-	if (err && err != -EBADMSG) {
-		ubifs_err("cannot read node %d from LEB %d:%d, error %d",
-			  type, lnum, offs, err);
+	err = ubifs_leb_read(c, lnum, buf, offs, len, 0);
+	if (err && err != -EBADMSG)
 		return err;
-	}
 
 	if (type != ch->node_type) {
 		ubifs_err("bad node type (%d but expected %d)",
diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
index ab91ca6..8b9ee9f 100644
--- a/fs/ubifs/lpt.c
+++ b/fs/ubifs/lpt.c
@@ -1222,7 +1222,7 @@ int ubifs_read_nnode(struct ubifs_info *c, struct ubifs_nnode *parent, int iip)
 		if (c->big_lpt)
 			nnode->num = calc_nnode_num_from_parent(c, parent, iip);
 	} else {
-		err = ubi_read(c->ubi, lnum, buf, offs, c->nnode_sz);
+		err = ubifs_leb_read(c, lnum, buf, offs, c->nnode_sz, 1);
 		if (err)
 			goto out;
 		err = ubifs_unpack_nnode(c, buf, nnode);
@@ -1291,7 +1291,7 @@ static int read_pnode(struct ubifs_info *c, struct ubifs_nnode *parent, int iip)
 			lprops->flags = ubifs_categorize_lprops(c, lprops);
 		}
 	} else {
-		err = ubi_read(c->ubi, lnum, buf, offs, c->pnode_sz);
+		err = ubifs_leb_read(c, lnum, buf, offs, c->pnode_sz, 1);
 		if (err)
 			goto out;
 		err = unpack_pnode(c, buf, pnode);
@@ -1333,7 +1333,7 @@ static int read_ltab(struct ubifs_info *c)
 	buf = vmalloc(c->ltab_sz);
 	if (!buf)
 		return -ENOMEM;
-	err = ubi_read(c->ubi, c->ltab_lnum, buf, c->ltab_offs, c->ltab_sz);
+	err = ubifs_leb_read(c, c->ltab_lnum, buf, c->ltab_offs, c->ltab_sz, 1);
 	if (err)
 		goto out;
 	err = unpack_ltab(c, buf);
@@ -1356,7 +1356,8 @@ static int read_lsave(struct ubifs_info *c)
 	buf = vmalloc(c->lsave_sz);
 	if (!buf)
 		return -ENOMEM;
-	err = ubi_read(c->ubi, c->lsave_lnum, buf, c->lsave_offs, c->lsave_sz);
+	err = ubifs_leb_read(c, c->lsave_lnum, buf, c->lsave_offs,
+			     c->lsave_sz, 1);
 	if (err)
 		goto out;
 	err = unpack_lsave(c, buf);
@@ -1816,8 +1817,8 @@ static struct ubifs_nnode *scan_get_nnode(struct ubifs_info *c,
 		if (c->big_lpt)
 			nnode->num = calc_nnode_num_from_parent(c, parent, iip);
 	} else {
-		err = ubi_read(c->ubi, branch->lnum, buf, branch->offs,
-			       c->nnode_sz);
+		err = ubifs_leb_read(c, branch->lnum, buf, branch->offs,
+				     c->nnode_sz, 1);
 		if (err)
 			return ERR_PTR(err);
 		err = ubifs_unpack_nnode(c, buf, nnode);
@@ -1885,8 +1886,8 @@ static struct ubifs_pnode *scan_get_pnode(struct ubifs_info *c,
 		ubifs_assert(branch->lnum >= c->lpt_first &&
 			     branch->lnum <= c->lpt_last);
 		ubifs_assert(branch->offs >= 0 && branch->offs < c->leb_size);
-		err = ubi_read(c->ubi, branch->lnum, buf, branch->offs,
-			       c->pnode_sz);
+		err = ubifs_leb_read(c, branch->lnum, buf, branch->offs,
+				     c->pnode_sz, 1);
 		if (err)
 			return ERR_PTR(err);
 		err = unpack_pnode(c, buf, pnode);
diff --git a/fs/ubifs/lpt_commit.c b/fs/ubifs/lpt_commit.c
index f13addf..cddd6bd 100644
--- a/fs/ubifs/lpt_commit.c
+++ b/fs/ubifs/lpt_commit.c
@@ -1161,11 +1161,11 @@ static int lpt_gc_lnum(struct ubifs_info *c, int lnum)
 	void *buf = c->lpt_buf;
 
 	dbg_lp("LEB %d", lnum);
-	err = ubi_read(c->ubi, lnum, buf, 0, c->leb_size);
-	if (err) {
-		ubifs_err("cannot read LEB %d, error %d", lnum, err);
+
+	err = ubifs_leb_read(c, lnum, buf, 0, c->leb_size, 1);
+	if (err)
 		return err;
-	}
+
 	while (1) {
 		if (!is_a_node(c, buf, len)) {
 			int pad_len;
@@ -1651,11 +1651,11 @@ static int dbg_check_ltab_lnum(struct ubifs_info *c, int lnum)
 	}
 
 	dbg_lp("LEB %d", lnum);
-	err = ubi_read(c->ubi, lnum, buf, 0, c->leb_size);
-	if (err) {
-		dbg_msg("ubi_read failed, LEB %d, error %d", lnum, err);
+
+	err = ubifs_leb_read(c, lnum, buf, 0, c->leb_size, 1);
+	if (err)
 		goto out;
-	}
+
 	while (1) {
 		if (!is_a_node(c, p, len)) {
 			int i, pad_len;
@@ -1902,11 +1902,10 @@ static void dump_lpt_leb(const struct ubifs_info *c, int lnum)
 		return;
 	}
 
-	err = ubi_read(c->ubi, lnum, buf, 0, c->leb_size);
-	if (err) {
-		ubifs_err("cannot read LEB %d, error %d", lnum, err);
+	err = ubifs_leb_read(c, lnum, buf, 0, c->leb_size, 1);
+	if (err)
 		goto out;
-	}
+
 	while (1) {
 		offs = c->leb_size - len;
 		if (!is_a_node(c, p, len)) {
diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index c591549..f28070c 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -117,7 +117,7 @@ static int get_master_node(const struct ubifs_info *c, int lnum, void **pbuf,
 	if (!sbuf)
 		return -ENOMEM;
 
-	err = ubi_read(c->ubi, lnum, sbuf, 0, c->leb_size);
+	err = ubifs_leb_read(c, lnum, sbuf, 0, c->leb_size, 0);
 	if (err && err != -EBADMSG)
 		goto out_free;
 
@@ -539,8 +539,8 @@ static int fix_unclean_leb(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 			int len = ALIGN(endpt, c->min_io_size);
 
 			if (start) {
-				err = ubi_read(c->ubi, lnum, sleb->buf, 0,
-					       start);
+				err = ubifs_leb_read(c, lnum, sleb->buf, 0,
+						     start, 1);
 				if (err)
 					return err;
 			}
@@ -819,7 +819,8 @@ static int get_cs_sqnum(struct ubifs_info *c, int lnum, int offs,
 		return -ENOMEM;
 	if (c->leb_size - offs < UBIFS_CS_NODE_SZ)
 		goto out_err;
-	err = ubi_read(c->ubi, lnum, (void *)cs_node, offs, UBIFS_CS_NODE_SZ);
+	err = ubifs_leb_read(c, lnum, (void *)cs_node, offs,
+			     UBIFS_CS_NODE_SZ, 0);
 	if (err && err != -EBADMSG)
 		goto out_free;
 	ret = ubifs_scan_a_node(c, cs_node, UBIFS_CS_NODE_SZ, lnum, offs, 0);
@@ -930,12 +931,12 @@ static int recover_head(struct ubifs_info *c, int lnum, int offs, void *sbuf)
 		return 0;
 
 	/* Read at the head location and check it is empty flash */
-	err = ubi_read(c->ubi, lnum, sbuf, offs, len);
+	err = ubifs_leb_read(c, lnum, sbuf, offs, len, 1);
 	if (err || !is_empty(sbuf, len)) {
 		dbg_rcvry("cleaning head at %d:%d", lnum, offs);
 		if (offs == 0)
 			return ubifs_leb_unmap(c, lnum);
-		err = ubi_read(c->ubi, lnum, sbuf, 0, offs);
+		err = ubifs_leb_read(c, lnum, sbuf, 0, offs, 1);
 		if (err)
 			return err;
 		return ubi_leb_change(c->ubi, lnum, sbuf, offs, UBI_UNKNOWN);
@@ -1008,7 +1009,7 @@ static int clean_an_unclean_leb(struct ubifs_info *c,
 		return 0;
 	}
 
-	err = ubi_read(c->ubi, lnum, buf, offs, len);
+	err = ubifs_leb_read(c, lnum, buf, offs, len, 0);
 	if (err && err != -EBADMSG)
 		return err;
 
@@ -1453,7 +1454,7 @@ static int fix_size_in_place(struct ubifs_info *c, struct size_entry *e)
 	if (i_size >= e->d_size)
 		return 0;
 	/* Read the LEB */
-	err = ubi_read(c->ubi, lnum, c->sbuf, 0, c->leb_size);
+	err = ubifs_leb_read(c, lnum, c->sbuf, 0, c->leb_size, 1);
 	if (err)
 		goto out;
 	/* Change the size field and recalculate the CRC */
diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index 5e97161..ccabaf1 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -523,8 +523,7 @@ static int is_last_bud(struct ubifs_info *c, struct ubifs_bud *bud)
 	if (!list_is_last(&next->list, &jh->buds_list))
 		return 0;
 
-	err = ubi_read(c->ubi, next->lnum, (char *)&data,
-		       next->start, 4);
+	err = ubifs_leb_read(c, next->lnum, (char *)&data, next->start, 4, 1);
 	if (err)
 		return 0;
 
diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index c606f01..701dccc 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -678,7 +678,7 @@ static int fixup_leb(struct ubifs_info *c, int lnum, int len)
 	}
 
 	dbg_mnt("fixup LEB %d, data len %d", lnum, len);
-	err = ubi_read(c->ubi, lnum, c->sbuf, 0, len);
+	err = ubifs_leb_read(c, lnum, c->sbuf, 0, len, 1);
 	if (err)
 		return err;
 
diff --git a/fs/ubifs/scan.c b/fs/ubifs/scan.c
index c7df916..37383e8 100644
--- a/fs/ubifs/scan.c
+++ b/fs/ubifs/scan.c
@@ -148,7 +148,7 @@ struct ubifs_scan_leb *ubifs_start_scan(const struct ubifs_info *c, int lnum,
 	INIT_LIST_HEAD(&sleb->nodes);
 	sleb->buf = sbuf;
 
-	err = ubi_read(c->ubi, lnum, sbuf + offs, offs, c->leb_size - offs);
+	err = ubifs_leb_read(c, lnum, sbuf + offs, offs, c->leb_size - offs, 0);
 	if (err && err != -EBADMSG) {
 		ubifs_err("cannot read %d bytes from LEB %d:%d,"
 			  " error %d", c->leb_size - offs, lnum, offs, err);
diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index 526b63c..0667386 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -462,7 +462,7 @@ static int try_read_node(const struct ubifs_info *c, void *buf, int type,
 
 	dbg_io("LEB %d:%d, %s, length %d", lnum, offs, dbg_ntype(type), len);
 
-	err = ubi_read(c->ubi, lnum, buf, offs, len);
+	err = ubifs_leb_read(c, lnum, buf, offs, len, 1);
 	if (err) {
 		ubifs_err("cannot read node type %d from LEB %d:%d, error %d",
 			  type, lnum, offs, err);
@@ -1666,7 +1666,7 @@ static int read_wbuf(struct ubifs_wbuf *wbuf, void *buf, int len, int lnum,
 	if (!overlap) {
 		/* We may safely unlock the write-buffer and read the data */
 		spin_unlock(&wbuf->lock);
-		return ubi_read(c->ubi, lnum, buf, offs, len);
+		return ubifs_leb_read(c, lnum, buf, offs, len, 0);
 	}
 
 	/* Don't read under wbuf */
@@ -1680,7 +1680,7 @@ static int read_wbuf(struct ubifs_wbuf *wbuf, void *buf, int len, int lnum,
 
 	if (rlen > 0)
 		/* Read everything that goes before write-buffer */
-		return ubi_read(c->ubi, lnum, buf, offs, rlen);
+		return ubifs_leb_read(c, lnum, buf, offs, rlen, 0);
 
 	return 0;
 }
@@ -1767,7 +1767,7 @@ int ubifs_tnc_bulk_read(struct ubifs_info *c, struct bu_info *bu)
 	if (wbuf)
 		err = read_wbuf(wbuf, bu->buf, len, lnum, offs);
 	else
-		err = ubi_read(c->ubi, lnum, bu->buf, offs, len);
+		err = ubifs_leb_read(c, lnum, bu->buf, offs, len, 0);
 
 	/* Check for a race with GC */
 	if (maybe_leb_gced(c, lnum, bu->gc_seq))
-- 
1.7.2.3
