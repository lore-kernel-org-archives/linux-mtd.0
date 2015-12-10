From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Ryan Mallon <rmallon@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <kernel@pengutronix.de>, Imre Kaloz <kaloz@openwrt.org>,
 Krzysztof Halasa <khalasa@piap.pl>, Tony Lindgren <tony@atomide.com>,
 linux-omap@vger.kernel.org, Alexander Clouter <alex@digriz.org.uk>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Gregory CLEMENT <gregory.clement@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Marek Vasut <marek.vasut@gmail.com>, Steven Miao <realmz6@gmail.com>,
 adi-buildroot-devel@lists.sourceforge.net,
 Mikael Starvik <starvik@axis.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>, linux-cris-kernel@axis.com,
 Josh Wu <josh.wu@atmel.com>, Wan ZongShun <mcuos.com@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 linux-samsung-soc@vger.kernel.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
 Stefan Agner <stefan@agner.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 devel@driverdev.osuosl.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v4 36/58] mtd: nand: pxa3xx: use the mtd instance embedded in
 struct nand_chip
Date: Thu, 10 Dec 2015 09:00:20 +0100
Message-Id: <1449734442-18672-37-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1449734442-18672-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1449734442-18672-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

struct nand_chip now embeds an mtd device. Make use of this mtd instance.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index dc39a98..c4d5788 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -167,7 +167,6 @@ enum pxa3xx_nand_variant {
 
 struct pxa3xx_nand_host {
 	struct nand_chip	chip;
-	struct mtd_info         *mtd;
 	void			*info_data;
 
 	/* page size of attached chip */
@@ -450,14 +449,15 @@ static int pxa3xx_nand_init_timings_compat(struct pxa3xx_nand_host *host,
 	struct nand_chip *chip = &host->chip;
 	struct pxa3xx_nand_info *info = host->info_data;
 	const struct pxa3xx_nand_flash *f = NULL;
+	struct mtd_info *mtd = nand_to_mtd(&host->chip);
 	int i, id, ntypes;
 
 	ntypes = ARRAY_SIZE(builtin_flash_types);
 
-	chip->cmdfunc(host->mtd, NAND_CMD_READID, 0x00, -1);
+	chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
 
-	id = chip->read_byte(host->mtd);
-	id |= chip->read_byte(host->mtd) << 0x8;
+	id = chip->read_byte(mtd);
+	id |= chip->read_byte(mtd) << 0x8;
 
 	for (i = 0; i < ntypes; i++) {
 		f = &builtin_flash_types[i];
@@ -890,7 +890,7 @@ static void set_command_address(struct pxa3xx_nand_info *info,
 static void prepare_start_command(struct pxa3xx_nand_info *info, int command)
 {
 	struct pxa3xx_nand_host *host = info->host[info->cs];
-	struct mtd_info *mtd = host->mtd;
+	struct mtd_info *mtd = nand_to_mtd(&host->chip);
 
 	/* reset data and oob column point to handle data */
 	info->buf_start		= 0;
@@ -943,7 +943,7 @@ static int prepare_set_command(struct pxa3xx_nand_info *info, int command,
 	struct mtd_info *mtd;
 
 	host = info->host[info->cs];
-	mtd = host->mtd;
+	mtd = nand_to_mtd(&host->chip);
 	addr_cycle = 0;
 	exec_cmd = 1;
 
@@ -1415,8 +1415,8 @@ static int pxa3xx_nand_config_ident(struct pxa3xx_nand_info *info)
 static void pxa3xx_nand_config_tail(struct pxa3xx_nand_info *info)
 {
 	struct pxa3xx_nand_host *host = info->host[info->cs];
-	struct mtd_info *mtd = host->mtd;
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = &host->chip;
+	struct mtd_info *mtd = nand_to_mtd(chip);
 
 	info->reg_ndcr |= (host->col_addr_cycles == 2) ? NDCR_RA_START : 0;
 	info->reg_ndcr |= (chip->page_shift == 6) ? NDCR_PG_PER_BLK : 0;
@@ -1693,19 +1693,20 @@ static int alloc_nand_resource(struct platform_device *pdev)
 	pdata = dev_get_platdata(&pdev->dev);
 	if (pdata->num_cs <= 0)
 		return -ENODEV;
-	info = devm_kzalloc(&pdev->dev, sizeof(*info) + (sizeof(*mtd) +
-			    sizeof(*host)) * pdata->num_cs, GFP_KERNEL);
+	info = devm_kzalloc(&pdev->dev,
+			    sizeof(*info) + sizeof(*host) * pdata->num_cs,
+			    GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
 
 	info->pdev = pdev;
 	info->variant = pxa3xx_nand_get_variant(pdev);
 	for (cs = 0; cs < pdata->num_cs; cs++) {
-		mtd = (void *)&info[1] + (sizeof(*mtd) + sizeof(*host)) * cs;
-		chip = (struct nand_chip *)(&mtd[1]);
-		host = (struct pxa3xx_nand_host *)chip;
+		host = (void *)&info[1] + sizeof(*host) * cs;
+		chip = &host->chip;
+		chip->priv = host;
+		mtd = nand_to_mtd(chip);
 		info->host[cs] = host;
-		host->mtd = mtd;
 		host->cs = cs;
 		host->info_data = info;
 		mtd->priv = chip;
@@ -1833,7 +1834,7 @@ static int pxa3xx_nand_remove(struct platform_device *pdev)
 	clk_disable_unprepare(info->clk);
 
 	for (cs = 0; cs < pdata->num_cs; cs++)
-		nand_release(info->host[cs]->mtd);
+		nand_release(nand_to_mtd(&info->host[cs]->chip));
 	return 0;
 }
 
@@ -1904,7 +1905,7 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
 	info = platform_get_drvdata(pdev);
 	probe_success = 0;
 	for (cs = 0; cs < pdata->num_cs; cs++) {
-		struct mtd_info *mtd = info->host[cs]->mtd;
+		struct mtd_info *mtd = nand_to_mtd(&info->host[cs]->chip);
 
 		/*
 		 * The mtd name matches the one used in 'mtdparts' kernel
-- 
2.1.4
