Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cQWpB-0000Cy-04
 for linux-mtd@lists.infradead.org; Mon, 09 Jan 2017 10:05:15 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Icenowy Zheng <icenowy@aosc.xyz>, Valdis.Kletnieks@vt.edu,
 Aleksei Mamlin <mamlinav@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 05/17] mtd: nand: Rename the nand_manufacturers struct
Date: Mon,  9 Jan 2017 11:04:12 +0100
Message-Id: <1483956264-3335-6-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1483956264-3335-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1483956264-3335-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Drop the 's' at the end of nand_manufacturers since the struct is actually
describing a single manufacturer, not a manufacturer table.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nand_ids.c | 2 +-
 include/linux/mtd/nand.h    | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index b3a332f37e14..0f90957ea118 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -169,7 +169,7 @@ struct nand_flash_dev nand_flash_ids[] = {
 };
 
 /* Manufacturer IDs */
-struct nand_manufacturers nand_manuf_ids[] = {
+struct nand_manufacturer nand_manuf_ids[] = {
 	{NAND_MFR_TOSHIBA, "Toshiba"},
 	{NAND_MFR_ESMT, "ESMT"},
 	{NAND_MFR_SAMSUNG, "Samsung"},
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 632975146c30..4673069d1b92 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -1055,17 +1055,17 @@ struct nand_flash_dev {
 };
 
 /**
- * struct nand_manufacturers - NAND Flash Manufacturer ID Structure
+ * struct nand_manufacturer - NAND Flash Manufacturer structure
  * @name:	Manufacturer name
  * @id:		manufacturer ID code of device.
 */
-struct nand_manufacturers {
+struct nand_manufacturer {
 	int id;
 	char *name;
 };
 
 extern struct nand_flash_dev nand_flash_ids[];
-extern struct nand_manufacturers nand_manuf_ids[];
+extern struct nand_manufacturer nand_manuf_ids[];
 
 int nand_default_bbt(struct mtd_info *mtd);
 int nand_markbad_bbt(struct mtd_info *mtd, loff_t offs);
-- 
2.7.4
