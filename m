Received: from smtp5.pp.htv.fi ([213.243.153.39])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JlPYz-0003xO-16
	for linux-mtd@lists.infradead.org; Mon, 14 Apr 2008 14:21:41 +0000
Date: Mon, 14 Apr 2008 17:20:36 +0300
From: Adrian Bunk <bunk@kernel.org>
To: dwmw2@infradead.org
Subject: [2.6 patch] mtd: make onenand_scan_bbt() static
Message-ID: <20080414142036.GU6695@cs181133002.pp.htv.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch makes the needlessly global onenand_scan_bbt() static.

Signed-off-by: Adrian Bunk <bunk@kernel.org>

---

 drivers/mtd/onenand/onenand_bbt.c |    3 +--
 include/linux/mtd/bbm.h           |    1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

c54bdc9336c6627a6baa5d268edb41563451f191 diff --git a/drivers/mtd/onenand/onenand_bbt.c b/drivers/mtd/onenand/onenand_bbt.c
index aecdd50..1d590cd 100644
--- a/drivers/mtd/onenand/onenand_bbt.c
+++ b/drivers/mtd/onenand/onenand_bbt.c
@@ -175,7 +175,7 @@ static int onenand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt)
  * by the onenand_release function.
  *
  */
-int onenand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
+static int onenand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 {
 	struct onenand_chip *this = mtd->priv;
 	struct bbm_info *bbm = this->bbm;
@@ -246,5 +246,4 @@ int onenand_default_bbt(struct mtd_info *mtd)
 	return onenand_scan_bbt(mtd, bbm->badblock_pattern);
 }
 
-EXPORT_SYMBOL(onenand_scan_bbt);
 EXPORT_SYMBOL(onenand_default_bbt);
diff --git a/include/linux/mtd/bbm.h b/include/linux/mtd/bbm.h
index fff8c53..0c07c7a 100644
--- a/include/linux/mtd/bbm.h
+++ b/include/linux/mtd/bbm.h
@@ -126,7 +126,6 @@ struct bbm_info {
 };
 
 /* OneNAND BBT interface */
-extern int onenand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd);
 extern int onenand_default_bbt(struct mtd_info *mtd);
 
 #endif	/* __LINUX_MTD_BBM_H */
