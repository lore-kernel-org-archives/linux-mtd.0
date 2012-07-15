Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SqKJq-0002zz-Jh
 for linux-mtd@lists.infradead.org; Sun, 15 Jul 2012 08:36:49 +0000
Received: by lbbgg6 with SMTP id gg6so6577614lbb.36
 for <linux-mtd@lists.infradead.org>; Sun, 15 Jul 2012 01:36:36 -0700 (PDT)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: James Nute <newten82@gmail.com>,
 Iwo Mergler <Iwo.Mergler@netcommwireless.com>
Subject: [PATCH 2/2] UBIFS: simplify reply code a bit
Date: Sun, 15 Jul 2012 11:30:51 +0300
Message-Id: <1342341051-30369-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1342341051-30369-1-git-send-email-dedekind1@gmail.com>
References: <1342341051-30369-1-git-send-email-dedekind1@gmail.com>
Cc: Ben Gardiner <bengardiner@nanometrics.ca>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>

In the log reply code we assume that 'c->lhead_offs' is known and may be
non-zero, which is not the case because we do not store it in the master
node and have to find out by scanning on every mount. Knowing this fact
allows us to simplify the log scanning loop a bit and remove a couple
of unneeded local variables.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>
---
 fs/ubifs/replay.c |   20 ++++++--------------
 1 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index 3a2da7e..eba46d4 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -1007,7 +1007,7 @@ out:
  */
 int ubifs_replay_journal(struct ubifs_info *c)
 {
-	int err, i, lnum, offs, free;
+	int err, lnum, free;
 
 	BUILD_BUG_ON(UBIFS_TRUN_KEY > 5);
 
@@ -1025,25 +1025,17 @@ int ubifs_replay_journal(struct ubifs_info *c)
 	dbg_mnt("start replaying the journal");
 	c->replaying = 1;
 	lnum = c->ltail_lnum = c->lhead_lnum;
-	offs = c->lhead_offs;
 
-	for (i = 0; i < c->log_lebs; i++, lnum++) {
-		if (lnum >= UBIFS_LOG_LNUM + c->log_lebs) {
-			/*
-			 * The log is logically circular, we reached the last
-			 * LEB, switch to the first one.
-			 */
-			lnum = UBIFS_LOG_LNUM;
-			offs = 0;
-		}
-		err = replay_log_leb(c, lnum, offs, c->sbuf);
+	lnum = UBIFS_LOG_LNUM;
+	do {
+		err = replay_log_leb(c, lnum, 0, c->sbuf);
 		if (err == 1)
 			/* We hit the end of the log */
 			break;
 		if (err)
 			goto out;
-		offs = 0;
-	}
+		lnum = ubifs_next_log_lnum(c, lnum);
+	} while (lnum != UBIFS_LOG_LNUM);
 
 	err = replay_buds(c);
 	if (err)
-- 
1.7.7.6
