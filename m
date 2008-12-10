Received: from rv-out-0708.google.com ([209.85.198.240])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LAQx0-0000Pc-5V
	for linux-mtd@lists.infradead.org; Wed, 10 Dec 2008 15:26:10 +0000
Received: by rv-out-0708.google.com with SMTP id b17so451866rvf.42
	for <linux-mtd@lists.infradead.org>;
	Wed, 10 Dec 2008 07:26:09 -0800 (PST)
Message-ID: <f17812d70812100726y305a90f8i251d4b9c12640ab4@mail.gmail.com>
Date: Wed, 10 Dec 2008 23:26:09 +0800
From: "Eric Miao" <eric.y.miao@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] [MTD][NAND] pxa3xx: convert from ns to clock ticks more
	accurately
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Cc: David Woodhouse <dwmw2@infradead.org>,
	ARM Linux <linux-arm-kernel@lists.arm.linux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From e12b9d1a578bc2d70dc2233af3caf06e672dfcce Mon Sep 17 00:00:00 2001
From: Matt Reimer <mreimer@vpop.net>
Date: Tue, 18 Nov 2008 10:54:32 -0800
Subject: [PATCH] [MTD][NAND] pxa3xx: convert from ns to clock ticks
more accurately

The various fields in NDTR{01} are in units of clock ticks minus one, but the
ns2cycle macro mistakenly adds one, inflating the number of clock ticks and
making it impossible to set any of these fields to zero.

Signed-off-by: Matt Reimer <mreimer@vpop.net>
Signed-off-by: Eric Miao <eric.miao@marvell.com>
---
 drivers/mtd/nand/pxa3xx_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index b797c1c..1e4f383 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -297,7 +297,7 @@ static struct pxa3xx_nand_flash *builtin_flash_types[] = {
 #define NDTR1_tAR(c)	(min((c), 15) << 0)

 /* convert nano-seconds to nand flash controller clock cycles */
-#define ns2cycle(ns, clk)	(int)(((ns) * (clk / 1000000) / 1000) + 1)
+#define ns2cycle(ns, clk)	(int)(((ns) * (clk / 1000000) / 1000) - 1)

 static void pxa3xx_nand_set_timing(struct pxa3xx_nand_info *info,
 				   const struct pxa3xx_nand_timing *t)
-- 
1.6.0.4
