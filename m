Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eMB6y-0000kG-Ib
 for linux-mtd@lists.infradead.org; Tue, 05 Dec 2017 11:10:11 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/2] mtd: nand: Only allocate ecc->{calc,
 code}_buf when actually needed
Date: Tue,  5 Dec 2017 12:09:29 +0100
Message-Id: <20171205110929.6820-2-boris.brezillon@free-electrons.com>
In-Reply-To: <20171205110929.6820-1-boris.brezillon@free-electrons.com>
References: <20171205110929.6820-1-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The only users of the ecc->{calc,code}_buf buffers are NAND controller
drivers implementing ecc->calculate() and/or ecc->correct(). Since the
->oobsize can be non-negligle, especially on modern NAND devices, we'd
better allocate it only when it is actually required.

Make ecc->{calc,code}_buf allocation dependent on the presence of
ecc->calculate() or ecc->correct().

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 71e70c4964f3..e6873d10c574 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -5318,21 +5318,9 @@ int nand_scan_tail(struct mtd_info *mtd)
 		return -EINVAL;
 	}
 
-	ecc->calc_buf = kmalloc(mtd->oobsize, GFP_KERNEL);
-	if (!ecc->calc_buf)
-		return -ENOMEM;
-
-	ecc->code_buf = kmalloc(mtd->oobsize, GFP_KERNEL);
-	if (!ecc->code_buf) {
-		ret = -ENOMEM;
-		goto err_free_buf;
-	}
-
 	chip->data_buf = kmalloc(mtd->writesize + mtd->oobsize, GFP_KERNEL);
-	if (!chip->data_buf) {
-		ret = -ENOMEM;
-		goto err_free_buf;
-	}
+	if (!chip->data_buf)
+		return -ENOMEM;
 
 	/*
 	 * FIXME: some NAND manufacturer drivers expect the first die to be
@@ -5495,6 +5483,15 @@ int nand_scan_tail(struct mtd_info *mtd)
 		goto err_nand_manuf_cleanup;
 	}
 
+	if (ecc->correct || ecc->calculate) {
+		ecc->calc_buf = kmalloc(mtd->oobsize, GFP_KERNEL);
+		ecc->code_buf = kmalloc(mtd->oobsize, GFP_KERNEL);
+		if (!ecc->calc_buf || !ecc->code_buf) {
+			ret = -ENOMEM;
+			goto err_nand_manuf_cleanup;
+		}
+	}
+
 	/* For many systems, the standard OOB write also works for raw */
 	if (!ecc->read_oob_raw)
 		ecc->read_oob_raw = ecc->read_oob;
-- 
2.11.0
