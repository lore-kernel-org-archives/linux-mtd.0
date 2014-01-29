Received: from mail-ie0-x22f.google.com ([2607:f8b0:4001:c03::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8dTL-0003BU-FB
 for linux-mtd@lists.infradead.org; Wed, 29 Jan 2014 22:19:03 +0000
Received: by mail-ie0-f175.google.com with SMTP id ar20so2630639iec.6
 for <linux-mtd@lists.infradead.org>; Wed, 29 Jan 2014 14:18:42 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] mtd: nand: don't use read_buf for 8-bit ONFI transfers
Date: Wed, 29 Jan 2014 14:18:29 -0800
Message-Id: <1391033909-6563-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1391033909-6563-1-git-send-email-computersforpeace@gmail.com>
References: <1391033909-6563-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Brian Norris <computersforpeace@gmail.com>, Pekon Gupta <pekon@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 u.kleine-koenig@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use a repeated read_byte() instead of read_buf(), since for x16 buswidth
devices, we need to avoid the upper I/O[16:9] bits. See the following
commit for reference:

commit 05f7835975dad6b3b517f9e23415985e648fb875
Author: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Date:   Thu Dec 5 22:22:04 2013 +0100

    mtd: nand: don't use {read,write}_buf for 8-bit transfers

Now, I think that all barriers to probing ONFI on x16 devices are
removed, so remove the check from nand_flash_detect_onfi().

Tested on 8-bit ONFI NAND (Micron MT29F32G08CBADAWP).

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index c69a1f7ce0a2..47fdf1704ff1 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3065,7 +3065,7 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 					int *busw)
 {
 	struct nand_onfi_params *p = &chip->onfi_params;
-	int i;
+	int i, j;
 	int val;
 
 	/* Try ONFI for unknown chip or LP */
@@ -3074,18 +3074,10 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 		chip->read_byte(mtd) != 'F' || chip->read_byte(mtd) != 'I')
 		return 0;
 
-	/*
-	 * ONFI must be probed in 8-bit mode or with NAND_BUSWIDTH_AUTO, not
-	 * with NAND_BUSWIDTH_16
-	 */
-	if (chip->options & NAND_BUSWIDTH_16) {
-		pr_err("ONFI cannot be probed in 16-bit mode; aborting\n");
-		return 0;
-	}
-
 	chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1);
 	for (i = 0; i < 3; i++) {
-		chip->read_buf(mtd, (uint8_t *)p, sizeof(*p));
+		for (j = 0; j < sizeof(*p); j++)
+			((uint8_t *)p)[j] = chip->read_byte(mtd);
 		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 254) ==
 				le16_to_cpu(p->crc)) {
 			break;
-- 
1.8.3.2
