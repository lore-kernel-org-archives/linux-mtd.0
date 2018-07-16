Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ff1Va-0008W8-FD
 for linux-mtd@lists.infradead.org; Mon, 16 Jul 2018 11:17:39 +0000
Received: by mail-lj1-x244.google.com with SMTP id q127-v6so28995248ljq.11
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jul 2018 04:17:28 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH RFC API ONLY] mtd: get parsers from lookup table
Date: Mon, 16 Jul 2018 13:17:12 +0200
Message-Id: <20180716111712.7636-1-zajec5@gmail.com>
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

Existing implementation of specifying flash device parsers became a bit
hacky and needs a cleanup. Currently it requires:
1) Passing parsers in a custom platform data by arch code
or
2) Hardcoding parsers table in a flash driver

The purpose of the new implementation is to:
1) Clean up flash drivers
2) Have a generic solution
3) Avoid code duplication

That new implementation assigns table of parsers to a MTD's parent
device. That way flash driver doesn't have to take care of passing
parsers. It's inspired by GPIO lookup table.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
It's obviously a RFC patch only. It doesn't really implement anything.
It DOESN'T COMPILE.

I'd like to know if you like this idea and if it's worth for me to
actually spend time implementing it.
---
 arch/arm/mach-pxa/corgi.c | 21 +++++++++++++--------
 drivers/mtd/mtdpart.c     |  4 ++++
 2 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-pxa/corgi.c b/arch/arm/mach-pxa/corgi.c
index 9a5a35e90769..0ff77e078d2b 100644
--- a/arch/arm/mach-pxa/corgi.c
+++ b/arch/arm/mach-pxa/corgi.c
@@ -615,16 +615,8 @@ static struct nand_bbt_descr sharpsl_bbt = {
 	.pattern = scan_ff_pattern
 };
 
-static const char * const probes[] = {
-	"cmdlinepart",
-	"ofpart",
-	"sharpslpart",
-	NULL,
-};
-
 static struct sharpsl_nand_platform_data sharpsl_nand_platform_data = {
 	.badblock_pattern	= &sharpsl_bbt,
-	.part_parsers		= probes,
 };
 
 static struct resource sharpsl_nand_resources[] = {
@@ -688,6 +680,16 @@ static struct i2c_board_info __initdata corgi_i2c_devices[] = {
 	{ I2C_BOARD_INFO("wm8731", 0x1b) },
 };
 
+static struct mtd_parser_lookup_table corgi_mtd_parser_lookup_table = {
+	.dev_name = NULL, /* Set with registered name */
+	.table = {
+		{ .parser = "cmdlinepart" },
+		{ .parser = "ofpart" },
+		{ .parser = "sharpslpart" },
+		{ },
+	},
+};
+
 static void corgi_poweroff(void)
 {
 	if (!machine_is_corgi())
@@ -740,6 +742,9 @@ static void __init corgi_init(void)
 
 	platform_add_devices(devices, ARRAY_SIZE(devices));
 
+	corgi_mtd_parser_lookup_table.dev_name = dev_name(&sharpsl_nand_device.dev);
+	mtd_parsers_add_lookup_table(corgi_mtd_parser_lookup_table);
+
 	regulator_has_full_constraints();
 }
 
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 52e2cb35fc79..0d96857a57d0 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -936,6 +936,10 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
 	struct mtd_part_parser *parser;
 	int ret, err = 0;
 
+	if (!types) {
+		types = mtd_parsers_get(master->dev.parent);
+	}
+
 	if (!types)
 		types = mtd_is_partition(master) ? default_subpartition_types :
 			default_mtd_part_types;
-- 
2.13.7
