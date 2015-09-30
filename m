Received: from li271-223.members.linode.com ([178.79.152.223]
 helo=mail.mleia.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhQjR-0007bf-KJ
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2015 23:24:18 +0000
From: Vladimir Zapolskiy <vz@mleia.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Roland Stigge <stigge@antcom.de>
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH v2 3/3] mtd: nand: lpc32xx_slc: fix calculation of timing arcs
 from given values
Date: Thu,  1 Oct 2015 02:23:37 +0300
Message-Id: <1443655417-14689-4-git-send-email-vz@mleia.com>
In-Reply-To: <1443655417-14689-1-git-send-email-vz@mleia.com>
References: <1443655417-14689-1-git-send-email-vz@mleia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

According to LPC32xx User's Manual all values measured in clock cycles
are programmable from 1 to 16 clocks (4 bits) starting from 0 in
bitfield, the current version of calculated clock cycles is too
conservative.

Correctness of 0 bitfield value (i.e. programmed 1 clock
timing) is proven with actual NAND chip devices.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
Changes from v2 to v1:
* use less conservative "DIV_ROUND_UP(c, n) - 1" construction instead of "c / n"

 drivers/mtd/nand/lpc32xx_slc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/lpc32xx_slc.c b/drivers/mtd/nand/lpc32xx_slc.c
index a9e8a02..cbf4501 100644
--- a/drivers/mtd/nand/lpc32xx_slc.c
+++ b/drivers/mtd/nand/lpc32xx_slc.c
@@ -95,7 +95,7 @@
 * slc_tac register definitions
 **********************************************************************/
 /* Computation of clock cycles on basis of controller and device clock rates */
-#define SLCTAC_CLOCKS(c, n, s)	(min_t(u32, 1 + (c / n), 0xF) << s)
+#define SLCTAC_CLOCKS(c, n, s)	(min_t(u32, DIV_ROUND_UP(c, n) - 1, 0xF) << s)
 
 /* Clock setting for RDY write sample wait time in 2*n clocks */
 #define SLCTAC_WDR(n)		(((n) & 0xF) << 28)
-- 
2.1.4
