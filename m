Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y48CP-0002Hb-4K
 for linux-mtd@lists.infradead.org; Thu, 25 Dec 2014 13:11:29 +0000
Message-ID: <549C0CC4.9050703@huawei.com>
Date: Thu, 25 Dec 2014 21:10:28 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH RFC 2/2] UBIFS: scan all log lebs during log replay
References: <549C0A10.3000201@huawei.com>
In-Reply-To: <549C0A10.3000201@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>, shengyong1@huawei.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

UBIFS suppose no more log lebs need to be scanned when
replay_log_leb() return %1. But it is not true because
some log lebs maybe incorrectly empty and the next leb
of this empty one may contain valid filesystem data.

This patch scan all the log lebs during log replaying
to guarantee these log lebs are in normal state.

I'm not sure if it is a valuable problem and don't know
if this patch gives a good way to solve this problem
either.

Signed-off-by: hujianyang <hujianyang@huawei.com>
---
 fs/ubifs/replay.c |   23 +++++++++++++++++++----
 1 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index f13f4b2..5537b90 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -1014,7 +1014,7 @@ out:
  */
 int ubifs_replay_journal(struct ubifs_info *c)
 {
-	int err, lnum, free;
+	int err, lnum, free, end;

 	BUILD_BUG_ON(UBIFS_TRUN_KEY > 5);

@@ -1032,13 +1032,28 @@ int ubifs_replay_journal(struct ubifs_info *c)
 	dbg_mnt("start replaying the journal");
 	c->replaying = 1;
 	lnum = c->ltail_lnum = c->lhead_lnum;
+	end = 0;

 	do {
 		err = replay_log_leb(c, lnum, 0, c->sbuf);
-		if (err == 1)
+
+		/*
+		 * If @end is set, residual log lebs should be empty or
+		 * contain older ref_nodes. replay_log_leb() must return %1.
+		 */
+		if (unlikely(!err && end)) {
+			ubifs_err("LEB %d is valid but considered to be empty",
+				  lnum);
+			err = -EINVAL;
+			goto out;
+		}
+
+		if (err == 1 && !end) {
 			/* We hit the end of the log */
-			break;
-		if (err)
+			end = 1;
+		}
+
+		if (err < 0)
 			goto out;
 		lnum = ubifs_next_log_lnum(c, lnum);
 	} while (lnum != c->ltail_lnum);
-- 
1.6.0.2
