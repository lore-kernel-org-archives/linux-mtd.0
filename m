Received: from mail-qw0-f49.google.com ([209.85.216.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PwQfy-0004oq-GU
	for linux-mtd@lists.infradead.org; Mon, 07 Mar 2011 03:00:03 +0000
Received: by qwj9 with SMTP id 9so3015145qwj.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 06 Mar 2011 19:00:00 -0800 (PST)
Subject: [PATCH 2/3] mtd: add "platform:" prefix for platform modalias
From: Axel Lin <axel.lin@gmail.com>
To: linux-kernel@vger.kernel.org
In-Reply-To: <1299466949.3879.0.camel@mola>
References: <1299466949.3879.0.camel@mola>
Content-Type: text/plain
Date: Mon, 07 Mar 2011 11:04:24 +0800
Message-Id: <1299467064.3879.3.camel@mola>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	linux-mtd@lists.infradead.org, Jian Zhang <jzhang@ti.com>,
	Vimal Singh <vimalsingh@ti.com>, Jarkko Lavinen <jarkko.lavinen@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since 43cc71eed1250755986da4c0f9898f9a635cb3bf (platform: prefix MODALIAS
with "platform:"), the platform modalias is prefixed with "platform:".

Signed-off-by: Axel Lin <axel.lin@gmail.com>
Cc: Jian Zhang <jzhang@ti.com>
Cc: Vimal Singh <vimalsingh@ti.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Jarkko Lavinen <jarkko.lavinen@nokia.com>
---
 drivers/mtd/nand/omap2.c      |    2 +-
 drivers/mtd/onenand/generic.c |    2 +-
 drivers/mtd/onenand/omap2.c   |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 4e33972..7b8f1ff 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1159,6 +1159,6 @@ static void __exit omap_nand_exit(void)
 module_init(omap_nand_init);
 module_exit(omap_nand_exit);
 
-MODULE_ALIAS(DRIVER_NAME);
+MODULE_ALIAS("platform:" DRIVER_NAME);
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Glue layer for NAND flash on TI OMAP boards");
diff --git a/drivers/mtd/onenand/generic.c b/drivers/mtd/onenand/generic.c
index e789149..ac08750 100644
--- a/drivers/mtd/onenand/generic.c
+++ b/drivers/mtd/onenand/generic.c
@@ -131,7 +131,7 @@ static struct platform_driver generic_onenand_driver = {
 	.remove		= __devexit_p(generic_onenand_remove),
 };
 
-MODULE_ALIAS(DRIVER_NAME);
+MODULE_ALIAS("platform:" DRIVER_NAME);
 
 static int __init generic_onenand_init(void)
 {
diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index ec26399..14a49ab 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -840,7 +840,7 @@ static void __exit omap2_onenand_exit(void)
 module_init(omap2_onenand_init);
 module_exit(omap2_onenand_exit);
 
-MODULE_ALIAS(DRIVER_NAME);
+MODULE_ALIAS("platform:" DRIVER_NAME);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Jarkko Lavinen <jarkko.lavinen@nokia.com>");
 MODULE_DESCRIPTION("Glue layer for OneNAND flash on OMAP2 / OMAP3");
-- 
1.7.2
