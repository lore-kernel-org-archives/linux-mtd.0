Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bP5Sh-0006JS-E7
 for linux-mtd@lists.infradead.org; Mon, 18 Jul 2016 10:07:44 +0000
Received: by mail-lf0-x243.google.com with SMTP id 33so11002214lfw.3
 for <linux-mtd@lists.infradead.org>; Mon, 18 Jul 2016 03:07:23 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Ben Hutchings <ben@decadent.org.uk>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: update description of MTD_BCM47XXSFLASH symbol
Date: Mon, 18 Jul 2016 12:07:03 +0200
Message-Id: <1468836426-27688-1-git-send-email-zajec5@gmail.com>
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

For years now we support writing to BCMA SoC serial flash, so don't
describe this driver as providing read-only support anymore.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/devices/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
index 5a1d0dc..bf8238f 100644
--- a/drivers/mtd/devices/Kconfig
+++ b/drivers/mtd/devices/Kconfig
@@ -113,12 +113,12 @@ config MTD_SST25L
 	  if you want to specify device partitioning.
 
 config MTD_BCM47XXSFLASH
-	tristate "R/O support for serial flash on BCMA bus"
+	tristate "Support for serial flash on BCMA bus"
 	depends on BCMA_SFLASH
 	help
 	  BCMA bus can have various flash memories attached, they are
 	  registered by bcma as platform devices. This enables driver for
-	  serial flash memories (only read-only mode is implemented).
+	  serial flash memories.
 
 config MTD_SLRAM
 	tristate "Uncached system RAM"
-- 
1.8.4.5
