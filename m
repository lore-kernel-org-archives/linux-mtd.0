Received: from mail-pw0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rs8jG-0007e1-9Z
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2012 08:06:14 +0000
Received: by pbdx9 with SMTP id x9so5495261pbd.36
 for <linux-mtd@lists.infradead.org>; Tue, 31 Jan 2012 00:06:10 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [RFC/PATCH] mtd: m25p80: set writebufsize
Date: Tue, 31 Jan 2012 00:06:03 -0800
Message-Id: <1327997163-9354-1-git-send-email-computersforpeace@gmail.com>
Cc: Kevin Cernekee <cernekee@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, agust@denx.de,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Using UBI on m25p80 can give messages like:

    UBI error: io_init: bad write buffer size 0 for 1 min. I/O unit

We need to initialize writebufsize; I think "page_size" is the correct
"bufsize", although I'm not sure. Comments?

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/devices/m25p80.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index f83e4d0..8808da9 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -932,6 +932,7 @@ static int __devinit m25p_probe(struct spi_device *spi)
 	ppdata.of_node = spi->dev.of_node;
 	flash->mtd.dev.parent = &spi->dev;
 	flash->page_size = info->page_size;
+	flash->mtd.writebufsize = flash->page_size;
 
 	if (info->addr_width)
 		flash->addr_width = info->addr_width;
-- 
1.7.5.4
