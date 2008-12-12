Received: from comal.ext.ti.com ([198.47.26.152])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LB4zA-0006OK-I6
	for linux-mtd@lists.infradead.org; Fri, 12 Dec 2008 10:11:04 +0000
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id mBCAAwSr001435
	for <linux-mtd@lists.infradead.org>; Fri, 12 Dec 2008 04:11:03 -0600
Received: from webmail.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id mBCAAuOO008589
	for <linux-mtd@lists.infradead.org>;
	Fri, 12 Dec 2008 04:10:57 -0600 (CST)
Message-ID: <57799.192.168.10.89.1229076657.squirrel@dbdmail.itg.ti.com>
Date: Fri, 12 Dec 2008 15:40:57 +0530 (IST)
Subject: [PATCH] [MTD] [NAND] nand_base.c: Allowing core driver to choose
	ECC block size for SW ECC scheme.
From: "vimal singh" <vimalsingh@ti.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch allows core driver to choose ECC block size in sw ecc case.

Signed-off-by: Vimal Singh <vimalsingh@ti.com>
---
Current nand driver supports 256 and 512 byte software ecc.
This patch provides driver the flexibility to choose ecc size.
'256' bytes will be used by default if not provided by core driver.

--- a/drivers/mtd/nand/nand_base.c	2008-12-12 14:26:30.050002000 +0530
+++ b/drivers/mtd/nand/nand_base.c	2008-12-12 14:27:05.330000000 +0530
@@ -2622,7 +2622,8 @@ int nand_scan_tail(struct mtd_info *mtd)
 		chip->ecc.write_page = nand_write_page_swecc;
 		chip->ecc.read_oob = nand_read_oob_std;
 		chip->ecc.write_oob = nand_write_oob_std;
-		chip->ecc.size = 256;
+		if (!chip->ecc.size)
+			chip->ecc.size = 256;
 		chip->ecc.bytes = 3;
 		break;
