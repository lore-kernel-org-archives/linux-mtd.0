Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aEMU7-0000mL-Pg
 for linux-mtd@lists.infradead.org; Wed, 30 Dec 2015 19:32:37 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: "Franklin S Cooper Jr." <fcooper@ti.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v4 4/5] mtd: nand: diskonchip: remove custom 'erased check'
 implementation
Date: Wed, 30 Dec 2015 20:32:06 +0100
Message-Id: <1451503927-10831-5-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1451503927-10831-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1451503927-10831-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The diskonchip drivers is manually checking for 'erased pages' while
correcting ECC bytes.
This logic can now done by the core infrastructure, and can thus be removed
from this drivers.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/diskonchip.c | 37 ++-----------------------------------
 1 file changed, 2 insertions(+), 35 deletions(-)

diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
index a5c0466..a6927bf 100644
--- a/drivers/mtd/nand/diskonchip.c
+++ b/drivers/mtd/nand/diskonchip.c
@@ -74,10 +74,6 @@ struct doc_priv {
 	int (*late_init)(struct mtd_info *mtd);
 };
 
-/* This is the syndrome computed by the HW ecc generator upon reading an empty
-   page, one with all 0xff for data and stored ecc code. */
-static u_char empty_read_syndrome[6] = { 0x26, 0xff, 0x6d, 0x47, 0x73, 0x7a };
-
 /* This is the ecc value computed by the HW ecc generator upon writing an empty
    page, one with all 0xff for data. */
 static u_char empty_write_ecc[6] = { 0x4b, 0x00, 0xe2, 0x0e, 0x93, 0xf7 };
@@ -912,7 +908,6 @@ static int doc200x_correct_data(struct mtd_info *mtd, u_char *dat,
 	void __iomem *docptr = doc->virtadr;
 	uint8_t calc_ecc[6];
 	volatile u_char dummy;
-	int emptymatch = 1;
 
 	/* flush the pipeline */
 	if (DoC_is_2000(doc)) {
@@ -936,37 +931,9 @@ static int doc200x_correct_data(struct mtd_info *mtd, u_char *dat,
 				calc_ecc[i] = ReadDOC_(docptr, DoC_Mplus_ECCSyndrome0 + i);
 			else
 				calc_ecc[i] = ReadDOC_(docptr, DoC_ECCSyndrome0 + i);
-			if (calc_ecc[i] != empty_read_syndrome[i])
-				emptymatch = 0;
-		}
-		/* If emptymatch=1, the read syndrome is consistent with an
-		   all-0xff data and stored ecc block.  Check the stored ecc. */
-		if (emptymatch) {
-			for (i = 0; i < 6; i++) {
-				if (read_ecc[i] == 0xff)
-					continue;
-				emptymatch = 0;
-				break;
-			}
 		}
-		/* If emptymatch still =1, check the data block. */
-		if (emptymatch) {
-			/* Note: this somewhat expensive test should not be triggered
-			   often.  It could be optimized away by examining the data in
-			   the readbuf routine, and remembering the result. */
-			for (i = 0; i < 512; i++) {
-				if (dat[i] == 0xff)
-					continue;
-				emptymatch = 0;
-				break;
-			}
-		}
-		/* If emptymatch still =1, this is almost certainly a freshly-
-		   erased block, in which case the ECC will not come out right.
-		   We'll suppress the error and tell the caller everything's
-		   OK.  Because it is. */
-		if (!emptymatch)
-			ret = doc_ecc_decode(rs_decoder, dat, calc_ecc);
+
+		ret = doc_ecc_decode(rs_decoder, dat, calc_ecc);
 		if (ret > 0)
 			printk(KERN_ERR "doc200x_correct_data corrected %d errors\n", ret);
 	}
-- 
2.1.4
