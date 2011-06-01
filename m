Received: from ns.vscht.cz ([2001:718:3:15::5])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QRlvG-0004iI-Jl
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2011 13:57:23 +0000
From: <jiri.pinkava@vscht.cz>
To: <dedekind1@gmail.com>
Subject: [PATCH] nand: Remove meaningless delay from nand_unlock
Date: Wed, 1 Jun 2011 15:56:40 +0200
Message-ID: <1306936600-28870-1-git-send-email-jiri.pinkava@vscht.cz>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, Jiri Pinkava <jiri.pinkava@vscht.cz>,
	dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Jiri Pinkava <jiri.pinkava@vscht.cz>

This delay is meaningless. If delay is needed it is device specific
and must be reimplemented by specific driver, otherwise no delay is
needed.

This function is not used by any current kernel code, affects only
external code (like main).

Signed-off-by: Jiri Pinkava <jiri.pinkava@vscht.cz>
---
 drivers/mtd/nand/nand_base.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index a46e9bb..290a1db 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -919,7 +919,6 @@ static int __nand_unlock(struct mtd_info *mtd, loff_t ofs,
 
 	/* Call wait ready function */
 	status = chip->waitfunc(mtd, chip);
-	udelay(1000);
 	/* See if device thinks it succeeded */
 	if (status & 0x01) {
 		DEBUG(MTD_DEBUG_LEVEL0, "%s: Error status = 0x%08x\n",
@@ -1028,7 +1027,6 @@ int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 
 	/* Call wait ready function */
 	status = chip->waitfunc(mtd, chip);
-	udelay(1000);
 	/* See if device thinks it succeeded */
 	if (status & 0x01) {
 		DEBUG(MTD_DEBUG_LEVEL0, "%s: Error status = 0x%08x\n",
-- 
1.7.5.2
