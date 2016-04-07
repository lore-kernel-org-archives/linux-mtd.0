Received: from comal.ext.ti.com ([198.47.26.152])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ao6t7-0002Ai-3v
 for linux-mtd@lists.infradead.org; Thu, 07 Apr 2016 10:10:11 +0000
From: Roger Quadros <rogerq@ti.com>
To: <tony@atomide.com>, <computersforpeace@gmail.com>,
 <boris.brezillon@free-electrons.com>
CC: <dwmw2@infradead.org>, <ezequiel@vanguardiasur.com.ar>,
 <javier@dowhile0.org>, <fcooper@ti.com>, <nsekhar@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-omap@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Roger Quadros
 <rogerq@ti.com>
Subject: [PATCH v6 07/17] mtd: nand: omap: Switch to using GPMC-NAND ops for
 writebuffer empty check
Date: Thu, 7 Apr 2016 13:08:25 +0300
Message-ID: <1460023715-19332-8-git-send-email-rogerq@ti.com>
In-Reply-To: <1460023715-19332-1-git-send-email-rogerq@ti.com>
References: <1460023715-19332-1-git-send-email-rogerq@ti.com>
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
Acked-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/omap2.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index cba9bf0..98023d5 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -291,14 +291,13 @@ static void omap_write_buf8(struct mtd_info *mtd, const u_char *buf, int len)
 {
 	struct omap_nand_info *info = mtd_to_omap(mtd);
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
@@ -326,7 +325,7 @@ static void omap_write_buf16(struct mtd_info *mtd, const u_char * buf, int len)
 {
 	struct omap_nand_info *info = mtd_to_omap(mtd);
 	u16 *p = (u16 *) buf;
-	u32	status = 0;
+	bool status;
 	/* FIXME try bursts of writesw() or DMA ... */
 	len >>= 1;
 
@@ -334,8 +333,7 @@ static void omap_write_buf16(struct mtd_info *mtd, const u_char * buf, int len)
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
2.5.0
