Received: from ns.vscht.cz ([2001:718:3:15::5])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q8kQ2-0007on-2v
	for linux-mtd@lists.infradead.org; Sun, 10 Apr 2011 02:30:31 +0000
From: <jiri.pinkava@vscht.cz>
To: <dwmw2@infradead.org>
Subject: [PATCH] nand: Remove meaningless delay from nand_unlock
Date: Sun, 10 Apr 2011 04:30:11 +0200
Message-ID: <1302402611-3878-1-git-send-email-jiri.pinkava@vscht.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: sjhill@realitydiluted.com, tglx@linutronix.de,
	=?UTF-8?q?Ji=C5=99=C3=AD=20Pinkava?= <jiri.pinkava@vscht.cz>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Jiří Pinkava <jiri.pinkava@vscht.cz>

This delay is meaningless. If delay is needed it is device specific
and must be reimplemented by specific driver, otherwise no delay is needed.

This function is not used by any current kernel code, affects only
external code (like main).

Signed-off-by: Jiri Pinkava <jiri.pinkava@vscht.cz>
---
 drivers/mtd/nand/nand_base.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 2aef58e..5b5aff5 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -922,7 +922,6 @@ static int __nand_unlock(struct mtd_info *mtd, loff_t ofs,
 
 	/* Call wait ready function */
 	status = chip->waitfunc(mtd, chip);
-	udelay(1000);
 	/* See if device thinks it succeeded */
 	if (status & 0x01) {
 		DEBUG(MTD_DEBUG_LEVEL0, "%s: Error status = 0x%08x\n",
-- 
1.7.4.4
