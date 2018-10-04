Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g80Yv-0006DY-QD
 for linux-mtd@lists.infradead.org; Thu, 04 Oct 2018 10:08:55 +0000
Received: by mail-ed1-x542.google.com with SMTP id y20-v6so1364435eds.10
 for <linux-mtd@lists.infradead.org>; Thu, 04 Oct 2018 03:08:43 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH] mtd: physmap_of: Remove unused struct of_device_id
Date: Thu,  4 Oct 2018 12:08:38 +0200
Message-Id: <20181004100838.12911-1-ricardo.ribalda@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This struct does not seem to be used anywhere on the code

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 drivers/mtd/maps/physmap_of_gemini.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/mtd/maps/physmap_of_gemini.c b/drivers/mtd/maps/physmap_of_gemini.c
index 830b1b7e702b..9df62ca721d5 100644
--- a/drivers/mtd/maps/physmap_of_gemini.c
+++ b/drivers/mtd/maps/physmap_of_gemini.c
@@ -44,11 +44,6 @@
 
 #define FLASH_PARALLEL_HIGH_PIN_CNT	(1 << 20)	/* else low pin cnt */
 
-static const struct of_device_id syscon_match[] = {
-	{ .compatible = "cortina,gemini-syscon" },
-	{ },
-};
-
 int of_flash_probe_gemini(struct platform_device *pdev,
 			  struct device_node *np,
 			  struct map_info *map)
-- 
2.19.0
