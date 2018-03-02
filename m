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
Subject: [PATCH 33/52] mtd: rawnand: s3c2410: enhance the probe function error
 path
Date: Fri,  2 Mar 2018 18:03:41 +0100
Message-Id: <20180302170400.6712-34-miquel.raynal@bootlin.com>
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

Prepare the migration of the lpc32xx_slc driver to use nand_scan() by
cleaning the error path in the probe function.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/s3c2410.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/s3c2410.c b/drivers/mtd/nand/raw/s3c2410.c
index b5bc5f106c09..1bc0458063d8 100644
--- a/drivers/mtd/nand/raw/s3c2410.c
+++ b/drivers/mtd/nand/raw/s3c2410.c
@@ -124,13 +124,11 @@ struct s3c2410_nand_info;
  * @chip: The NAND chip information.
  * @set: The platform information supplied for this set of NAND chips.
  * @info: Link back to the hardware information.
- * @scan_res: The result from calling nand_scan_ident().
 */
 struct s3c2410_nand_mtd {
 	struct nand_chip		chip;
 	struct s3c2410_nand_set		*set;
 	struct s3c2410_nand_info	*info;
-	int				scan_res;
 };
 
 enum s3c_cpu_type {
@@ -1163,17 +1161,19 @@ static int s3c24xx_nand_probe(struct platform_device *pdev)
 		mtd->dev.parent = &pdev->dev;
 		s3c2410_nand_init_chip(info, nmtd, sets);
 
-		nmtd->scan_res = nand_scan_ident(mtd,
-						 (sets) ? sets->nr_chips : 1,
-						 NULL);
+		err = nand_scan_ident(mtd, (sets) ? sets->nr_chips : 1, NULL);
+		if (err)
+			goto exit_error;
 
-		if (nmtd->scan_res == 0) {
-			err = s3c2410_nand_update_chip(info, nmtd);
-			if (err < 0)
-				goto exit_error;
-			nand_scan_tail(mtd);
-			s3c2410_nand_add_partition(info, nmtd, sets);
-		}
+		err = s3c2410_nand_update_chip(info, nmtd);
+		if (err < 0)
+			goto exit_error;
+
+		err = nand_scan_tail(mtd);
+		if (err)
+			goto exit_error;
+
+		s3c2410_nand_add_partition(info, nmtd, sets);
 
 		if (sets != NULL)
 			sets++;
-- 
2.14.1
