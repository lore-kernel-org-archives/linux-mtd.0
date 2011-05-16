Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QLxGW-0005wG-Uq
	for linux-mtd@lists.infradead.org; Mon, 16 May 2011 12:51:17 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-da01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4GCpDUm021378
	for <linux-mtd@lists.infradead.org>; Mon, 16 May 2011 15:51:15 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/4] UBIFS: always cleanup the recovered LEB
Date: Mon, 16 May 2011 15:55:11 +0300
Message-Id: <1305550513-27990-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1305550513-27990-1-git-send-email-dedekind1@gmail.com>
References: <1305550513-27990-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Now when we call 'ubifs_recover_leb()' only for LEBs which are potentially
corrupted (i.e., only for last buds, not for all of them), we can cleanup every
LEB, not only those where we find corruption. The reason - unstable bits. Even
though the LEB may look good now, it might contain unstable bits which may hit
us a bit later.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/recovery.c |   29 +++++++++--------------------
 1 files changed, 9 insertions(+), 20 deletions(-)

diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index 7d92203..4d10b6e 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -609,7 +609,7 @@ static int drop_incomplete_group(struct ubifs_scan_leb *sleb, int *offs)
 struct ubifs_scan_leb *ubifs_recover_leb(struct ubifs_info *c, int lnum,
 					 int offs, void *sbuf, int grouped)
 {
-	int ret = 0, err, len = c->leb_size - offs, need_clean = 0;
+	int ret = 0, err, len = c->leb_size - offs;
 	int start = offs;
 	struct ubifs_scan_leb *sleb;
 	void *buf = sbuf + offs;
@@ -620,9 +620,6 @@ struct ubifs_scan_leb *ubifs_recover_leb(struct ubifs_info *c, int lnum,
 	if (IS_ERR(sleb))
 		return sleb;
 
-	if (sleb->ecc)
-		need_clean = 1;
-
 	while (len >= 8) {
 		dbg_scan("look at LEB %d:%d (%d bytes left)",
 			 lnum, offs, len);
@@ -665,21 +662,18 @@ struct ubifs_scan_leb *ubifs_recover_leb(struct ubifs_info *c, int lnum,
 	}
 
 	if (ret == SCANNED_GARBAGE || ret == SCANNED_A_BAD_PAD_NODE) {
-		if (is_last_write(c, buf, offs)) {
+		if (is_last_write(c, buf, offs))
 			clean_buf(c, &buf, lnum, &offs, &len);
-			need_clean = 1;
-		} else
+		else
 			goto corrupted_rescan;
 	} else if (ret == SCANNED_A_CORRUPT_NODE) {
-		if (no_more_nodes(c, buf, len, lnum, offs)) {
+		if (no_more_nodes(c, buf, len, lnum, offs))
 			clean_buf(c, &buf, lnum, &offs, &len);
-			need_clean = 1;
-		} else
+		else
 			goto corrupted_rescan;
 	} else if (!is_empty(buf, len)) {
 		if (is_last_write(c, buf, offs)) {
 			clean_buf(c, &buf, lnum, &offs, &len);
-			need_clean = 1;
 		} else {
 			int corruption = first_non_ff(buf, len);
 
@@ -701,21 +695,16 @@ struct ubifs_scan_leb *ubifs_recover_leb(struct ubifs_info *c, int lnum,
 		buf = sbuf + offs;
 		len = c->leb_size - offs;
 		clean_buf(c, &buf, lnum, &offs, &len);
-		need_clean = 1;
 	}
 
-	if (offs % c->min_io_size) {
+	if (offs % c->min_io_size)
 		clean_buf(c, &buf, lnum, &offs, &len);
-		need_clean = 1;
-	}
 
 	ubifs_end_scan(c, sleb, lnum, offs);
 
-	if (need_clean) {
-		err = fix_unclean_leb(c, sleb, start);
-		if (err)
-			goto error;
-	}
+	err = fix_unclean_leb(c, sleb, start);
+	if (err)
+		goto error;
 
 	return sleb;
 
-- 
1.7.2.3
