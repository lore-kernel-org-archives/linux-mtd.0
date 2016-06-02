Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b8NS9-0004uT-9x
 for linux-mtd@lists.infradead.org; Thu, 02 Jun 2016 07:54:05 +0000
Date: Thu, 2 Jun 2016 09:53:37 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Benoit Cousson <bcousson@baylibre.com>, Tony Lindgren
 <tony@atomide.com>, David Woodhouse <dwmw2@infradead.org>
CC: Linux mtd <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/4] MAINTAINERS: mtd: Add maintainer for Evatronix NAND
 flash driver
Message-ID: <alpine.DEB.2.02.1606020952560.19416@lnxricardw1.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Ricard Wanderlof <ricardw@axis.com>
---
 MAINTAINERS |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9c567a4..d28b863 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4320,6 +4320,12 @@ F:	Documentation/networking/phy.txt
 F:	drivers/of/of_mdio.c
 F:	drivers/of/of_net.c
 
+EVATRONIX NAND FLASH DRIVER
+M:	Ricard Wanderlof <ricardw@axis.com>
+L:	linux-mtd@lists.infradead.org
+S:	Maintained
+F:	drivers/mtd/nand/evatronix_nand.c
+
 EXT2 FILE SYSTEM
 M:	Jan Kara <jack@suse.com>
 L:	linux-ext4@vger.kernel.org
-- 
1.7.10.4


-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
