Received: from twhmllg3.macronix.com ([122.147.135.201])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFZOh-0004rc-Fz
 for linux-mtd@lists.infradead.org; Thu, 25 Oct 2018 06:45:37 +0000
From: masonccyang@mxic.com.tw
To: boris.brezillon@bootlin.com, miquel.raynal@bootlin.com, richard@nod.at,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, juliensu@mxic.com.tw, zhengxunli@mxic.com.tw
Cc: masonccyang@mxic.com.tw
Subject: [PATCH] mtd: rawnand: Add All 1.8V AC chips have a broken
 GET_FEATURES(TIMINGS)
Date: Thu, 25 Oct 2018 14:44:31 +0800
Message-Id: <1540449871-7224-2-git-send-email-masonccyang@mxic.com.tw>
In-Reply-To: <1540449871-7224-1-git-send-email-masonccyang@mxic.com.tw>
References: <1540449871-7224-1-git-send-email-masonccyang@mxic.com.tw>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Mason Yang <masonccyang@mxic.com.tw>

Make sure we flag all 1.8V broken chips as not supporting this features.

Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
---
 drivers/mtd/nand/raw/nand_macronix.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
index 49c546c..3836544 100644
--- a/drivers/mtd/nand/raw/nand_macronix.c
+++ b/drivers/mtd/nand/raw/nand_macronix.c
@@ -33,6 +33,13 @@ static void macronix_nand_fix_broken_get_timings(struct nand_chip *chip)
 		"MX30LF4G18AC",
 		"MX30LF4G28AC",
 		"MX60LF8G18AC",
+		"MX30UF1G18AC",
+		"MX30UF1G16AC",
+		"MX30UF2G18AC",
+		"MX30UF2G16AC",
+		"MX30UF4G18AC",
+		"MX30UF4G16AC",
+		"MX30UF4G28AC",
 	};
 
 	if (!chip->parameters.supports_set_get_features)
-- 
1.9.1
