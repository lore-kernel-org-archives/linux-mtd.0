Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ar9qd-00056E-L0
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2016 19:56:12 +0000
Received: by mail-wm0-x22b.google.com with SMTP id v188so44935987wme.1
 for <linux-mtd@lists.infradead.org>; Fri, 15 Apr 2016 12:55:51 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 10/12] mtd: nand: read ECC algorithm from the new field
Date: Fri, 15 Apr 2016 21:54:10 +0200
Message-Id: <1460750052-16285-11-git-send-email-zajec5@gmail.com>
In-Reply-To: <1460750052-16285-1-git-send-email-zajec5@gmail.com>
References: <1460750052-16285-1-git-send-email-zajec5@gmail.com>
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

Now we have all drivers properly setting this new field we can start
using it and proceed with deprecating NAND_ECC_SOFT_BCH.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/nand/nand_base.c | 98 ++++++++++++++++++++++++--------------------
 1 file changed, 53 insertions(+), 45 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index e1f3cf8..ffd1b32 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4154,7 +4154,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 	/*
 	 * If no default placement scheme is given, select an appropriate one.
 	 */
-	if (!mtd->ooblayout && (ecc->mode != NAND_ECC_SOFT_BCH)) {
+	if (!mtd->ooblayout && ecc->algo != NAND_ECC_BCH) {
 		switch (mtd->oobsize) {
 		case 8:
 		case 16:
@@ -4248,51 +4248,59 @@ int nand_scan_tail(struct mtd_info *mtd)
 		ecc->algo = NAND_ECC_HAMMING;
 
 	case NAND_ECC_SOFT:
-		ecc->calculate = nand_calculate_ecc;
-		ecc->correct = nand_correct_data;
-		ecc->read_page = nand_read_page_swecc;
-		ecc->read_subpage = nand_read_subpage;
-		ecc->write_page = nand_write_page_swecc;
-		ecc->read_page_raw = nand_read_page_raw;
-		ecc->write_page_raw = nand_write_page_raw;
-		ecc->read_oob = nand_read_oob_std;
-		ecc->write_oob = nand_write_oob_std;
-		if (!ecc->size)
-			ecc->size = 256;
-		ecc->bytes = 3;
-		ecc->strength = 1;
-		break;
-
 	case NAND_ECC_SOFT_BCH:
-		if (!mtd_nand_has_bch()) {
-			WARN(1, "CONFIG_MTD_NAND_ECC_BCH not enabled\n");
-			ret = -EINVAL;
-			goto err_free;
-		}
-		ecc->calculate = nand_bch_calculate_ecc;
-		ecc->correct = nand_bch_correct_data;
-		ecc->read_page = nand_read_page_swecc;
-		ecc->read_subpage = nand_read_subpage;
-		ecc->write_page = nand_write_page_swecc;
-		ecc->read_page_raw = nand_read_page_raw;
-		ecc->write_page_raw = nand_write_page_raw;
-		ecc->read_oob = nand_read_oob_std;
-		ecc->write_oob = nand_write_oob_std;
-		/*
-		 * Board driver should supply ecc.size and ecc.strength values
-		 * to select how many bits are correctable. Otherwise, default
-		 * to 4 bits for large page devices.
-		 */
-		if (!ecc->size && (mtd->oobsize >= 64)) {
-			ecc->size = 512;
-			ecc->strength = 4;
-		}
+		switch (ecc->algo) {
+		case NAND_ECC_HAMMING:
+			ecc->calculate = nand_calculate_ecc;
+			ecc->correct = nand_correct_data;
+			ecc->read_page = nand_read_page_swecc;
+			ecc->read_subpage = nand_read_subpage;
+			ecc->write_page = nand_write_page_swecc;
+			ecc->read_page_raw = nand_read_page_raw;
+			ecc->write_page_raw = nand_write_page_raw;
+			ecc->read_oob = nand_read_oob_std;
+			ecc->write_oob = nand_write_oob_std;
+			if (!ecc->size)
+				ecc->size = 256;
+			ecc->bytes = 3;
+			ecc->strength = 1;
+			break;
+		case NAND_ECC_BCH:
+			if (!mtd_nand_has_bch()) {
+				WARN(1, "CONFIG_MTD_NAND_ECC_BCH not enabled\n");
+				ret = -EINVAL;
+				goto err_free;
+			}
+			ecc->calculate = nand_bch_calculate_ecc;
+			ecc->correct = nand_bch_correct_data;
+			ecc->read_page = nand_read_page_swecc;
+			ecc->read_subpage = nand_read_subpage;
+			ecc->write_page = nand_write_page_swecc;
+			ecc->read_page_raw = nand_read_page_raw;
+			ecc->write_page_raw = nand_write_page_raw;
+			ecc->read_oob = nand_read_oob_std;
+			ecc->write_oob = nand_write_oob_std;
+			/*
+			* Board driver should supply ecc.size and ecc.strength
+			* values to select how many bits are correctable.
+			* Otherwise, default to 4 bits for large page devices.
+			*/
+			if (!ecc->size && (mtd->oobsize >= 64)) {
+				ecc->size = 512;
+				ecc->strength = 4;
+			}
 
-		/* See nand_bch_init() for details. */
-		ecc->bytes = 0;
-		ecc->priv = nand_bch_init(mtd);
-		if (!ecc->priv) {
-			WARN(1, "BCH ECC initialization failed!\n");
+			/* See nand_bch_init() for details. */
+			ecc->bytes = 0;
+			ecc->priv = nand_bch_init(mtd);
+			if (!ecc->priv) {
+				WARN(1, "BCH ECC initialization failed!\n");
+				ret = -EINVAL;
+				goto err_free;
+			}
+			break;
+		default:
+			WARN(1, "Unsupported ECC algorithm!\n");
 			ret = -EINVAL;
 			goto err_free;
 		}
@@ -4478,7 +4486,7 @@ void nand_release(struct mtd_info *mtd)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
 
-	if (chip->ecc.mode == NAND_ECC_SOFT_BCH)
+	if (chip->ecc.algo == NAND_ECC_BCH)
 		nand_bch_free((struct nand_bch_control *)chip->ecc.priv);
 
 	mtd_device_unregister(mtd);
-- 
1.8.4.5
