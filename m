Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QLsQH-0003Yx-Qj
	for linux-mtd@lists.infradead.org; Mon, 16 May 2011 07:41:03 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4G7ex5O011552
	for <linux-mtd@lists.infradead.org>; Mon, 16 May 2011 10:41:00 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 05/20] UBIFS: improve debugging messages
Date: Mon, 16 May 2011 10:44:24 +0300
Message-Id: <1305531879-19311-6-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1305531879-19311-1-git-send-email-dedekind1@gmail.com>
References: <1305531879-19311-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Print a bit more information is some recovery and replay paths.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/recovery.c |    7 +++----
 fs/ubifs/replay.c   |    3 ++-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index 3f41a0c..42b4512 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -1140,12 +1140,11 @@ int ubifs_rcvry_gc_commit(struct ubifs_info *c)
 	struct ubifs_lprops lp;
 	int err;
 
+	dbg_rcvry("GC head LEB %d, offs %d", wbuf->lnum, wbuf->offs);
+
 	c->gc_lnum = -1;
-	if (wbuf->lnum == -1 || wbuf->offs == c->leb_size) {
-		dbg_rcvry("no GC head: wbuf->lnum %d, wbuf->offs %d",
-			  wbuf->lnum, wbuf->offs);
+	if (wbuf->lnum == -1 || wbuf->offs == c->leb_size)
 		return grab_empty_leb(c);
-	}
 
 	err = ubifs_find_dirty_leb(c, &lp, wbuf->offs, 2);
 	if (err) {
diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index c29c468..0052663 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -509,7 +509,7 @@ static int replay_bud(struct ubifs_info *c, int lnum, int offs, int jhead,
 	struct ubifs_scan_node *snod;
 	struct ubifs_bud *bud;
 
-	dbg_mnt("replay bud LEB %d, head %d", lnum, jhead);
+	dbg_mnt("replay bud LEB %d, head %d, offs %d", lnum, jhead, offs);
 	if (c->need_recovery)
 		sleb = ubifs_recover_leb(c, lnum, offs, c->sbuf, jhead != GCHD);
 	else
@@ -636,6 +636,7 @@ static int replay_bud(struct ubifs_info *c, int lnum, int offs, int jhead,
 
 	*dirty = sleb->endpt - offs - used;
 	*free = c->leb_size - sleb->endpt;
+	dbg_mnt("bud LEB %d replied: dirty %d, free %d", lnum, *dirty, *free);
 
 out:
 	ubifs_scan_destroy(sleb);
-- 
1.7.2.3
