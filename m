Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dOuCp-0003Fi-TI
 for linux-mtd@lists.infradead.org; Sat, 24 Jun 2017 23:11:09 +0000
Received: by mail-lf0-x244.google.com with SMTP id n136so9879082lfn.2
 for <linux-mtd@lists.infradead.org>; Sat, 24 Jun 2017 16:10:46 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Jonas Gorski <jonas.gorski@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V4 2/2] mtd: ofpart: add of_match_table with "fixed-partitions"
Date: Sun, 25 Jun 2017 01:10:25 +0200
Message-Id: <20170624231025.23292-2-zajec5@gmail.com>
In-Reply-To: <20170624231025.23292-1-zajec5@gmail.com>
References: <20170624231025.23292-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Rafał Miłecki <rafal@milecki.pl>

This allows using this parser with any flash driver that takes care of
setting of_node (using mtd_set_of_node helper) correctly. Up to now
support for "fixed-partitions" DT compatibility string was working only
with flash drivers that were specifying "ofpart" (manually or by letting
mtd use the default set of parsers).

This matches existing bindings documentation.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
Reviewed-by: Brian Norris <computersforpeace@gmail.com>
Tested-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/ofpart.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index 2861c7079d7b..fb6f3df40e94 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -140,9 +140,16 @@ static int parse_ofpart_partitions(struct mtd_info *master,
 	return ret;
 }
 
+static const struct of_device_id parse_ofpart_match_table[] = {
+	{ .compatible = "fixed-partitions" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, parse_ofpart_match_table);
+
 static struct mtd_part_parser ofpart_parser = {
 	.parse_fn = parse_ofpart_partitions,
 	.name = "ofpart",
+	.of_match_table = parse_ofpart_match_table,
 };
 
 static int parse_ofoldpart_partitions(struct mtd_info *master,
-- 
2.11.0
