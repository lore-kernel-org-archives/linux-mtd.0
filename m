Message-Id: <200908062305.n76N5Y08004955@imap1.linux-foundation.org>
Subject: [patch 5/8] mtd: register orion_nand using platform_driver_probe()
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Thu, 06 Aug 2009 16:05:34 -0700
Cc: nico@marvell.com, joern@logfs.org, gregkh@suse.de, saeed@marvell.com,
	linux-mtd@lists.infradead.org, u.kleine-koenig@pengutronix.de,
	akpm@linux-foundation.org, buytenh@marvell.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

orion_nand_probe lives in .init.text, so using platform_driver_register to
register it is wrong because binding a device after the init memory is
discarded (e.g.  via sysfs) results in an oops.

As requested by Nicolas Pitre platform_driver_probe is used instead of
moving the probe function to .devinit.text as proposed initially.  This
saves some memory, but devices registered after the driver is probed are
not bound (probably there are none) and binding via sysfs isn't possible.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Cc: Lennert Buytenhek <buytenh@marvell.com>
Cc: Saeed Bishara <saeed@marvell.com>
Cc: Joern Engel <joern@logfs.org>
Acked-by: Nicolas Pitre <nico@marvell.com>
Cc: Greg Kroah-Hartman <gregkh@suse.de>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/nand/orion_nand.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff -puN drivers/mtd/nand/orion_nand.c~mtd-register-orion_nand-using-platform_driver_probe drivers/mtd/nand/orion_nand.c
--- a/drivers/mtd/nand/orion_nand.c~mtd-register-orion_nand-using-platform_driver_probe
+++ a/drivers/mtd/nand/orion_nand.c
@@ -171,7 +171,6 @@ static int __devexit orion_nand_remove(s
 }
 
 static struct platform_driver orion_nand_driver = {
-	.probe		= orion_nand_probe,
 	.remove		= __devexit_p(orion_nand_remove),
 	.driver		= {
 		.name	= "orion_nand",
@@ -181,7 +180,7 @@ static struct platform_driver orion_nand
 
 static int __init orion_nand_init(void)
 {
-	return platform_driver_register(&orion_nand_driver);
+	return platform_driver_probe(&orion_nand_driver, orion_nand_probe);
 }
 
 static void __exit orion_nand_exit(void)
_
