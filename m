Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pz8ze-0000nH-8r
	for linux-mtd@lists.infradead.org; Mon, 14 Mar 2011 14:43:35 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2EEhTfj004506
	for <linux-mtd@lists.infradead.org>; Mon, 14 Mar 2011 16:43:29 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
Subject: [PATCH 1/6] UBIFS: allocate dump buffer on demand
Date: Mon, 14 Mar 2011 16:46:07 +0200
Message-Id: <1300113972-4507-2-git-send-email-dedekind1@gmail.com>
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
'dbg_dump_leb()', dynamically allocate it when needed. The intend
is to get rid of the pre-allocated 'c->dbg->buf' buffer and save
128KiB of RAM (or more if PEB size is larger). Indeed, currently we
allocate this memory even if the user never enables any self-check,
which is wasteful.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.c |   15 +++++++++++++--
 1 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 02c10dc..c2e5c08 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -810,16 +810,24 @@ void dbg_dump_leb(const struct ubifs_info *c, int lnum)
 {
 	struct ubifs_scan_leb *sleb;
 	struct ubifs_scan_node *snod;
+	void *buf;
 
 	if (dbg_failure_mode)
 		return;
 
 	printk(KERN_DEBUG "(pid %d) start dumping LEB %d\n",
 	       current->pid, lnum);
-	sleb = ubifs_scan(c, lnum, 0, c->dbg->buf, 0);
+
+	buf = __vmalloc(c->leb_size, GFP_KERNEL | GFP_NOFS, PAGE_KERNEL);
+	if (!buf) {
+		ubifs_err("cannot allocate memory for dumping LEB %d", lnum);
+		return;
+	}
+
+	sleb = ubifs_scan(c, lnum, 0, buf, 0);
 	if (IS_ERR(sleb)) {
 		ubifs_err("scan error %d", (int)PTR_ERR(sleb));
-		return;
+		goto out;
 	}
 
 	printk(KERN_DEBUG "LEB %d has %d nodes ending at %d\n", lnum,
@@ -835,6 +843,9 @@ void dbg_dump_leb(const struct ubifs_info *c, int lnum)
 	printk(KERN_DEBUG "(pid %d) finish dumping LEB %d\n",
 	       current->pid, lnum);
 	ubifs_scan_destroy(sleb);
+
+out:
+	vfree(buf);
 	return;
 }
 
-- 
1.7.2.3
