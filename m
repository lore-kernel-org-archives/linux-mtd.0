Received: from mail-pd0-x233.google.com ([2607:f8b0:400e:c02::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V3Ge3-0006p4-Ci
 for linux-mtd@lists.infradead.org; Sun, 28 Jul 2013 02:23:41 +0000
Received: by mail-pd0-f179.google.com with SMTP id v10so4061090pde.10
 for <linux-mtd@lists.infradead.org>; Sat, 27 Jul 2013 19:23:17 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 5/6] mtd: nandsim: remove unused code
Date: Sun, 28 Jul 2013 11:21:57 +0900
Message-Id: <1374978118-11418-5-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1374978118-11418-1-git-send-email-akinobu.mita@gmail.com>
References: <1374978118-11418-1-git-send-email-akinobu.mita@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Akinobu Mita <akinobu.mita@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove the leftover from commit 831d316b8b80b68dcdd2b3f5ede6d33c2bbf5835
("mtd: nandsim: remove autoincrement code").

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/nand/nandsim.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 0ff53ef..ce90990 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -760,12 +760,6 @@ static int init_nandsim(struct mtd_info *mtd)
 		ns->nbparts += 1;
 	}
 
-	/* Detect how many ID bytes the NAND chip outputs */
-	for (i = 0; nand_flash_ids[i].name != NULL; i++) {
-		if (second_id_byte != nand_flash_ids[i].dev_id)
-			continue;
-	}
-
 	if (ns->busw == 16)
 		NS_WARN("16-bit flashes support wasn't tested\n");
 
-- 
1.8.3.1
