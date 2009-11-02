Received: from mba.ocn.ne.jp ([122.28.14.163] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N4y5V-0003yO-Pr
	for linux-mtd@lists.infradead.org; Mon, 02 Nov 2009 14:40:58 +0000
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] txx9ndfmc: Use nand_release() to free resources
Date: Mon,  2 Nov 2009 23:40:48 +0900
Message-Id: <1257172848-6282-1-git-send-email-anemo@mba.ocn.ne.jp>
Cc: dwmw2@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch fixes memory leak on chip->bbt and chip->buffers.

Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
---
 drivers/mtd/nand/txx9ndfmc.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/txx9ndfmc.c b/drivers/mtd/nand/txx9ndfmc.c
index 73af832..863513c 100644
--- a/drivers/mtd/nand/txx9ndfmc.c
+++ b/drivers/mtd/nand/txx9ndfmc.c
@@ -429,11 +429,10 @@ static int __exit txx9ndfmc_remove(struct platform_device *dev)
 		chip = mtd->priv;
 		txx9_priv = chip->priv;
 
+		nand_release(mtd);
 #ifdef CONFIG_MTD_PARTITIONS
-		del_mtd_partitions(mtd);
 		kfree(drvdata->parts[i]);
 #endif
-		del_mtd_device(mtd);
 		kfree(txx9_priv->mtdname);
 		kfree(txx9_priv);
 	}
-- 
1.5.6.5
