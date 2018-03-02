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
Subject: [PATCH 28/52] mtd: rawnand: mxc: fix probe function error path
Date: Fri,  2 Mar 2018 18:03:36 +0100
Message-Id: <20180302170400.6712-29-miquel.raynal@bootlin.com>
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
The helper mtd_device_parse_register() returns an error code that should
be checked and nand_release() called accordingly.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/mxc_nand.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index 944ecf03d3b1..948fe3e9d8da 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1911,15 +1911,18 @@ static int mxcnd_probe(struct platform_device *pdev)
 		goto escan;
 
 	/* Register the partitions */
-	mtd_device_parse_register(mtd, part_probes,
-			NULL,
-			host->pdata.parts,
-			host->pdata.nr_parts);
+	err = mtd_device_parse_register(mtd, part_probes, NULL,
+					host->pdata.parts,
+					host->pdata.nr_parts);
+	if (err)
+		goto release_nand;
 
 	platform_set_drvdata(pdev, host);
 
 	return 0;
 
+release_nand:
+	nand_release(mtd);
 escan:
 	if (host->clk_act)
 		clk_disable_unprepare(host->clk);
-- 
2.14.1
