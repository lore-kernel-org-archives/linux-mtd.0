Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fGKJu-0006lk-DU
 for linux-mtd@lists.infradead.org; Wed, 09 May 2018 08:19:36 +0000
Received: by mail-lf0-x243.google.com with SMTP id h197-v6so49663290lfg.11
 for <linux-mtd@lists.infradead.org>; Wed, 09 May 2018 01:19:19 -0700 (PDT)
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
Subject: [PATCH V2 2/2] mtd: bcm47xxpart: add of_match_table with a new DT
 binding
Date: Wed,  9 May 2018 10:17:29 +0200
Message-Id: <20180509081729.28347-2-zajec5@gmail.com>
In-Reply-To: <20180509081729.28347-1-zajec5@gmail.com>
References: <20180509081729.28347-1-zajec5@gmail.com>
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

This allows using bcm47xxpart parser to find partitions on flash
described in DT using the "brcm,bcm947xx-cfe-partitions" compatible
property. It means this parser doesn't have to be explicitly selected by
a flash driver anymore. It can be used e.g. together with a generic
m25p80 / spi-nor if device is just properly described.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: Slightly update commit message.
---
 drivers/mtd/bcm47xxpart.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index 1f0239848ebe..0f93d2239352 100644
--- a/drivers/mtd/bcm47xxpart.c
+++ b/drivers/mtd/bcm47xxpart.c
@@ -304,9 +304,16 @@ static int bcm47xxpart_parse(struct mtd_info *master,
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
2.13.6
