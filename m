Received: from sdcmail02.amcc.com ([198.137.200.90])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MeHqh-00017Z-Jh
	for linux-mtd@lists.infradead.org; Fri, 21 Aug 2009 00:19:24 +0000
From: Feng Kan <fkan@amcc.com>
To: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org
Subject: [PATCH 1/1] Fix ECC Correction bug for SMC ordering for NDFC driver.
Date: Thu, 20 Aug 2009 17:19:17 -0700
Message-Id: <1250813957-1786-1-git-send-email-fkan@amcc.com>
Cc: Feng Kan <fkan@amcc.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix ECC Correction bug where the byte offset location were double
fliped causing correction routine to toggle the wrong byte location
in the ECC segment. The ndfc_calculate_ecc routine change the order
of getting the ECC code.
        /* The NDFC uses Smart Media (SMC) bytes order */
        ecc_code[0] = p[2];
        ecc_code[1] = p[1];
        ecc_code[2] = p[3];
But in the Correction algorithm when calculating the byte offset
location, the b1 is used as the upper part of the address. Which
again reverse the order making the final byte offset address 
location incorrect.
	byte_addr = (addressbits[b1] << 4) + addressbits[b0];
The order is change to read it in straight and let the correction
function to revert it to SMC order.

Signed-off-by: Feng Kan <fkan@amcc.com>
Acked-by: Victor Gallardo <vgallardo@amcc.com>
Acked-by: Prodyut Hazarika <phazarika@amcc.com>
---
 drivers/mtd/nand/ndfc.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/ndfc.c b/drivers/mtd/nand/ndfc.c
index 5906c40..d9d3e6e 100644
--- a/drivers/mtd/nand/ndfc.c
+++ b/drivers/mtd/nand/ndfc.c
@@ -101,8 +101,8 @@ static int ndfc_calculate_ecc(struct mtd_info *mtd,
 	wmb();
 	ecc = in_be32(ndfc->ndfcbase + NDFC_ECC);
 	/* The NDFC uses Smart Media (SMC) bytes order */
-	ecc_code[0] = p[2];
-	ecc_code[1] = p[1];
+	ecc_code[0] = p[1];
+	ecc_code[1] = p[2];
 	ecc_code[2] = p[3];
 
 	return 0;
-- 
1.5.5
