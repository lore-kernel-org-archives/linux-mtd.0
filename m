Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dxBmY-0003yc-M2
 for linux-mtd@lists.infradead.org; Wed, 27 Sep 2017 12:49:44 +0000
Received: by mail-wm0-x243.google.com with SMTP id m127so17841402wmm.3
 for <linux-mtd@lists.infradead.org>; Wed, 27 Sep 2017 05:49:20 -0700 (PDT)
Message-ID: <1506516557.19393.5.camel@gmail.com>
Subject: [PATCH] mtd: nand: atmel: fix buffer overflow in atmel_pmecc_user
From: Richard Genoud <richard.genoud@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Genoud <richard.genoud@gmail.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
Date: Wed, 27 Sep 2017 14:49:17 +0200
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When calculating the size needed by struct atmel_pmecc_user *user,
the dmu and delta buffer sizes were forgotten.
This lead to a memory corruption (especially with a large ecc_strength).

Link: http://lkml.kernel.org/r/1506503157.3016.5.camel@gmail.com
Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: stable@vger.kernel.org
Reported-by: Richard Genoud <richard.genoud@gmail.com>
Pointed-at-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 drivers/mtd/nand/atmel/pmecc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/atmel/pmecc.c b/drivers/mtd/nand/atmel/pmecc.c
index 146af8218314..8268636675ef 100644
--- a/drivers/mtd/nand/atmel/pmecc.c
+++ b/drivers/mtd/nand/atmel/pmecc.c
@@ -363,7 +363,7 @@ atmel_pmecc_create_user(struct atmel_pmecc *pmecc,
 	size += (req->ecc.strength + 1) * sizeof(u16);
 	/* Reserve space for mu, dmu and delta. */
 	size = ALIGN(size, sizeof(s32));
-	size += (req->ecc.strength + 1) * sizeof(s32);
+	size += (req->ecc.strength + 1) * sizeof(s32) * 3;
 
 	user = kzalloc(size, GFP_KERNEL);
 	if (!user)
