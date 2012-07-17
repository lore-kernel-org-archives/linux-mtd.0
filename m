Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sr1Oc-0007Fm-J8
 for linux-mtd@lists.infradead.org; Tue, 17 Jul 2012 06:36:35 +0000
Received: by pbbrq13 with SMTP id rq13so320370pbb.36
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jul 2012 23:36:30 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH v2 2/2] mtd: nand: remove unused 'int' return codes
Date: Mon, 16 Jul 2012 23:38:15 -0700
Message-Id: <1342507095-18574-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1342507095-18574-1-git-send-email-computersforpeace@gmail.com>
References: <1342507095-18574-1-git-send-email-computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The return codes for read_abs_bbts() and search_read_bbts() are always
non-zero, and so don't have much meaning. Just remove them.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Reviewed-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
---
v2: only add Reviewed-by tag

 drivers/mtd/nand/nand_bbt.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 2d1d2fa..9a5dd43 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -370,8 +370,8 @@ static u32 bbt_get_ver_offs(struct mtd_info *mtd, struct nand_bbt_descr *td)
  * Read the bad block table(s) for all chips starting at a given page. We
  * assume that the bbt bits are in consecutive order.
  */
-static int read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
-			 struct nand_bbt_descr *td, struct nand_bbt_descr *md)
+static void read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
+			  struct nand_bbt_descr *td, struct nand_bbt_descr *md)
 {
 	struct nand_chip *this = mtd->priv;
 
@@ -392,7 +392,6 @@ static int read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
 		pr_info("Bad block table at page %d, version 0x%02X\n",
 			 md->pages[0], md->version[0]);
 	}
-	return 1;
 }
 
 /* Scan a given block full */
@@ -623,7 +622,9 @@ static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
  *
  * Search and read the bad block table(s).
  */
-static int search_read_bbts(struct mtd_info *mtd, uint8_t * buf, struct nand_bbt_descr *td, struct nand_bbt_descr *md)
+static void search_read_bbts(struct mtd_info *mtd, uint8_t * buf,
+			     struct nand_bbt_descr *td,
+			     struct nand_bbt_descr *md)
 {
 	/* Search the primary table */
 	search_bbt(mtd, buf, td);
@@ -631,9 +632,6 @@ static int search_read_bbts(struct mtd_info *mtd, uint8_t * buf, struct nand_bbt
 	/* Search the mirror table */
 	if (md)
 		search_bbt(mtd, buf, md);
-
-	/* Force result check */
-	return 1;
 }
 
 /**
@@ -1159,14 +1157,13 @@ int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 
 	/* Is the bbt at a given page? */
 	if (td->options & NAND_BBT_ABSPAGE) {
-		res = read_abs_bbts(mtd, buf, td, md);
+		read_abs_bbts(mtd, buf, td, md);
 	} else {
 		/* Search the bad block table using a pattern in oob */
-		res = search_read_bbts(mtd, buf, td, md);
+		search_read_bbts(mtd, buf, td, md);
 	}
 
-	if (res)
-		res = check_create(mtd, buf, bd);
+	res = check_create(mtd, buf, bd);
 
 	/* Prevent the bbt regions from erasing / writing */
 	mark_bbt_region(mtd, td);
-- 
1.7.11.1
