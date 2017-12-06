Received: from mail-cys01nam02on0053.outbound.protection.outlook.com
 ([104.47.37.53] helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMUsl-0001KJ-6r
 for linux-mtd@lists.infradead.org; Wed, 06 Dec 2017 08:16:44 +0000
From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: <linux-mtd@lists.infradead.org>
CC: <dedekind1@gmail.com>, <computersforpeace@gmail.com>,
 <boris.brezillon@free-electrons.com>, Prabhakar Kushwaha
 <prabhakar.kushwaha@nxp.com>
Subject: [RFC 02/10] mtd: spi-nor: Use the highest supported READ protocol
Date: Wed, 6 Dec 2017 13:45:33 +0530
Message-ID: <1512548141-3319-3-git-send-email-prabhakar.kushwaha@nxp.com>
In-Reply-To: <1512548141-3319-1-git-send-email-prabhakar.kushwaha@nxp.com>
References: <1512548141-3319-1-git-send-email-prabhakar.kushwaha@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

HWCAP read capabilities defines higher bit position as the higher
priority. i.e. use Octo SPI protocols first, then Quad SPI protocols
before Dual SPI protocols, Fast Read and lastly (Slow) Read.

Currently implementation chose the last set bit i.e. slowest read.
This patch select the highest available read capability.

Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 7d3b52f..01898e1 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2521,7 +2521,7 @@ static int spi_nor_select_read(struct spi_nor *nor,
 			       const struct spi_nor_flash_parameter *params,
 			       u32 shared_hwcaps)
 {
-	int cmd, best_match = fls(shared_hwcaps & SNOR_HWCAPS_READ_MASK) - 1;
+	int cmd, best_match = ffs(shared_hwcaps & SNOR_HWCAPS_READ_MASK) - 1;
 	const struct spi_nor_read_command *read;
 
 	if (best_match < 0)
-- 
2.7.4
