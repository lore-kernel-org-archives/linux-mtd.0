Received: from nbd.name ([2a01:4f8:131:30e2::2])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cJPhJ-0008PC-1h
 for linux-mtd@lists.infradead.org; Tue, 20 Dec 2016 19:03:37 +0000
From: John Crispin <john@phrozen.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 John Crispin <john@phrozen.org>
Subject: =?UTF-8?q?=5BPATCH=5D=20mtd=3A=20update=20my=20email=20address?=
Date: Tue, 20 Dec 2016 20:03:26 +0100
Message-Id: <1482260606-61784-1-git-send-email-john@phrozen.org>
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

This patch updates my email address as I no longer have access to the old
one.

Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/mtd/maps/lantiq-flash.c |    4 ++--
 drivers/mtd/nand/xway_nand.c    |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-flash.c
index c8febb3..3e33ab6 100644
--- a/drivers/mtd/maps/lantiq-flash.c
+++ b/drivers/mtd/maps/lantiq-flash.c
@@ -4,7 +4,7 @@
  *  by the Free Software Foundation.
  *
  *  Copyright (C) 2004 Liu Peng Infineon IFAP DC COM CPE
- *  Copyright (C) 2010 John Crispin <blogic@openwrt.org>
+ *  Copyright (C) 2010 John Crispin <john@phrozen.org>
  */
 
 #include <linux/err.h>
@@ -209,5 +209,5 @@ struct ltq_mtd {
 module_platform_driver(ltq_mtd_driver);
 
 MODULE_LICENSE("GPL");
-MODULE_AUTHOR("John Crispin <blogic@openwrt.org>");
+MODULE_AUTHOR("John Crispin <john@phrozen.org>");
 MODULE_DESCRIPTION("Lantiq SoC NOR");
diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
index 1f2948c..bef709c 100644
--- a/drivers/mtd/nand/xway_nand.c
+++ b/drivers/mtd/nand/xway_nand.c
@@ -3,7 +3,7 @@
  *  under the terms of the GNU General Public License version 2 as published
  *  by the Free Software Foundation.
  *
- *  Copyright © 2012 John Crispin <blogic@openwrt.org>
+ *  Copyright © 2012 John Crispin <john@phrozen.org>
  *  Copyright © 2016 Hauke Mehrtens <hauke@hauke-m.de>
  */
 
-- 
1.7.10.4
