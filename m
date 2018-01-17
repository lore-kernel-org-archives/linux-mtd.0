Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ebit9-000698-0k
 for linux-mtd@lists.infradead.org; Wed, 17 Jan 2018 08:16:08 +0000
Received: by mail-lf0-x243.google.com with SMTP id o89so16639029lfg.10
 for <linux-mtd@lists.infradead.org>; Wed, 17 Jan 2018 00:15:52 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Jonas Gorski <jonas.gorski@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, John Crispin <john@phrozen.org>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V8 2/2] mtd: ofpart: add of_match_table with "fixed-partitions"
Date: Wed, 17 Jan 2018 09:15:21 +0100
Message-Id: <20180117081521.2463-2-zajec5@gmail.com>
In-Reply-To: <20180117081521.2463-1-zajec5@gmail.com>
References: <20180104070534.16248-1-zajec5@gmail.com>
 <20180117081521.2463-1-zajec5@gmail.com>
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
index 6bdf4e525677..92fcbac046d9 100644
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
