Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OkuiW-0008SJ-Im
	for linux-mtd@lists.infradead.org; Mon, 16 Aug 2010 08:06:54 +0000
Received: by gwb10 with SMTP id 10so2195910gwb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 16 Aug 2010 01:06:46 -0700 (PDT)
Subject: [PATCH] [MTD] [NAND] pxa3xx: fix ns2cycle equation
From: Axel Lin <axel.lin@gmail.com>
To: linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain
Date: Mon, 16 Aug 2010 16:09:09 +0800
Message-Id: <1281946149.10299.1.camel@mola>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Eric Miao <eric.y.miao@gmail.com>, Matt Reimer <mreimer@vpop.net>,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Test on a PXA310 platform with Samsung K9F2G08X0B NAND flash,
with tCH=5 and clk is 156MHz, ns2cycle(5, 156000000) returns -1.

ns2cycle returns negtive value will break NDTR0_tXX macros.

After checking the commit log, I found the problem is introduced by
commit 5b0d4d7c8a67c5ba3d35e6ceb0c5530cc6846db7
"[MTD] [NAND] pxa3xx: convert from ns to clock ticks more accurately"

To get num of clock cycles, we use below equation:
num of clock cycles = time (ns) / one clock cycle (ns) + 1
We need to add 1 cycle here because integer division will truncate the result.
It is possible the developers set the Min values in SPEC for timing settings.
Thus the truncate may cause problem, and it is safe to add an extra cycle here.

The various fields in NDTR{01} are in units of clock ticks minus one,
thus we should subtract 1 cycle then.

Thus the correct equation should be:
num of clock cycles = time (ns) / one clock cycle (ns) + 1 - 1
                    = time (ns) / one clock cycle (ns)

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/mtd/nand/pxa3xx_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index e02fa4f..4d89f37 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -363,7 +363,7 @@ static struct pxa3xx_nand_flash *builtin_flash_types[] = {
 #define tAR_NDTR1(r)	(((r) >> 0) & 0xf)
 
 /* convert nano-seconds to nand flash controller clock cycles */
-#define ns2cycle(ns, clk)	(int)(((ns) * (clk / 1000000) / 1000) - 1)
+#define ns2cycle(ns, clk)	(int)((ns) * (clk / 1000000) / 1000)
 
 /* convert nand flash controller clock cycles to nano-seconds */
 #define cycle2ns(c, clk)	((((c) + 1) * 1000000 + clk / 500) / (clk / 1000))
-- 
1.7.2
