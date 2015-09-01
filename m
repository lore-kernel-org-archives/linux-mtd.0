Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWri9-0002q5-1d
 for linux-mtd@lists.infradead.org; Tue, 01 Sep 2015 19:59:17 +0000
Received: by padhy1 with SMTP id hy1so5957098pad.1
 for <linux-mtd@lists.infradead.org>; Tue, 01 Sep 2015 12:58:56 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
	Marek Vasut <marex@denx.de>
Subject: [PATCH 01/10] mtd: spi-nor: make implicit <linux/bitops.h> dependency
 explicit
Date: Tue,  1 Sep 2015 12:57:06 -0700
Message-Id: <1441137435-52862-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1441137435-52862-1-git-send-email-computersforpeace@gmail.com>
References: <1441137435-52862-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We use BIT() in the header. No real problem for now, but it's better to
be accurate.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 include/linux/mtd/spi-nor.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 495433d3f56d..91e165fa3918 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -10,6 +10,8 @@
 #ifndef __LINUX_MTD_SPI_NOR_H
 #define __LINUX_MTD_SPI_NOR_H
 
+#include <linux/bitops.h>
+
 /*
  * Note on opcode nomenclature: some opcodes have a format like
  * SPINOR_OP_FUNCTION{4,}_x_y_z. The numbers x, y, and z stand for the number
-- 
2.5.0.457.gab17608
