Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fuc2k-0004AZ-Mt
 for linux-mtd@lists.infradead.org; Tue, 28 Aug 2018 11:20:20 +0000
Received: by mail-wm0-x243.google.com with SMTP id t25-v6so1598753wmi.3
 for <linux-mtd@lists.infradead.org>; Tue, 28 Aug 2018 04:20:08 -0700 (PDT)
From: Jonas Gorski <jonas.gorski@gmail.com>
To: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 5/5] mtd: parser_imagetag: add of_match_table support
Date: Tue, 28 Aug 2018 13:19:44 +0200
Message-Id: <20180828111944.5956-6-jonas.gorski@gmail.com>
In-Reply-To: <20180828111944.5956-1-jonas.gorski@gmail.com>
References: <20180828111944.5956-1-jonas.gorski@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Allow matching the imagetag parser for fixed partitions defined in the
device tree.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 drivers/mtd/parsers/parser_imagetag.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/parsers/parser_imagetag.c b/drivers/mtd/parsers/parser_imagetag.c
index 81e2fc70c889..6897a8c37142 100644
--- a/drivers/mtd/parsers/parser_imagetag.c
+++ b/drivers/mtd/parsers/parser_imagetag.c
@@ -24,6 +24,7 @@
 #include <linux/vmalloc.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
+#include <linux/of.h>
 
 /* Ensure strings read from flash structs are null terminated */
 #define STR_NULL_TERMINATE(x) \
@@ -200,9 +201,16 @@ static int bcm963xx_parse_imagetag_partitions(struct mtd_info *master,
 	return nrparts;
 }
 
+static const struct of_device_id parse_bcm963xx_imagetag_match_table[] = {
+	{ .compatible = "brcm,bcm963xx-imagetag" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, parse_bcm963xx_imagetag_match_table);
+
 static struct mtd_part_parser bcm963xx_imagetag_parser = {
 	.parse_fn = bcm963xx_parse_imagetag_partitions,
 	.name = "bcm963xx-imagetag",
+	.of_match_table = parse_bcm963xx_imagetag_match_table,
 };
 module_mtd_part_parser(bcm963xx_imagetag_parser);
 
-- 
2.13.2
