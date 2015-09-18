From: Roger Quadros <rogerq@ti.com>
To: <tony@atomide.com>
CC: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <ezequiel@vanguardiasur.com.ar>, <javier@dowhile0.org>,
 <fcooper@ti.com>, <nsekhar@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Roger Quadros <rogerq@ti.com>
Subject: [PATCH v3 06/27] mtd: nand: omap2: Switch to using GPMC-NAND ops for
 writebuffer empty check
Date: Fri, 18 Sep 2015 17:53:28 +0300
Message-ID: <1442588029-13769-7-git-send-email-rogerq@ti.com>
In-Reply-To: <1442588029-13769-1-git-send-email-rogerq@ti.com>
References: <1442588029-13769-1-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Instead of accessing the gpmc_status register directly start
using the gpmc_nand_ops->nand_writebuffer_empty() helper
to check write buffer empty status.

Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 drivers/mtd/nand/omap2.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index f214fe2..0eb0b8c 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -289,14 +289,13 @@ static void omap_write_buf8(struct mtd_info *mtd, const u_char *buf, int len)
 	struct omap_nand_info *info = container_of(mtd,
 						struct omap_nand_info, mtd);
 	u_char *p = (u_char *)buf;
-	u32	status = 0;
+	bool status;
 
 	while (len--) {
 		iowrite8(*p++, info->nand.IO_ADDR_W);
 		/* wait until buffer is available for write */
 		do {
-			status = readl(info->reg.gpmc_status) &
-					STATUS_BUFF_EMPTY;
+			status = info->ops->nand_writebuffer_empty();
 		} while (!status);
 	}
 }
@@ -325,7 +324,7 @@ static void omap_write_buf16(struct mtd_info *mtd, const u_char * buf, int len)
 	struct omap_nand_info *info = container_of(mtd,
 						struct omap_nand_info, mtd);
 	u16 *p = (u16 *) buf;
-	u32	status = 0;
+	bool status;
 	/* FIXME try bursts of writesw() or DMA ... */
 	len >>= 1;
 
@@ -333,8 +332,7 @@ static void omap_write_buf16(struct mtd_info *mtd, const u_char * buf, int len)
 		iowrite16(*p++, info->nand.IO_ADDR_W);
 		/* wait until buffer is available for write */
 		do {
-			status = readl(info->reg.gpmc_status) &
-					STATUS_BUFF_EMPTY;
+			status = info->ops->nand_writebuffer_empty();
 		} while (!status);
 	}
 }
-- 
2.1.4
