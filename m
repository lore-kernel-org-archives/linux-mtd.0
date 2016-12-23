Received: from mail-wj0-x243.google.com ([2a00:1450:400c:c01::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cKL2p-0004uk-QG
 for linux-mtd@lists.infradead.org; Fri, 23 Dec 2016 08:17:40 +0000
Received: by mail-wj0-x243.google.com with SMTP id hb5so5973747wjc.2
 for <linux-mtd@lists.infradead.org>; Fri, 23 Dec 2016 00:17:18 -0800 (PST)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] mtd: nand: xway: fix build failure
Date: Fri, 23 Dec 2016 08:17:12 +0000
Message-Id: <1482481032-28043-1-git-send-email-sudipm.mukherjee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The build of mips xway_defconfig was failing with the error:

drivers/mtd/nand/xway_nand.c:235:1: warning:
	data definition has no type or storage class
 MODULE_DEVICE_TABLE(of, xway_nand_match);
 ^~~~~~~~~~~~~~~~~~~
drivers/mtd/nand/xway_nand.c:235:1: error:
	type defaults to 'int' in declaration of 'MODULE_DEVICE_TABLE'
		[-Werror=implicit-int]

It missed to include the header file.

Signed-off-by: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
---

Build log of next-20161223 is at:
https://travis-ci.org/sudipm-mukherjee/parport/jobs/186246753

This error will be fixed but it will now uncover the next error as the
build goes on.

 drivers/mtd/nand/xway_nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
index 1f2948c..00168d6 100644
--- a/drivers/mtd/nand/xway_nand.c
+++ b/drivers/mtd/nand/xway_nand.c
@@ -7,6 +7,7 @@
  *  Copyright © 2016 Hauke Mehrtens <hauke@hauke-m.de>
  */
 
+#include <linux/module.h>
 #include <linux/mtd/nand.h>
 #include <linux/of_gpio.h>
 #include <linux/of_platform.h>
-- 
1.9.1
