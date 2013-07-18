Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UzjP8-000446-MX
 for linux-mtd@lists.infradead.org; Thu, 18 Jul 2013 08:17:40 +0000
Received: by mail-pa0-f48.google.com with SMTP id kp12so2902117pab.7
 for <linux-mtd@lists.infradead.org>; Thu, 18 Jul 2013 01:17:16 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: nand: fix NAND_BUSWIDTH_AUTO for x16 devices
Date: Thu, 18 Jul 2013 01:17:02 -0700
Message-Id: <1374135422-8975-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Matthieu Castet <matthieu.castet@parrot.com>,
 Alexander Shiyan <shc_work@mail.ru>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The code for NAND_BUSWIDTH_AUTO is broken. According to Alexander:

  "I have a problem with attach NAND UBI in 16 bit mode.
   NAND works fine if I specify NAND_BUSWIDTH_16 option, but not
   working with NAND_BUSWIDTH_AUTO option. In second case NAND
   chip is identifyed with ONFI."

See his report for the rest of the details:

  http://lists.infradead.org/pipermail/linux-mtd/2013-July/047515.html

Anyway, the problem is that nand_set_defaults() is called twice, we
intend it to reset the chip functions to their x16 buswidth verions
if the buswidth changed from x8 to x16; however, nand_set_defaults()
does exactly nothing if called a second time.

Fix this by hacking nand_set_defaults() to reset the buswidth-dependent
functions if they were set to the x8 version the first time. Note that
this does not do anything to reset from x16 to x8, but that's not the
supported use case for NAND_BUSWIDTH_AUTO anyway.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Reported-by: Alexander Shiyan <shc_work@mail.ru>
Tested-by: Alexander Shiyan <shc_work@mail.ru>
Cc: Matthieu Castet <matthieu.castet@parrot.com>
Cc: <stable@vger.kernel.org> # v3.8+
---
I have compile-tested only.

David, since this is a bugfix (and likely stable material), any chance we can
get this in 3.11? ;)

 drivers/mtd/nand/nand_base.c |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index acd2fc9..4e4f090 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2786,7 +2786,9 @@ static void nand_set_defaults(struct nand_chip *chip, int busw)
 
 	if (!chip->select_chip)
 		chip->select_chip = nand_select_chip;
-	if (!chip->read_byte)
+
+	/* If called twice, pointers that depend on busw may need to be reset */
+	if (!chip->read_byte || chip->read_byte == nand_read_byte)
 		chip->read_byte = busw ? nand_read_byte16 : nand_read_byte;
 	if (!chip->read_word)
 		chip->read_word = nand_read_word;
@@ -2794,9 +2796,9 @@ static void nand_set_defaults(struct nand_chip *chip, int busw)
 		chip->block_bad = nand_block_bad;
 	if (!chip->block_markbad)
 		chip->block_markbad = nand_default_block_markbad;
-	if (!chip->write_buf)
+	if (!chip->write_buf || chip->write_buf == nand_write_buf)
 		chip->write_buf = busw ? nand_write_buf16 : nand_write_buf;
-	if (!chip->read_buf)
+	if (!chip->read_buf || chip->read_buf == nand_read_buf)
 		chip->read_buf = busw ? nand_read_buf16 : nand_read_buf;
 	if (!chip->scan_bbt)
 		chip->scan_bbt = nand_default_bbt;
-- 
1.7.9.5
