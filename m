Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QS9FQ-00074e-Q9
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2011 14:51:46 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so758005wwb.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Jun 2011 07:51:44 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 043/104] mtd: physmap_of: use ofpart through generic parsing
Date: Thu,  2 Jun 2011 18:51:21 +0400
Message-Id: <1307026293-8535-9-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>
References: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Convert the driver to use ofpart partitions parsing through the generic
parse_mtd_partitions().

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/maps/physmap_of.c |   10 +++-------
 1 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index d251d1d..312eb17 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -165,7 +165,8 @@ static struct mtd_info * __devinit obsolete_probe(struct platform_device *dev,
    specifies the list of partition probers to use. If none is given then the
    default is use. These take precedence over other device tree
    information. */
-static const char *part_probe_types_def[] = { "cmdlinepart", "RedBoot", NULL };
+static const char *part_probe_types_def[] = { "cmdlinepart", "RedBoot",
+					"ofpart", NULL };
 static const char ** __devinit of_get_probes(struct device_node *dp)
 {
 	const char *cp;
@@ -331,6 +332,7 @@ static int __devinit of_flash_probe(struct platform_device *dev)
 	if (err)
 		goto err_out;
 
+	info->cmtd->node = dp;
 	part_probe_types = of_get_probes(dp);
 	err = parse_mtd_partitions(info->cmtd, part_probe_types,
 				   &info->parts, 0);
@@ -341,12 +343,6 @@ static int __devinit of_flash_probe(struct platform_device *dev)
 	of_free_probes(part_probe_types);
 
 	if (err == 0) {
-		err = of_mtd_parse_partitions(&dev->dev, dp, &info->parts);
-		if (err < 0)
-			goto err_out;
-	}
-
-	if (err == 0) {
 		err = parse_obsolete_partitions(dev, info, dp);
 		if (err < 0)
 			goto err_out;
-- 
1.7.4.4
