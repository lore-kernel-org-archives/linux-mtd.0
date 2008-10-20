Received: from ganesha.gnumonks.org ([2001:780:45:1d:2e0:81ff:fe28:898a])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Krqvm-0006wR-As
	for linux-mtd@lists.infradead.org; Mon, 20 Oct 2008 09:20:07 +0000
Date: Mon, 20 Oct 2008 11:14:48 +0200
From: Harald Welte <laforge@gnumonks.org>
To: Ben Dooks <ben@trinity.fluff.org>
Subject: [PATCH] S3C24xx NAND: allow for faster timings
Message-ID: <20081020091447.GA1048@prithivi.gnumonks.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Tacls can actually be zero with some NAND flash devices, so we need
to permit this.

Also, the TACLS register actually specifies the actual number of
HCLK clocks, where the TWRPH0 and TWRPH1 registers are auto-incremented
by one HCLK clock in hardware.

Signed-off-by: Harald Welte <laforge@openmoko.org>
---
 drivers/mtd/nand/s3c2410.c |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 4413d76..81f66ba 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -168,9 +168,6 @@ static int s3c_nand_calc_rate(int wanted, unsigned long clk, int max)
 		return -1;
 	}
 
-	if (result < 1)
-		result = 1;
-
 	return result;
 }
 
@@ -202,7 +199,7 @@ static int s3c2410_nand_inithw(struct s3c2410_nand_info *info,
 		twrph1 = 8;
 	}
 
-	if (tacls < 0 || twrph0 < 0 || twrph1 < 0) {
+	if (tacls < 0 || twrph0 < 1 || twrph1 < 1) {
 		dev_err(info->device, "cannot get suitable timings\n");
 		return -EINVAL;
 	}
@@ -213,14 +210,14 @@ static int s3c2410_nand_inithw(struct s3c2410_nand_info *info,
  	switch (info->cpu_type) {
  	case TYPE_S3C2410:
 		cfg = S3C2410_NFCONF_EN;
-		cfg |= S3C2410_NFCONF_TACLS(tacls - 1);
+		cfg |= S3C2410_NFCONF_TACLS(tacls);
 		cfg |= S3C2410_NFCONF_TWRPH0(twrph0 - 1);
 		cfg |= S3C2410_NFCONF_TWRPH1(twrph1 - 1);
 		break;
 
  	case TYPE_S3C2440:
  	case TYPE_S3C2412:
-		cfg = S3C2440_NFCONF_TACLS(tacls - 1);
+		cfg = S3C2440_NFCONF_TACLS(tacls);
 		cfg |= S3C2440_NFCONF_TWRPH0(twrph0 - 1);
 		cfg |= S3C2440_NFCONF_TWRPH1(twrph1 - 1);
 
-- 
1.5.6.5
-- 
- Harald Welte <laforge@gnumonks.org>           http://laforge.gnumonks.org/
============================================================================
"Privacy in residential applications is a desirable marketing option."
                                                  (ETSI EN 300 175-7 Ch. A6)
