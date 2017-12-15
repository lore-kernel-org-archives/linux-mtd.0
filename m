Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePh7z-0007Fk-0m
 for linux-mtd@lists.infradead.org; Fri, 15 Dec 2017 03:57:44 +0000
Received: by mail-pf0-x243.google.com with SMTP id l24so5252031pfj.6
 for <linux-mtd@lists.infradead.org>; Thu, 14 Dec 2017 19:57:17 -0800 (PST)
From: venkat.prashanth2498@gmail.com
To: dwmw2@infradead.org,
	computersforpeace@gmail.com,
	richard@nod.at
Cc: wboyer@gmail.com, boris.brezillon@free-electrons.com,
 cyrille.pitchen@atmel.com, david.oberhollenzer@sigma-star.at,
 linux-mtd@lists.infradead.org,
 Venkat Prashanth B U <venkat.prashanth2498@gmail.com>
Subject: [PATCH 3/8] Drivers:MTD:Nand: remove the redefinition error
Date: Fri, 15 Dec 2017 09:27:09 +0530
Message-Id: <1513310229-2867-1-git-send-email-venkat.prashanth2498@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Venkat Prashanth B U <venkat.prashanth2498@gmail.com>

This is a patch to the omap_elm.c file which fixes the redefinition
error in the function‘elm_decode_bch_error_page’

Signed-off-by: Venkat Prashanth B U <venkat.prashanth2498@gmail.com>
---
 drivers/mtd/nand/omap_elm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/omap_elm.c b/drivers/mtd/nand/omap_elm.c
index 235ec79..06c24f3 100644
--- a/drivers/mtd/nand/omap_elm.c
+++ b/drivers/mtd/nand/omap_elm.c
@@ -335,7 +335,7 @@ static void elm_error_correction(struct elm_info *info,
 }

 /**
- * elm_decode_bch_error_page - Locate error position
+ * elm_decode_bch_err_pg - Locate error position
  * @dev:	device pointer
  * @ecc_calc:	calculated ECC bytes from GPMC
  * @err_vec:	elm error vectors
@@ -343,7 +343,7 @@ static void elm_error_correction(struct elm_info *info,
  * Called with one or more error reported vectors & vectors with
  * error reported is updated in err_vec[].error_reported
  */
-void elm_decode_bch_error_page(struct device *dev, u8 *ecc_calc,
+void elm_decode_bch_err_pg(struct device *dev, u8 *ecc_calc,
 		struct elm_errorvec *err_vec)
 {
 	struct elm_info *info = dev_get_drvdata(dev);
@@ -368,7 +368,7 @@ void elm_decode_bch_error_page(struct device *dev, u8 *ecc_calc,
 	elm_write_reg(info, ELM_IRQENABLE, reg_val & ~INTR_EN_PAGE_MASK);
 	elm_error_correction(info, err_vec);
 }
-EXPORT_SYMBOL(elm_decode_bch_error_page);
+EXPORT_SYMBOL(elm_decode_bch_err_pg);

 static irqreturn_t elm_isr(int this_irq, void *dev_id)
 {
--
1.9.1
