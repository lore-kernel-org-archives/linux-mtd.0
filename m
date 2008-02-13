Received: from moutng.kundenserver.de ([212.227.126.171])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JPFfH-0002D2-ID
	for linux-mtd@lists.infradead.org; Wed, 13 Feb 2008 11:20:42 +0000
From: Stefan Roese <sr@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2] mtd: Fix physmap_of to not exit upon unsuccessful
	partition scan
Date: Wed, 13 Feb 2008 12:19:52 +0100
Message-Id: <1202901592-19718-1-git-send-email-sr@denx.de>
Cc: dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The patch 9a310d21196f38f6ad0ad146057548653e495c09 ("[MTD] Factor out OF
partition support from the NOR driver.") introduced an problem. Now the
physmap_of driver returns with error upon the first unsuccessful
partition scan (parse_mtd_partitions()). This is not wanted, since even
when the RedBoot/cmdlinepart partition scan is unsuccessful, the other
scan's (of_mtd_parse_partitions(), parse_obsolete_partitions()) should be
done nevertheless.

This patch fixes this problem.

Signed-off-by: Stefan Roese <sr@denx.de>
---
 drivers/mtd/maps/physmap_of.c |   16 ++++------------
 1 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 49acd41..09a78ea 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -224,24 +224,16 @@ static int __devinit of_flash_probe(struct of_device *dev,
 	/* First look for RedBoot table or partitions on the command
 	 * line, these take precedence over device tree information */
 	err = parse_mtd_partitions(info->mtd, part_probe_types,
-	                           &info->parts, 0);
-	if (err < 0)
-		return err;
+				   &info->parts, 0);
 
 #ifdef CONFIG_MTD_OF_PARTS
-	if (err == 0) {
+	if (err <= 0)
 		err = of_mtd_parse_partitions(&dev->dev, info->mtd,
-		                              dp, &info->parts);
-		if (err < 0)
-			return err;
-	}
+					      dp, &info->parts);
 #endif
 
-	if (err == 0) {
+	if (err <= 0)
 		err = parse_obsolete_partitions(dev, info, dp);
-		if (err < 0)
-			return err;
-	}
 
 	if (err > 0)
 		add_mtd_partitions(info->mtd, info->parts, err);
-- 
1.5.4.1
