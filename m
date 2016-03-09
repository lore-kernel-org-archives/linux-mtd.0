Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adlAx-0007gg-FT
 for linux-mtd@lists.infradead.org; Wed, 09 Mar 2016 20:57:48 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v2] MAINTAINERS: add a maintainer for the NAND subsystem
Date: Wed,  9 Mar 2016 21:57:24 +0100
Message-Id: <1457557044-7029-1-git-send-email-boris.brezillon@free-electrons.com>
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
Changes since v1:
- rename the MAINTAINERS entry to NAND FLASH SUBSYSTEM
- add Richard as a reviewer
- add a git tree
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 30aca4a..4afa65f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7393,6 +7393,17 @@ W:	https://www.myricom.com/support/downloads/myri10ge.html
 S:	Supported
 F:	drivers/net/ethernet/myricom/myri10ge/
 
+NAND FLASH SUBSYSTEM
+M:	Boris Brezillon <boris.brezillon@free-electrons.com>
+R:	Richard Weinberger <richard@nod.at>
+L:	linux-mtd@lists.infradead.org
+W:	http://www.linux-mtd.infradead.org/
+Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
+T:	git git://github.com/linux-nand/linux.git
+S:	Maintained
+F:	drivers/mtd/nand/
+F:	include/linux/mtd/nand*.h
+
 NATSEMI ETHERNET DRIVER (DP8381x)
 S:	Orphan
 F:	drivers/net/ethernet/natsemi/natsemi.c
-- 
2.1.4
