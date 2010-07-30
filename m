Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Oerix-0000xp-PQ
	for linux-mtd@lists.infradead.org; Fri, 30 Jul 2010 15:42:16 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH] MTD: pxa2xx: move pxa2xx_flash_probe to .devinit.text
Date: Fri, 30 Jul 2010 17:42:09 +0200
Message-Id: <1280504530-31737-1-git-send-email-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Nicolas Pitre <nico@marvell.com>, linux-kernel@vger.kernel.org,
	Julia Lawall <julia@diku.dk>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Tejun Heo <tj@kernel.org>, Russell King <rmk+kernel@arm.linux.org.uk>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This fixes the following warning by modpost:

	WARNING: vmlinux.o(.data+0x15018): Section mismatch in reference from the variable pxa2xx_flash_driver to the function .init.text:pxa2xx_flash_probe()
	The variable pxa2xx_flash_driver references
	the function __init pxa2xx_flash_probe()
	If the reference is valid then annotate the
	variable with __init* or __refdata (see linux/init.h) or name the variable:
	*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console,

I choosed to do this instead of using platform_driver_probe as the remove
function uses __devexit.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/mtd/maps/pxa2xx-flash.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/pxa2xx-flash.c b/drivers/mtd/maps/pxa2xx-flash.c
index dd90880..d8ae634 100644
--- a/drivers/mtd/maps/pxa2xx-flash.c
+++ b/drivers/mtd/maps/pxa2xx-flash.c
@@ -51,7 +51,7 @@ struct pxa2xx_flash_info {
 static const char *probes[] = { "RedBoot", "cmdlinepart", NULL };
 
 
-static int __init pxa2xx_flash_probe(struct platform_device *pdev)
+static int __devinit pxa2xx_flash_probe(struct platform_device *pdev)
 {
 	struct flash_platform_data *flash = pdev->dev.platform_data;
 	struct pxa2xx_flash_info *info;
-- 
1.7.1
