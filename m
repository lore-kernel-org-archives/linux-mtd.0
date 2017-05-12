Received: from 11.mo7.mail-out.ovh.net ([87.98.173.157])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d9ElA-0000lJ-D4
 for linux-mtd@lists.infradead.org; Fri, 12 May 2017 17:53:50 +0000
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id C0F6C4FBCF
 for <linux-mtd@lists.infradead.org>; Fri, 12 May 2017 19:53:20 +0200 (CEST)
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
To: computersforpeace@gmail.com, dwmw2@infradead.org, richard@nod.at,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: [PATCH] MAINTAINERS: Update SPI NOR subsystem git repositories
Date: Fri, 12 May 2017 19:53:09 +0200
Message-Id: <90daf933f72564bd9394e78451724f5634089577.1494611223.git.cyrille.pitchen@wedev4u.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SPI NOR branches are now hosted on MTD repos, spi-nor/next is on l2-mtd
and spi-nor/fixes will be on linux-mtd.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
---
Hi all,

this is the same patch as for the NAND subsystem migration.
Hence same question: how de we specify the branches?
I don't see any entry for that purpose in the MAINTAINERS file.

Best regards,

Cyrille

 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c265a5fe4848..edc3adefc6ab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11881,7 +11881,8 @@ M:	Marek Vasut <marek.vasut@gmail.com>
 L:	linux-mtd@lists.infradead.org
 W:	http://www.linux-mtd.infradead.org/
 Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
-T:	git git://github.com/spi-nor/linux.git
+T:	git git://git.infradead.org/linux-mtd.git
+T:	git git://git.infradead.org/l2-mtd.git
 S:	Maintained
 F:	drivers/mtd/spi-nor/
 F:	include/linux/mtd/spi-nor.h
-- 
2.11.0
