Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adbiO-00020s-Ps
 for linux-mtd@lists.infradead.org; Wed, 09 Mar 2016 10:51:41 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH] MAINTAINERS: add a maintainer for the NAND subsystem
Date: Wed,  9 Mar 2016 11:36:20 +0100
Message-Id: <1457519780-19138-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add myself as the maintainer of the NAND subsystem.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 30aca4a..b648e72 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7393,6 +7393,15 @@ W:	https://www.myricom.com/support/downloads/myri10ge.html
 S:	Supported
 F:	drivers/net/ethernet/myricom/myri10ge/
 
+NAND
+M:	Boris Brezillon <boris.brezillon@free-electrons.com>
+L:	linux-mtd@lists.infradead.org
+W:	http://www.linux-mtd.infradead.org/
+Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
+S:	Maintained
+F:	drivers/mtd/nand/
+F:	include/linux/mtd/nand*.h
+
 NATSEMI ETHERNET DRIVER (DP8381x)
 S:	Orphan
 F:	drivers/net/ethernet/natsemi/natsemi.c
-- 
2.1.4
