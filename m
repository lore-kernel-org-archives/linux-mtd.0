Received: from mout.kundenserver.de ([212.227.126.131])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAJUc-0006Ef-B8
 for linux-mtd@lists.infradead.org; Wed, 10 Oct 2018 18:46:00 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: sa1100: avoid VLA in sa1100_setup_mtd
Date: Wed, 10 Oct 2018 20:44:50 +0200
Message-Id: <20181010184533.691620-1-arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Enabling -Wvla found another variable-length array with randconfig
testing:

drivers/mtd/maps/sa1100-flash.c: In function 'sa1100_setup_mtd':
drivers/mtd/maps/sa1100-flash.c:224:10: error: ISO C90 forbids variable length array 'cdev' [-Werror=vla]

As far as I can tell, there is an upper bound on the number of resources
that can be passed, based on the number of CS lines on the bus.
In practice, all boards we support have either one or two resources,
but using six to be on the safe side has no extra cost.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mtd/maps/sa1100-flash.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/sa1100-flash.c b/drivers/mtd/maps/sa1100-flash.c
index 784c6e1a0391..234573b401bd 100644
--- a/drivers/mtd/maps/sa1100-flash.c
+++ b/drivers/mtd/maps/sa1100-flash.c
@@ -23,6 +23,8 @@
 #include <asm/sizes.h>
 #include <asm/mach/flash.h>
 
+#define SA1100_NUM_CS 6
+
 struct sa_subdev_info {
 	char name[16];
 	struct map_info map;
@@ -157,7 +159,7 @@ static struct sa_info *sa1100_setup_mtd(struct platform_device *pdev,
 	/*
 	 * Count number of devices.
 	 */
-	for (nr = 0; ; nr++)
+	for (nr = 0; nr < SA1100_NUM_CS; nr++)
 		if (!platform_get_resource(pdev, IORESOURCE_MEM, nr))
 			break;
 
@@ -221,7 +223,7 @@ static struct sa_info *sa1100_setup_mtd(struct platform_device *pdev,
 		info->mtd = info->subdev[0].mtd;
 		ret = 0;
 	} else if (info->num_subdev > 1) {
-		struct mtd_info *cdev[nr];
+		struct mtd_info *cdev[SA1100_NUM_CS];
 		/*
 		 * We detected multiple devices.  Concatenate them together.
 		 */
-- 
2.18.0
