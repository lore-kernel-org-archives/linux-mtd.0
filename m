Received: from mail-gx0-f12.google.com ([209.85.217.12])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KfDKc-0003vD-EV
	for linux-mtd@lists.infradead.org; Mon, 15 Sep 2008 12:37:30 +0000
Received: by gxk5 with SMTP id 5so23457891gxk.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Sep 2008 05:37:29 -0700 (PDT)
Message-ID: <ea2442770809150537p538f5298s9b5b003a1825b09f@mail.gmail.com>
Date: Mon, 15 Sep 2008 14:37:29 +0200
From: "Karl Beldan" <karl.beldan@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] [NAND] nand_base.c: reset chip first
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Cc: David.Woodhouse@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some chips require a RESET after power-up (e.g. Micron MT29FxGxxxxx).
The first command sent is NAND_CMD_READID.
Issue a NAND_CMD_RESET in nand_scan_ident before reading the device id.
Tested with an MT29F4G08AAC.

Signed-off-by: Karl Beldan <karl.beldan@gmail.com>
---
Prior to resetting, the chip gives a correct first ID byte though.


diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index d1129ba..2cfac9b 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2318,6 +2318,12 @@ static struct nand_flash_dev
*nand_get_flash_type(struct mtd_info *mtd,
 	/* Select the device */
 	chip->select_chip(mtd, 0);

+	/*
+	 * Reset the chip, required by some chips (e.g. Micron MT29FxGxxxxx)
+	 * after power-up
+	 */
+	chip->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
+
 	/* Send the command for reading device ID */
 	chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);

@@ -2488,6 +2494,8 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips)
 	/* Check for a chip array */
 	for (i = 1; i < maxchips; i++) {
 		chip->select_chip(mtd, i);
+		/* See comment in nand_get_flash_type for reset */
+		chip->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
 		/* Send the command for reading device ID */
 		chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
 		/* Read manufacturer and device IDs */
