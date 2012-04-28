Received: from mail-pz0-f43.google.com ([209.85.210.43])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SNwWl-00036o-Kq
 for linux-mtd@lists.infradead.org; Sat, 28 Apr 2012 01:32:48 +0000
Received: by dadn15 with SMTP id n15so2142415dad.16
 for <linux-mtd@lists.infradead.org>; Fri, 27 Apr 2012 18:32:46 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 04/10] mtd: cafe_nand: utilize oob_required parameter
Date: Fri, 27 Apr 2012 18:29:48 -0700
Message-Id: <1335576594-25267-5-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1335576594-25267-1-git-send-email-computersforpeace@gmail.com>
References: <1335576594-25267-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Don't write OOB if the caller doesn't require it.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/cafe_nand.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
index 738aafa..4c9714b 100644
--- a/drivers/mtd/nand/cafe_nand.c
+++ b/drivers/mtd/nand/cafe_nand.c
@@ -525,7 +525,8 @@ static void cafe_nand_write_page_lowlevel(struct mtd_info *mtd,
 	struct cafe_priv *cafe = mtd->priv;
 
 	chip->write_buf(mtd, buf, mtd->writesize);
-	chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
+	if (oob_required)
+		chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
 
 	/* Set up ECC autogeneration */
 	cafe->ctl2 |= (1<<30);
-- 
1.7.5.4.2.g519b1
