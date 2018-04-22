Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAJRe-0001lF-GZ
 for linux-mtd@lists.infradead.org; Sun, 22 Apr 2018 18:10:40 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] mtd: nand: add myself as NAND co-maintainer
Date: Sun, 22 Apr 2018 19:55:53 +0200
Message-Id: <20180422175553.7489-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have been actively reviewing and contributing improvements to the NAND
subsystem for more than 6 months now and am willing to continue doing so
in the future. Formalize my new role.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Acked-by: Richard Weinberger <richard@nod.at>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0a1410d5a621..85b39fd1c70d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9574,6 +9574,7 @@ F:	drivers/net/ethernet/myricom/myri10ge/
 
 NAND FLASH SUBSYSTEM
 M:	Boris Brezillon <boris.brezillon@bootlin.com>
+M:	Miquel Raynal <miquel.raynal@bootlin.com>
 R:	Richard Weinberger <richard@nod.at>
 L:	linux-mtd@lists.infradead.org
 W:	http://www.linux-mtd.infradead.org/
-- 
2.14.1
