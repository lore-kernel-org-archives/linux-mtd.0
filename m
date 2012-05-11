Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SSwUC-0004zm-7o
 for linux-mtd@lists.infradead.org; Fri, 11 May 2012 20:30:48 +0000
Received: by dadm1 with SMTP id m1so4049899dad.36
 for <linux-mtd@lists.infradead.org>; Fri, 11 May 2012 13:30:47 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 2/3] mtd: cafe_nand: spelling mistake
Date: Fri, 11 May 2012 13:30:34 -0700
Message-Id: <1336768235-12658-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1336768235-12658-1-git-send-email-computersforpeace@gmail.com>
References: <1336768235-12658-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
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
 drivers/mtd/nand/cafe_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
index 41371ba..f3594a6 100644
--- a/drivers/mtd/nand/cafe_nand.c
+++ b/drivers/mtd/nand/cafe_nand.c
@@ -377,7 +377,7 @@ static int cafe_nand_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
  * @buf:	buffer to store read data
  * @oob_required:	caller expects OOB data read to chip->oob_poi
  *
- * The hw generator calculates the error syndrome automatically. Therefor
+ * The hw generator calculates the error syndrome automatically. Therefore
  * we need a special oob layout and handling.
  */
 static int cafe_nand_read_page(struct mtd_info *mtd, struct nand_chip *chip,
-- 
1.7.5.4.2.g519b1
