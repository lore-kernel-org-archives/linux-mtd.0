Date: Wed, 27 Aug 2014 12:45:36 -0500 (CDT)
From: Aaron Sierra <asierra@xes-inc.com>
To: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Message-ID: <677105509.189583.1409161536993.JavaMail.zimbra@xes-inc.com>
In-Reply-To: <930617930.480758.1409098152001.JavaMail.zimbra@xes-inc.com>
Subject: [PATCH 1/2] mtd: nand: Base BCH ECC bytes on required strength
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Jordan Friendshuh <jfriendshuh@xes-inc.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Jordan Friendshuh <jfriendshuh@xes-inc.com>

NAND devices with page sizes over 4 KiB require more than 4-bits of ECC
coverage. This patch calculates the value of ecc_bytes based on a still
assumed 512-byte step size (13-bits) and the ecc_strength.

Example:
Micron M73A devices (8 KiB page) require 8-bit ECC per 512-byte

Signed-off-by: Jordan Friendshuh <jfriendshuh@xes-inc.com>
Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
---
 drivers/mtd/nand/nand_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 4f3e80c..9fdfed4 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4001,7 +4001,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 		 */
 		if (!ecc->size && (mtd->oobsize >= 64)) {
 			ecc->size = 512;
-			ecc->bytes = 7;
+			ecc->bytes = DIV_ROUND_UP(13 * ecc->strength, 8);
 		}
 		ecc->priv = nand_bch_init(mtd, ecc->size, ecc->bytes,
 					       &ecc->layout);
-- 
1.9.1
