Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XTsqZ-0004tG-8Y
 for linux-mtd@lists.infradead.org; Tue, 16 Sep 2014 13:31:07 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 2/2] UBIFS: Fix trivial typo in power_cut_emulated()
Date: Tue, 16 Sep 2014 15:30:36 +0200
Message-Id: <1410874236-3125-3-git-send-email-richard@nod.at>
In-Reply-To: <1410874236-3125-1-git-send-email-richard@nod.at>
References: <1410874236-3125-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

s/withing/within/

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 177b015..b439e84 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -2462,7 +2462,7 @@ static int power_cut_emulated(struct ubifs_info *c, int lnum, int write)
 
 			if (chance(1, 2)) {
 				d->pc_delay = 1;
-				/* Fail withing 1 minute */
+				/* Fail within 1 minute */
 				delay = prandom_u32() % 60000;
 				d->pc_timeout = jiffies;
 				d->pc_timeout += msecs_to_jiffies(delay);
-- 
1.8.4.5
