Received: from max.feld.cvut.cz ([147.32.192.36])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XcZxD-0006v6-Sz
 for linux-mtd@lists.infradead.org; Fri, 10 Oct 2014 13:09:57 +0000
From: Michal Sojka <sojkam1@fel.cvut.cz>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] Update help of CONFIG_MTD_OF_PARTS
Date: Fri, 10 Oct 2014 15:06:17 +0200
Message-Id: <1412946377-18933-1-git-send-email-sojkam1@fel.cvut.cz>
Cc: Michal Sojka <sojkam1@fel.cvut.cz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The help text of CONFIG_MTD_OF_PARTS refers to additional documentation
in booting-without-of.txt but this documentation was moved to another
file in commit efcc2da3fd148c9acb7d7cf1d9800e0649f950fc (Stefan Roese:
Factor MTD physmap bindings out of booting-without-of). This updates the
help text to point to the right place.

Signed-off-by: Michal Sojka <sojkam1@fel.cvut.cz>
---
 drivers/mtd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 94b8210..fa8371a 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -133,7 +133,7 @@ config MTD_OF_PARTS
 	help
 	  This provides a partition parsing function which derives
 	  the partition map from the children of the flash node,
-	  as described in Documentation/devicetree/booting-without-of.txt.
+	  as described in Documentation/devicetree/bindings/mtd/mtd-physmap.txt.
 
 config MTD_AR7_PARTS
 	tristate "TI AR7 partitioning support"
-- 
2.1.1
