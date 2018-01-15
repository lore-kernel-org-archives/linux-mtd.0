Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ebDW4-00034G-2E
 for linux-mtd@lists.infradead.org; Mon, 15 Jan 2018 22:46:09 +0000
Received: by mail-lf0-x243.google.com with SMTP id g72so9628891lfg.5
 for <linux-mtd@lists.infradead.org>; Mon, 15 Jan 2018 14:45:57 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org, Jonas Gorski <jonas.gorski@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V4 1/2] mtd: move code adding master MTD out of
 mtd_add_device_partitions
Date: Mon, 15 Jan 2018 23:45:46 +0100
Message-Id: <20180115224547.9265-2-zajec5@gmail.com>
In-Reply-To: <20180115224547.9265-1-zajec5@gmail.com>
References: <20180115143519.9845-1-zajec5@gmail.com>
 <20180115224547.9265-1-zajec5@gmail.com>
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

This change is a small cleanup of mtd_device_parse_register. When using
MTD_PARTITIONED_MASTER it makes sure a master MTD is registered before
dealing with partitions. There are 2 advantages of this:
1) Not mixing code handling master MTD with code handling partitions
2) Possibility of reusing mtd_parse_part in the future to avoid some
   code duplication.

This commit doesn't change any behavior except from a slightly different
failure code path. The new code may need to call del_mtd_device when
something goes wrong.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: Use device_is_registered (thanks Boris)
    Add an empty line before "return ret;"
V3: Use device_is_registered also in a out code path
---
 drivers/mtd/mtdcore.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index f80e911b8843..3304199cca07 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -641,20 +641,12 @@ static int mtd_add_device_partitions(struct mtd_info *mtd,
 {
 	const struct mtd_partition *real_parts = parts->parts;
 	int nbparts = parts->nr_parts;
-	int ret;
 
-	if (nbparts == 0 || IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER)) {
-		ret = add_mtd_device(mtd);
-		if (ret)
-			return ret;
-	}
+	if (!nbparts && !device_is_registered(&mtd->dev))
+		return add_mtd_device(mtd);
 
-	if (nbparts > 0) {
-		ret = add_mtd_partitions(mtd, real_parts, nbparts);
-		if (ret && IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
-			del_mtd_device(mtd);
-		return ret;
-	}
+	if (nbparts > 0)
+		return add_mtd_partitions(mtd, real_parts, nbparts);
 
 	return 0;
 }
@@ -714,6 +706,12 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 
 	mtd_set_dev_defaults(mtd);
 
+	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER)) {
+		ret = add_mtd_device(mtd);
+		if (ret)
+			return ret;
+	}
+
 	memset(&parsed, 0, sizeof(parsed));
 
 	ret = parse_mtd_partitions(mtd, types, &parsed, parser_data);
@@ -753,6 +751,9 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 out:
 	/* Cleanup any parsed partitions */
 	mtd_part_parser_cleanup(&parsed);
+	if (ret && device_is_registered(&mtd->dev))
+		del_mtd_device(mtd);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(mtd_device_parse_register);
-- 
2.11.0
