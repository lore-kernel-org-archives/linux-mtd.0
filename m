Received: from metis.extern.pengutronix.de ([83.236.181.26])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FuoR0-0001sO-EZ
	for linux-mtd@lists.infradead.org; Mon, 26 Jun 2006 11:35:15 +0100
Received: from leda.ptxnet.pengutronix.de ([10.1.0.71])
	by metis.extern.pengutronix.de with esmtp (Exim 3.36 #1 (Debian))
	id 1FuoQh-00062S-00
	for <linux-mtd@lists.infradead.org>; Mon, 26 Jun 2006 12:34:55 +0200
Received: from sha by leda.ptxnet.pengutronix.de with local (Exim 4.51)
	id 1FuoQh-0001RP-KY
	for linux-mtd@lists.infradead.org; Mon, 26 Jun 2006 12:34:55 +0200
Date: Mon, 26 Jun 2006 12:34:55 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: off-by-one error in physmap.c
Message-ID: <20060626103455.GA5167@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch fixes a simple off-by-one error in the mtd physmap driver.

Sascha


Signed-Off-By: Sascha Hauer <s.hauer@pengutronix.de>

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 433c3ca..d6301f0 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -182,7 +182,7 @@ static struct physmap_flash_data physmap
 
 static struct resource physmap_flash_resource = {
 	.start		= CONFIG_MTD_PHYSMAP_START,
-	.end		= CONFIG_MTD_PHYSMAP_START + CONFIG_MTD_PHYSMAP_LEN,
+	.end		= CONFIG_MTD_PHYSMAP_START + CONFIG_MTD_PHYSMAP_LEN - 1,
 	.flags		= IORESOURCE_MEM,
 };
 
