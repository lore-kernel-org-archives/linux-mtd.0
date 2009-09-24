Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MqtjF-0006eY-5P
	for linux-mtd@lists.infradead.org; Thu, 24 Sep 2009 19:11:49 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 2/2] mtd/maps: gpio-addr-flash: depend on GPIO arch support
Date: Thu, 24 Sep 2009 15:11:38 -0400
Message-Id: <1253819498-16780-2-git-send-email-vapier@gentoo.org>
In-Reply-To: <1253690210.4170.618.camel@macbook.infradead.org>
References: <1253690210.4170.618.camel@macbook.infradead.org>
Cc: uclinux-dist-devel@blackfin.uclinux.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The driver requires gpio functionality, so make sure we depend on that in
the Kconfig menu.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 drivers/mtd/maps/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 3a9a960..0fc67a2 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -486,6 +486,7 @@ config MTD_BFIN_ASYNC
 
 config MTD_GPIO_ADDR
 	tristate "GPIO-assisted Flash Chip Support"
+	depends on GENERIC_GPIO || GPIOLIB
 	depends on MTD_COMPLEX_MAPPINGS
 	select MTD_PARTITIONS
 	help
-- 
1.6.5.rc1
