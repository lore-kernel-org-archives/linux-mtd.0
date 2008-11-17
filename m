From: "Denis V. Lunev" <den@openvz.org>
To: dwmw2@infradead.org
Subject: [PATCH] mtd: OOPS accessing flash operations over STM flash on PXA
Date: Mon, 17 Nov 2008 12:22:15 +0300
Message-Id: <1226913735-9469-1-git-send-email-den@openvz.org>
Sender: <den@sw.ru>
Cc: "Denis V. Lunev" <den@openvz.org>, ymiao3@marvell.com,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

STM 2Gb flash is a large-page NAND flash. Set operations accordingly.
This field is dereferrenced without a check in several places resulting
in OOPS (seen in reality).

Signed-off-by: Denis V. Lunev <den@openvz.org>
---
 drivers/mtd/nand/pxa3xx_nand.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index c0fa9c9..15f0a26 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -269,6 +269,7 @@ static struct pxa3xx_nand_timing stm2GbX16_timing = {
 
 static struct pxa3xx_nand_flash stm2GbX16 = {
 	.timing = &stm2GbX16_timing,
+	.cmdset	= &largepage_cmdset,
 	.page_per_block = 64,
 	.page_size = 2048,
 	.flash_width = 16,
-- 
1.5.6.4
