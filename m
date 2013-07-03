From: Josh Wu <josh.wu@atmel.com>
To: <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <dedekind1@gmail.com>
Subject: [PATCH] mtd: atmel_nand: fix pmecc selction for ecc requirement typo
Date: Wed, 3 Jul 2013 17:56:19 +0800
Message-ID: <1372845379-5958-1-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Josh Wu <josh.wu@atmel.com>, plagnioj@jcrosoft.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Atmel PMECC support 2, 4, 8, 12, 24 bit error correction.
So if the ecc requirement in ONFI is <= 2, 4, 8, 12, 24.
We will use 2, 4, 8, 12, 24.

This patch fix the typo. Use '<=' replace '<'.

Reported-by: Scott Wood <scottwood@freescale.com>
Signed-off-by: Josh Wu <josh.wu@atmel.com>
---
 drivers/mtd/nand/atmel_nand.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 7e50ed8..2a42aa8 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -960,11 +960,11 @@ static int pmecc_choose_ecc(struct atmel_nand_host *host,
 			host->pmecc_corr_cap = 2;
 		else if (*cap <= 4)
 			host->pmecc_corr_cap = 4;
-		else if (*cap < 8)
+		else if (*cap <= 8)
 			host->pmecc_corr_cap = 8;
-		else if (*cap < 12)
+		else if (*cap <= 12)
 			host->pmecc_corr_cap = 12;
-		else if (*cap < 24)
+		else if (*cap <= 24)
 			host->pmecc_corr_cap = 24;
 		else
 			return -EINVAL;
-- 
1.7.9.5
