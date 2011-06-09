Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUb6w-0002VF-RR
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 09:01:18 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p5990wEH028399
	for <linux-mtd@lists.infradead.org>; Thu, 9 Jun 2011 12:01:05 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 17/30] UBIFS: be more informative in failure mode
Date: Thu,  9 Jun 2011 12:04:57 +0300
Message-Id: <1307610310-28691-18-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1307610310-28691-1-git-send-email-dedekind1@gmail.com>
References: <1307610310-28691-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

When we are testing UBIFS recovery, it is better to print in which eraseblock
we are going to fail. Currently UBIFS prints it only if recovery debugging
messages are enabled, but this is not very practical. So change 'dbg_rcvry()'
messages to 'ubifs_warn()' messages.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.c |   26 +++++++++++++-------------
 1 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index fdfa5de..05fae3f 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -2631,11 +2631,11 @@ static int do_fail(struct ubi_volume_desc *desc, int lnum, int write)
 				d->fail_delay = 1;
 				d->fail_timeout = jiffies +
 						  msecs_to_jiffies(delay);
-				dbg_rcvry("failing after %ums", delay);
+				ubifs_warn("failing after %ums", delay);
 			} else {
 				d->fail_delay = 2;
 				d->fail_cnt_max = delay;
-				dbg_rcvry("failing after %u calls", delay);
+				ubifs_warn("failing after %u calls", delay);
 			}
 		}
 		d->fail_cnt += 1;
@@ -2653,56 +2653,56 @@ static int do_fail(struct ubi_volume_desc *desc, int lnum, int write)
 				return 0;
 		} else if (chance(19, 20))
 			return 0;
-		dbg_rcvry("failing in super block LEB %d", lnum);
+		ubifs_warn("failing in super block LEB %d", lnum);
 	} else if (lnum == UBIFS_MST_LNUM || lnum == UBIFS_MST_LNUM + 1) {
 		if (chance(19, 20))
 			return 0;
-		dbg_rcvry("failing in master LEB %d", lnum);
+		ubifs_warn("failing in master LEB %d", lnum);
 	} else if (lnum >= UBIFS_LOG_LNUM && lnum <= c->log_last) {
 		if (write) {
 			if (chance(99, 100))
 				return 0;
 		} else if (chance(399, 400))
 			return 0;
-		dbg_rcvry("failing in log LEB %d", lnum);
+		ubifs_warn("failing in log LEB %d", lnum);
 	} else if (lnum >= c->lpt_first && lnum <= c->lpt_last) {
 		if (write) {
 			if (chance(7, 8))
 				return 0;
 		} else if (chance(19, 20))
 			return 0;
-		dbg_rcvry("failing in LPT LEB %d", lnum);
+		ubifs_warn("failing in LPT LEB %d", lnum);
 	} else if (lnum >= c->orph_first && lnum <= c->orph_last) {
 		if (write) {
 			if (chance(1, 2))
 				return 0;
 		} else if (chance(9, 10))
 			return 0;
-		dbg_rcvry("failing in orphan LEB %d", lnum);
+		ubifs_warn("failing in orphan LEB %d", lnum);
 	} else if (lnum == c->ihead_lnum) {
 		if (chance(99, 100))
 			return 0;
-		dbg_rcvry("failing in index head LEB %d", lnum);
+		ubifs_warn("failing in index head LEB %d", lnum);
 	} else if (c->jheads && lnum == c->jheads[GCHD].wbuf.lnum) {
 		if (chance(9, 10))
 			return 0;
-		dbg_rcvry("failing in GC head LEB %d", lnum);
+		ubifs_warn("failing in GC head LEB %d", lnum);
 	} else if (write && !RB_EMPTY_ROOT(&c->buds) &&
 		   !ubifs_search_bud(c, lnum)) {
 		if (chance(19, 20))
 			return 0;
-		dbg_rcvry("failing in non-bud LEB %d", lnum);
+		ubifs_warn("failing in non-bud LEB %d", lnum);
 	} else if (c->cmt_state == COMMIT_RUNNING_BACKGROUND ||
 		   c->cmt_state == COMMIT_RUNNING_REQUIRED) {
 		if (chance(999, 1000))
 			return 0;
-		dbg_rcvry("failing in bud LEB %d commit running", lnum);
+		ubifs_warn("failing in bud LEB %d commit running", lnum);
 	} else {
 		if (chance(9999, 10000))
 			return 0;
-		dbg_rcvry("failing in bud LEB %d commit not running", lnum);
+		ubifs_warn("failing in bud LEB %d commit not running", lnum);
 	}
-	ubifs_err("*** SETTING FAILURE MODE ON (LEB %d) ***", lnum);
+
 	d->failure_mode = 1;
 	dump_stack();
 	return 1;
-- 
1.7.2.3
