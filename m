Received: from m2.elettra.trieste.it ([140.105.206.202] helo=elettra.eu)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xz0Cw-00011a-IU
 for linux-mtd@lists.infradead.org; Thu, 11 Dec 2014 09:38:51 +0000
From: Alessio Igor Bogani <alessio.bogani@elettra.eu>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: map_ram: Enable mtdoops
Date: Thu, 11 Dec 2014 10:38:06 +0100
Message-Id: <1418290686-10335-1-git-send-email-alessio.bogani@elettra.eu>
Cc: Alessio Igor Bogani <alessio.bogani@elettra.eu>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Alessio Igor Bogani <alessio.bogani@elettra.eu>
---
 drivers/mtd/chips/map_ram.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/chips/map_ram.c b/drivers/mtd/chips/map_ram.c
index 991c2a1..afb43d5 100644
--- a/drivers/mtd/chips/map_ram.c
+++ b/drivers/mtd/chips/map_ram.c
@@ -68,6 +68,7 @@ static struct mtd_info *map_ram_probe(struct map_info *map)
 	mtd->_get_unmapped_area = mapram_unmapped_area;
 	mtd->_read = mapram_read;
 	mtd->_write = mapram_write;
+	mtd->_panic_write = mapram_write;
 	mtd->_sync = mapram_nop;
 	mtd->flags = MTD_CAP_RAM;
 	mtd->writesize = 1;
-- 
2.1.3
