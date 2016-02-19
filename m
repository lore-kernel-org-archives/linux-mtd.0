Received: from bear.ext.ti.com ([192.94.94.41])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aWsQY-0001Ed-2W
 for linux-mtd@lists.infradead.org; Fri, 19 Feb 2016 21:17:28 +0000
From: Roger Quadros <rogerq@ti.com>
To: <tony@atomide.com>, <computersforpeace@gmail.com>
CC: <dwmw2@infradead.org>, <ezequiel@vanguardiasur.com.ar>,
 <javier@dowhile0.org>, <fcooper@ti.com>, <nsekhar@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-omap@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Roger Quadros
 <rogerq@ti.com>
Subject: [PATCH v5 11/26] memory: omap-gpmc: Prevent mapping into 1st 16MB
Date: Fri, 19 Feb 2016 23:15:33 +0200
Message-ID: <1455916548-3441-12-git-send-email-rogerq@ti.com>
In-Reply-To: <1455916548-3441-1-git-send-email-rogerq@ti.com>
References: <1455916548-3441-1-git-send-email-rogerq@ti.com>
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

We have been preventing mapping GPMC children in the
first 1MB but really it has to be the first 16MB as
the minimum GPMC partition size is 16MB.

Also print an error message if CS mapping fails
due to DT requesting address outside the GPMC
map.

Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 drivers/memory/omap-gpmc.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index 13b900e..6c8d85e 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -94,6 +94,14 @@
 #define GPMC_CS_SIZE		0x30
 #define	GPMC_BCH_SIZE		0x10
 
+/*
+ * The first 1MB of GPMC address space is typically mapped to
+ * the internal ROM. Never allocate the first page, to
+ * facilitate bug detection; even if we didn't boot from ROM.
+ * As GPMC minimum partition size is 16MB we can only start from
+ * there.
+ */
+#define GPMC_MEM_START		0x1000000
 #define GPMC_MEM_END		0x3FFFFFFF
 
 #define GPMC_CHUNK_SHIFT	24		/* 16 MB */
@@ -1277,12 +1285,7 @@ static void gpmc_mem_init(void)
 {
 	int cs;
 
-	/*
-	 * The first 1MB of GPMC address space is typically mapped to
-	 * the internal ROM. Never allocate the first page, to
-	 * facilitate bug detection; even if we didn't boot from ROM.
-	 */
-	gpmc_mem_root.start = SZ_1M;
+	gpmc_mem_root.start = GPMC_MEM_START;
 	gpmc_mem_root.end = GPMC_MEM_END;
 
 	/* Reserve all regions that has been set up by bootloader */
@@ -1936,6 +1939,15 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
 	if (ret < 0) {
 		dev_err(&pdev->dev, "cannot remap GPMC CS %d to %pa\n",
 			cs, &res.start);
+		if (res.start < GPMC_MEM_START) {
+			dev_info(&pdev->dev,
+				 "GPMC CS %d start cannot be lesser than 0x%x\n",
+				 cs, GPMC_MEM_START);
+		} else if (res.end > GPMC_MEM_END) {
+			dev_info(&pdev->dev,
+				 "GPMC CS %d end cannot be greater than 0x%x\n",
+				 cs, GPMC_MEM_END);
+		}
 		goto err;
 	}
 
-- 
2.1.4
