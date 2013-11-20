Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vj6lj-0005N2-3w
 for linux-mtd@lists.infradead.org; Wed, 20 Nov 2013 12:20:32 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] mtd: Add PXA3xx NAND driver to MAINTAINERS
Date: Wed, 20 Nov 2013 09:20:09 -0300
Message-Id: <1384950009-13767-3-git-send-email-ezequiel.garcia@free-electrons.com>
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

Add the pxa3xx-nand driver which supports PXA3xx and Armada 370/XP SoC
family to MAINTAINERS to ensure I get proper Cc on patches.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d4145f7..e596b93 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5566,6 +5566,12 @@ F:	include/linux/mtd/nand.h
 F:	include/linux/mtd/nand_ecc.h
 F:	include/linux/mtd/nand_bch.h
 
+PXA3xx NAND DRIVER
+M:	Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
+L:	linux-mtd@lists.infradead.org
+S:	Maintained
+F:	drivers/mtd/nand/pxa3xx-nand.c
+
 MEN A21 WATCHDOG DRIVER
 M:  	Johannes Thumshirn <johannes.thumshirn@men.de>
 L:	linux-watchdog@vger.kernel.org
-- 
1.8.1.5
