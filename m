Date: Tue, 27 Jul 2010 19:39:37 +0900
From: Kyungmin Park <kmpark@infradead.org>,
	Kyungmin Park <kyungmin.park@samsung.com>
Subject: [PATCH] S5PC110: Add OneNAND interrupt number
To: linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
Message-id: <20100727103937.GA1247@july>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Content-disposition: inline
Cc: kgene.kim@samsung.com, m.szyprowski@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To use OneNAND interrupt at drivers, also extend DMA address to cover fully.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
diff --git a/arch/arm/mach-s5pv210/dev-onenand.c b/arch/arm/mach-s5pv210/dev-onenand.c
index 34997b7..f8ede33 100644
--- a/arch/arm/mach-s5pv210/dev-onenand.c
+++ b/arch/arm/mach-s5pv210/dev-onenand.c
@@ -27,9 +27,14 @@ static struct resource s5pc110_onenand_resources[] = {
 	},
 	[1] = {
 		.start	= S5PC110_PA_ONENAND_DMA,
-		.end	= S5PC110_PA_ONENAND_DMA + SZ_2K - 1,
+		.end	= S5PC110_PA_ONENAND_DMA + SZ_8K - 1,
 		.flags	= IORESOURCE_MEM,
 	},
+	[2] = {
+		.start	= IRQ_ONENAND_AUDI,
+		.end	= IRQ_ONENAND_AUDI,
+		.flags	= IORESOURCE_IRQ,
+	},
 };
 
 struct platform_device s5pc110_device_onenand = {
