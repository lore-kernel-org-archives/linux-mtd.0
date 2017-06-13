Received: from 14.mo5.mail-out.ovh.net ([188.165.51.82])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKrmP-00036I-82
 for linux-mtd@lists.infradead.org; Tue, 13 Jun 2017 19:47:11 +0000
Received: from player734.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id C5A8B1056DB
 for <linux-mtd@lists.infradead.org>; Tue, 13 Jun 2017 21:46:35 +0200 (CEST)
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
To: computersforpeace@gmail.com, dwmw2@infradead.org, richard@nod.at,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: [PATCH v2 1/1] MAINTAINERS: Update SPI NOR subsystem git repositories
Date: Tue, 13 Jun 2017 21:46:24 +0200
Message-Id: <20170613194624.9815-1-cyrille.pitchen@wedev4u.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SPI NOR branches are now hosted on MTD repos, spi-nor/next is on l2-mtd
and spi-nor/fixes is on linux-mtd.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
---

ChangeLog

v1 -> v2
- add branch names 'spi-nor/fixes' and 'spi-nor/next' after url.

 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3bf9897f8df4..46177688a4e8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12282,7 +12282,8 @@ M:	Marek Vasut <marek.vasut@gmail.com>
 L:	linux-mtd@lists.infradead.org
 W:	http://www.linux-mtd.infradead.org/
 Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
-T:	git git://github.com/spi-nor/linux.git
+T:	git git://git.infradead.org/linux-mtd.git spi-nor/fixes
+T:	git git://git.infradead.org/l2-mtd.git spi-nor/next
 S:	Maintained
 F:	drivers/mtd/spi-nor/
 F:	include/linux/mtd/spi-nor.h
-- 
2.11.0
