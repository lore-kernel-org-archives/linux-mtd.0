From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>
Subject: [PATCH v4 09/31] mtd: nand: pxa3xx: read_page() returns max_bitflips
Date: Thu,  7 Nov 2013 12:17:13 -0300
Message-Id: <1383837455-30721-10-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1383837455-30721-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1383837455-30721-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>,
 Daniel Mack <zonque@gmail.com>, Huang Shijie <b32955@freescale.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As per the ecc.read_page() prototype, we must return the maximum number
of bitflips that were corrected on any one region covering an ecc step.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index c578ca7..521d43e 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -751,6 +751,7 @@ static int pxa3xx_nand_read_page_hwecc(struct mtd_info *mtd,
 {
 	struct pxa3xx_nand_host *host = mtd->priv;
 	struct pxa3xx_nand_info *info = host->info_data;
+	int max_bitflips = 0;
 
 	chip->read_buf(mtd, buf, mtd->writesize);
 	chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
@@ -758,6 +759,7 @@ static int pxa3xx_nand_read_page_hwecc(struct mtd_info *mtd,
 	if (info->retcode == ERR_SBERR) {
 		switch (info->use_ecc) {
 		case 1:
+			max_bitflips = 1;
 			mtd->ecc_stats.corrected++;
 			break;
 		case 0:
@@ -776,7 +778,7 @@ static int pxa3xx_nand_read_page_hwecc(struct mtd_info *mtd,
 			mtd->ecc_stats.failed++;
 	}
 
-	return 0;
+	return max_bitflips;
 }
 
 static uint8_t pxa3xx_nand_read_byte(struct mtd_info *mtd)
-- 
1.8.1.5
