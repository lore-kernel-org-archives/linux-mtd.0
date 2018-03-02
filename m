From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Josh Wu <rainyfeeling@outlook.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>, Stefan Agner <stefan@agner.ch>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 39/52] mtd: rawnand: tango: fix probe function error path
Date: Fri,  2 Mar 2018 18:03:47 +0100
Message-Id: <20180302170400.6712-40-miquel.raynal@bootlin.com>
In-Reply-To: <20180302170400.6712-1-miquel.raynal@bootlin.com>
References: <20180302170400.6712-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

An error after nand_scan_tail() should trigger a nand_release().

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/tango_nand.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/tango_nand.c b/drivers/mtd/nand/raw/tango_nand.c
index c5bee00b7f5e..69e5eb136edc 100644
--- a/drivers/mtd/nand/raw/tango_nand.c
+++ b/drivers/mtd/nand/raw/tango_nand.c
@@ -591,8 +591,10 @@ static int chip_init(struct device *dev, struct device_node *np)
 	tchip->bb_cfg = BB_CFG(mtd->writesize, BBM_SIZE);
 
 	err = mtd_device_register(mtd, NULL, 0);
-	if (err)
+	if (err) {
+		nand_release(mtd);
 		return err;
+	}
 
 	nfc->chips[cs] = tchip;
 
-- 
2.14.1
