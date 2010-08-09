From: Baruch Siach <baruch@tkos.co.il>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] nand: fix .correct callback return value check
Date: Mon,  9 Aug 2010 07:20:23 +0300
Message-Id: <ca767a0d6cafbea862c307e944c2b800dafb6660.1281327492.git.baruch@tkos.co.il>
In-Reply-To: <20100808204341.GA20065@pengutronix.de>
References: <20100808204341.GA20065@pengutronix.de>
Cc: Baruch Siach <baruch@tkos.co.il>,
	Russell King - ARM Linux <linux@arm.linux.org.uk>,
	John Ogness <john.ogness@linutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Drivers may (and do) return negative errno values other than -1 from the
.correct callback.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 drivers/mtd/nand/nand_base.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 4a7b864..080f551 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1210,7 +1210,7 @@ static int nand_read_subpage(struct mtd_info *mtd, struct nand_chip *chip, uint3
 		int stat;
 
 		stat = chip->ecc.correct(mtd, p, &chip->buffers->ecccode[i], &chip->buffers->ecccalc[i]);
-		if (stat == -1)
+		if (stat < 0)
 			mtd->ecc_stats.failed++;
 		else
 			mtd->ecc_stats.corrected += stat;
-- 
1.7.1
