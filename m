Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OoEwD-00022i-3U
	for linux-mtd@lists.infradead.org; Wed, 25 Aug 2010 12:18:41 +0000
From: Wolfram Sang <w.sang@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [RFC] nand/davinci: Fix comment to match the code
Date: Wed, 25 Aug 2010 14:18:20 +0200
Message-Id: <1282738700-30966-1-git-send-email-w.sang@pengutronix.de>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	davinci-linux-open-source@linux.davincidsp.com,
	Sudhakar Rajashekhara <sudhakar.raj@ti.com>,
	Sneha Narnakaje <nsnehaprabha@ti.com>, Wolfram Sang <w.sang@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
Cc: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
Cc: Sneha Narnakaje <nsnehaprabha@ti.com>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---

Found while debugging a NAND issue with a dm365.

 drivers/mtd/nand/davinci_nand.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index 2ac7367..53f864a 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -369,8 +369,9 @@ compare:
 	 * after setting the 4BITECC_ADD_CALC_START bit. So if you immediately
 	 * begin trying to poll for the state, you may fall right out of your
 	 * loop without any of the correction calculations having taken place.
-	 * The recommendation from the hardware team is to wait till ECC_STATE
-	 * reads less than 4, which means ECC HW has entered correction state.
+	 * The recommendation from the hardware team is to initially delay as
+	 * long as ECC_STATE reads less than 4. After that, ECC HW has entered
+	 * correction state.
 	 */
 	do {
 		ecc_state = (davinci_nand_readl(info,
-- 
1.7.1
