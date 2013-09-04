Received: from mail-ie0-x229.google.com ([2607:f8b0:4001:c03::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VHHmP-0004mZ-KH
 for linux-mtd@lists.infradead.org; Wed, 04 Sep 2013 18:26:15 +0000
Received: by mail-ie0-f169.google.com with SMTP id tp5so1508655ieb.0
 for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2013 11:25:51 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 08/12] mtd: nand: don't print ONFI buswidth errors unless we
 need to
Date: Wed,  4 Sep 2013 11:25:22 -0700
Message-Id: <1378319126-24473-9-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1378319126-24473-1-git-send-email-computersforpeace@gmail.com>
References: <1378319126-24473-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There are a few things wrong with this error message.

First, it is unnecessary to print until after the READID (address 20h)
command. READID *has* to work properly in whatever bus width
configuration we are in, or else no identification mode works. So we can
silence some useless warnings on systems which come up in 16-bit mode
and do not even respond with an O-N-F-I string.

Second, it doesn't read very well, and it has an extraneous exclamation.

Third, it doesn't have proper multiline comment style.

So, I move the whole block below the READID check and rewrite it.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 38b8dd4..8599096 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2937,17 +2937,21 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
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
-- 
1.8.4
