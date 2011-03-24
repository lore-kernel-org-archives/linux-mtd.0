Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q2lQs-0000Pq-D6
	for linux-mtd@lists.infradead.org; Thu, 24 Mar 2011 14:22:40 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2OEMart031540
	for <linux-mtd@lists.infradead.org>; Thu, 24 Mar 2011 16:22:36 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] UBIFS: use GFP_NOFS properly
Date: Thu, 24 Mar 2011 16:25:17 +0200
Message-Id: <1300976717-396-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1300976717-396-1-git-send-email-dedekind1@gmail.com>
References: <1300976717-396-1-git-send-email-dedekind1@gmail.com>
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

This patch fixes a brown-paperbag bug which was introduced by me:
I used incorrect "GFP_KERNEL | GFP_NOFS" allocation flags to make
sure my allocations do not cause write-back. But the correct form
is "GFP_NOFS".

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.c      |    2 +-
 fs/ubifs/lprops.c     |    2 +-
 fs/ubifs/lpt_commit.c |    4 ++--
 fs/ubifs/orphan.c     |    2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 01c2b02..f25a733 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -818,7 +818,7 @@ void dbg_dump_leb(const struct ubifs_info *c, int lnum)
 	printk(KERN_DEBUG "(pid %d) start dumping LEB %d\n",
 	       current->pid, lnum);
 
-	buf = __vmalloc(c->leb_size, GFP_KERNEL | GFP_NOFS, PAGE_KERNEL);
+	buf = __vmalloc(c->leb_size, GFP_NOFS, PAGE_KERNEL);
 	if (!buf) {
 		ubifs_err("cannot allocate memory for dumping LEB %d", lnum);
 		return;
diff --git a/fs/ubifs/lprops.c b/fs/ubifs/lprops.c
index c7b25e2..0ee0847 100644
--- a/fs/ubifs/lprops.c
+++ b/fs/ubifs/lprops.c
@@ -1094,7 +1094,7 @@ static int scan_check_cb(struct ubifs_info *c,
 		}
 	}
 
-	buf = __vmalloc(c->leb_size, GFP_KERNEL | GFP_NOFS, PAGE_KERNEL);
+	buf = __vmalloc(c->leb_size, GFP_NOFS, PAGE_KERNEL);
 	if (!buf) {
 		ubifs_err("cannot allocate memory to scan LEB %d", lnum);
 		goto out;
diff --git a/fs/ubifs/lpt_commit.c b/fs/ubifs/lpt_commit.c
index 0a3c2c3..0c9c69b 100644
--- a/fs/ubifs/lpt_commit.c
+++ b/fs/ubifs/lpt_commit.c
@@ -1633,7 +1633,7 @@ static int dbg_check_ltab_lnum(struct ubifs_info *c, int lnum)
 	if (!(ubifs_chk_flags & UBIFS_CHK_LPROPS))
 		return 0;
 
-	buf = p = __vmalloc(c->leb_size, GFP_KERNEL | GFP_NOFS, PAGE_KERNEL);
+	buf = p = __vmalloc(c->leb_size, GFP_NOFS, PAGE_KERNEL);
 	if (!buf) {
 		ubifs_err("cannot allocate memory for ltab checking");
 		return 0;
@@ -1885,7 +1885,7 @@ static void dump_lpt_leb(const struct ubifs_info *c, int lnum)
 
 	printk(KERN_DEBUG "(pid %d) start dumping LEB %d\n",
 	       current->pid, lnum);
-	buf = p = __vmalloc(c->leb_size, GFP_KERNEL | GFP_NOFS, PAGE_KERNEL);
+	buf = p = __vmalloc(c->leb_size, GFP_NOFS, PAGE_KERNEL);
 	if (!buf) {
 		ubifs_err("cannot allocate memory to dump LPT");
 		return;
diff --git a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
index 2cdbd31..09df318 100644
--- a/fs/ubifs/orphan.c
+++ b/fs/ubifs/orphan.c
@@ -898,7 +898,7 @@ static int dbg_scan_orphans(struct ubifs_info *c, struct check_info *ci)
 	if (c->no_orphs)
 		return 0;
 
-	buf = __vmalloc(c->leb_size, GFP_KERNEL | GFP_NOFS, PAGE_KERNEL);
+	buf = __vmalloc(c->leb_size, GFP_NOFS, PAGE_KERNEL);
 	if (!buf) {
 		ubifs_err("cannot allocate memory to check orphans");
 		return 0;
-- 
1.7.2.3
