Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QLsQl-0003dB-0P
	for linux-mtd@lists.infradead.org; Mon, 16 May 2011 07:41:32 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4G7eT40011095
	for <linux-mtd@lists.infradead.org>; Mon, 16 May 2011 10:41:30 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 14/20] UBIFS: remove BUG statement
Date: Mon, 16 May 2011 10:44:33 +0300
Message-Id: <1305531879-19311-15-git-send-email-dedekind1@gmail.com>
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

Remove a 'BUG()' statement when we are unable to find a bud and add a
similar 'ubifs_assert()' statement instead.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/replay.c |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index 4378baa..0f50fbf 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -487,7 +487,6 @@ static int replay_bud(struct ubifs_info *c, struct bud_entry *b)
 	int jhead = b->bud->jhead;
 	struct ubifs_scan_leb *sleb;
 	struct ubifs_scan_node *snod;
-	struct ubifs_bud *bud;
 
 	dbg_mnt("replay bud LEB %d, head %d, offs %d", lnum, jhead, offs);
 
@@ -608,10 +607,7 @@ static int replay_bud(struct ubifs_info *c, struct bud_entry *b)
 			goto out;
 	}
 
-	bud = ubifs_search_bud(c, lnum);
-	if (!bud)
-		BUG();
-
+	ubifs_assert(ubifs_search_bud(c, lnum));
 	ubifs_assert(sleb->endpt - offs >= used);
 	ubifs_assert(sleb->endpt % c->min_io_size == 0);
 
-- 
1.7.2.3
