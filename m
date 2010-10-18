Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P7mWB-0007bi-D5
	for linux-mtd@lists.infradead.org; Mon, 18 Oct 2010 10:00:36 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	o9IA01wR013880
	for <linux-mtd@lists.infradead.org>; Mon, 18 Oct 2010 13:00:31 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
Subject: [PATCH 1/2] UBIFS: do not allocate unneeded scan buffer
Date: Mon, 18 Oct 2010 13:01:15 +0300
Message-Id: <1287396075-1840-1-git-send-email-dedekind1@gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

In 'ubifs_replay_journal()' we allocate 'sbuf' for scanning the log.
However, we already have 'c->sbuf' for these purposes, so do not
allocate yet another one. This reduces UBIFS memory consumption while
recovering.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/replay.c |    8 +-------
 1 files changed, 1 insertions(+), 7 deletions(-)

diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index 7df04ba..eed0fcf 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -1013,7 +1013,6 @@ out:
 int ubifs_replay_journal(struct ubifs_info *c)
 {
 	int err, i, lnum, offs, free;
-	void *sbuf = NULL;
 
 	BUILD_BUG_ON(UBIFS_TRUN_KEY > 5);
 
@@ -1028,10 +1027,6 @@ int ubifs_replay_journal(struct ubifs_info *c)
 		return -EINVAL;
 	}
 
-	sbuf = vmalloc(c->leb_size);
-	if (!sbuf)
-		return -ENOMEM;
-
 	dbg_mnt("start replaying the journal");
 	c->replaying = 1;
 	lnum = c->ltail_lnum = c->lhead_lnum;
@@ -1046,7 +1041,7 @@ int ubifs_replay_journal(struct ubifs_info *c)
 			lnum = UBIFS_LOG_LNUM;
 			offs = 0;
 		}
-		err = replay_log_leb(c, lnum, offs, sbuf);
+		err = replay_log_leb(c, lnum, offs, c->sbuf);
 		if (err == 1)
 			/* We hit the end of the log */
 			break;
@@ -1079,7 +1074,6 @@ int ubifs_replay_journal(struct ubifs_info *c)
 out:
 	destroy_replay_tree(c);
 	destroy_bud_list(c);
-	vfree(sbuf);
 	c->replaying = 0;
 	return err;
 }
-- 
1.7.2.3
