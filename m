Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJZml-00048i-0Y
 for linux-mtd@lists.infradead.org; Mon, 05 Nov 2018 07:59:00 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Olof Johansson <olof@lixom.net>
Subject: [PATCH v2] mtd: sa1100: avoid VLA in sa1100_setup_mtd
Date: Mon,  5 Nov 2018 08:58:35 +0100
Message-Id: <20181105075835.16234-1-boris.brezillon@bootlin.com>
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

Dynamically allocate the cdev array passed to mtd_concat_create()
instead of using a VLA.

Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Olof Johansson <olof@lixom.net>
---
Changes in v2:
- Allocate cdev dynamically instead of having a fixed-size array

Hello,

I'm planning to queue this patch to the mtd/fixes PR. Arnd, Kees, feel
free to add your R-b.

Regards,

Boris
---
 drivers/mtd/maps/sa1100-flash.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/sa1100-flash.c b/drivers/mtd/maps/sa1100-flash.c
index 784c6e1a0391..fd5fe12d7461 100644
--- a/drivers/mtd/maps/sa1100-flash.c
+++ b/drivers/mtd/maps/sa1100-flash.c
@@ -221,7 +221,14 @@ static struct sa_info *sa1100_setup_mtd(struct platform_device *pdev,
 		info->mtd = info->subdev[0].mtd;
 		ret = 0;
 	} else if (info->num_subdev > 1) {
-		struct mtd_info *cdev[nr];
+		struct mtd_info **cdev;
+
+		cdev = kmalloc_array(nr, sizeof(*cdev), GFP_KERNEL);
+		if (!cdev) {
+			ret = -ENOMEM;
+			goto err;
+		}
+
 		/*
 		 * We detected multiple devices.  Concatenate them together.
 		 */
@@ -230,6 +237,7 @@ static struct sa_info *sa1100_setup_mtd(struct platform_device *pdev,
 
 		info->mtd = mtd_concat_create(cdev, info->num_subdev,
 					      plat->name);
+		kfree(cdev);
 		if (info->mtd == NULL) {
 			ret = -ENXIO;
 			goto err;
-- 
2.17.1
