From: Antoine Tenart <antoine.tenart@free-electrons.com>
To: sebastian.hesselbarth@gmail.com, ezequiel.garcia@free-electrons.com,
 dwmw2@infradead.org, computersforpeace@gmail.com, robert.jarzmik@free.fr
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>, zmxu@marvell.com,
 jszhang@marvell.com, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/5] mtd: pxa3xx: prepare allowing compile test
Date: Wed, 21 Oct 2015 10:29:00 +0200
Message-Id: <1445416144-9194-2-git-send-email-antoine.tenart@free-electrons.com>
In-Reply-To: <1445416144-9194-1-git-send-email-antoine.tenart@free-electrons.com>
References: <1445416144-9194-1-git-send-email-antoine.tenart@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Using readsl() result in a build error on i386. Fix this
by using ioread32_rep() instead, to allow compile test the
pxa3xx nand driver later.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 77b3206aef01..91605c1ee169 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -532,7 +532,7 @@ static void drain_fifo(struct pxa3xx_nand_info *info, void *data, int len)
 		 * the polling on the last read.
 		 */
 		while (len > 8) {
-			readsl(info->mmio_base + NDDB, data, 8);
+			ioread32_rep(info->mmio_base + NDDB, data, 8);
 
 			ret = readl_relaxed_poll_timeout(info->mmio_base + NDSR, val,
 							 val & NDSR_RDDREQ, 1000, 5000);
@@ -547,7 +547,7 @@ static void drain_fifo(struct pxa3xx_nand_info *info, void *data, int len)
 		}
 	}
 
-	readsl(info->mmio_base + NDDB, data, len);
+	ioread32_rep(info->mmio_base + NDDB, data, len);
 }
 
 static void handle_data_pio(struct pxa3xx_nand_info *info)
-- 
2.6.2
