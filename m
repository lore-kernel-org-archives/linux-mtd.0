Received: from 19.mo5.mail-out.ovh.net ([46.105.35.78])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cWS9Y-00014A-Ud
 for linux-mtd@lists.infradead.org; Wed, 25 Jan 2017 18:18:42 +0000
Received: from player695.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id A3279930D6
 for <linux-mtd@lists.infradead.org>; Wed, 25 Jan 2017 19:18:18 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 1/2] mtd: name the mtd device with an optional label
 property
Date: Wed, 25 Jan 2017 19:17:34 +0100
Message-Id: <1485368255-12038-2-git-send-email-clg@kaod.org>
In-Reply-To: <1485368255-12038-1-git-send-email-clg@kaod.org>
References: <1485368255-12038-1-git-send-email-clg@kaod.org>
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

Drivers wanting to support this new label property will benefit from
it without a change. They might want to check in the future that
mtd->name is NULL before assigning a default name to the mtd device.
Other drivers will keep the current behavior, which is to override
mtd->name with their own value.

Suggested-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---

 Changes since v1:

 - moved the use of the "label" property from mtd_set_dev_defaults()
   to mtd_set_of_node() to let drivers keep control on how mtd->name
   is set and allocated.

 include/linux/mtd/mtd.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 13f8052b9ff9..f4fe15517295 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -24,6 +24,7 @@
 #include <linux/uio.h>
 #include <linux/notifier.h>
 #include <linux/device.h>
+#include <linux/of.h>
 
 #include <mtd/mtd-abi.h>
 
@@ -385,6 +386,7 @@ static inline void mtd_set_of_node(struct mtd_info *mtd,
 				   struct device_node *np)
 {
 	mtd->dev.of_node = np;
+	of_property_read_string(np, "label", &mtd->name);
 }
 
 static inline struct device_node *mtd_get_of_node(struct mtd_info *mtd)
-- 
2.7.4
