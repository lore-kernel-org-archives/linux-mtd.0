Received: from co1ehsobe002.messaging.microsoft.com ([216.32.180.185]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W058s-0002pw-ED
 for linux-mtd@lists.infradead.org; Mon, 06 Jan 2014 08:02:35 +0000
From: Hou Zhiqiang <b48286@freescale.com>
To: <linux-mtd@lists.infradead.org>, <linuxppc-dev@ozlabs.org>
Subject: [PATCH] mtd: m25p80: Make the name of mtd_info fixed
Date: Mon, 6 Jan 2014 14:34:29 +0800
Message-ID: <1388990069-27066-1-git-send-email-b48286@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: scottwood@freescale.com, Hou Zhiqiang <b48286@freescale.com>,
 mingkai.hu@freescale.com, computersforpeace@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To give spi flash layout using "mtdparts=..." in cmdline, we must
give mtd_info a fixed name,because the cmdlinepart's parser will
match the name given in cmdline with the mtd_info.

Now, if use OF node, mtd_info's name will be spi->dev->name. It
consists of spi_master->bus_num, and the spi_master->bus_num maybe
dynamically fetched.
So, give the mtd_info a new fiexd name "name.cs", "name" is name of
spi_device_id and "cs" is chip-select in spi_dev.

Signed-off-by: Hou Zhiqiang <b48286@freescale.com>
---
 drivers/mtd/devices/m25p80.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index eb558e8..d1ed480 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -1012,7 +1012,8 @@ static int m25p_probe(struct spi_device *spi)
 	if (data && data->name)
 		flash->mtd.name = data->name;
 	else
-		flash->mtd.name = dev_name(&spi->dev);
+		flash->mtd.name = kasprintf(GFP_KERNEL, "%s.%d",
+				id->name, spi->chip_select);
 
 	flash->mtd.type = MTD_NORFLASH;
 	flash->mtd.writesize = 1;
-- 
1.8.4.1
