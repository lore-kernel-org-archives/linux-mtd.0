Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUb6u-0002SR-Hf
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 09:01:11 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p5990wE8028399
	for <linux-mtd@lists.infradead.org>; Thu, 9 Jun 2011 12:01:02 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 08/30] UBIFS: remove dead code
Date: Thu,  9 Jun 2011 12:04:48 +0300
Message-Id: <1307610310-28691-9-git-send-email-dedekind1@gmail.com>
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

Remove dead pieces of code under "if (c->min_io_size == 1)" statement -
we never execute it because in UBIFS 'c->min_io_size' is always at least 8.
This are leftovers from old pre-mainline prototype.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/tnc_commit.c |  106 ++++++++++++++-----------------------------------
 1 files changed, 30 insertions(+), 76 deletions(-)

diff --git a/fs/ubifs/tnc_commit.c b/fs/ubifs/tnc_commit.c
index 41920f3..8315387 100644
--- a/fs/ubifs/tnc_commit.c
+++ b/fs/ubifs/tnc_commit.c
@@ -491,25 +491,6 @@ static int layout_in_empty_space(struct ubifs_info *c)
 		else
 			next_len = ubifs_idx_node_sz(c, cnext->child_cnt);
 
-		if (c->min_io_size == 1) {
-			buf_offs += ALIGN(len, 8);
-			if (next_len) {
-				if (buf_offs + next_len <= c->leb_size)
-					continue;
-				err = ubifs_update_one_lp(c, lnum, 0,
-						c->leb_size - buf_offs, 0, 0);
-				if (err)
-					return err;
-				lnum = -1;
-				continue;
-			}
-			err = ubifs_update_one_lp(c, lnum,
-					c->leb_size - buf_offs, 0, 0, 0);
-			if (err)
-				return err;
-			break;
-		}
-
 		/* Update buffer positions */
 		wlen = used + len;
 		used += ALIGN(len, 8);
@@ -830,7 +811,7 @@ static int write_index(struct ubifs_info *c)
 	struct ubifs_idx_node *idx;
 	struct ubifs_znode *znode, *cnext;
 	int i, lnum, offs, len, next_len, buf_len, buf_offs, used;
-	int avail, wlen, err, lnum_pos = 0;
+	int avail, wlen, err, lnum_pos = 0, blen, nxt_offs;
 
 	cnext = c->enext;
 	if (!cnext)
@@ -938,65 +919,38 @@ static int write_index(struct ubifs_info *c)
 		else
 			next_len = ubifs_idx_node_sz(c, cnext->child_cnt);
 
-		if (c->min_io_size == 1) {
-			/*
-			 * Write the prepared index node immediately if there is
-			 * no minimum IO size
-			 */
-			err = ubifs_leb_write(c, lnum, c->cbuf, buf_offs,
-					      wlen, UBI_SHORTTERM);
-			if (err)
-				return err;
-			buf_offs += ALIGN(wlen, 8);
-			if (next_len) {
-				used = 0;
-				avail = buf_len;
-				if (buf_offs + next_len > c->leb_size) {
-					err = ubifs_update_one_lp(c, lnum,
-						LPROPS_NC, 0, 0, LPROPS_TAKEN);
-					if (err)
-						return err;
-					lnum = -1;
-				}
+		nxt_offs = buf_offs + used + next_len;
+		if (next_len && nxt_offs <= c->leb_size) {
+			if (avail > 0)
 				continue;
-			}
+			else
+				blen = buf_len;
 		} else {
-			int blen, nxt_offs = buf_offs + used + next_len;
-
-			if (next_len && nxt_offs <= c->leb_size) {
-				if (avail > 0)
-					continue;
-				else
-					blen = buf_len;
-			} else {
-				wlen = ALIGN(wlen, 8);
-				blen = ALIGN(wlen, c->min_io_size);
-				ubifs_pad(c, c->cbuf + wlen, blen - wlen);
-			}
-			/*
-			 * The buffer is full or there are no more znodes
-			 * to do
-			 */
-			err = ubifs_leb_write(c, lnum, c->cbuf, buf_offs,
-					      blen, UBI_SHORTTERM);
-			if (err)
-				return err;
-			buf_offs += blen;
-			if (next_len) {
-				if (nxt_offs > c->leb_size) {
-					err = ubifs_update_one_lp(c, lnum,
-						LPROPS_NC, 0, 0, LPROPS_TAKEN);
-					if (err)
-						return err;
-					lnum = -1;
-				}
-				used -= blen;
-				if (used < 0)
-					used = 0;
-				avail = buf_len - used;
-				memmove(c->cbuf, c->cbuf + blen, used);
-				continue;
+			wlen = ALIGN(wlen, 8);
+			blen = ALIGN(wlen, c->min_io_size);
+			ubifs_pad(c, c->cbuf + wlen, blen - wlen);
+		}
+
+		/* The buffer is full or there are no more znodes to do */
+		err = ubifs_leb_write(c, lnum, c->cbuf, buf_offs, blen,
+				      UBI_SHORTTERM);
+		if (err)
+			return err;
+		buf_offs += blen;
+		if (next_len) {
+			if (nxt_offs > c->leb_size) {
+				err = ubifs_update_one_lp(c, lnum, LPROPS_NC, 0,
+							  0, LPROPS_TAKEN);
+				if (err)
+					return err;
+				lnum = -1;
 			}
+			used -= blen;
+			if (used < 0)
+				used = 0;
+			avail = buf_len - used;
+			memmove(c->cbuf, c->cbuf + blen, used);
+			continue;
 		}
 		break;
 	}
-- 
1.7.2.3
