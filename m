Received: from nbd.name ([46.4.11.11])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S0c26-0000ex-Bb
 for linux-mtd@lists.infradead.org; Thu, 23 Feb 2012 17:00:43 +0000
From: John Crispin <blogic@openwrt.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] MTD: MIPS: lantiq: reintroduce support for cmdline partitions
Date: Thu, 23 Feb 2012 17:59:49 +0100
Message-Id: <1330016389-20973-1-git-send-email-blogic@openwrt.org>
Cc: Daniel Schwierzeck <daniel.schwierzeck@googlemail.com>,
 linux-mtd@lists.infradead.org, John Crispin <blogic@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Daniel Schwierzeck <daniel.schwierzeck@googlemail.com>

Since commit ca97dec2ab5c87e9fbdf7e882e1820004a3966fa the
command line parsing of MTD partitions does not work anymore.

Signed-off-by: Daniel Schwierzeck <daniel.schwierzeck@googlemail.com>
Signed-off-by: John Crispin <blogic@openwrt.org>
---
 drivers/mtd/maps/lantiq-flash.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-flash.c
index 395ebfe..ccc6954 100644
--- a/drivers/mtd/maps/lantiq-flash.c
+++ b/drivers/mtd/maps/lantiq-flash.c
@@ -45,6 +45,7 @@ struct ltq_mtd {
 };
 
 static char ltq_map_name[] = "ltq_nor";
+static const char *ltq_probe_types[] __devinitconst = { "cmdlinepart", NULL };
 
 static map_word
 ltq_read16(struct map_info *map, unsigned long adr)
@@ -168,7 +169,7 @@ ltq_mtd_probe(struct platform_device *pdev)
 	cfi->addr_unlock1 ^= 1;
 	cfi->addr_unlock2 ^= 1;
 
-	err = mtd_device_parse_register(ltq_mtd->mtd, NULL, 0,
+	err = mtd_device_parse_register(ltq_mtd->mtd, ltq_probe_types, 0,
 			ltq_mtd_data->parts, ltq_mtd_data->nr_parts);
 	if (err) {
 		dev_err(&pdev->dev, "failed to add partitions\n");
-- 
1.7.7.1
