Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vj6lj-0005N3-3x
 for linux-mtd@lists.infradead.org; Wed, 20 Nov 2013 12:20:32 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] mtd: Add NAND device drivers to MAINTAINERS
Date: Wed, 20 Nov 2013 09:20:08 -0300
Message-Id: <1384950009-13767-2-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1384950009-13767-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1384950009-13767-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add drivers/mtd/nand/ to MAINTAINERS file with Brian Norris
as the subsystem maintainer.

Cc: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 167e188..d4145f7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5554,6 +5554,18 @@ F:	drivers/mtd/
 F:	include/linux/mtd/
 F:	include/uapi/mtd/
 
+NAND DEVICE DRIVERS
+M:	Brian Norris <computersforpeace@gmail.com>
+L:	linux-mtd@lists.infradead.org
+W:	http://www.linux-mtd.infradead.org/
+Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
+T:	git http://git.infradead.org/l2-mtd.git
+S:	Maintained
+F:	drivers/mtd/nand/
+F:	include/linux/mtd/nand.h
+F:	include/linux/mtd/nand_ecc.h
+F:	include/linux/mtd/nand_bch.h
+
 MEN A21 WATCHDOG DRIVER
 M:  	Johannes Thumshirn <johannes.thumshirn@men.de>
 L:	linux-watchdog@vger.kernel.org
-- 
1.8.1.5
