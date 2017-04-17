Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0BOy-0005qn-Mv
 for linux-mtd@lists.infradead.org; Mon, 17 Apr 2017 18:29:35 +0000
Received: by mail-lf0-x243.google.com with SMTP id x72so16991425lfb.1
 for <linux-mtd@lists.infradead.org>; Mon, 17 Apr 2017 11:29:12 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Frank Rowand <frowand.list@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V4 3/3] mtd: physmap_of: drop duplicated support for linux,
 part-probe property
Date: Mon, 17 Apr 2017 20:28:53 +0200
Message-Id: <20170417182853.24281-3-zajec5@gmail.com>
In-Reply-To: <20170417182853.24281-1-zajec5@gmail.com>
References: <20170331114016.26858-1-zajec5@gmail.com>
 <20170417182853.24281-1-zajec5@gmail.com>
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

Now support for linux,part-probe has been added to the MTD core there is
no need to duplicate support for it in physmap_of.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/maps/physmap_of.c | 46 +------------------------------------------
 1 file changed, 1 insertion(+), 45 deletions(-)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 14e8909c9955..49dbb7235848 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -114,47 +114,9 @@ static struct mtd_info *obsolete_probe(struct platform_device *dev,
 static const char * const part_probe_types_def[] = {
 	"cmdlinepart", "RedBoot", "ofpart", "ofoldpart", NULL };
 
-static const char * const *of_get_probes(struct device_node *dp)
-{
-	const char *cp;
-	int cplen;
-	unsigned int l;
-	unsigned int count;
-	const char **res;
-
-	cp = of_get_property(dp, "linux,part-probe", &cplen);
-	if (cp == NULL)
-		return part_probe_types_def;
-
-	count = 0;
-	for (l = 0; l != cplen; l++)
-		if (cp[l] == 0)
-			count++;
-
-	res = kzalloc((count + 1)*sizeof(*res), GFP_KERNEL);
-	if (!res)
-		return NULL;
-	count = 0;
-	while (cplen > 0) {
-		res[count] = cp;
-		l = strlen(cp) + 1;
-		cp += l;
-		cplen -= l;
-		count++;
-	}
-	return res;
-}
-
-static void of_free_probes(const char * const *probes)
-{
-	if (probes != part_probe_types_def)
-		kfree(probes);
-}
-
 static const struct of_device_id of_flash_match[];
 static int of_flash_probe(struct platform_device *dev)
 {
-	const char * const *part_probe_types;
 	const struct of_device_id *match;
 	struct device_node *dp = dev->dev.of_node;
 	struct resource res;
@@ -320,14 +282,8 @@ static int of_flash_probe(struct platform_device *dev)
 
 	info->cmtd->dev.parent = &dev->dev;
 	mtd_set_of_node(info->cmtd, dp);
-	part_probe_types = of_get_probes(dp);
-	if (!part_probe_types) {
-		err = -ENOMEM;
-		goto err_out;
-	}
-	mtd_device_parse_register(info->cmtd, part_probe_types, NULL,
+	mtd_device_parse_register(info->cmtd, part_probe_types_def, NULL,
 			NULL, 0);
-	of_free_probes(part_probe_types);
 
 	kfree(mtd_list);
 
-- 
2.11.0
