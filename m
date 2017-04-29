Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d4OLW-0002Er-Fc
 for linux-mtd@lists.infradead.org; Sat, 29 Apr 2017 09:07:22 +0000
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Kumar Gala <galak@codeaurora.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH v2 3/5] mtd: nand: export nand_{read,write}_page_raw()
Date: Sat, 29 Apr 2017 11:06:44 +0200
Message-Id: <1493456806-18898-4-git-send-email-thomas.petazzoni@free-electrons.com>
In-Reply-To: <1493456806-18898-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1493456806-18898-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The nand_read_page_raw() and nand_write_page_raw() functions might be
re-used by vendor-specific implementations of the read_page/write_page
functions. Instead of having vendor-specific code duplicate this code,
it is much better to export those functions and allow them to be
re-used.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nand_base.c | 10 ++++++----
 include/linux/mtd/nand.h     |  8 ++++++++
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index b639e88..3282738 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1456,14 +1456,15 @@ EXPORT_SYMBOL(nand_check_erased_ecc_chunk);
  *
  * Not for syndrome calculating ECC controllers, which use a special oob layout.
  */
-static int nand_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
-			      uint8_t *buf, int oob_required, int page)
+int nand_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
+		       uint8_t *buf, int oob_required, int page)
 {
 	chip->read_buf(mtd, buf, mtd->writesize);
 	if (oob_required)
 		chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
 	return 0;
 }
+EXPORT_SYMBOL(nand_read_page_raw);
 
 /**
  * nand_read_page_raw_syndrome - [INTERN] read raw page data without ecc
@@ -2401,8 +2402,8 @@ static int nand_read_oob(struct mtd_info *mtd, loff_t from,
  *
  * Not for syndrome calculating ECC controllers, which use a special oob layout.
  */
-static int nand_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
-			       const uint8_t *buf, int oob_required, int page)
+int nand_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
+			const uint8_t *buf, int oob_required, int page)
 {
 	chip->write_buf(mtd, buf, mtd->writesize);
 	if (oob_required)
@@ -2410,6 +2411,7 @@ static int nand_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 
 	return 0;
 }
+EXPORT_SYMBOL(nand_write_page_raw);
 
 /**
  * nand_write_page_raw_syndrome - [INTERN] raw page write function
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 6035220..7a01d2e 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -1259,6 +1259,14 @@ int nand_read_oob_std(struct mtd_info *mtd, struct nand_chip *chip, int page);
 int nand_read_oob_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
 			   int page);
 
+/* Default read_page_raw implementation */
+int nand_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
+		       uint8_t *buf, int oob_required, int page);
+
+/* Default write_page_raw implementation */
+int nand_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
+			const uint8_t *buf, int oob_required, int page);
+
 /* Reset and initialize a NAND device */
 int nand_reset(struct nand_chip *chip, int chipnr);
 
-- 
2.7.4
