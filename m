Received: from mail-wg0-f47.google.com ([74.125.82.47])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XVNw6-0005LI-Kx
 for linux-mtd@lists.infradead.org; Sat, 20 Sep 2014 16:55:03 +0000
Received: by mail-wg0-f47.google.com with SMTP id y10so1084132wgg.30
 for <linux-mtd@lists.infradead.org>; Sat, 20 Sep 2014 09:54:40 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Brian Norris <computersforpeace@gmail.com>, Roger Quadros <rogerq@ti.com>
Subject: [PATCH v4 5/5] mtd: nand: Constrain omap_elm to built-in
Date: Sat, 20 Sep 2014 17:53:16 +0100
Message-Id: <1411231996-6387-6-git-send-email-ezequiel@vanguardiasur.com.ar>
In-Reply-To: <1411231996-6387-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1411231996-6387-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
 linux-mtd@lists.infradead.org, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This fixes the following build error when omap2_nand is chosen built-in,
and omap_elm is chosen as a module:

  drivers/mtd/nand/omap2.c:2010: undefined reference to `elm_config'
  drivers/mtd/nand/omap2.c:1980: undefined reference to `elm_config'
  drivers/mtd/nand/omap2.c:1927: undefined reference to `elm_config'
  drivers/mtd/nand/omap2.c:1444: undefined reference to `elm_decode_bch_error_page'

Fix this by making omap_elm a 'bool' driver.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/mtd/nand/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index f1cf503..549c0cb 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -96,7 +96,7 @@ config MTD_NAND_OMAP2
 
 config MTD_NAND_OMAP_BCH
 	depends on MTD_NAND_OMAP2
-	tristate "Support hardware based BCH error correction"
+	bool "Support hardware based BCH error correction"
 	default n
 	select BCH
 	help
-- 
2.1.0
