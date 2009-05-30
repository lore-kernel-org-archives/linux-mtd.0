Received: from aeryn.fluff.org.uk ([87.194.8.8] helo=teyla.home.fluff.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MASe2-0003bK-LI
	for linux-mtd@lists.infradead.org; Sat, 30 May 2009 17:47:36 +0000
From: Ben Dooks <ben-linux@fluff.org>
To: linux-mtd@lists.infradead.org
Subject: [MTD] [NAND] S3C2410: Use DIV_ROUND_UP
Date: Sat, 30 May 2009 18:41:38 +0100
Message-Id: <1243705298-21814-12-git-send-email-ben-linux@fluff.org>
In-Reply-To: <1243705298-21814-11-git-send-email-ben-linux@fluff.org>
References: <1243705298-21814-1-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-2-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-3-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-4-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-5-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-6-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-7-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-8-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-9-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-10-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-11-git-send-email-ben-linux@fluff.org>
Cc: Ben Dooks <ben-linux@fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Change to using DIV_ROUND_UP() in the timing calculation
instead of blindly doing result++

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 drivers/mtd/nand/s3c2410.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 8a7f960..89b7905 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -180,8 +180,7 @@ static int s3c_nand_calc_rate(int wanted, unsigned long clk, int max)
 {
 	int result;
 
-	result = (wanted * clk) / NS_IN_KHZ;
-	result++;
+	result = DIV_ROUND_UP((wanted * clk), NS_IN_KHZ);
 
 	pr_debug("result %d from %ld, %d\n", result, clk, wanted);
 
-- 
1.5.6.5
