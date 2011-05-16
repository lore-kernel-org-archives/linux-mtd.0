Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QLxGV-0005vk-U9
	for linux-mtd@lists.infradead.org; Mon, 16 May 2011 12:51:16 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-da01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4GCpDUl021378
	for <linux-mtd@lists.infradead.org>; Mon, 16 May 2011 15:51:14 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/4] UBIFS: clean up LEB recovery function
Date: Mon, 16 May 2011 15:55:10 +0300
Message-Id: <1305550513-27990-2-git-send-email-dedekind1@gmail.com>
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

This patch cleans up 'ubifs_recover_leb()' function and makes it more readable.
Move things which are done only once out of the loop and kill unneeded 'switch'
statement.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/recovery.c |   84 +++++++++++++++++----------------------------------
 1 files changed, 28 insertions(+), 56 deletions(-)

diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index 42b4512..7d92203 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -609,8 +609,8 @@ static int drop_incomplete_group(struct ubifs_scan_leb *sleb, int *offs)
 struct ubifs_scan_leb *ubifs_recover_leb(struct ubifs_info *c, int lnum,
 					 int offs, void *sbuf, int grouped)
 {
-	int err, len = c->leb_size - offs, need_clean = 0, quiet = 1;
-	int empty_chkd = 0, start = offs;
+	int ret = 0, err, len = c->leb_size - offs, need_clean = 0;
+	int start = offs;
 	struct ubifs_scan_leb *sleb;
 	void *buf = sbuf + offs;
 
@@ -624,8 +624,6 @@ struct ubifs_scan_leb *ubifs_recover_leb(struct ubifs_info *c, int lnum,
 		need_clean = 1;
 
 	while (len >= 8) {
-		int ret;
-
 		dbg_scan("look at LEB %d:%d (%d bytes left)",
 			 lnum, offs, len);
 
@@ -635,8 +633,7 @@ struct ubifs_scan_leb *ubifs_recover_leb(struct ubifs_info *c, int lnum,
 		 * Scan quietly until there is an error from which we cannot
 		 * recover
 		 */
-		ret = ubifs_scan_a_node(c, buf, len, lnum, offs, quiet);
-
+		ret = ubifs_scan_a_node(c, buf, len, lnum, offs, 0);
 		if (ret == SCANNED_A_NODE) {
 			/* A valid node, and not a padding node */
 			struct ubifs_ch *ch = buf;
@@ -649,66 +646,37 @@ struct ubifs_scan_leb *ubifs_recover_leb(struct ubifs_info *c, int lnum,
 			offs += node_len;
 			buf += node_len;
 			len -= node_len;
-			continue;
-		}
-
-		if (ret > 0) {
+		} else if (ret > 0) {
 			/* Padding bytes or a valid padding node */
 			offs += ret;
 			buf += ret;
 			len -= ret;
-			continue;
-		}
-
-		if (ret == SCANNED_EMPTY_SPACE) {
-			if (!is_empty(buf, len)) {
-				if (!is_last_write(c, buf, offs))
-					break;
-				clean_buf(c, &buf, lnum, &offs, &len);
-				need_clean = 1;
-			}
-			empty_chkd = 1;
+		} else if (ret == SCANNED_EMPTY_SPACE ||
+			   ret == SCANNED_GARBAGE     ||
+			   ret == SCANNED_A_BAD_PAD_NODE ||
+			   ret == SCANNED_A_CORRUPT_NODE) {
+			dbg_rcvry("found corruption - %d", ret);
 			break;
-		}
-
-		if (ret == SCANNED_GARBAGE || ret == SCANNED_A_BAD_PAD_NODE)
-			if (is_last_write(c, buf, offs)) {
-				clean_buf(c, &buf, lnum, &offs, &len);
-				need_clean = 1;
-				empty_chkd = 1;
-				break;
-			}
-
-		if (ret == SCANNED_A_CORRUPT_NODE)
-			if (no_more_nodes(c, buf, len, lnum, offs)) {
-				clean_buf(c, &buf, lnum, &offs, &len);
-				need_clean = 1;
-				empty_chkd = 1;
-				break;
-			}
-
-		if (quiet) {
-			/* Redo the last scan but noisily */
-			quiet = 0;
-			continue;
-		}
-
-		switch (ret) {
-		case SCANNED_GARBAGE:
-			dbg_err("garbage");
-			goto corrupted;
-		case SCANNED_A_CORRUPT_NODE:
-		case SCANNED_A_BAD_PAD_NODE:
-			dbg_err("bad node");
-			goto corrupted;
-		default:
-			dbg_err("unknown");
+		} else {
+			dbg_err("unexpected return value %d", ret);
 			err = -EINVAL;
 			goto error;
 		}
 	}
 
-	if (!empty_chkd && !is_empty(buf, len)) {
+	if (ret == SCANNED_GARBAGE || ret == SCANNED_A_BAD_PAD_NODE) {
+		if (is_last_write(c, buf, offs)) {
+			clean_buf(c, &buf, lnum, &offs, &len);
+			need_clean = 1;
+		} else
+			goto corrupted_rescan;
+	} else if (ret == SCANNED_A_CORRUPT_NODE) {
+		if (no_more_nodes(c, buf, len, lnum, offs)) {
+			clean_buf(c, &buf, lnum, &offs, &len);
+			need_clean = 1;
+		} else
+			goto corrupted_rescan;
+	} else if (!is_empty(buf, len)) {
 		if (is_last_write(c, buf, offs)) {
 			clean_buf(c, &buf, lnum, &offs, &len);
 			need_clean = 1;
@@ -751,6 +719,10 @@ struct ubifs_scan_leb *ubifs_recover_leb(struct ubifs_info *c, int lnum,
 
 	return sleb;
 
+corrupted_rescan:
+	/* Re-scan the corrupted data with verbose messages */
+	dbg_err("corruptio %d", ret);
+	ubifs_scan_a_node(c, buf, len, lnum, offs, 1);
 corrupted:
 	ubifs_scanned_corruption(c, lnum, offs, buf);
 	err = -EUCLEAN;
-- 
1.7.2.3
