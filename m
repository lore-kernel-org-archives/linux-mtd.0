Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKVYY-0004KI-9I
 for linux-mtd@lists.infradead.org; Wed, 29 Jul 2015 17:54:18 +0000
From: Hans de Goede <hdegoede@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: Boris BREZILLON <b.brezillon.dev@gmail.com>, linux-mtd@lists.infradead.org,
 linux-sunxi@googlegroups.com, Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 3/4] mtd: nand: nand_get_flash_type: Print detected ECC
 strength and size
Date: Wed, 29 Jul 2015 19:53:53 +0200
Message-Id: <1438192434-18363-3-git-send-email-hdegoede@redhat.com>
In-Reply-To: <1438192434-18363-1-git-send-email-hdegoede@redhat.com>
References: <1438192434-18363-1-git-send-email-hdegoede@redhat.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Print the detected ECC strength and size from nand_get_flash_type().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/mtd/nand/nand_base.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index f3fefbf..e2e2690 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4433,9 +4433,10 @@ ident_done:
 		pr_info("%s %s\n", nand_manuf_ids[maf_idx].name,
 				type->name);
 
-	pr_info("%d MiB, %s, erase size: %d KiB, page size: %d, OOB size: %d\n",
+	pr_info("%d MiB, %s, erase size: %d KiB, page size: %d, OOB size: %d, ECC strength %d size %d\n",
 		(int)(chip->chipsize >> 20), nand_is_slc(chip) ? "SLC" : "MLC",
-		mtd->erasesize >> 10, mtd->writesize, mtd->oobsize);
+		mtd->erasesize >> 10, mtd->writesize, mtd->oobsize,
+		chip->ecc_strength_ds, chip->ecc_step_ds);
 	return type;
 }
 
-- 
2.4.3
