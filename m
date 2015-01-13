Date: Mon, 12 Jan 2015 18:35:55 -0600 (CST)
From: Aaron Sierra <asierra@xes-inc.com>
To: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Message-ID: <889558859.110937.1421109355675.JavaMail.zimbra@xes-inc.com>
In-Reply-To: <2021171878.109755.1421108768347.JavaMail.zimbra@xes-inc.com>
Subject: [PATCH 1/2] nand_base: SOFT_BCH: Request strength over bytes
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Previously, we requested that drivers pass ecc.size and ecc.bytes when
using NAND_ECC_SOFT_BCH. However, a driver is likely to only know the ECC
strength required for its NAND, so each driver would need to perform a
strength-to-bytes calculation.

Avoid duplicating this calculation in each driver by asking drivers to
pass ecc.size and ecc.strength so that the strength-to-bytes calculation
need only be implemented once.

This reverts/generalizes this commit:
    mtd: nand: Base BCH ECC bytes on required strength

Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
---
 drivers/mtd/nand/nand_base.c  | 21 +++++++++++++++------
 drivers/mtd/nand/sunxi_nand.c |  2 --
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 41585df..993612c 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4028,22 +4028,31 @@ int nand_scan_tail(struct mtd_info *mtd)
 		ecc->read_oob = nand_read_oob_std;
 		ecc->write_oob = nand_write_oob_std;
 		/*
-		 * Board driver should supply ecc.size and ecc.bytes values to
-		 * select how many bits are correctable; see nand_bch_init()
-		 * for details. Otherwise, default to 4 bits for large page
-		 * devices.
+		 * Board driver should supply ecc.size and ecc.strength values
+		 * to select how many bits are correctable. Otherwise, default
+		 * to 4 bits for large page devices.
 		 */
 		if (!ecc->size && (mtd->oobsize >= 64)) {
 			ecc->size = 512;
-			ecc->bytes = DIV_ROUND_UP(13 * ecc->strength, 8);
+			ecc->strength = 4;
 		}
+
+		/*
+		 * We previously recommended drivers pass ecc.size and
+		 * ecc.bytes. Continue to support drivers that do.
+		 * See nand_bch_init() for details.
+		 */
+		if (ecc->bytes && !ecc->strength)
+			ecc->strength = ecc->bytes * 8 / fls(8 * ecc->size);
+
+		ecc->bytes = DIV_ROUND_UP(
+				ecc->strength * fls(8 * ecc->size), 8);
 		ecc->priv = nand_bch_init(mtd, ecc->size, ecc->bytes,
 					       &ecc->layout);
 		if (!ecc->priv) {
 			pr_warn("BCH ECC initialization failed!\n");
 			BUG();
 		}
-		ecc->strength = ecc->bytes * 8 / fls(8 * ecc->size);
 		break;
 
 	case NAND_ECC_NONE:
diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
index ccaa8e2..6f93b29 100644
--- a/drivers/mtd/nand/sunxi_nand.c
+++ b/drivers/mtd/nand/sunxi_nand.c
@@ -1110,8 +1110,6 @@ static int sunxi_nand_ecc_init(struct mtd_info *mtd, struct nand_ecc_ctrl *ecc,
 
 	switch (ecc->mode) {
 	case NAND_ECC_SOFT_BCH:
-		ecc->bytes = DIV_ROUND_UP(ecc->strength * fls(8 * ecc->size),
-					  8);
 		break;
 	case NAND_ECC_HW:
 		ret = sunxi_nand_hw_ecc_ctrl_init(mtd, ecc, np);
-- 
1.9.1
