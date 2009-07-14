Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MQjCV-0006Ct-K0
	for linux-mtd@lists.infradead.org; Tue, 14 Jul 2009 14:41:54 +0000
Date: Tue, 14 Jul 2009 16:41:35 +0200
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] Orion NAND: Make dword load asm volatile to avoid GCC
	optimizing it away
Message-ID: <20090714164135.65e91b91@marrow.netinsight.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

GCC 4.3.3 happily removes the dword load instruction in
orion_nand_read_buf. This patch makes the inline assembly volatile to
avoid this situation.

Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
---
 drivers/mtd/nand/orion_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
index 7ad9722..3f9b113 100644
--- a/drivers/mtd/nand/orion_nand.c
+++ b/drivers/mtd/nand/orion_nand.c
@@ -61,7 +61,7 @@ static void orion_nand_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 	buf64 = (uint64_t *)buf;
 	while (i < len/8) {
 		uint64_t x;
-		asm ("ldrd\t%0, [%1]" : "=r" (x) : "r" (io_base));
+		asm volatile ("ldrd\t%0, [%1]" : "=r" (x) : "r" (io_base));
 		buf64[i++] = x;
 	}
 	i *= 8;
-- 
1.6.0.4
