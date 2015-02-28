Received: from mail-pd0-x233.google.com ([2607:f8b0:400e:c02::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YRePj-0007xf-II
 for linux-mtd@lists.infradead.org; Sat, 28 Feb 2015 10:14:28 +0000
Received: by pdjz10 with SMTP id z10so27092745pdj.0
 for <linux-mtd@lists.infradead.org>; Sat, 28 Feb 2015 02:14:06 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/5] mtd: nand_bbt: drop unnecessary header
Date: Sat, 28 Feb 2015 02:13:09 -0800
Message-Id: <1425118393-25179-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1425118393-25179-1-git-send-email-computersforpeace@gmail.com>
References: <1425118393-25179-1-git-send-email-computersforpeace@gmail.com>
Cc: Ezequiel Garcia <ezequiel.garcia@imgtec.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Alexander Shiyan <shc_work@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_bbt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 9bb8453d224e..307a285afb78 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -64,7 +64,6 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/bbm.h>
 #include <linux/mtd/nand.h>
-#include <linux/mtd/nand_ecc.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/vmalloc.h>
-- 
2.1.0
