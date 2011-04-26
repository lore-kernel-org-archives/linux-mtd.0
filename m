Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QEced-00071M-KS
	for linux-mtd@lists.infradead.org; Tue, 26 Apr 2011 07:25:54 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3Q7Pna9010197
	for <linux-mtd@lists.infradead.org>; Tue, 26 Apr 2011 10:25:49 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/4] UBIFS: print useful debugging messages when cannot
	recover gc_lnum
Date: Tue, 26 Apr 2011 10:29:22 +0300
Message-Id: <1303802963-31612-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1303802963-31612-1-git-send-email-dedekind1@gmail.com>
References: <1303802963-31612-1-git-send-email-dedekind1@gmail.com>
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

If we fail to recover the gc_lnum we just return an error and it then
it is difficult to figure out why this happened. This patch adds useful
debugging information which should make it easier to debug the failure.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/recovery.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index 3e0eedbe..3d2598d 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -1177,6 +1177,8 @@ find_free:
 	lnum = ubifs_find_free_leb_for_idx(c);
 	if (lnum < 0) {
 		dbg_err("could not find an empty LEB");
+		dbg_dump_lprops(c);
+		dbg_dump_budg(c, &c->bi);
 		return lnum;
 	}
 	/* And reset the index flag */
-- 
1.7.2.3
