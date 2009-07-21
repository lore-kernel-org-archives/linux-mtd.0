Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MTMF1-0005XY-JD
	for linux-mtd@lists.infradead.org; Tue, 21 Jul 2009 20:47:16 +0000
From: =?utf-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] register orion_nand using platform_driver_probe
Date: Tue, 21 Jul 2009 22:46:36 +0200
Message-Id: <1248209196-15705-1-git-send-email-u.kleine-koenig@pengutronix.de>
In-Reply-To: <alpine.LFD.2.00.0907141211260.3138@xanadu.home>
References: <alpine.LFD.2.00.0907141211260.3138@xanadu.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Cc: Tzachi Perelstein <tzachi@marvell.com>,
	=?utf-8?q?J=C3=B6rn=20Engel?= <joern@logfs.org>,
	Nicolas Pitre <nico@marvell.com>,
	Saeed Bishara <saeed@marvell.com>, linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>, Greg Kroah-Hartman <gregkh@suse.de>,
	Lennert Buytenhek <buytenh@marvell.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

orion_nand_probe lives in .init.text, so using platform_driver_register
to register it is wrong because binding a device after the init memory
is discarded (e.g. via sysfs) results in an oops.

As requested by Nicolas Pitre platform_driver_probe is used instead of
moving the probe function to .devinit.text as proposed initially.
This saves some memory, but devices registered after the driver is
probed are not bound (probably there are none) and binding via sysfs
isn't possible.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Cc: Lennert Buytenhek <buytenh@marvell.com>
Cc: Saeed Bishara <saeed@marvell.com>
Cc: Jörn Engel <joern@logfs.org>
Cc: Nicolas Pitre <nico@marvell.com>
Cc: Tzachi Perelstein <tzachi@marvell.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@suse.de>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org

---
 drivers/mtd/nand/orion_nand.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
index 7ad9722..cb9d13b 100644
--- a/drivers/mtd/nand/orion_nand.c
+++ b/drivers/mtd/nand/orion_nand.c
@@ -171,7 +171,6 @@ static int __devexit orion_nand_remove(struct platform_device *pdev)
 }
 
 static struct platform_driver orion_nand_driver = {
-	.probe		= orion_nand_probe,
 	.remove		= __devexit_p(orion_nand_remove),
 	.driver		= {
 		.name	= "orion_nand",
@@ -181,7 +180,7 @@ static struct platform_driver orion_nand_driver = {
 
 static int __init orion_nand_init(void)
 {
-	return platform_driver_register(&orion_nand_driver);
+	return platform_driver_probe(&orion_nand_driver, orion_nand_probe);
 }
 
 static void __exit orion_nand_exit(void)
-- 
tg: (4b0a840..) t/platsection/orion_nand_driver (depends on: linus/master)
