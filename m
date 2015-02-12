Received: from guitar.tcltek.co.il ([192.115.133.116] helo=mx.tkos.co.il)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YLrcq-0005O1-Jm
 for linux-mtd@lists.infradead.org; Thu, 12 Feb 2015 11:08:07 +0000
From: Baruch Siach <baruch@tkos.co.il>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: nand: increase tWB to 200ns
Date: Thu, 12 Feb 2015 13:06:22 +0200
Message-Id: <c6ed3415192689588a77277dca1fdf174f87b244.1423739182.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Baruch Siach <baruch@tkos.co.il>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ONFI spec (version 4.0, §4.18.1) sets tWB to max 200ns for SDR mode 0.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 drivers/mtd/nand/nand_base.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 31e252a5ce9c..ebb7749247d5 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -662,7 +662,7 @@ static void nand_command(struct mtd_info *mtd, unsigned int command,
 	 * Apply this short delay always to ensure that we do wait tWB in
 	 * any case on any machine.
 	 */
-	ndelay(100);
+	ndelay(200);
 
 	nand_wait_ready(mtd);
 }
@@ -774,7 +774,7 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
 	 * Apply this short delay always to ensure that we do wait tWB in
 	 * any case on any machine.
 	 */
-	ndelay(100);
+	ndelay(200);
 
 	nand_wait_ready(mtd);
 }
@@ -883,7 +883,7 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 	 * Apply this short delay always to ensure that we do wait tWB in any
 	 * case on any machine.
 	 */
-	ndelay(100);
+	ndelay(200);
 
 	chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
 
-- 
2.1.4
