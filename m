Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1emjAZ-0007MX-Uy
 for linux-mtd@lists.infradead.org; Fri, 16 Feb 2018 16:47:37 +0000
Received: by mail-wm0-x241.google.com with SMTP id v71so4227086wmv.2
 for <linux-mtd@lists.infradead.org>; Fri, 16 Feb 2018 08:47:20 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, David Lechner <david@lechnology.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 1/6] nand: davinci: rename the platform driver
Date: Fri, 16 Feb 2018 17:47:07 +0100
Message-Id: <20180216164712.25898-2-brgl@bgdev.pl>
In-Reply-To: <20180216164712.25898-1-brgl@bgdev.pl>
References: <20180216164712.25898-1-brgl@bgdev.pl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Commit d8e22fb4ccac ("ARM: da850: add the nand dev_id to the clock
lookup table") broke the nand support in board file mode for
da850-based boards. Instead of reverting it and breaking the DT users
in the process (due to clock lookup), rename the driver to match the
clock table before renaming the users.

Fixes: d8e22fb4ccac ("ARM: da850: add the nand dev_id to the clock lookup table")
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/mtd/nand/davinci_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index ccc8c43abcff..4fb143bf1872 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -865,7 +865,7 @@ static struct platform_driver nand_davinci_driver = {
 	.probe		= nand_davinci_probe,
 	.remove		= nand_davinci_remove,
 	.driver		= {
-		.name	= "davinci_nand",
+		.name	= "davinci-nand",
 		.of_match_table = of_match_ptr(davinci_nand_of_match),
 	},
 };
-- 
2.16.1
