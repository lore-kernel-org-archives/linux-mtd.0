Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUb71-0002Oa-0S
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 09:01:12 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p5990wET028399
	for <linux-mtd@lists.infradead.org>; Thu, 9 Jun 2011 12:01:10 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 29/30] UBIFS: rename recovery testing variables
Date: Thu,  9 Jun 2011 12:05:09 +0300
Message-Id: <1307610310-28691-30-git-send-email-dedekind1@gmail.com>
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

Since the recovery testing is effectively about emulating power cuts by UBIFS,
use "power cut" as the base term for all the related variables and name them
correspondingly. This is just a minor clean-up for the sake of readability.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.c |   52 ++++++++++++++++++++++++++++------------------------
 fs/ubifs/debug.h |   22 +++++++++++-----------
 2 files changed, 39 insertions(+), 35 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index a0e0c95..be45d62 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -2548,39 +2548,36 @@ static int simple_rand(void)
 	return (next >> 16) & 32767;
 }
 
-static int do_fail(struct ubifs_info *c, int lnum, int write)
+static int power_cut_emulated(struct ubifs_info *c, int lnum, int write)
 {
 	struct ubifs_debug_info *d = c->dbg;
 
 	ubifs_assert(dbg_is_tst_rcvry(c));
 
-	if (d->failure_mode)
-		return 1;
-
-	if (!d->fail_cnt) {
-		/* First call - decide delay to failure */
+	if (!d->pc_cnt) {
+		/* First call - decide delay to the power cut */
 		if (chance(1, 2)) {
 			unsigned int delay = 1 << (simple_rand() >> 11);
 
 			if (chance(1, 2)) {
-				d->fail_delay = 1;
-				d->fail_timeout = jiffies +
+				d->pc_delay = 1;
+				d->pc_timeout = jiffies +
 						  msecs_to_jiffies(delay);
 				ubifs_warn("failing after %ums", delay);
 			} else {
-				d->fail_delay = 2;
-				d->fail_cnt_max = delay;
+				d->pc_delay = 2;
+				d->pc_cnt_max = delay;
 				ubifs_warn("failing after %u calls", delay);
 			}
 		}
-		d->fail_cnt += 1;
+		d->pc_cnt += 1;
 	}
 	/* Determine if failure delay has expired */
-	if (d->fail_delay == 1) {
-		if (time_before(jiffies, d->fail_timeout))
+	if (d->pc_delay == 1) {
+		if (time_before(jiffies, d->pc_timeout))
 			return 0;
-	} else if (d->fail_delay == 2)
-		if (d->fail_cnt++ < d->fail_cnt_max)
+	} else if (d->pc_delay == 2)
+		if (d->pc_cnt++ < d->pc_cnt_max)
 			return 0;
 	if (lnum == UBIFS_SB_LNUM) {
 		if (write) {
@@ -2638,7 +2635,7 @@ static int do_fail(struct ubifs_info *c, int lnum, int write)
 		ubifs_warn("failing in bud LEB %d commit not running", lnum);
 	}
 
-	d->failure_mode = 1;
+	d->pc_happened = 1;
 	dump_stack();
 	return 1;
 }
@@ -2658,9 +2655,10 @@ int dbg_leb_write(struct ubifs_info *c, int lnum, const void *buf,
 {
 	int err, failing;
 
-	if (c->dbg->failure_mode)
+	if (c->dbg->pc_happened)
 		return -EROFS;
-	failing = do_fail(c, lnum, 1);
+
+	failing = power_cut_emulated(c, lnum, 1);
 	if (failing)
 		cut_data(buf, len);
 	err = ubi_leb_write(c->ubi, lnum, buf, offs, len, dtype);
@@ -2676,12 +2674,14 @@ int dbg_leb_change(struct ubifs_info *c, int lnum, const void *buf,
 {
 	int err;
 
-	if (do_fail(c, lnum, 1))
+	if (c->dbg->pc_happened)
+		return -EROFS;
+	if (power_cut_emulated(c, lnum, 1))
 		return -EROFS;
 	err = ubi_leb_change(c->ubi, lnum, buf, len, dtype);
 	if (err)
 		return err;
-	if (do_fail(c, lnum, 1))
+	if (power_cut_emulated(c, lnum, 1))
 		return -EROFS;
 	return 0;
 }
@@ -2690,12 +2690,14 @@ int dbg_leb_unmap(struct ubifs_info *c, int lnum)
 {
 	int err;
 
-	if (do_fail(c, lnum, 0))
+	if (c->dbg->pc_happened)
+		return -EROFS;
+	if (power_cut_emulated(c, lnum, 0))
 		return -EROFS;
 	err = ubi_leb_unmap(c->ubi, lnum);
 	if (err)
 		return err;
-	if (do_fail(c, lnum, 0))
+	if (power_cut_emulated(c, lnum, 0))
 		return -EROFS;
 	return 0;
 }
@@ -2704,12 +2706,14 @@ int dbg_leb_map(struct ubifs_info *c, int lnum, int dtype)
 {
 	int err;
 
-	if (do_fail(c, lnum, 0))
+	if (c->dbg->pc_happened)
+		return -EROFS;
+	if (power_cut_emulated(c, lnum, 0))
 		return -EROFS;
 	err = ubi_leb_map(c->ubi, lnum, dtype);
 	if (err)
 		return err;
-	if (do_fail(c, lnum, 0))
+	if (power_cut_emulated(c, lnum, 0))
 		return -EROFS;
 	return 0;
 }
diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index 0ab3757..45174b5 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -44,11 +44,11 @@ typedef int (*dbg_znode_callback)(struct ubifs_info *c,
  * @old_zroot_level: old index root level - used by 'dbg_check_old_index()'
  * @old_zroot_sqnum: old index root sqnum - used by 'dbg_check_old_index()'
  *
- * @failure_mode: failure mode for recovery testing
- * @fail_delay: 0=>don't delay, 1=>delay a time, 2=>delay a number of calls
- * @fail_timeout: time in jiffies when delay of failure mode expires
- * @fail_cnt: current number of calls to failure mode I/O functions
- * @fail_cnt_max: number of calls by which to delay failure mode
+ * @pc_happened: non-zero if an emulated power cut happened
+ * @pc_delay: 0=>don't delay, 1=>delay a time, 2=>delay a number of calls
+ * @pc_timeout: time in jiffies when delay of failure mode expires
+ * @pc_cnt: current number of calls to failure mode I/O functions
+ * @pc_cnt_max: number of calls by which to delay failure mode
  *
  * @chk_lpt_sz: used by LPT tree size checker
  * @chk_lpt_sz2: used by LPT tree size checker
@@ -87,11 +87,11 @@ struct ubifs_debug_info {
 	int old_zroot_level;
 	unsigned long long old_zroot_sqnum;
 
-	int failure_mode;
-	int fail_delay;
-	unsigned long fail_timeout;
-	unsigned int fail_cnt;
-	unsigned int fail_cnt_max;
+	int pc_happened;
+	int pc_delay;
+	unsigned long pc_timeout;
+	unsigned int pc_cnt;
+	unsigned int pc_cnt_max;
 
 	long long chk_lpt_sz;
 	long long chk_lpt_sz2;
@@ -246,7 +246,7 @@ static inline int dbg_is_tst_rcvry(const struct ubifs_info *c)
 }
 static inline int dbg_is_power_cut(const struct ubifs_info *c)
 {
-	return !!c->dbg->failure_mode;
+	return !!c->dbg->pc_happened;
 }
 
 int ubifs_debugging_init(struct ubifs_info *c);
-- 
1.7.2.3
