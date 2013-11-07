From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>
Subject: [PATCH v4 16/31] mtd: nand: pxa3xx: Use waitfunc() to wait for the
 device to be ready
Date: Thu,  7 Nov 2013 12:17:20 -0300
Message-Id: <1383837455-30721-17-git-send-email-ezequiel.garcia@free-electrons.com>
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

In pxa3xx_nand_sensing() instead of simply using info->is_ready
after issuing a command, the correct way of checking is to wait
for the device to be ready through the chip's waitfunc().

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 588b23a..6997a25 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1041,10 +1041,11 @@ static int pxa3xx_nand_sensing(struct pxa3xx_nand_info *info)
 		return ret;
 
 	chip->cmdfunc(mtd, NAND_CMD_RESET, 0, 0);
-	if (info->is_ready)
-		return 0;
+	ret = chip->waitfunc(mtd, chip);
+	if (ret & NAND_STATUS_FAIL)
+		return -ENODEV;
 
-	return -ENODEV;
+	return 0;
 }
 
 static int pxa3xx_nand_scan(struct mtd_info *mtd)
-- 
1.8.1.5
