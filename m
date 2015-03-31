Received: from smtprelay02.ispgateway.de ([80.67.31.40])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yd3je-0007Ny-DW
 for linux-mtd@lists.infradead.org; Tue, 31 Mar 2015 21:30:13 +0000
From: Christian Riesch <christian.riesch@omicron.at>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: cfi_cmdset_0002: Initialize datum before calling
 map_word_load_partial
Date: Tue, 31 Mar 2015 23:29:22 +0200
Message-Id: <1427837363-2782-1-git-send-email-christian.riesch@omicron.at>
Cc: Christian Riesch <christian.riesch@omicron.at>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In do_otp_write we must initialize the variable datum before calling
map_word_load_partial. Otherwise the upper bits of datum may be undefined,
which later causes problems in chip_good called by do_write_oneword.

Signed-off-by: Christian Riesch <christian.riesch@omicron.at>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index c50d8cf..c3624eb 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1295,7 +1295,7 @@ static int do_otp_write(struct map_info *map, struct flchip *chip, loff_t adr,
 		unsigned long bus_ofs = adr & ~(map_bankwidth(map)-1);
 		int gap = adr - bus_ofs;
 		int n = min_t(int, len, map_bankwidth(map) - gap);
-		map_word datum;
+		map_word datum = map_word_ff(map);
 
 		if (n != map_bankwidth(map)) {
 			/* partial write of a word, load old contents */
-- 
1.7.9.5
