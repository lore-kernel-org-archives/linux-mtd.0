Received: from xdsl-664.zgora.dialog.net.pl ([81.168.226.152] helo=tuxland.pl)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IERl6-0004Bb-8Y
	for linux-mtd@lists.infradead.org; Fri, 27 Jul 2007 11:30:00 -0400
From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
To: dwmw2@infradead.org, Vitaly Wool <vwool@ru.mvista.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] mtd: remove redundant/dead code from physmap_of.c
Date: Fri, 27 Jul 2007 17:29:32 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200707271729.33026.m.kozlowski@tuxland.pl>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

	This patch removes redundant memset() and dead return line from
of_physmap_probe(). No functional change.

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 drivers/mtd/maps/physmap_of.c | 6223 -> 6176 (-47 bytes)

 drivers/mtd/maps/physmap_of.c |    5 -----
 1 file changed, 5 deletions(-)

--- linux-2.6.23-rc1-mm1-a/drivers/mtd/maps/physmap_of.c	2007-07-26 13:07:41.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/drivers/mtd/maps/physmap_of.c	2007-07-27 17:06:15.000000000 +0200
@@ -139,11 +139,10 @@ static int __devinit of_physmap_probe(st
 	info = kzalloc(sizeof(struct physmap_flash_info), GFP_KERNEL);
 	if (info == NULL) {
 		err = -ENOMEM;
 		goto err_out;
 	}
-	memset(info, 0, sizeof(*info));

 	dev_set_drvdata(&dev->dev, info);

 	info->res = request_mem_region(res.start, res.end - res.start + 1,
 			dev->dev.bus_id);
@@ -211,14 +210,10 @@ static int __devinit of_physmap_probe(st
 	return 0;

 err_out:
 	of_physmap_remove(dev);
 	return err;
-
-	return 0;
-
-
 }

 static struct of_device_id of_physmap_match[] = {
 	{
 		.type		= "rom",
