Received: from mail-pb0-x229.google.com ([2607:f8b0:400e:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VrMxJ-0006t4-AF
 for linux-mtd@lists.infradead.org; Fri, 13 Dec 2013 07:14:38 +0000
Received: by mail-pb0-f41.google.com with SMTP id jt11so2061274pbb.0
 for <linux-mtd@lists.infradead.org>; Thu, 12 Dec 2013 23:14:15 -0800 (PST)
Date: Fri, 13 Dec 2013 12:44:07 +0530
From: Rashika Kheria <rashika.kheria@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drivers: mtd: Mark functions as static and remove unused
 function in lpddr_cmds.c
Message-ID: <d0512c2bc35b27af33ad79d74d93ecc0f2b4e92c.1386912859.git.rashika.kheria@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 josh@joshtriplett.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch marks the functions do_write_buffer() and do_erase_oneblock()
as static because because they are not used outside this file. It also
removes the unused function word_program() in lpddr/lpddr_cmds.c.

Thus, it also removes the following warnings in lpddr/lpddr_cmds.c:
drivers/mtd/lpddr/lpddr_cmds.c:391:5: warning: no previous prototype for ‘do_write_buffer’ [-Wmissing-prototypes]
drivers/mtd/lpddr/lpddr_cmds.c:472:5: warning: no previous prototype for ‘do_erase_oneblock’ [-Wmissing-prototypes]
drivers/mtd/lpddr/lpddr_cmds.c:751:5: warning: no previous prototype for ‘word_program’ [-Wmissing-prototypes]

Signed-off-by: Rashika Kheria <rashika.kheria@gmail.com>
Reviewed-by: Josh Triplett <josh@joshtriplett.org>
---
 drivers/mtd/lpddr/lpddr_cmds.c |   32 ++------------------------------
 1 file changed, 2 insertions(+), 30 deletions(-)

diff --git a/drivers/mtd/lpddr/lpddr_cmds.c b/drivers/mtd/lpddr/lpddr_cmds.c
index 2ef19aa..d38b646 100644
--- a/drivers/mtd/lpddr/lpddr_cmds.c
+++ b/drivers/mtd/lpddr/lpddr_cmds.c
@@ -388,7 +388,7 @@ static void put_chip(struct map_info *map, struct flchip *chip)
 	wake_up(&chip->wq);
 }
 
-int do_write_buffer(struct map_info *map, struct flchip *chip,
+static int do_write_buffer(struct map_info *map, struct flchip *chip,
 			unsigned long adr, const struct kvec **pvec,
 			unsigned long *pvec_seek, int len)
 {
@@ -469,7 +469,7 @@ int do_write_buffer(struct map_info *map, struct flchip *chip,
 	return ret;
 }
 
-int do_erase_oneblock(struct mtd_info *mtd, loff_t adr)
+static int do_erase_oneblock(struct mtd_info *mtd, loff_t adr)
 {
 	struct map_info *map = mtd->priv;
 	struct lpddr_private *lpddr = map->fldrv_priv;
@@ -748,34 +748,6 @@ static int lpddr_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	return do_xxlock(mtd, ofs, len, DO_XXLOCK_UNLOCK);
 }
 
-int word_program(struct map_info *map, loff_t adr, uint32_t curval)
-{
-    int ret;
-	struct lpddr_private *lpddr = map->fldrv_priv;
-	int chipnum = adr >> lpddr->chipshift;
-	struct flchip *chip = &lpddr->chips[chipnum];
-
-	mutex_lock(&chip->mutex);
-	ret = get_chip(map, chip, FL_WRITING);
-	if (ret) {
-		mutex_unlock(&chip->mutex);
-		return ret;
-	}
-
-	send_pfow_command(map, LPDDR_WORD_PROGRAM, adr, 0x00, (map_word *)&curval);
-
-	ret = wait_for_ready(map, chip, (1<<lpddr->qinfo->SingleWordProgTime));
-	if (ret)	{
-		printk(KERN_WARNING"%s word_program error at: %llx; val: %x\n",
-			map->name, adr, curval);
-		goto out;
-	}
-
-out:	put_chip(map, chip);
-	mutex_unlock(&chip->mutex);
-	return ret;
-}
-
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Alexey Korolev <akorolev@infradead.org>");
 MODULE_DESCRIPTION("MTD driver for LPDDR flash chips");
-- 
1.7.9.5
