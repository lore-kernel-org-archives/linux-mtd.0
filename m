Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T3mHl-0006js-L4
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2012 11:06:14 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: [PATCH 3/3] UBIFS: fix replay regression
Date: Tue, 21 Aug 2012 14:06:00 +0300
Message-Id: <1345547160-31958-4-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1345547160-31958-1-git-send-email-dedekind1@gmail.com>
References: <1345547160-31958-1-git-send-email-dedekind1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Commit "d51f17e UBIFS: simplify reply code a bit" introduces a bug with the
following symptoms:

UBIFS error (pid 1): replay_log_leb: first CS node at LEB 3:0 has wrong commit number 0 expected 1

The issue is that we start replaying the log from UBIFS_LOG_LNUM instead
of c->lhead_lnum. This patch fixes that.

Reported-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/ubifs/replay.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index eba46d4..94d78fc 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -1026,7 +1026,6 @@ int ubifs_replay_journal(struct ubifs_info *c)
 	c->replaying = 1;
 	lnum = c->ltail_lnum = c->lhead_lnum;
 
-	lnum = UBIFS_LOG_LNUM;
 	do {
 		err = replay_log_leb(c, lnum, 0, c->sbuf);
 		if (err == 1)
@@ -1035,7 +1034,7 @@ int ubifs_replay_journal(struct ubifs_info *c)
 		if (err)
 			goto out;
 		lnum = ubifs_next_log_lnum(c, lnum);
-	} while (lnum != UBIFS_LOG_LNUM);
+	} while (lnum != c->ltail_lnum);
 
 	err = replay_buds(c);
 	if (err)
-- 
1.7.7.6
