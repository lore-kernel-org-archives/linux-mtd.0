Received: from mail-ob0-x22e.google.com ([2607:f8b0:4003:c01::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UxSlM-0006NI-LY
 for linux-mtd@lists.infradead.org; Fri, 12 Jul 2013 02:07:13 +0000
Received: by mail-ob0-f174.google.com with SMTP id wd20so10709881obb.5
 for <linux-mtd@lists.infradead.org>; Thu, 11 Jul 2013 19:06:51 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 12 Jul 2013 10:06:50 +0800
Message-ID: <CAHSAbzMWjDrB94Gp-3x4iUWpFewd81f8aeSg0+8pvsvMop0BQg@mail.gmail.com>
Subject: M25p80 little bug
From: yuhang wang <wangyuhang2014@gmail.com>
To: artem.bityutskiy@linux.intel.com, marex@denx.de, wfp5p@virginia.edu,
 swarren@nvidia.com, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

There seems two bugs in m25p80 driver.
1: The position to kmalloc flash->command seems incorrect. Because
flash->fast_read is not set.
2: There is no place to free flash if error occur in probe.

>From 4c9c1fc03b5a953b0a95f543de1fbdfc62f28b42 Mon Sep 17 00:00:00 2001
From: wangyuhang <wangyuhang2014@gmail.com>
Date: Wed, 10 Jul 2013 16:58:17 +0800
Subject: [PATCH] m25p80 bug Signed-off-by: wangyuhang
 <wangyuhang2014@gmail.com>

Signed-off-by: wangyuhang <wangyuhang2014@gmail.com>
---
 drivers/mtd/devices/m25p80.c |   24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 5b6b072..6bb9e2b 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -901,7 +901,7 @@ static int m25p_probe(struct spi_device *spi)
  struct flash_platform_data *data;
  struct m25p *flash;
  struct flash_info *info;
- unsigned i;
+ unsigned i,ret;
  struct mtd_part_parser_data ppdata;
  struct device_node __maybe_unused *np = spi->dev.of_node;

@@ -958,13 +958,7 @@ static int m25p_probe(struct spi_device *spi)
  flash = kzalloc(sizeof *flash, GFP_KERNEL);
  if (!flash)
  return -ENOMEM;
- flash->command = kmalloc(MAX_CMD_SIZE + (flash->fast_read ? 1 : 0),
- GFP_KERNEL);
- if (!flash->command) {
- kfree(flash);
- return -ENOMEM;
- }
-
+
  flash->spi = spi;
  mutex_init(&flash->lock);
  dev_set_drvdata(&spi->dev, flash);
@@ -1031,7 +1025,12 @@ static int m25p_probe(struct spi_device *spi)
 #ifdef CONFIG_M25PXX_USE_FAST_READ
  flash->fast_read = true;
 #endif
-
+ flash->command = kmalloc(MAX_CMD_SIZE + (flash->fast_read ? 1 : 0),
+ GFP_KERNEL);
+ if (!flash->command) {
+ kfree(flash);
+ return -ENOMEM;
+ }
  if (info->addr_width)
  flash->addr_width = info->addr_width;
  else {
@@ -1067,9 +1066,14 @@ static int m25p_probe(struct spi_device *spi)
  /* partitions should match sector boundaries; and it may be good to
  * use readonly partitions for writeprotected sectors (BP2..BP0).
  */
- return mtd_device_parse_register(&flash->mtd, NULL, &ppdata,
+ ret = mtd_device_parse_register(&flash->mtd, NULL, &ppdata,
  data ? data->parts : NULL,
  data ? data->nr_parts : 0);
+ if (ret) {
+ kfree(flash->command);
+ kfree(flash);
+ }
+ return ret;
 }


--
1.7.9.5
