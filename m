Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUb70-0002X2-O3
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 09:01:26 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p5990wEQ028399
	for <linux-mtd@lists.infradead.org>; Thu, 9 Jun 2011 12:01:09 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 26/30] UBIFS: switch to I/O helpers
Date: Thu,  9 Jun 2011 12:05:06 +0300
Message-Id: <1307610310-28691-27-git-send-email-dedekind1@gmail.com>
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

Switch the rest of direct UBI calls to UBIFS helper functions.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/log.c      |    4 +---
 fs/ubifs/lpt.c      |   16 ++++++++--------
 fs/ubifs/recovery.c |   14 +++++++-------
 fs/ubifs/sb.c       |    4 ++--
 fs/ubifs/super.c    |    2 +-
 5 files changed, 19 insertions(+), 21 deletions(-)

diff --git a/fs/ubifs/log.c b/fs/ubifs/log.c
index fabfb53..f9fd068 100644
--- a/fs/ubifs/log.c
+++ b/fs/ubifs/log.c
@@ -262,7 +262,7 @@ int ubifs_add_bud_to_log(struct ubifs_info *c, int jhead, int lnum, int offs)
 		 * an unclean reboot, because the target LEB might have been
 		 * unmapped, but not yet physically erased.
 		 */
-		err = ubi_leb_map(c->ubi, bud->lnum, UBI_SHORTTERM);
+		err = ubifs_leb_map(c, bud->lnum, UBI_SHORTTERM);
 		if (err)
 			goto out_unlock;
 	}
@@ -283,8 +283,6 @@ int ubifs_add_bud_to_log(struct ubifs_info *c, int jhead, int lnum, int offs)
 	return 0;
 
 out_unlock:
-	if (err != -EAGAIN)
-		ubifs_ro_mode(c, err);
 	mutex_unlock(&c->log_mutex);
 	kfree(ref);
 	kfree(bud);
diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
index 8b9ee9f..6189c74 100644
--- a/fs/ubifs/lpt.c
+++ b/fs/ubifs/lpt.c
@@ -701,8 +701,8 @@ int ubifs_create_dflt_lpt(struct ubifs_info *c, int *main_lebs, int lpt_first,
 			alen = ALIGN(len, c->min_io_size);
 			set_ltab(c, lnum, c->leb_size - alen, alen - len);
 			memset(p, 0xff, alen - len);
-			err = ubi_leb_change(c->ubi, lnum++, buf, alen,
-					     UBI_SHORTTERM);
+			err = ubifs_leb_change(c, lnum++, buf, alen,
+					       UBI_SHORTTERM);
 			if (err)
 				goto out;
 			p = buf;
@@ -732,8 +732,8 @@ int ubifs_create_dflt_lpt(struct ubifs_info *c, int *main_lebs, int lpt_first,
 				set_ltab(c, lnum, c->leb_size - alen,
 					    alen - len);
 				memset(p, 0xff, alen - len);
-				err = ubi_leb_change(c->ubi, lnum++, buf, alen,
-						     UBI_SHORTTERM);
+				err = ubifs_leb_change(c, lnum++, buf, alen,
+						       UBI_SHORTTERM);
 				if (err)
 					goto out;
 				p = buf;
@@ -780,8 +780,8 @@ int ubifs_create_dflt_lpt(struct ubifs_info *c, int *main_lebs, int lpt_first,
 			alen = ALIGN(len, c->min_io_size);
 			set_ltab(c, lnum, c->leb_size - alen, alen - len);
 			memset(p, 0xff, alen - len);
-			err = ubi_leb_change(c->ubi, lnum++, buf, alen,
-					     UBI_SHORTTERM);
+			err = ubifs_leb_change(c, lnum++, buf, alen,
+					       UBI_SHORTTERM);
 			if (err)
 				goto out;
 			p = buf;
@@ -806,7 +806,7 @@ int ubifs_create_dflt_lpt(struct ubifs_info *c, int *main_lebs, int lpt_first,
 		alen = ALIGN(len, c->min_io_size);
 		set_ltab(c, lnum, c->leb_size - alen, alen - len);
 		memset(p, 0xff, alen - len);
-		err = ubi_leb_change(c->ubi, lnum++, buf, alen, UBI_SHORTTERM);
+		err = ubifs_leb_change(c, lnum++, buf, alen, UBI_SHORTTERM);
 		if (err)
 			goto out;
 		p = buf;
@@ -826,7 +826,7 @@ int ubifs_create_dflt_lpt(struct ubifs_info *c, int *main_lebs, int lpt_first,
 
 	/* Write remaining buffer */
 	memset(p, 0xff, alen - len);
-	err = ubi_leb_change(c->ubi, lnum, buf, alen, UBI_SHORTTERM);
+	err = ubifs_leb_change(c, lnum, buf, alen, UBI_SHORTTERM);
 	if (err)
 		goto out;
 
diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index f28070c..51bcf42 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -213,10 +213,10 @@ static int write_rcvrd_mst_node(struct ubifs_info *c,
 	mst->flags |= cpu_to_le32(UBIFS_MST_RCVRY);
 
 	ubifs_prepare_node(c, mst, UBIFS_MST_NODE_SZ, 1);
-	err = ubi_leb_change(c->ubi, lnum, mst, sz, UBI_SHORTTERM);
+	err = ubifs_leb_change(c, lnum, mst, sz, UBI_SHORTTERM);
 	if (err)
 		goto out;
-	err = ubi_leb_change(c->ubi, lnum + 1, mst, sz, UBI_SHORTTERM);
+	err = ubifs_leb_change(c, lnum + 1, mst, sz, UBI_SHORTTERM);
 	if (err)
 		goto out;
 out:
@@ -554,8 +554,8 @@ static int fix_unclean_leb(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 					ubifs_pad(c, buf, pad_len);
 				}
 			}
-			err = ubi_leb_change(c->ubi, lnum, sleb->buf, len,
-					     UBI_UNKNOWN);
+			err = ubifs_leb_change(c, lnum, sleb->buf, len,
+					       UBI_UNKNOWN);
 			if (err)
 				return err;
 		}
@@ -939,7 +939,7 @@ static int recover_head(struct ubifs_info *c, int lnum, int offs, void *sbuf)
 		err = ubifs_leb_read(c, lnum, sbuf, 0, offs, 1);
 		if (err)
 			return err;
-		return ubi_leb_change(c->ubi, lnum, sbuf, offs, UBI_UNKNOWN);
+		return ubifs_leb_change(c, lnum, sbuf, offs, UBI_UNKNOWN);
 	}
 
 	return 0;
@@ -1069,7 +1069,7 @@ static int clean_an_unclean_leb(struct ubifs_info *c,
 	}
 
 	/* Write back the LEB atomically */
-	err = ubi_leb_change(c->ubi, lnum, sbuf, len, UBI_UNKNOWN);
+	err = ubifs_leb_change(c, lnum, sbuf, len, UBI_UNKNOWN);
 	if (err)
 		return err;
 
@@ -1470,7 +1470,7 @@ static int fix_size_in_place(struct ubifs_info *c, struct size_entry *e)
 		len -= 1;
 	len = ALIGN(len + 1, c->min_io_size);
 	/* Atomically write the fixed LEB back again */
-	err = ubi_leb_change(c->ubi, lnum, c->sbuf, len, UBI_UNKNOWN);
+	err = ubifs_leb_change(c, lnum, c->sbuf, len, UBI_UNKNOWN);
 	if (err)
 		goto out;
 	dbg_rcvry("inode %lu at %d:%d size %lld -> %lld",
diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 701dccc..93d938a 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -674,7 +674,7 @@ static int fixup_leb(struct ubifs_info *c, int lnum, int len)
 
 	if (len == 0) {
 		dbg_mnt("unmap empty LEB %d", lnum);
-		return ubi_leb_unmap(c->ubi, lnum);
+		return ubifs_leb_unmap(c, lnum);
 	}
 
 	dbg_mnt("fixup LEB %d, data len %d", lnum, len);
@@ -682,7 +682,7 @@ static int fixup_leb(struct ubifs_info *c, int lnum, int len)
 	if (err)
 		return err;
 
-	return ubi_leb_change(c->ubi, lnum, c->sbuf, len, UBI_UNKNOWN);
+	return ubifs_leb_change(c, lnum, c->sbuf, len, UBI_UNKNOWN);
 }
 
 /**
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 70e8c92..9b2bc56 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -914,7 +914,7 @@ static int check_volume_empty(struct ubifs_info *c)
 
 	c->empty = 1;
 	for (lnum = 0; lnum < c->leb_cnt; lnum++) {
-		err = ubi_is_mapped(c->ubi, lnum);
+		err = ubifs_is_mapped(c, lnum);
 		if (unlikely(err < 0))
 			return err;
 		if (err == 1) {
-- 
1.7.2.3
