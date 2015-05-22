Received: from mail-pd0-x231.google.com ([2607:f8b0:400e:c02::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvrE6-0002gx-09
 for linux-mtd@lists.infradead.org; Fri, 22 May 2015 17:59:19 +0000
Received: by pdea3 with SMTP id a3so24907552pde.2
 for <linux-mtd@lists.infradead.org>; Fri, 22 May 2015 10:58:56 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: nand: correct indentation within conditional
Date: Fri, 22 May 2015 10:58:30 -0700
Message-Id: <1432317510-11301-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We had an extra tab.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index a157757347ec..ceb68ca8277a 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3685,7 +3685,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 			if (find_full_id_nand(mtd, chip, type, id_data, &busw))
 				goto ident_done;
 		} else if (*dev_id == type->dev_id) {
-				break;
+			break;
 		}
 	}
 
-- 
1.9.1
