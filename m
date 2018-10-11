Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAg5i-00024I-Dx
 for linux-mtd@lists.infradead.org; Thu, 11 Oct 2018 18:53:47 +0000
Received: by mail-lf1-x142.google.com with SMTP id w21-v6so7489434lff.6
 for <linux-mtd@lists.infradead.org>; Thu, 11 Oct 2018 11:53:35 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/2] mtd: physmap_of: Move custom initialization
Date: Thu, 11 Oct 2018 20:53:25 +0200
Message-Id: <20181011185326.1371-1-linus.walleij@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In order to be able to assign custom complex mappings
to the physmap_of plugin for Gemini, move the initialization
so that the simple map is initialized before we enter the
platform-specific functions so the latter can override
them.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/maps/physmap_of_core.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/maps/physmap_of_core.c b/drivers/mtd/maps/physmap_of_core.c
index 4129535b8e46..74ad753265f3 100644
--- a/drivers/mtd/maps/physmap_of_core.c
+++ b/drivers/mtd/maps/physmap_of_core.c
@@ -239,13 +239,6 @@ static int of_flash_probe(struct platform_device *dev)
 		else if (of_property_read_bool(dp, "little-endian"))
 			info->list[i].map.swap = CFI_LITTLE_ENDIAN;
 
-		err = of_flash_probe_gemini(dev, dp, &info->list[i].map);
-		if (err)
-			goto err_out;
-		err = of_flash_probe_versatile(dev, dp, &info->list[i].map);
-		if (err)
-			goto err_out;
-
 		err = -ENOMEM;
 		info->list[i].map.virt = ioremap(info->list[i].map.phys,
 						 info->list[i].map.size);
@@ -257,6 +250,14 @@ static int of_flash_probe(struct platform_device *dev)
 
 		simple_map_init(&info->list[i].map);
 
+		/* Variants can override map accessors */
+		err = of_flash_probe_gemini(dev, dp, &info->list[i].map);
+		if (err)
+			goto err_out;
+		err = of_flash_probe_versatile(dev, dp, &info->list[i].map);
+		if (err)
+			goto err_out;
+
 		/*
 		 * On some platforms (e.g. MPC5200) a direct 1:1 mapping
 		 * may cause problems with JFFS2 usage, as the local bus (LPB)
-- 
2.17.1
