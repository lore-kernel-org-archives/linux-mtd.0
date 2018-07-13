Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fdtFZ-0002TO-MU
 for linux-mtd@lists.infradead.org; Fri, 13 Jul 2018 08:16:27 +0000
Received: by mail-lf0-x242.google.com with SMTP id y200-v6so26479400lfd.7
 for <linux-mtd@lists.infradead.org>; Fri, 13 Jul 2018 01:16:14 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Cyril Bur <cyrilbur@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linuxppc-dev@lists.ozlabs.org,
 Timothy Pearson <tpearson@raptorengineering.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] mtd: powernv_flash: set of_node in mtd's dev
Date: Fri, 13 Jul 2018 10:15:59 +0200
Message-Id: <20180713081559.4373-1-zajec5@gmail.com>
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

From: Rafał Miłecki <rafal@milecki.pl>

This enables some features implemented in mtd subsystem like reading
label and partitioning info from DT.

Reported-by: Timothy Pearson <tpearson@raptorengineering.com>
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/mtd/devices/powernv_flash.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
index c1312b141ae0..33593122e49b 100644
--- a/drivers/mtd/devices/powernv_flash.c
+++ b/drivers/mtd/devices/powernv_flash.c
@@ -223,6 +223,7 @@ static int powernv_flash_set_driver_info(struct device *dev,
 	mtd->_read = powernv_flash_read;
 	mtd->_write = powernv_flash_write;
 	mtd->dev.parent = dev;
+	mtd_set_of_node(mtd, dev->of_node);
 	return 0;
 }
 
-- 
2.13.7
