Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cQWoo-0008RK-PD
 for linux-mtd@lists.infradead.org; Mon, 09 Jan 2017 10:04:48 +0000
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
Subject: [PATCH v6 04/17] mtd: nand: Rename nand_get_flash_type() into
 nand_detect()
Date: Mon,  9 Jan 2017 11:04:11 +0100
Message-Id: <1483956264-3335-5-git-send-email-boris.brezillon@free-electrons.com>
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

Since commit 4722c0e958e6 ("mtd: nand: change return type of
nand_get_flash_type() to int"), nand_get_flash_type() no longer returns
a nand_flash_dev object.
Rename the function to match this new behavior.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Acked-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nand_base.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 3a31b705af6f..efb3ade568d8 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4010,8 +4010,7 @@ static bool find_full_id_nand(struct nand_chip *chip,
 /*
  * Get the flash and manufacturer id and lookup if the type is supported.
  */
-static int nand_get_flash_type(struct nand_chip *chip,
-			       struct nand_flash_dev *type)
+static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	int busw;
@@ -4368,7 +4367,7 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 	nand_set_defaults(chip);
 
 	/* Read the flash type */
-	ret = nand_get_flash_type(chip, table);
+	ret = nand_detect(chip, table);
 	if (ret) {
 		if (!(chip->options & NAND_SCAN_SILENT_NODEV))
 			pr_warn("No NAND device found\n");
-- 
2.7.4
