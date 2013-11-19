Received: from va3ehsobe010.messaging.microsoft.com ([216.32.180.30]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vibsa-0005Kh-Px
 for linux-mtd@lists.infradead.org; Tue, 19 Nov 2013 03:21:33 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v2 3/3] mtd: gpmi: change pr_debug to dev_dbg
Date: Tue, 19 Nov 2013 10:57:52 +0800
Message-ID: <1384829872-8714-4-git-send-email-b32955@freescale.com>
In-Reply-To: <1384829872-8714-1-git-send-email-b32955@freescale.com>
References: <1384829872-8714-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

change all the pr_debug to dev_dbg.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   13 +++++--------
 1 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 85d2be2..4b8df4a 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -18,9 +18,6 @@
  * with this program; if not, write to the Free Software Foundation, Inc.,
  * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
  */
-
-#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-
 #include <linux/clk.h>
 #include <linux/slab.h>
 #include <linux/interrupt.h>
@@ -885,7 +882,7 @@ static void gpmi_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 	struct nand_chip *chip = mtd->priv;
 	struct gpmi_nand_data *this = chip->priv;
 
-	pr_debug("len is %d\n", len);
+	dev_dbg(this->dev, "len is %d\n", len);
 	this->upper_buf	= buf;
 	this->upper_len	= len;
 
@@ -897,7 +894,7 @@ static void gpmi_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 	struct nand_chip *chip = mtd->priv;
 	struct gpmi_nand_data *this = chip->priv;
 
-	pr_debug("len is %d\n", len);
+	dev_dbg(this->dev, "len is %d\n", len);
 	this->upper_buf	= (uint8_t *)buf;
 	this->upper_len	= len;
 
@@ -976,7 +973,7 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	unsigned int  max_bitflips = 0;
 	int           ret;
 
-	pr_debug("page number is : %d\n", page);
+	dev_dbg(this->dev, "page number is : %d\n", page);
 	ret = read_page_prepare(this, buf, mtd->writesize,
 					this->payload_virt, this->payload_phys,
 					nfc_geo->payload_size,
@@ -1052,7 +1049,7 @@ static int gpmi_ecc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	dma_addr_t auxiliary_phys;
 	int        ret;
 
-	pr_debug("ecc write page.\n");
+	dev_dbg(this->dev, "ecc write page.\n");
 	if (this->swap_block_mark) {
 		/*
 		 * If control arrives here, we're doing block mark swapping.
@@ -1190,7 +1187,7 @@ static int gpmi_ecc_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
 {
 	struct gpmi_nand_data *this = chip->priv;
 
-	pr_debug("page number is %d\n", page);
+	dev_dbg(this->dev, "page number is %d\n", page);
 	/* clear the OOB buffer */
 	memset(chip->oob_poi, ~0, mtd->oobsize);
 
-- 
1.7.2.rc3
