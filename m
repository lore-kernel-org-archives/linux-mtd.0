Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fXZeA-0005Mg-Id
 for linux-mtd@lists.infradead.org; Mon, 25 Jun 2018 22:07:45 +0000
Received: by mail-lf0-x244.google.com with SMTP id v17-v6so8680346lfe.13
 for <linux-mtd@lists.infradead.org>; Mon, 25 Jun 2018 15:07:31 -0700 (PDT)
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
Subject: [PATCH V2 2/2] mtd: parsers: trx: add of_match_table with the new DT
 binding
Date: Tue, 26 Jun 2018 00:05:08 +0200
Message-Id: <20180625220508.21242-2-zajec5@gmail.com>
In-Reply-To: <20180625220508.21242-1-zajec5@gmail.com>
References: <20180612104434.15232-1-zajec5@gmail.com>
 <20180625220508.21242-1-zajec5@gmail.com>
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

This allows using TRX parser to find TRX partitions on flash device
described in DT using a proper binding. It's useful for devices storing
firmware on a separated flash and having rootfs partition in it.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: Update to support only the "brcm,trx" binding
---
 drivers/mtd/parsers/parser_trx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/parsers/parser_trx.c b/drivers/mtd/parsers/parser_trx.c
index df360a75e1eb..f580a41a52b8 100644
--- a/drivers/mtd/parsers/parser_trx.c
+++ b/drivers/mtd/parsers/parser_trx.c
@@ -116,9 +116,16 @@ static int parser_trx_parse(struct mtd_info *mtd,
 	return i;
 };
 
+static const struct of_device_id mtd_parser_trx_of_match_table[] = {
+	{ .compatible = "brcm,trx" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, mtd_parser_trx_of_match_table);
+
 static struct mtd_part_parser mtd_parser_trx = {
 	.parse_fn = parser_trx_parse,
 	.name = "trx",
+	.of_match_table = mtd_parser_trx_of_match_table,
 };
 module_mtd_part_parser(mtd_parser_trx);
 
-- 
2.13.7
