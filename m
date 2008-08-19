Received: from oceanus.site5.com ([67.43.13.2])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KVONl-0006Fd-Dw
	for linux-mtd@lists.infradead.org; Tue, 19 Aug 2008 10:24:10 +0000
Message-ID: <48AA9F44.6000905@compulab.co.il>
Date: Tue, 19 Aug 2008 13:24:04 +0300
From: Mike Rapoport <mike@compulab.co.il>
MIME-Version: 1.0
To: eric miao <eric.y.miao@gmail.com>
Subject: [PATCH] pxa3xx_nand: Add Samsung512MbX8
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	ARM Linux <linux-arm-kernel@lists.arm.linux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add definitions of Samsung512MbX8 flashes

Signed-off-by: Mike Rapoport <mike@compulab.co.il>

 drivers/mtd/nand/pxa3xx_nand.c |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index a64ad15..06e03bf 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -291,10 +291,34 @@ static struct pxa3xx_nand_flash micron1GbX16 = {
 	.chip_id	= 0xb12c,
 };

+static struct pxa3xx_nand_timing samsung512MbX8_timing = {
+	.tCH	= 25,
+	.tCS	= 44,
+	.tWH	= 32,
+	.tWP	= 44,
+	.tRH	= 32,
+	.tRP	= 44,
+	.tR	= 25000,
+	.tWHR	= 96,
+	.tAR	= 25,
+};
+
+static struct pxa3xx_nand_flash samsung512MbX8 = {
+	.timing		= &samsung512MbX8_timing,
+	.cmdset		= &largepage_cmdset,
+	.page_per_block	= 64,
+	.page_size	= 2048,
+	.flash_width	= 8,
+	.dfc_width	= 8,
+	.num_blocks	= 4096,
+	.chip_id	= 0xdcec,
+};
+
 static struct pxa3xx_nand_flash *builtin_flash_types[] = {
 	&samsung512MbX16,
 	&micron1GbX8,
 	&micron1GbX16,
+	&samsung512MbX8,
 };

 #define NDTR0_tCH(c)	(min((c), 7) << 19)


-- 
Sincerely yours,
Mike.
