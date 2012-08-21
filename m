Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T3mHi-0006js-Rg
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2012 11:06:12 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: [PATCH 2/3] UBIFS: fix error error path
Date: Tue, 21 Aug 2012 14:05:59 +0300
Message-Id: <1345547160-31958-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1345547160-31958-1-git-send-email-dedekind1@gmail.com>
References: <1345547160-31958-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

This patch fixes a regression introduced by
"4994297 UBIFS: make ubifs_lpt_init clean-up in case of failure" which
I've hit while running the 'integck -p' test. When remount the file-system
from R/O mode to R/W mode and 'lpt_init_wr()' fails, we free _all_ LPT
resources by calling 'ubifs_lpt_free(c, 0)', even those needed for R/O
mode. This leads to subsequent crashes, e.g., if we try to unmount
the file-system.

Cc: stable@vger.kernel.org [v3.5+]
Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/ubifs/lpt.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
index ce33b2b..8640920 100644
--- a/fs/ubifs/lpt.c
+++ b/fs/ubifs/lpt.c
@@ -1749,7 +1749,10 @@ int ubifs_lpt_init(struct ubifs_info *c, int rd, int wr)
 	return 0;
 
 out_err:
-	ubifs_lpt_free(c, 0);
+	if (wr)
+		ubifs_lpt_free(c, 1);
+	if (rd)
+		ubifs_lpt_free(c, 0);
 	return err;
 }
 
-- 
1.7.7.6
