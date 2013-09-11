Received: from mail-oa0-x231.google.com ([2607:f8b0:4003:c02::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VJtWy-00053p-GB
 for linux-mtd@lists.infradead.org; Wed, 11 Sep 2013 23:09:05 +0000
Received: by mail-oa0-f49.google.com with SMTP id i7so10082166oag.36
 for <linux-mtd@lists.infradead.org>; Wed, 11 Sep 2013 16:08:43 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: nand: cleanup ONFI printed errors, warnings
Date: Wed, 11 Sep 2013 16:08:14 -0700
Message-Id: <1378940894-27598-1-git-send-email-computersforpeace@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The ONFI detection routine is too verbose in some cases and not verbose
enough in others. This patch refactors it to print only when there are
significant warnings/errors.

Probing in 16-bit mode:
  It is unnecessary to print until after the READID (address 20h)
  command. READID *has* to work properly in whatever bus width
  configuration we are in, or else no identification mode works. So we
  can silence some useless warnings on systems which come up in 16-bit
  mode and do not even respond with an O-N-F-I string.

Valid parameter page:
  Nobody needs to see this. Do we inform the user every time other
  hardware responds properly? Instead, add an error message if *no*
  uncorrupted parameter pages are found.

ONFI ECC:
  Most drivers don't yet use the reported minimum ECC values, so it
  shouldn't yet be a fatal condition if the extended parameter page is
  incorrect. But we should at least give a warning for the corner cases
  that we don't expect.

ONFI flash detected:
  Nobody needs to see this. This is the expected case, that we detect
  ONFI properly, or else it wasn't ONFI-compliant and is detected by
  some other routine.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 7ed4841..d4578a1 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2937,29 +2937,34 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 	int i;
 	int val;
 
-	/* ONFI need to be probed in 8 bits mode, and 16 bits should be selected with NAND_BUSWIDTH_AUTO */
-	if (chip->options & NAND_BUSWIDTH_16) {
-		pr_err("Trying ONFI probe in 16 bits mode, aborting !\n");
-		return 0;
-	}
 	/* Try ONFI for unknown chip or LP */
 	chip->cmdfunc(mtd, NAND_CMD_READID, 0x20, -1);
 	if (chip->read_byte(mtd) != 'O' || chip->read_byte(mtd) != 'N' ||
 		chip->read_byte(mtd) != 'F' || chip->read_byte(mtd) != 'I')
 		return 0;
 
+	/*
+	 * ONFI must be probed in 8-bit mode or with NAND_BUSWIDTH_AUTO, not
+	 * with NAND_BUSWIDTH_16
+	 */
+	if (chip->options & NAND_BUSWIDTH_16) {
+		pr_err("ONFI cannot be probed in 16-bit mode; aborting\n");
+		return 0;
+	}
+
 	chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1);
 	for (i = 0; i < 3; i++) {
 		chip->read_buf(mtd, (uint8_t *)p, sizeof(*p));
 		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 254) ==
 				le16_to_cpu(p->crc)) {
-			pr_info("ONFI param page %d valid\n", i);
 			break;
 		}
 	}
 
-	if (i == 3)
+	if (i == 3) {
+		pr_err("Could not find valid ONFI parameter page; aborting\n");
 		return 0;
+	}
 
 	/* Check version */
 	val = le16_to_cpu(p->revision);
@@ -3011,10 +3016,11 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 
 		/* The Extended Parameter Page is supported since ONFI 2.1. */
 		if (nand_flash_detect_ext_param_page(mtd, chip, p))
-			pr_info("Failed to detect the extended param page.\n");
+			pr_warn("Failed to detect ONFI extended param page\n");
+	} else {
+		pr_warn("Could not retrieve ONFI ECC requirements\n");
 	}
 
-	pr_info("ONFI flash detected\n");
 	return 1;
 }
 
-- 
1.8.4
