Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MuutR-0003tr-NR
	for linux-mtd@lists.infradead.org; Mon, 05 Oct 2009 21:14:58 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 3/3] mtd/maps: gpio-addr-flash: depend on GPIO arch support
Date: Mon,  5 Oct 2009 17:14:49 -0400
Message-Id: <1254777289-32109-4-git-send-email-vapier@gentoo.org>
In-Reply-To: <1254777289-32109-1-git-send-email-vapier@gentoo.org>
References: <1254777289-32109-1-git-send-email-vapier@gentoo.org>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
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
index 841e085..14be075 100644
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
1.6.5.rc2
