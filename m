Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d5o6B-00081O-HH
 for linux-mtd@lists.infradead.org; Wed, 03 May 2017 06:49:21 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: [PATCH] MAINTAINERS: Update NAND subsystem git repositories
Date: Wed,  3 May 2017 08:48:55 +0200
Message-Id: <1493794135-23074-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

NAND branches are now hosted on MTD repos, nand/next is on l2-mtd and
nand/fixes will be on linux-mtd.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9a84d0022d57..4aa9ca992ad4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8605,7 +8605,8 @@ R:	Richard Weinberger <richard@nod.at>
 L:	linux-mtd@lists.infradead.org
 W:	http://www.linux-mtd.infradead.org/
 Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
-T:	git git://github.com/linux-nand/linux.git
+T:	git git://git.infradead.org/linux-mtd.git
+T:	git git://git.infradead.org/l2-mtd.git
 S:	Maintained
 F:	drivers/mtd/nand/
 F:	include/linux/mtd/nand*.h
-- 
2.7.4
