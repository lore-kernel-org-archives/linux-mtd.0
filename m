Received: from 74-93-104-97-washington.hfc.comcastbusiness.net ([74.93.104.97]
	helo=sunset.davemloft.net)
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OgtSQ-000229-OQ
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 05:57:36 +0000
Date: Wed, 04 Aug 2010 22:57:51 -0700 (PDT)
Message-Id: <20100804.225751.241430994.davem@davemloft.net>
To: dwmw2@infradead.org
Subject: [PATCH] mtd: Missing slab.h include
From: David Miller <davem@davemloft.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: David S. Miller <davem@davemloft.net>
---

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 3dfda9c..44db805 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -21,6 +21,7 @@
 #include <linux/delay.h>
 #include <linux/wait.h>
 #include <linux/mutex.h>
+#include <linux/slab.h>
 #include <linux/pci.h>
 #include <linux/mtd/mtd.h>
 #include <linux/module.h>
