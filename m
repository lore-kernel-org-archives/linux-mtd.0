Received: from mail-gx0-f223.google.com ([209.85.217.223])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NBMUL-0007AD-Nv
	for linux-mtd@lists.infradead.org; Fri, 20 Nov 2009 05:57:02 +0000
Received: by gxk23 with SMTP id 23so3374338gxk.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 19 Nov 2009 21:56:55 -0800 (PST)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: vmu-flash: Use hweight_long
Date: Fri, 20 Nov 2009 14:56:07 +0900
Message-Id: <1258696567-15887-1-git-send-email-akinobu.mita@gmail.com>
Cc: Adrian McMenamin <adrian@mcmen.demon.co.uk>,
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Paul Mundt <lethal@linux-sh.org>, David Woodhouse <dwmw2@infradead.org>,
	Akinobu Mita <akinobu.mita@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use hweight_long instead of Brian Kernighan's/Peter Wegner's method

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: linux-mtd@lists.infradead.org
Cc: Paul Mundt <lethal@linux-sh.org>
Cc: Adrian McMenamin <adrian@mcmen.demon.co.uk>
---
 drivers/mtd/maps/vmu-flash.c |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/maps/vmu-flash.c b/drivers/mtd/maps/vmu-flash.c
index 1f73297..1008462 100644
--- a/drivers/mtd/maps/vmu-flash.c
+++ b/drivers/mtd/maps/vmu-flash.c
@@ -612,10 +612,9 @@ static int __devinit vmu_connect(struct maple_device *mdev)
 
 	test_flash_data = be32_to_cpu(mdev->devinfo.function);
 	/* Need to count how many bits are set - to find out which
-	 * function_data element has details of the memory card:
-	 * using Brian Kernighan's/Peter Wegner's method */
-	for (c = 0; test_flash_data; c++)
-		test_flash_data &= test_flash_data - 1;
+	 * function_data element has details of the memory card
+	 */
+	c = hweight_long(test_flash_data);
 
 	basic_flash_data = be32_to_cpu(mdev->devinfo.function_data[c - 1]);
 
-- 
1.6.5.1
