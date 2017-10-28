Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e8LoJ-000190-3K
 for linux-mtd@lists.infradead.org; Sat, 28 Oct 2017 07:45:41 +0000
Received: by mail-pg0-x243.google.com with SMTP id m18so7003521pgd.13
 for <linux-mtd@lists.infradead.org>; Sat, 28 Oct 2017 00:45:17 -0700 (PDT)
From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
To: boris.brezillon@free-electrons.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Subject: [RFC] NAND: Optimize NAND_ECC_HW_OOB_FIRST read
Date: Sat, 28 Oct 2017 13:13:51 +0530
Message-Id: <20171028074351.13118-1-prasannatsmkumar@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Lars-Peter Clausen <lars@metafoo.de>

Avoid sending unnecessary READ commands to the chip.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
---
This patch is taken from git://projects.qi-hardware.com/qi-kernel.git
branch jz-3.16. From [1] and [2] it can be seen that the patch author
thinks this can be sent upstream but it never happened so far. This
patch is used in OpenWRT as seen from [3].

I have only compile tested the patch.

1. https://www.mail-archive.com/discussion@lists.en.qi-hardware.com/msg04635.html
2. https://www.mail-archive.com/discussion@lists.en.qi-hardware.com/msg04639.html
3. https://git.lede-project.org/?p=source.git;a=blob;f=target/linux/xburst/patches-3.18/002-NAND-Optimize-NAND_ECC_HW_OOB_FIRST-read.patch;h=046da51912de3cd4444779df5de13d2c1999719a;hb=c03d4317a6bc891cb4a5e89cbdd77f37c23aff86

 drivers/mtd/nand/nand_base.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 12edaae..4bf3bdb 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1680,9 +1680,15 @@ static int nand_read_page_hwecc_oob_first(struct mtd_info *mtd,
 	unsigned int max_bitflips = 0;
 
 	/* Read the OOB area first */
-	chip->cmdfunc(mtd, NAND_CMD_READOOB, 0, page);
-	chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
-	chip->cmdfunc(mtd, NAND_CMD_READ0, 0, page);
+	if (mtd->writesize > 512) {
+		chip->cmdfunc(mtd, NAND_CMD_READ0, mtd->writesize, page);
+		chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
+		chip->cmdfunc(mtd, NAND_CMD_RNDOUT, 0, -1);
+	} else {
+		chip->cmdfunc(mtd, NAND_CMD_READOOB, 0, page);
+		chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
+		chip->cmdfunc(mtd, NAND_CMD_READ0, 0, page);
+	}
 
 	ret = mtd_ooblayout_get_eccbytes(mtd, ecc_code, chip->oob_poi, 0,
 					 chip->ecc.total);
@@ -1902,8 +1908,10 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 						 __func__, buf);
 
 read_retry:
-			if (nand_standard_page_accessors(&chip->ecc))
+			if (nand_standard_page_accessors(&chip->ecc) &&
+			    chip->ecc.mode != NAND_ECC_HW_OOB_FIRST) {
 				chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
+			}
 
 			/*
 			 * Now read the page into the buffer.  Absent an error,
-- 
2.10.0
