Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QLxGX-0005wY-Sm
	for linux-mtd@lists.infradead.org; Mon, 16 May 2011 12:51:18 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-da01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4GCpDUn021378
	for <linux-mtd@lists.infradead.org>; Mon, 16 May 2011 15:51:16 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/4] UBIFS: simplify LEB recovery function further
Date: Mon, 16 May 2011 15:55:12 +0300
Message-Id: <1305550513-27990-4-git-send-email-dedekind1@gmail.com>
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

Further simplify 'ubifs_recover_leb()' by noticing that we have to call
'clean_buf()' in any case, and it is fine to call it if the offset is
aligned to 'c->min_io_size'. Thus, we do not have to call it separately
from every "if" - just call it once at the end.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/recovery.c |   17 ++++-------------
 1 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index 4d10b6e..74281f1 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -662,19 +662,13 @@ struct ubifs_scan_leb *ubifs_recover_leb(struct ubifs_info *c, int lnum,
 	}
 
 	if (ret == SCANNED_GARBAGE || ret == SCANNED_A_BAD_PAD_NODE) {
-		if (is_last_write(c, buf, offs))
-			clean_buf(c, &buf, lnum, &offs, &len);
-		else
+		if (!is_last_write(c, buf, offs))
 			goto corrupted_rescan;
 	} else if (ret == SCANNED_A_CORRUPT_NODE) {
-		if (no_more_nodes(c, buf, len, lnum, offs))
-			clean_buf(c, &buf, lnum, &offs, &len);
-		else
+		if (!no_more_nodes(c, buf, len, lnum, offs))
 			goto corrupted_rescan;
 	} else if (!is_empty(buf, len)) {
-		if (is_last_write(c, buf, offs)) {
-			clean_buf(c, &buf, lnum, &offs, &len);
-		} else {
+		if (!is_last_write(c, buf, offs)) {
 			int corruption = first_non_ff(buf, len);
 
 			/*
@@ -694,12 +688,9 @@ struct ubifs_scan_leb *ubifs_recover_leb(struct ubifs_info *c, int lnum,
 	if (grouped && drop_incomplete_group(sleb, &offs)) {
 		buf = sbuf + offs;
 		len = c->leb_size - offs;
-		clean_buf(c, &buf, lnum, &offs, &len);
 	}
 
-	if (offs % c->min_io_size)
-		clean_buf(c, &buf, lnum, &offs, &len);
-
+	clean_buf(c, &buf, lnum, &offs, &len);
 	ubifs_end_scan(c, sleb, lnum, offs);
 
 	err = fix_unclean_leb(c, sleb, start);
-- 
1.7.2.3
