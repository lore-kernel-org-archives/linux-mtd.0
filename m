Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUb71-0002Ob-B1
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 09:01:12 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p5990wEU028399
	for <linux-mtd@lists.infradead.org>; Thu, 9 Jun 2011 12:01:10 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 30/30] UBIFS: improve power cut emulation testing
Date: Thu,  9 Jun 2011 12:05:10 +0300
Message-Id: <1307610310-28691-31-git-send-email-dedekind1@gmail.com>
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

This patch cleans-up and improves the power cut testing:

1. Kill custom 'simple_random()' function and use 'random32()' instead.
2. Make timeout larger
3. When cutting the buffer - fill the end with random data sometimes, not
   only with 0xFFs.
4. Some times cut in the middle of the buffer, not always at the end.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.c |   91 +++++++++++++++++++++++++++++------------------------
 1 files changed, 50 insertions(+), 41 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index be45d62..48b6369 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -27,11 +27,12 @@
  * various local functions of those subsystems.
  */
 
-#include "ubifs.h"
 #include <linux/module.h>
 #include <linux/debugfs.h>
 #include <linux/math64.h>
 #include <linux/uaccess.h>
+#include <linux/random.h>
+#include "ubifs.h"
 
 #ifdef CONFIG_UBIFS_FS_DEBUG
 
@@ -2535,17 +2536,10 @@ error_dump:
 	return 0;
 }
 
-/* Failure mode for recovery testing */
-
-#define chance(n, d) (simple_rand() <= (n) * 32768LL / (d))
-
-static unsigned int next;
-static int simple_rand(void)
+static inline int chance(unsigned int n, unsigned int out_of)
 {
-	if (next == 0)
-		next = current->pid;
-	next = next * 1103515245 + 12345;
-	return (next >> 16) & 32767;
+	return !!((random32() % out_of) + 1 <= n);
+
 }
 
 static int power_cut_emulated(struct ubifs_info *c, int lnum, int write)
@@ -2557,33 +2551,37 @@ static int power_cut_emulated(struct ubifs_info *c, int lnum, int write)
 	if (!d->pc_cnt) {
 		/* First call - decide delay to the power cut */
 		if (chance(1, 2)) {
-			unsigned int delay = 1 << (simple_rand() >> 11);
+			unsigned long delay;
 
 			if (chance(1, 2)) {
 				d->pc_delay = 1;
-				d->pc_timeout = jiffies +
-						  msecs_to_jiffies(delay);
-				ubifs_warn("failing after %ums", delay);
+				/* Fail withing 1 minute */
+				delay = random32() % 60000;
+				d->pc_timeout = jiffies;
+				d->pc_timeout += msecs_to_jiffies(delay);
+				ubifs_warn("failing after %lums", delay);
 			} else {
 				d->pc_delay = 2;
+				delay = random32() % 10000;
+				/* Fail within 10000 operations */
 				d->pc_cnt_max = delay;
-				ubifs_warn("failing after %u calls", delay);
+				ubifs_warn("failing after %lu calls", delay);
 			}
 		}
+
 		d->pc_cnt += 1;
 	}
+
 	/* Determine if failure delay has expired */
-	if (d->pc_delay == 1) {
-		if (time_before(jiffies, d->pc_timeout))
+	if (d->pc_delay == 1 && time_before(jiffies, d->pc_timeout))
 			return 0;
-	} else if (d->pc_delay == 2)
-		if (d->pc_cnt++ < d->pc_cnt_max)
+	if (d->pc_delay == 2 && d->pc_cnt++ < d->pc_cnt_max)
 			return 0;
+
 	if (lnum == UBIFS_SB_LNUM) {
-		if (write) {
-			if (chance(1, 2))
-				return 0;
-		} else if (chance(19, 20))
+		if (write && chance(1, 2))
+			return 0;
+		if (chance(19, 20))
 			return 0;
 		ubifs_warn("failing in super block LEB %d", lnum);
 	} else if (lnum == UBIFS_MST_LNUM || lnum == UBIFS_MST_LNUM + 1) {
@@ -2591,24 +2589,21 @@ static int power_cut_emulated(struct ubifs_info *c, int lnum, int write)
 			return 0;
 		ubifs_warn("failing in master LEB %d", lnum);
 	} else if (lnum >= UBIFS_LOG_LNUM && lnum <= c->log_last) {
-		if (write) {
-			if (chance(99, 100))
-				return 0;
-		} else if (chance(399, 400))
+		if (write && chance(99, 100))
+			return 0;
+		if (chance(399, 400))
 			return 0;
 		ubifs_warn("failing in log LEB %d", lnum);
 	} else if (lnum >= c->lpt_first && lnum <= c->lpt_last) {
-		if (write) {
-			if (chance(7, 8))
-				return 0;
-		} else if (chance(19, 20))
+		if (write && chance(7, 8))
+			return 0;
+		if (chance(19, 20))
 			return 0;
 		ubifs_warn("failing in LPT LEB %d", lnum);
 	} else if (lnum >= c->orph_first && lnum <= c->orph_last) {
-		if (write) {
-			if (chance(1, 2))
-				return 0;
-		} else if (chance(9, 10))
+		if (write && chance(1, 2))
+			return 0;
+		if (chance(9, 10))
 			return 0;
 		ubifs_warn("failing in orphan LEB %d", lnum);
 	} else if (lnum == c->ihead_lnum) {
@@ -2636,18 +2631,32 @@ static int power_cut_emulated(struct ubifs_info *c, int lnum, int write)
 	}
 
 	d->pc_happened = 1;
+	ubifs_warn("========== Power cut emulated ==========");
 	dump_stack();
 	return 1;
 }
 
-static void cut_data(const void *buf, int len)
+static void cut_data(const void *buf, unsigned int len)
 {
-	int flen, i;
+	unsigned int from, to, i, ffs = chance(1, 2);
 	unsigned char *p = (void *)buf;
 
-	flen = (len * (long long)simple_rand()) >> 15;
-	for (i = flen; i < len; i++)
-		p[i] = 0xff;
+	from = random32() % (len + 1);
+	if (chance(1, 2))
+		to = random32() % (len - from + 1);
+	else
+		to = len;
+
+	if (from < to)
+		ubifs_warn("filled bytes %u-%u with %s", from, to - 1,
+			   ffs ? "0xFFs" : "random data");
+
+	if (ffs)
+		for (i = from; i < to; i++)
+			p[i] = 0xFF;
+	else
+		for (i = from; i < to; i++)
+			p[i] = random32() % 0x100;
 }
 
 int dbg_leb_write(struct ubifs_info *c, int lnum, const void *buf,
-- 
1.7.2.3
