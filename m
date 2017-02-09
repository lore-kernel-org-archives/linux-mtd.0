Received: from 9.mo53.mail-out.ovh.net ([87.98.186.128])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbkvf-0003av-NW
 for linux-mtd@lists.infradead.org; Thu, 09 Feb 2017 09:22:19 +0000
Received: from player158.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo53.mail-out.ovh.net (Postfix) with ESMTP id 56200384A7
 for <linux-mtd@lists.infradead.org>; Thu,  9 Feb 2017 10:21:52 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v3 1/2] mtd: name the mtd device with an optional label
 property
Date: Thu,  9 Feb 2017 10:21:07 +0100
Message-Id: <1486632068-14894-2-git-send-email-clg@kaod.org>
In-Reply-To: <1486632068-14894-1-git-send-email-clg@kaod.org>
References: <1486632068-14894-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This can be used to easily identify a specific chip on a system with
multiple chips.

Suggested-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---

 Changes since v2:

 - only assign device name from label if mtd->name is undefined

 Changes since v1:

 - moved the use of the "label" property from mtd_set_dev_defaults()
   to mtd_set_of_node() to let drivers keep control on how mtd->name
   is set and allocated.

 include/linux/mtd/mtd.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 13f8052b9ff9..5a08ddff4f51 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -24,6 +24,7 @@
 #include <linux/uio.h>
 #include <linux/notifier.h>
 #include <linux/device.h>
+#include <linux/of.h>
 
 #include <mtd/mtd-abi.h>
 
@@ -385,6 +386,8 @@ static inline void mtd_set_of_node(struct mtd_info *mtd,
 				   struct device_node *np)
 {
 	mtd->dev.of_node = np;
+	if (!mtd->name)
+		of_property_read_string(np, "label", &mtd->name);
 }
 
 static inline struct device_node *mtd_get_of_node(struct mtd_info *mtd)
-- 
2.7.4
