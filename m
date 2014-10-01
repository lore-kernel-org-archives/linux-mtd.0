Received: from mail-wi0-x22f.google.com ([2a00:1450:400c:c05::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XZLNm-0004EP-RD
 for linux-mtd@lists.infradead.org; Wed, 01 Oct 2014 15:00:00 +0000
Received: by mail-wi0-f175.google.com with SMTP id d1so856372wiv.8
 for <linux-mtd@lists.infradead.org>; Wed, 01 Oct 2014 07:59:34 -0700 (PDT)
From: Rostislav Lisovy <lisovy@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, pekon gupta <pekon@ti.com>,
 Tony Lindgren <tony@atomide.com>, Roger Quadros <rogerq@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] mtd: nand: omap: Do not use global variables
Date: Wed,  1 Oct 2014 16:59:13 +0200
Message-Id: <1412175554-19391-1-git-send-email-lisovy@merica.cz>
Cc: michal.vokac@comap.cz, lisovy@gmail.com,
 Rostislav Lisovy <lisovy@merica.cz>, sojkam1@fel.cvut.cz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since the commit 97a288ba2cfa ("ARM: omap2+: gpmc-nand: Use
dynamic platform_device_alloc()") gpmc-nand driver supports
multiple NAND flash devices connected to the single controller.
Remove global variable to make the code thread-safe.

Signed-off-by: Rostislav Lisovy <lisovy@merica.cz>
---
 drivers/mtd/nand/omap2.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 5967b38..24d5c6a 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -146,8 +146,6 @@ static u_char bch8_vector[] = {0xf3, 0xdb, 0x14, 0x16, 0x8b, 0xd2, 0xbe, 0xcc,
 static u_char bch4_vector[] = {0x00, 0x6b, 0x31, 0xdd, 0x41, 0xbc, 0x10};
 #endif
 
-/* oob info generated runtime depending on ecc algorithm and layout selected */
-static struct nand_ecclayout omap_oobinfo;
 
 struct omap_nand_info {
 	struct nand_hw_control		controller;
@@ -1794,7 +1792,7 @@ static int omap_nand_probe(struct platform_device *pdev)
 	}
 
 	/* populate MTD interface based on ECC scheme */
-	ecclayout		= &omap_oobinfo;
+	ecclayout		= kzalloc(sizeof(*ecclayout), GFP_KERNEL);
 	switch (info->ecc_opt) {
 	case OMAP_ECC_HAM1_CODE_SW:
 		nand_chip->ecc.mode = NAND_ECC_SOFT;
-- 
1.9.1
