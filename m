Received: from mail-pd0-x232.google.com ([2607:f8b0:400e:c02::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YRePm-0007zT-P0
 for linux-mtd@lists.infradead.org; Sat, 28 Feb 2015 10:14:31 +0000
Received: by pdbnh10 with SMTP id nh10so3423970pdb.3
 for <linux-mtd@lists.infradead.org>; Sat, 28 Feb 2015 02:14:09 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 4/5] mtd: nand_bbt: unify/fix error handling in nand_scan_bbt()
Date: Sat, 28 Feb 2015 02:13:12 -0800
Message-Id: <1425118393-25179-5-git-send-email-computersforpeace@gmail.com>
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

Don't leak this->bbt, and return early if check_create() fails. It helps
to have a single error path to avoid these problems.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_bbt.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 53e17586fbed..516db2c4524b 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -1077,7 +1077,7 @@ static void verify_bbt_descr(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 static int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 {
 	struct nand_chip *this = mtd->priv;
-	int len, res = 0;
+	int len, res;
 	uint8_t *buf;
 	struct nand_bbt_descr *td = this->bbt_td;
 	struct nand_bbt_descr *md = this->bbt_md;
@@ -1098,10 +1098,9 @@ static int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 	if (!td) {
 		if ((res = nand_memory_bbt(mtd, bd))) {
 			pr_err("nand_bbt: can't scan flash and build the RAM-based BBT\n");
-			kfree(this->bbt);
-			this->bbt = NULL;
+			goto err;
 		}
-		return res;
+		return 0;
 	}
 	verify_bbt_descr(mtd, td);
 	verify_bbt_descr(mtd, md);
@@ -1111,9 +1110,8 @@ static int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 	len += (len >> this->page_shift) * mtd->oobsize;
 	buf = vmalloc(len);
 	if (!buf) {
-		kfree(this->bbt);
-		this->bbt = NULL;
-		return -ENOMEM;
+		res = -ENOMEM;
+		goto err;
 	}
 
 	/* Is the bbt at a given page? */
@@ -1125,6 +1123,8 @@ static int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 	}
 
 	res = check_create(mtd, buf, bd);
+	if (res)
+		goto err;
 
 	/* Prevent the bbt regions from erasing / writing */
 	mark_bbt_region(mtd, td);
@@ -1132,6 +1132,11 @@ static int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 		mark_bbt_region(mtd, md);
 
 	vfree(buf);
+	return 0;
+
+err:
+	kfree(this->bbt);
+	this->bbt = NULL;
 	return res;
 }
 
-- 
2.1.0
