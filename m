Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QVXLa-00010O-HM
	for linux-mtd@lists.infradead.org; Sat, 11 Jun 2011 23:12:07 +0000
Received: by mail-ew0-f49.google.com with SMTP id 3so1527779ewy.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 11 Jun 2011 16:12:06 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 03/18] mtd: physmap_of: use ofpart through generic parsing
Date: Sun, 12 Jun 2011 03:11:47 +0400
Message-Id: <1307833922-21602-4-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307833922-21602-1-git-send-email-dbaryshkov@gmail.com>
References: <1307833922-21602-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
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
 drivers/mtd/maps/physmap_of.c |   13 +++++--------
 1 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index d251d1d..6a75743 100644
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
@@ -218,6 +219,7 @@ static int __devinit of_flash_probe(struct platform_device *dev)
 	int reg_tuple_size;
 	struct mtd_info **mtd_list = NULL;
 	resource_size_t res_size;
+	struct mtd_part_parser_data ppdata;
 
 	match = of_match_device(of_flash_match, &dev->dev);
 	if (!match)
@@ -331,9 +333,10 @@ static int __devinit of_flash_probe(struct platform_device *dev)
 	if (err)
 		goto err_out;
 
+	ppdata.of_node = dp;
 	part_probe_types = of_get_probes(dp);
 	err = parse_mtd_partitions(info->cmtd, part_probe_types,
-				   &info->parts, 0);
+				   &info->parts, &ppdata);
 	if (err < 0) {
 		of_free_probes(part_probe_types);
 		goto err_out;
@@ -341,12 +344,6 @@ static int __devinit of_flash_probe(struct platform_device *dev)
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
1.7.5.3
