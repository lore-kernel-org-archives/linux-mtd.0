Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eZvjK-00066S-GD
 for linux-mtd@lists.infradead.org; Fri, 12 Jan 2018 09:34:32 +0000
Received: by mail-lf0-x244.google.com with SMTP id f3so5242580lfe.4
 for <linux-mtd@lists.infradead.org>; Fri, 12 Jan 2018 01:34:19 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Jonas Gorski <jonas.gorski@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 2/2] mtd: bcm47xxpart: add of_match_table with a new DT binding
Date: Fri, 12 Jan 2018 10:33:54 +0100
Message-Id: <20180112093354.17593-2-zajec5@gmail.com>
In-Reply-To: <20180112093354.17593-1-zajec5@gmail.com>
References: <20180112093354.17593-1-zajec5@gmail.com>
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

This allows using bcm47xxpart parser to support DT describing partitions
on a flash using "brcm,bcm947xx-cfe-partitions" compatible property. It
means this parser doesn't have to be explicitly selected by a flash
driver anymore. It can be used e.g. together with a generic m25p80 /
spi-nor if device is just properly described.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/mtd/bcm47xxpart.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index fe2581d9d882..4bc2ad842eee 100644
--- a/drivers/mtd/bcm47xxpart.c
+++ b/drivers/mtd/bcm47xxpart.c
@@ -290,9 +290,16 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 	return curr_part;
 };
 
+static const struct of_device_id bcm47xxpart_of_match_table[] = {
+	{ .compatible = "brcm,bcm947xx-cfe-partitions" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, bcm47xxpart_of_match_table);
+
 static struct mtd_part_parser bcm47xxpart_mtd_parser = {
 	.parse_fn = bcm47xxpart_parse,
 	.name = "bcm47xxpart",
+	.of_match_table = bcm47xxpart_of_match_table,
 };
 module_mtd_part_parser(bcm47xxpart_mtd_parser);
 
-- 
2.11.0
