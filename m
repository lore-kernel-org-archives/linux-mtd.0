Received: from v031479.home.net.pl ([89.161.171.237])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SCA7M-0002bv-GH
 for linux-mtd@lists.infradead.org; Mon, 26 Mar 2012 13:37:54 +0000
Date: Mon, 26 Mar 2012 15:37:36 +0200
From: =?utf-8?B?TWljaGHFgiBXcsOzYmVs?= <michal.wrobel@flytronic.pl>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: ixp4xx: fix partition parser argument
Message-ID: <20120326133735.GA19800@FLYC077.flytronic.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit c7975330154af17aecc167b33ca866b6b3d98918 ("mtd: abstract last MTD
partition parser argument") moved the "origin" argument into struct
mtd_part_parser_data, but didn't update its only user: ixp4xx.c.

Signed-off-by: Michał Wróbel <michal.wrobel@flytronic.pl>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
---
 drivers/mtd/maps/ixp4xx.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/ixp4xx.c b/drivers/mtd/maps/ixp4xx.c
index 8b54101..8d6ca57 100644
--- a/drivers/mtd/maps/ixp4xx.c
+++ b/drivers/mtd/maps/ixp4xx.c
@@ -183,6 +183,7 @@ static int ixp4xx_flash_probe(struct platform_device *dev)
 	struct flash_platform_data *plat = dev->dev.platform_data;
 	struct ixp4xx_flash_info *info;
 	int err = -1;
+	struct mtd_part_parser_data ppdata;
 
 	if (!plat)
 		return -ENODEV;
@@ -247,7 +248,8 @@ static int ixp4xx_flash_probe(struct platform_device *dev)
 	/* Use the fast version */
 	info->map.write = ixp4xx_write16;
 
-	err = mtd_device_parse_register(info->mtd, probes, dev->resource->start,
+	ppdata.origin = dev->resource->start;
+	err = mtd_device_parse_register(info->mtd, probes, &ppdata,
 			plat->parts, plat->nr_parts);
 	if (err) {
 		printk(KERN_ERR "Could not parse partitions\n");
-- 
1.7.5.4
