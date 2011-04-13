Received: from ns.vscht.cz ([2001:718:3:15::5])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9xIW-00012b-Nl
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 10:27:45 +0000
From: Jiri Pinkava <jiri.pinkava@vscht.cz>
To: <dedekind1@gmail.com>
Subject: [PATCH] nand: Remove doubled chip deselection on (un)lock
Date: Wed, 13 Apr 2011 12:26:48 +0200
Message-ID: <1302690408-17498-1-git-send-email-jiri.pinkava@vscht.cz>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, Jiri Pinkava <jiri.pinkava@vscht.cz>,
	dwmw2@infradead.org, ben-linux@fluff.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Chip deselection is already done in nand_release_device. So only
duplicate code.

Signed-off-by: Jiri Pinkava <jiri.pinkava@vscht.cz>
---
 drivers/mtd/nand/nand_base.c |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index c54a4cb..bc1c2e6 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -976,9 +976,6 @@ int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	ret = __nand_unlock(mtd, ofs, len, 0);
 
 out:
-	/* de-select the NAND device */
-	chip->select_chip(mtd, -1);
-
 	nand_release_device(mtd);
 
 	return ret;
@@ -1046,9 +1043,6 @@ int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	ret = __nand_unlock(mtd, ofs, len, 0x1);
 
 out:
-	/* de-select the NAND device */
-	chip->select_chip(mtd, -1);
-
 	nand_release_device(mtd);
 
 	return ret;
-- 
1.7.4.4
