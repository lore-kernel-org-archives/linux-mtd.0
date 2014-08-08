Received: from bear.ext.ti.com ([192.94.94.41])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFl9N-0000rv-2L
 for linux-mtd@lists.infradead.org; Fri, 08 Aug 2014 14:28:09 +0000
From: Roger Quadros <rogerq@ti.com>
To: <computersforpeace@gmail.com>, <tony@atomide.com>,
 <gregkh@linuxfoundation.org>
Subject: [PATCH] mtd: nand: omap: Fix 1-bit Hamming code scheme,
 omap_calculate_ecc()
Date: Fri, 8 Aug 2014 17:27:08 +0300
Message-ID: <1407508028-12973-1-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: artem.bityutskiy@linux.intel.com, jg1.han@samsung.com, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, pekon@pek-sem.com,
 linux-mtd@lists.infradead.org, ezequiel.garcia@free-electrons.com,
 linux-omap@vger.kernel.org, dwmw2@infradead.org, Roger Quadros <rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

commit 65b97cf6b8de introduced in v3.7 caused a regression
by using a reversed CS_MASK thus causing omap_calculate_ecc to
always fail. As the NAND base driver never checks for .calculate()'s
return value, the zeroed ECC values are used as is without showing
any error to the user. However, this won't work and the NAND device
won't be guarded by any error code.

Fix the issue by using the correct mask.

Code was tested on omap3beagle using the following procedure
- flash the primary bootloader (MLO) from the kernel to the first
NAND partition using nandwrite.
- boot the board from NAND. This utilizes OMAP ROM loader that
relies on 1-bit Hamming code ECC.

Fixes: 65b97cf6b8de (mtd: nand: omap2: handle nand on gpmc)

Cc: <stable@vger.kernel.org>	[3.7+]
Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 drivers/mtd/nand/omap2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index f0ed92e..e2b9b34 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -931,7 +931,7 @@ static int omap_calculate_ecc(struct mtd_info *mtd, const u_char *dat,
 	u32 val;
 
 	val = readl(info->reg.gpmc_ecc_config);
-	if (((val >> ECC_CONFIG_CS_SHIFT)  & ~CS_MASK) != info->gpmc_cs)
+	if (((val >> ECC_CONFIG_CS_SHIFT) & CS_MASK) != info->gpmc_cs)
 		return -EINVAL;
 
 	/* read ecc result */
-- 
1.8.3.2
