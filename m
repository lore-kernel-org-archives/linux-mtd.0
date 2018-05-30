Received: from mail1.bemta8.messagelabs.com ([216.82.243.201])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fNxTn-0007MC-Cn
 for linux-mtd@lists.infradead.org; Wed, 30 May 2018 09:33:17 +0000
From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Tokunori Ikegami <ikegami@allied-telesis.co.jp>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, stable@vger.kernel.org
Subject: [PATCH v8 4/5] mtd: cfi_cmdset_0002: Change erase functions to check
 chip good only
Date: Wed, 30 May 2018 18:32:29 +0900
Message-Id: <20180530093230.3240-5-ikegami@allied-telesis.co.jp>
In-Reply-To: <20180530093230.3240-1-ikegami@allied-telesis.co.jp>
References: <20180530093230.3240-1-ikegami@allied-telesis.co.jp>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently the functions use to check both chip ready and good.
But the chip ready is not enough to check the operation status.
So change this to check the chip good instead of this.
About the retry functions to make sure the error handling remain it.

Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Reviewed-by: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org
Cc: stable@vger.kernel.org
---
Changes since v7:
- None.

Changes since v6:
- Change Cc: Joakim Tjernlund tag as Reviewed-by: tag.
- Add Cc: stable tag.

Changes since v5:
- None since this change is implemented by v6 patch series.

 drivers/mtd/chips/cfi_cmdset_0002.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index e703900975d4..6adda4dc2007 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -2294,12 +2294,13 @@ static int __xipram do_erase_chip(struct map_info *map, struct flchip *chip)
 			chip->erase_suspended = 0;
 		}
 
-		if (chip_ready(map, adr))
+		if (chip_good(map, adr, map_word_ff(map)))
 			break;
 
 		if (time_after(jiffies, timeo)) {
 			printk(KERN_WARNING "MTD %s(): software timeout\n",
 			       __func__);
+			ret = -EIO;
 			break;
 		}
 
@@ -2307,15 +2308,15 @@ static int __xipram do_erase_chip(struct map_info *map, struct flchip *chip)
 		UDELAY(map, chip, adr, 1000000/HZ);
 	}
 	/* Did we succeed? */
-	if (!chip_good(map, adr, map_word_ff(map))) {
+	if (ret) {
 		/* reset on all failures. */
 		map_write(map, CMD(0xF0), chip->start);
 		/* FIXME - should have reset delay before continuing */
 
-		if (++retry_cnt <= MAX_RETRIES)
+		if (++retry_cnt <= MAX_RETRIES) {
+			ret = 0;
 			goto retry;
-
-		ret = -EIO;
+		}
 	}
 
 	chip->state = FL_READY;
@@ -2388,7 +2389,7 @@ static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,
 			chip->erase_suspended = 0;
 		}
 
-		if (chip_ready(map, adr)) {
+		if (chip_good(map, adr, map_word_ff(map))) {
 			xip_enable(map, chip, adr);
 			break;
 		}
@@ -2397,6 +2398,7 @@ static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,
 			xip_enable(map, chip, adr);
 			printk(KERN_WARNING "MTD %s(): software timeout\n",
 			       __func__);
+			ret = -EIO;
 			break;
 		}
 
@@ -2404,15 +2406,15 @@ static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,
 		UDELAY(map, chip, adr, 1000000/HZ);
 	}
 	/* Did we succeed? */
-	if (!chip_good(map, adr, map_word_ff(map))) {
+	if (ret) {
 		/* reset on all failures. */
 		map_write(map, CMD(0xF0), chip->start);
 		/* FIXME - should have reset delay before continuing */
 
-		if (++retry_cnt <= MAX_RETRIES)
+		if (++retry_cnt <= MAX_RETRIES) {
+			ret = 0;
 			goto retry;
-
-		ret = -EIO;
+		}
 	}
 
 	chip->state = FL_READY;
-- 
2.16.1
