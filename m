Received: from eddie.linux-mips.org ([148.251.95.138] helo=cvs.linux-mips.org)
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eYh9y-0002F6-0f
 for linux-mtd@lists.infradead.org; Mon, 08 Jan 2018 23:48:56 +0000
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
 (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
 id S23993049AbeAHXskU1mKs (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Tue, 9 Jan 2018 00:48:40 +0100
Date: Tue, 9 Jan 2018 00:48:37 +0100
Sender: Ladislav Michl <ladis@linux-mips.org>
From: Ladislav Michl <ladis@linux-mips.org>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: [PATCH] mtd: nand: samsung: Disable subpage writes on E-die NAND
Message-ID: <20180108234837.GA15913@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Samsung E-die SLC NAND manufactured using 21nm process supports only
1 partial program cycle, so disable subpage writes for it.
Manufacturing process is stored in lowest two bits of 5th ID byte.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 Note: Patch generated and tested against next-20180108 on at91sam9g20
       board with K9F1G08U0E.

 drivers/mtd/nand/nand_samsung.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nand_samsung.c b/drivers/mtd/nand/nand_samsung.c
index f6b0a63a068c..9400b4a84243 100644
--- a/drivers/mtd/nand/nand_samsung.c
+++ b/drivers/mtd/nand/nand_samsung.c
@@ -92,10 +92,17 @@ static void samsung_nand_decode_id(struct nand_chip *chip)
 	} else {
 		nand_decode_ext_id(chip);
 
-		/* Datasheet values for SLC Samsung K9F4G08U0D-S[I|C]B0(T00) */
-		if (nand_is_slc(chip) && chip->id.data[1] == 0xDC) {
-			chip->ecc_step_ds = 512;
-			chip->ecc_strength_ds = 1;
+		if (nand_is_slc(chip)) {
+			/* K9F4G08U0D-S[I|C]B0(T00) */
+			if (chip->id.data[1] == 0xDC) {
+				chip->ecc_step_ds = 512;
+				chip->ecc_strength_ds = 1;
+			}
+
+			/* 21nm chips do not support partial page write */
+			if (chip->id.len > 4 &&
+			    (chip->id.data[4] & GENMASK(1,0)) == 0x1)
+				chip->options |= NAND_NO_SUBPAGE_WRITE;
 		}
 	}
 }
-- 
2.15.1
