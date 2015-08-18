Received: from mail-pa0-f42.google.com ([209.85.220.42])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRgYG-0003an-UG
 for linux-mtd@lists.infradead.org; Tue, 18 Aug 2015 13:03:44 +0000
Received: by paccq16 with SMTP id cq16so88914205pac.1
 for <linux-mtd@lists.infradead.org>; Tue, 18 Aug 2015 06:03:18 -0700 (PDT)
Message-ID: <1439902993.15765.1.camel@ingics.com>
Subject: [PATCH] mtd: omap_elm: Fix module alias
From: Axel Lin <axel.lin@ingics.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Roger Quadros <rogerq@ti.com>, Frans Klaver <frans.klaver@xsens.com>,
 Ezequiel =?ISO-8859-1?Q?Garc=EDa?=
 <ezequiel@vanguardiasur.com.ar>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org
Date: Tue, 18 Aug 2015 21:03:13 +0800
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove extra space after the "platform:" prefix and make the alias matches
driver name.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/mtd/nand/omap_elm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/omap_elm.c b/drivers/mtd/nand/omap_elm.c
index 376bfe1..235ec79 100644
--- a/drivers/mtd/nand/omap_elm.c
+++ b/drivers/mtd/nand/omap_elm.c
@@ -574,5 +574,5 @@ module_platform_driver(elm_driver);
 
 MODULE_DESCRIPTION("ELM driver for BCH error correction");
 MODULE_AUTHOR("Texas Instruments");
-MODULE_ALIAS("platform: elm");
+MODULE_ALIAS("platform:" DRIVER_NAME);
 MODULE_LICENSE("GPL v2");
-- 
2.1.0
