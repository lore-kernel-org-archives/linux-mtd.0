Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzcLt-0000Ze-Sk
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 03:27:11 +0000
Received: by pabfh17 with SMTP id fh17so105136831pab.0
 for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2015 19:26:48 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/3] mtd: untangle error codes and number of partitions
Date: Thu, 19 Nov 2015 19:26:36 -0800
Message-Id: <1447989997-108476-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1447989997-108476-1-git-send-email-computersforpeace@gmail.com>
References: <1447989997-108476-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We're going to need to know how many partitions were registered, so
let's disentangle the 'ret' and 'nr_parts' variables, so that nr_parts
always represents the number of partitions we're registering.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/mtdcore.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 62f83b050978..c8d54948bbc1 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -592,23 +592,25 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 	struct mtd_partition *real_parts = NULL;
 
 	ret = parse_mtd_partitions(mtd, types, &real_parts, parser_data);
-	if (ret <= 0 && nr_parts && parts) {
+	if (ret > 0) {
+		nr_parts = ret;
+	} else if (ret <= 0 && nr_parts && parts) {
 		real_parts = kmemdup(parts, sizeof(*parts) * nr_parts,
 				     GFP_KERNEL);
 		if (!real_parts)
 			ret = -ENOMEM;
 		else
-			ret = nr_parts;
+			ret = 0;
 	}
 	/* Didn't come up with either parsed OR fallback partitions */
 	if (ret < 0) {
 		pr_info("mtd: failed to find partitions; one or more parsers reports errors (%d)\n",
 			ret);
 		/* Don't abort on errors; we can still use unpartitioned MTD */
-		ret = 0;
+		nr_parts = 0;
 	}
 
-	ret = mtd_add_device_partitions(mtd, real_parts, ret);
+	ret = mtd_add_device_partitions(mtd, real_parts, nr_parts);
 	if (ret)
 		goto out;
 
-- 
2.6.0.rc2.230.g3dd15c0
