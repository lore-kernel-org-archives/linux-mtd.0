Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZcqgY-0007ZU-C2
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2015 08:06:22 +0000
From: Enrico Jorns <ejo@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: kernel@pengutronix.de,
	Enrico Jorns <ejo@pengutronix.de>
Subject: [PATCH] mtd: nand: denali: pass col argument to READID operation
Date: Fri, 18 Sep 2015 10:02:41 +0200
Message-Id: <1442563361-32230-1-git-send-email-ejo@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A read id operation followed by 0x00 reads the device ID while
a read id operation followed by 0x20 reads the possible ONFI identifier.

As the READID function did not propagate the second id parameter but had
a hard-coded call for 0x90 0x00, reading the ONFI identifier was not
possible and thus chips werde not detected (tested with
MT29F8G08ABABAWP)

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 drivers/mtd/nand/denali.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 870c7fc..7b6186f 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1304,7 +1304,7 @@ static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
 		 */
 		addr = MODE_11 | BANK(denali->flash_bank);
 		index_addr(denali, addr | 0, 0x90);
-		index_addr(denali, addr | 1, 0);
+		index_addr(denali, addr | 1, col);
 		for (i = 0; i < 8; i++) {
 			index_addr_read_data(denali, addr | 2, &id);
 			write_byte_to_buf(denali, id);
-- 
2.5.1
