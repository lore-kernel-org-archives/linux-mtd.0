From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [RFC PATCH v2 01/12] mtd: rawnand: ams-delta: Assign mtd->dev.parent,
 not mtd->owner
Date: Tue,  7 Aug 2018 00:29:07 +0200
Message-Id: <20180806222918.12644-2-jmkrzyszt@gmail.com>
In-Reply-To: <20180806222918.12644-1-jmkrzyszt@gmail.com>
References: <20180718235710.18242-1-jmkrzyszt@gmail.com>
 <20180806222918.12644-1-jmkrzyszt@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix missing mtd->dev.parent assignment and drop useless mtd->owner.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/mtd/nand/raw/ams-delta.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index 2a8872ebd14a..af313c620264 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -162,7 +162,7 @@ static int ams_delta_init(struct platform_device *pdev)
 	}
 
 	ams_delta_mtd = nand_to_mtd(this);
-	ams_delta_mtd->owner = THIS_MODULE;
+	ams_delta_mtd->dev.parent = &pdev->dev;
 
 	/*
 	 * Don't try to request the memory region from here,
-- 
2.16.4
