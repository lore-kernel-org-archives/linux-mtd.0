Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pz8ze-0000nL-C7
	for linux-mtd@lists.infradead.org; Mon, 14 Mar 2011 14:43:35 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2EEhTSa004474
	for <linux-mtd@lists.infradead.org>; Mon, 14 Mar 2011 16:43:30 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
Subject: [PATCH 5/6] UBIFS: allocate orphans scan buffer on demand
Date: Mon, 14 Mar 2011 16:46:11 +0200
Message-Id: <1300113972-4507-6-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1300113972-4507-1-git-send-email-dedekind1@gmail.com>
References: <1300113972-4507-1-git-send-email-dedekind1@gmail.com>
Cc: MTD list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Instead of using pre-allocated 'c->dbg->buf' buffer in
'dbg_scan_orphans()', dynamically allocate it when needed. The intend
is to get rid of the pre-allocated 'c->dbg->buf' buffer and save
128KiB of RAM (or more if PEB size is larger). Indeed, currently we
allocate this memory even if the user never enables any self-check,
which is wasteful.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/orphan.c |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
index 82009c7..2cdbd31 100644
--- a/fs/ubifs/orphan.c
+++ b/fs/ubifs/orphan.c
@@ -892,15 +892,22 @@ static int dbg_read_orphans(struct check_info *ci, struct ubifs_scan_leb *sleb)
 static int dbg_scan_orphans(struct ubifs_info *c, struct check_info *ci)
 {
 	int lnum, err = 0;
+	void *buf;
 
 	/* Check no-orphans flag and skip this if no orphans */
 	if (c->no_orphs)
 		return 0;
 
+	buf = __vmalloc(c->leb_size, GFP_KERNEL | GFP_NOFS, PAGE_KERNEL);
+	if (!buf) {
+		ubifs_err("cannot allocate memory to check orphans");
+		return 0;
+	}
+
 	for (lnum = c->orph_first; lnum <= c->orph_last; lnum++) {
 		struct ubifs_scan_leb *sleb;
 
-		sleb = ubifs_scan(c, lnum, 0, c->dbg->buf, 0);
+		sleb = ubifs_scan(c, lnum, 0, buf, 0);
 		if (IS_ERR(sleb)) {
 			err = PTR_ERR(sleb);
 			break;
@@ -912,6 +919,7 @@ static int dbg_scan_orphans(struct ubifs_info *c, struct check_info *ci)
 			break;
 	}
 
+	vfree(buf);
 	return err;
 }
 
-- 
1.7.2.3
