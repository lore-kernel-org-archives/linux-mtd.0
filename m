Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fgqUA-0006Nf-Ly
 for linux-mtd@lists.infradead.org; Sat, 21 Jul 2018 11:55:44 +0000
Received: by mail-lf1-x142.google.com with SMTP id a134-v6so3474627lfe.6
 for <linux-mtd@lists.infradead.org>; Sat, 21 Jul 2018 04:55:31 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Bert Kenward <bkenward@solarflare.com>, linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 1/2] mtd: lpddr: use mtd_device_register()
Date: Sat, 21 Jul 2018 13:55:09 +0200
Message-Id: <20180721115510.24078-1-zajec5@gmail.com>
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

This driver doesn't specify parsers so it can use that little helper.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/mtd/lpddr/lpddr2_nvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/lpddr/lpddr2_nvm.c b/drivers/mtd/lpddr/lpddr2_nvm.c
index 5d73db2a496d..c950c880ad59 100644
--- a/drivers/mtd/lpddr/lpddr2_nvm.c
+++ b/drivers/mtd/lpddr/lpddr2_nvm.c
@@ -476,7 +476,7 @@ static int lpddr2_nvm_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 	/* Parse partitions and register the MTD device */
-	return mtd_device_parse_register(mtd, NULL, NULL, NULL, 0);
+	return mtd_device_register(mtd, NULL, 0);
 }
 
 /*
-- 
2.13.7
