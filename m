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
Subject: [PATCH 02/52] mtd: rawnand: bf5xx: fix probe function error path
Date: Fri,  2 Mar 2018 18:03:10 +0100
Message-Id: <20180302170400.6712-3-miquel.raynal@bootlin.com>
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
The helper mtd_device_register() (wrapped by bf5xx_nand_add_partition())
returns an error code that should be checked and nand_release() called
accordingly.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/bf5xx_nand.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/bf5xx_nand.c b/drivers/mtd/nand/raw/bf5xx_nand.c
index 9a1d8d104570..da7a6083b0e5 100644
--- a/drivers/mtd/nand/raw/bf5xx_nand.c
+++ b/drivers/mtd/nand/raw/bf5xx_nand.c
@@ -831,11 +831,16 @@ static int bf5xx_nand_probe(struct platform_device *pdev)
 #endif
 
 	/* add NAND partition */
-	bf5xx_nand_add_partition(info);
+	err = bf5xx_nand_add_partition(info);
+	if (err)
+		goto out_err_release_nand;
 
 	dev_dbg(&pdev->dev, "initialised ok\n");
+
 	return 0;
 
+out_err_release_nand:
+	nand_release(mtd);
 out_err_nand_scan:
 	bf5xx_nand_dma_remove(info);
 out_err:
-- 
2.14.1
